#!/usr/bin/env bash

VALUE=${1:--111} # set default value to -111
echo ${VALUE:0:1} # 截取第一参数的首字符

cat ${2:-index.html} | sed -e 's/>/>\
/g' | grep '<a' | while IFS='"' read a b c ; do echo $b; done

declare -a MYRA
MYRA=($(ls -ld ${3:-*}))
echo ${#MYRA[@]}
echo ${MYRA[101]}

ls -l ${4:-'13.sh'} | {
    read PERMS LCOUNT OWNER GROUP SIZE CRDATE CRTIME FILE ;
    echo $FILE has $LCOUNT 'link(s)' and is $SIZE bytes long. ;
}

./onebyone.sh < 13.sh

# bash有效，13.15
# case 1
echo 1
while read; do echo ~~"$REPLY"~~; done < whitespace
# case 2
echo 2
while read REPLY; do echo ~~"$REPLY"~~; done < whitespace
# case 3
echo 3
while read; do echo "~~${REPLY## }~~"; done < whitespace
# case 4
echo 4
while read; do echo "~~${REPLY%% }~~"; done < whitespace
# case 5
echo 5
shopt -s extglob
while read; do echo "~~${REPLY##+([[:space:]])}~~"; done < whitespace
# case 6
echo 6
while read; do echo "~~${REPLY%%+([[:space:]])}~~"; done < whitespace
