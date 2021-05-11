#!/usr/bin/env bash

STRICT_ISO_8601='%Y-%m-%dT%H:%M:%S%z'
ISO_8601='%Y-%m-%d %H:%M:%S %Z'
ISO_8601_1='%Y-%m-%d %T %Z'
DATEFILE='%Y%m%d%H%M%S'

echo STRICT_ISO_8601
date "+$STRICT_ISO_8601"
echo ISO_8601
date "+$ISO_8601"
echo ISO_8601_1
date "+$ISO_8601_1"
echo DATEFILE
date "+$DATEFILE"

date '+%s'

# brew install coreutils
# mac系统中没有gnu date，因此使用gdate代替
gdate -d '2021-05-11' '+%s'

# 没有gnu date情况下可用的临时解决方案，获取纪元秒
perl -e 'print time, qq(\n);'
perl -e 'use Time::Local; print timelocal(localtime()) . qq(\n);'
perl -e 'use POSIX qw(strftime); print strftime("%s", localtime()) . qq(\n);'

# 纪元秒转换时间
EPOCH='1131173989'
gdate -d "1970-01-01 UTC $EPOCH seconds" "+$ISO_8601_1"
gdate --utc --date "1970-01-01 UTC $EPOCH seconds" "+$ISO_8601_1"

# 用Perl获得昨天和明天的日期
perl -e "use POSIX qw(strftime); print strftime('$ISO_8601', localtime(time - 86400)), qq(\n);"
perl -e "use POSIX qw(strftime); print strftime('$ISO_8601', localtime(time + 86400)), qq(\n);"

# 处理时区/夏令时/闰年问题。。。没有解决方案

# 混合使用date和cron来处理cron无法单独处理的定时问题：11.9

