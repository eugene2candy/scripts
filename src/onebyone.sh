#!/usr/bin/env bash

while read ALINE
do
    for ((i=0; i < ${#ALINE}; i++))
    do
        ACHAR=${ALINE:i:1}
        echo $ACHAR
    done
done