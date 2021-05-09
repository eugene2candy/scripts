#!/usr/bin/env bash

rm -f ./folder/*

for FN in 1 2 3 4 5
do
    touch ${FN}.tmp
done

# .指代当前路径，查询以tmp为后缀的文件，将找到的打印出来，执行命令以\;结束，其中{}被替换为已找到的文件名
find . -name '*.tmp' -print -exec mv '{}' ./folder \;

# 处理文件名中的odd字符
find . -name '*.mp3' -print0 | xargs -i -0 mv '{}' ./folder

# find -L # -L选项包括查找符号链接指向的文件
find -L . -name '*.mp3' -print0 | xargs -i -0 mv '{}' ./folder

# -iname 不区分大小写
find . -follow -iname '*.mp3' -print0 | xargs -i -0 mv '{}' ./folder

# 按日期查找 +90表示90天前，-90表示90天以内
find . -name '*.tmp' -mtime +90 -print

# 按类型查找
find . -type d -name '*folder*' -print
# b 块设备文件
# c 字符设备文件
# d 目录
# p 管道（或fifo）
# f 普通文件
# l 符号链接
# s 套接字
# D 门（door）（仅Solaris）

# 按大小查找
find . -size -3000k -print

# 按文件内容查找
grep -i grep *.sh
# grep -i grep */*.sh # 所有子目录
# -H选项会输出包含搜索内容的文件名
find . -name '*.txt' -exec grep -Hi grep '{}' \;

# locate 09.sh

