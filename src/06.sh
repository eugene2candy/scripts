#!/usr/bin/env bash

X=1
Y=2
# echo $(( X+=5 , Y*=2 ))
let X+=5 Y*=2
echo $X
echo $Y

# 检查文件特性的单目运算符 表6-2

# 文件可读可写
# if [ -r $FILE -a -w $FILE ]

# shopt -s可以打开shell选项，extglob选项涉及扩展模式匹配
# shopt -s extglob
# if [[ "$FN" == *.@(jpg|jpeg) ]]
# @(...) 仅匹配一次
# *(...) 匹配0次或多次
# +(...) 匹配1次或多次
# ?(...) 匹配0次或1次
# !(...) 匹配除此之外的任何模式

# 无视字母大小写
# shopt -s nocasematch

for (( i=0 ; i < 10 ; i++ ))
do
    echo $i
done

# start from 1.0, step 0.01, until 1.1
for fp in $(seq 1.0 .01 1.1)
do
    echo $fp
done
