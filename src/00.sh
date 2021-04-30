#!/usr/bin/env bash

ls
pwd
ls -l
stat 00.sh
file 00.sh
file -b 00.sh
ls -d .*
ls -lA
echo .*

# 被别名覆盖的命令可以以反斜杠开头避开，例如
\ls

# echo * 可作为ls的应急替代方案

# .[!.]* 会漏掉..foo
# .??* 会漏掉.a
# ls -d .[!.]* .??* 会将同时匹配两种模式的文件名显示两次
# 此处没有通用解决方案

cat /etc/shells
