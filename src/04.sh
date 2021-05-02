#!/usr/bin/env bash

# 依次执行无论成功与否
ls ; echo 123 ; echo 321
# 依次执行，上一个成功执行下一个
ls && echo 123 && echo 321

# 命令后加&用以后台运行
ls &
ls & ls ../ & ls

# 杀死作业1（进程号1234）
# kill %1
# kill 1234
# 重新连接回后台进程
# fg %1
# 前台命令没执行完可以Ctrl-Z暂停
# bg恢复作业

# 前一条命令执行成功，$?结果将会被置0，否则为1
STAT=$?

cd xxx
if (( $? == 0 )); then rm * ; fi
# 运用&&快速判断，无需利用$?
cd xxx && rm *

# 执行目录下所有脚本
for SCRIPT in ./*
do
    if [ -f "$SCRIPT" -a -x "$SCRIPT" ]
    then
        $SCRIPT
    fi
done
