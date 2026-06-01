#!/usr/bin/env bash
set -euo pipefail

SKILL_NAME="qimao-novel-writing"
SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$SKILL_NAME"
TARGET_DIR="$HOME/.hermes/skills/creative/$SKILL_NAME"

if [ ! -d "$SOURCE_DIR" ]; then
  echo "错误：找不到技能目录：$SOURCE_DIR" >&2
  exit 1
fi

mkdir -p "$HOME/.hermes/skills/creative"

if [ -d "$TARGET_DIR" ]; then
  BACKUP_DIR="$TARGET_DIR.bak.$(date +%Y%m%d%H%M%S)"
  echo "检测到旧版本，备份到：$BACKUP_DIR"
  mv "$TARGET_DIR" "$BACKUP_DIR"
fi

cp -R "$SOURCE_DIR" "$TARGET_DIR"

echo "安装完成：$TARGET_DIR"
echo "请重启 Hermes，或在会话中执行：/reload-skills"
echo "使用方式：/skill qimao-novel-writing"
