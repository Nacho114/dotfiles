#!/bin/bash
cwd=$(cat /tmp/zellij_git_cwd 2>/dev/null)
if [ -n "$cwd" ]; then
  git -C "$cwd" branch --show-current 2>/dev/null
fi
