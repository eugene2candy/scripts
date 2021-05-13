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
