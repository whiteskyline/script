# /Users/horizon/script 结构化审计

## 结论

这套脚本的本质不是一组可执行 Bash 脚本，而是被 `.zshrc` 加载的个人 zsh startup library。当前最大问题不是语法细节，而是职责边界不清：文件按历史追加形成，函数按使用时机散落，导致脚本名和函数功能逐渐不匹配。

## 优先级最高的问题

1. `source` 阶段存在副作用。
   - `utils/golang.sh` 原来每次加载都会执行 `go env -w GOPROXY=...`，这会持久写 Go 配置。已改为 `export GOPROXY=...`，只影响当前 shell。
   - `config/path.sh` 会无条件重复拼接 `PATH`，多次 source 后 PATH 会膨胀。

2. Shell 类型不明确。
   - 文件头多为 `#!/bin/bash`，但实际从 `.zshrc` 加载。
   - 代码中使用了 zsh 特性，例如 `goto.sh` 的 `declare -A` 和 `${(kv)location_map}`。建议统一声明为 zsh library，文件后缀可逐步迁移到 `.zsh`。

3. 文件名和职责不匹配。
   - `utils/alias.sh` 包含 `draw_image`，它是 Graphviz 渲染工具，不是 alias。
   - `utils/goto.sh` 同时包含目录跳转、内部网页打开、SSH、VNC。
   - `utils/dev_machine_script.sh` 同时包含服务启动、测试、目录跳转、Go 版本切换、Kerberos 登录、Python alias。
   - `utils/dy.sh` 同时包含抖音音频下载和 Argos 日志页打开。
   - `utils/dev_info.sh` 同时包含测试账号信息和日志查询入口。

4. 全局变量污染严重。
   - `BASE_DIR`、`MODULE_BASE_DIR`、`MYSQL_HOME`、`TARGET_BRANCH`、`TITLE` 等变量多处未使用 `local`。
   - `prev_branch`、`path_history` 是有意状态，但缺少命名空间，容易和外部变量撞名。

5. 路径硬编码和历史用户名混杂。
   - 同时存在 `/Users/horizon`、`/Users/bytedance`、`/Users/minghorizon`、`/home/linmingxing`、`/data01/users/linmingxing`。
   - `nginx.sh` 使用 `$USER_HOME`，但入口只设置了 `$HOME_DIR`，这可能是 bug。

## 建议目标结构

```text
/Users/horizon/script
  core_loader.zsh
  lib/
    path.zsh              # PATH 和 *_HOME，只做环境定义
    loader.zsh            # source 顺序、幂等加载、错误提示
  modules/
    aliases.zsh           # 纯 alias
    nav.zsh               # cd、goto、goprj、gocmd
    git.zsh               # git helpers
    go.zsh                # Go 环境和 Go helper
    service_aweme.zsh     # aweme 服务启动、测试、debug
    remote.zsh            # ssh、vnc、relay、kinit
    web_shortcuts.zsh     # seat、seaa、sargos、slog
    media.zsh             # draw_image、dydw
    data_mysql.zsh        # MySQL alias/helper
    terminal.zsh          # st、title 等终端行为
    help.zsh              # listc/listv/listz/listf
  data/
    command_list.log
    env_list.log
    zsh_list.log
```

## 迁移策略

第一步：不改用户命令名，只移动实现。

- 保留 `goto`、`goprj`、`dev_start`、`gits` 等已有命令。
- 新文件按职责放函数，旧文件只保留 `source` 或兼容 wrapper。
- 每个模块只做两件事：定义变量，定义函数/alias。禁止在加载阶段执行 `go env -w`、`git`、`ssh`、`open`、`curl` 等动作。

第二步：建立加载规范。

- `core_loader` 负责设置 `SCRIPT_BASE_DIR`、`SOURCE_BASE_DIR`，并按固定顺序加载模块。
- 加载函数必须用 `emulate -L zsh` 或至少避免污染全局变量。
- 引入 `path_prepend` / `path_append`，避免 PATH 重复。
- `source` 使用绝对路径，不依赖 `cd` 到模块目录。

第三步：补函数注释。

只给“有决策成本”的函数加注释：启动服务、切 Go 版本、远程连接、跨 repo 更新依赖。简单 alias 不需要注释。

## 建议命名映射

| 当前文件 | 实际职责 | 建议归属 |
| --- | --- | --- |
| `config/path.sh` | 环境变量和 PATH | `lib/path.zsh` |
| `utils/cd.sh` | cd 历史和上级目录 alias | `modules/nav.zsh` |
| `utils/goto.sh` | 目录跳转、内部网页、SSH/VNC | 拆到 `nav.zsh`、`web_shortcuts.zsh`、`remote.zsh` |
| `utils/goprj.sh` | 项目目录跳转 | `modules/nav.zsh` |
| `utils/gocmd.sh` | 跳转到命令所在目录 | `modules/nav.zsh` |
| `utils/alias.sh` | 通用 alias、Graphviz 渲染 | `aliases.zsh`、`media.zsh` |
| `utils/git.sh` | Git helper | `modules/git.zsh` |
| `utils/golang.sh` | Go 环境和 Go helper | `modules/go.zsh` |
| `utils/dev_machine_script.sh` | aweme 服务、测试、跳转、env | `service_aweme.zsh`、`nav.zsh`、`remote.zsh` |
| `utils/dy.sh` | 下载音频、Argos URL | `media.zsh`、`web_shortcuts.zsh` |
| `utils/dev_info.sh` | 测试账号、日志 URL | `data/dev_info.zsh`、`web_shortcuts.zsh` |
| `utils/relay.sh` | SSH 入口 | `modules/remote.zsh` |
| `utils/st.sh` | 终端 title | `modules/terminal.zsh` |
| `utils/mysql.sh` | MySQL alias | `modules/data_mysql.zsh` |
| `utils/nginx.sh` | Nginx alias/helper | `modules/service_nginx.zsh` |
| `help/*.sh` | 帮助列表 | `modules/help.zsh` + `data/*.log` |

## 已做的小改动

- `core_loader.sh` 在 macOS 下如果 `HOME_DIR` 未设置，会默认使用 `$HOME`。
- `utils/golang.sh` 把 `go env -w GOPROXY=...` 改为 `export GOPROXY=...`，避免开 shell 时持久改配置。
- `config/path.sh` 改为幂等 PATH 管理：先清理不存在路径和重复路径，再只加入存在的自管工具目录。
- `config/path.sh` 不再硬编码已由 Homebrew 或系统 PATH 管理的历史路径，例如旧 `ffmpeg` Cellar 路径和 Python 3.10 Framework 路径。
- `utils/golang.sh` 去掉 `GOPATH` 末尾斜杠，避免生成 `$GOPATH//bin`，并避免重复追加 Go bin 目录。
- 给 `goto.sh`、`golang.sh`、`dev_machine_script.sh` 的高风险函数补了用途注释和拆分 TODO。
