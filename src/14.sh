#!/bin/bash -

# 设置合理的路径
PATH='/usr/local/bin:/bin:/usr/bin'
# 并确保导出
\export PATH

# 清除所有别名
\unalias -a

# 清楚命令路径散列
hash -r

# 将硬性限制设置为0，关闭核心转储（core dumps）
# 通常可以把这条放进.zshrc中
ulimit -H -c 0 --

# 设置合理的、安全的IFS（仅可作用于bash和ksh93）
# IFS=$' \t\n'

# 设置并使用合理的、安全的umask变量
# 这不会影响已经再命令行上重定向的文件
# 022产生0755权限，077产生0700权限。。
UMASK=022
umask $UMASK

until [ -n "$temp_dir" -a ! -d "$temp_dir" ]; do
    temp_dir="/tmp/meaningful_prefix.${RANDOM}${RANDOM}${RANDOM}"
done
mkdir -p -m 0700 $temp_dir \
  || (echo "FATAL: Failed to create temp dir '$temp_dir': $?"; exit 100)

# 尽全力清楚临时文件
# 一定要先设置好temp_dir，千万不要修改
cleanup="rm -rf $temp_dir"
trap "$cleanup" ABRT EXIT HUP INT QUIT

# ------------------------------------------------------------------------

# 验证数据的必要性！！！

# 使用#!/bin/bash -
# 来避免某些setuid root解释器欺骗攻击

# 脚本起始处设置好PATH

# 使用getconf获取能找到所有标准实用工具的路径（由POSIX确保）
# export PATH=$(getconf PATH)
echo $(getconf PATH)

# chkpath.2 检查PATH路径中人皆可写的目录

