#!/usr/bin/env bash

# sort -r xxx # 逆序排序
# sort -f xxx # 不区分大小写

# sort -n xxx # 对数字排序

# 对整个ip进行排序
sort -t . -k 1,1n -k 2,2n -k 3,3n -k 4,4n ipaddr.list

