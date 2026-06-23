#!/bin/zsh

# 只整理当前 shell 的 PATH。

# 判断 PATH 是否已有目录。
function _script_path_contains() {
    case ":$PATH:" in
        *":$1:"*) return 0 ;;
        *) return 1 ;;
    esac
}

# 前置加入存在的目录。
function _script_path_prepend() {
    local path_dir="${1:a}"
    [[ -d "$path_dir" ]] || return 0
    _script_path_contains "$path_dir" && return 0
    export PATH="$path_dir:$PATH"
}

# 清理无效和重复 PATH。
function _script_path_normalize() {
    local path_dir
    local -A seen
    local -a kept

    for path_dir in ${(s.:.)PATH}; do
        path_dir="${path_dir:a}"
        [[ -n "$path_dir" && -d "$path_dir" ]] || continue
        [[ -n "${seen[$path_dir]}" ]] && continue
        seen[$path_dir]=1
        kept+=("$path_dir")
    done

    export PATH="${(j.:.)kept}"
}

_script_path_normalize

# Homebrew 入口。
export HOMEBREW_HOME="/opt/homebrew"
_script_path_prepend "$HOMEBREW_HOME/bin"

unfunction _script_path_contains _script_path_prepend _script_path_normalize
