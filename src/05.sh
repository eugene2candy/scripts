#!/usr/bin/env bash

# 赋值变量=两侧不能有任何空格

NEWPATH=${PATH//:/ }
echo $NEWPATH

for FN in 1 2 3 4 5
do
    echo ${FN}abc
done

# 查看所有变量值
# set
# env
# export -p
# bash4+可以用declare -p

# for FILE in $*
# do
#     echo changing $FILE
#     chmod +x $FILE
# done

# better one, avoid issue when contains spaces
for FILE in "$@"
do
    echo changing "$FILE"
    chmod +x "$FILE"
done

# 参数个数, 5.11
echo $#

# :-指定默认参数
# FILEDIR=${1:-/tmp}

# :?提示错误
# FILEDIR=${1:?"ERROR. You must ..."}

# name:number:number 从name索引位置number开始返回长度number的字串
# #name 返回字符串长度
# name#pattern 起始位置开始删除匹配pattern的最短字串
# name##pattern 起始位置开始删除匹配pattern的最长字串
# name%pattern 结束位置开始删除匹配pattern的最短字串
# name%%pattern 结束位置开始删除匹配pattern的最长字串
# name/pattern/string 替换字符串中第一次出现的pattern
# name//pattern/string 替换字符串中出现的所有pattern

# 绝对值
MYVAR=-5
echo ${MYVAR#-} # ABS(MYVAR)

basename $(pwd)
# equals to
PWD=$(pwd)
echo ${PWD##*/}

# 大小写转换
# $FN 原始
# ${FN,,} 小写
# ${FN^^} 大写
# ${FN~~} 大小写反转
