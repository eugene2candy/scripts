#!/usr/bin/env bash

echo '单引号的字符串不会被干涉 $USER'
echo "双引号中还是可能被干涉 $USER"

# printf通常被用以更多地控制输出的格式和位置
printf '%s %s %s\n' User is $USER

echo fill it up > file1.txt
echo fill it up again > file2.txt
cat file1.txt file2.txt > filecombine.txt
cat filecombine.txt
rm file1.txt file2.txt filecombine.txt

ls > temp1.txt
cat temp1.txt
rm temp1.txt
ls -C > temp2.txt
cat temp2.txt
rm temp2.txt

# 将输出和错误发送到不同文件
# program 1> messages.out 2> message.err

# 将输出和错误发送到同一文件
# both >& outfile
# both &> outfile
# both > outfile 2>&1 # 该写法移植性较强

# >> 代表追加输出

# 正数第二行
tail -n +2 01.sh
# 最后一行
tail -n 1 01.sh

# 丢弃输出
# noisy > /dev/null 2>&1

# 多命令的重定向输出
{ pwd; ls; cd ../; pwd; ls; } > all.out
pwd
cat src/all.out
rm src/all.out

# 多管道命令查看中间状态
# com1 | com2 | com3 | tee /temp/output | com4 | ...

# gcc bad.c 2>&1 | tee save.it

# 避免意外覆盖文件
# set -o noclobber

# 有意覆盖既有文件，忽略noclobber
# echo something >| file.out
