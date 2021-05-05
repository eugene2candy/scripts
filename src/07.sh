#!/usr/bin/env bash

grep printf *.sh
grep -h printf *.sh # 忽略文件名
grep -c printf *.sh # 仅出现次数
grep -l printf *.sh # 仅显示出现处待搜索内容的文件名
grep -i error *.sh # 忽略大小写

# zgrep zcat gzcat
zgrep -i error * # 搜索压缩文件

# 输出每一行第一个参数
awk '{print $1}' 01.sh

# 过滤
ls -l | awk '{print $1, $NF}'

# 汇总字数
ls -l | awk '{sum += $5}; END {print sum}'

# 7.14 用awk统计字符串出现次数
# 7.16 7.17 直方图

