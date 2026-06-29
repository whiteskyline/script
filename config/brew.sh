#!/bin/zsh

# Homebrew 基础配置。
export HOMEBREW_HOME="${HOMEBREW_HOME:-/opt/homebrew}"

# 国内网络下优先使用清华镜像加速 Homebrew API 和 bottle 下载。
export HOMEBREW_API_DOMAIN="${HOMEBREW_API_DOMAIN:-https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api}"
export HOMEBREW_BOTTLE_DOMAIN="${HOMEBREW_BOTTLE_DOMAIN:-https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles}"
