#!/usr/bin/env bash

sort tmp tmp2
# sort -r xxx # 逆序排序
sort -r tmp tmp2
# sort -f xxx # 不区分大小写
sort -f tmp tmp2
# sort -n xxx # 对数字排序

# 对整个ip进行排序
sort -t . -k 1,1n -k 2,2n -k 3,3n -k 4,4n ipaddr.list

# unique
cat tmp | sort -u
# cat tmp | uniq > tmpfile 中uniq只能对已排序的进行去重

file tmp
file 08.sh

tr ';:.!?' ',' <tmp3 >after
tr 'A-Z' 'a-z' <tmp4 >lower # tr并不支持正则，但支持字符区间

# DOS文件转换为Linux格式
# DOS格式包含回车+换行，Linux格式仅包含换行
# 因此需要删除\r
# tr -d '\r' <file.dos >file.txt
# tr能够识别的转义序列：
# \ooo # 以八进制描述的字符
# \\ # 反斜线
# \a # alarm
# \b # 退格符
# \f # 换页符
# \n # 换行符
# \r # 回车符
# \t # 制表符
# \v # 垂直制表符

# 8.12删除智能引号 从MS work文档提取ASCII文本
tr '\221\222\223\224\226\227' '\047\047""--' <odd.txt >plain.txt

# 统计行数/单词数/字符数
wc 08.sh # 行数 单词数 字符数 filename

# 重新编排段落 fmt
fmt 5 8 tmp4 # 目标长度 最大长度 filename

# Wolfgang Friebel的lesspipe.sh
