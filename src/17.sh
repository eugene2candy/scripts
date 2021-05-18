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

