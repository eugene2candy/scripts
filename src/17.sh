#!/usr/bin/env bash

# replace echo to mv and remove <>
# expect files as xxx=xxx=xxx.odt
for i in *.odt; do echo "<$i>" "<$(echo "$i" | cut -d'=' -f1,3)>"; done

# unzip '*.zip'

# screen -a
ls
echo $SHLVL
# screen -r
# screen -d -r

diff -u 17.sh patched.sh > patch

sed -i '' -e '1i\
static header line1
' add_header

echo 仅出现在left
comm -23 left right

echo 仅出现在right
comm -13 left right

echo 同时出现
comm -12 left right

echo \
echo diff 1
diff -y -W 60 left right

echo \
echo diff 2
diff -y -W 60 --suppress-common-lines left right

echo \
echo diff 3
diff left right

cat -n 17.sh
cat -b 17.sh

pause ()
{
    read -n 1 -p 'press any key when ready...'
}

pause

LC_NUMERIC=en_US.UTF-8 printf "%'d\n" 123456789
LC_NUMERIC=en_US.UTF-8 printf "%'f\n" 123456789.987