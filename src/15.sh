#!/usr/bin/env bash

# bash 2.04+
for ((i=0; i<10; i++)); do echo $i; done

# bash 3.0+
for i in {1..10}; do echo $i; done

# seq
for i in $(seq 1 10); do echo $i; done

# 使用可移植的echo
shopt -s xpg_echo
printf "%b" "something"

# 十六进制输出
hexdump -C 15.sh

nl -ba 15.sh
# nl使用了空格（ASCII20）和制表符（ASCII09）
nl -ba 15.sh | hexdump -C

# cookbook filename: finding_ipas
echo "IPv4 Using awk, cut, and head"
/sbin/ifconfig -a | awk '/(cast)/ { print $2 }' | cut -d':' -f2 | head -1

echo "IPv4 Using Perl, just for fun"
/sbin/ifconfig -a | perl -ne 'if ( m/^\s*inet (?:addr:)?([\d.]+).*?cast/ ) { print qq($1\n); exit 0; }'

echo "IPv6 Using awk, cut, and head"
/sbin/ifconfig -a | egrep 'inet6 addr: |address: ' | cut -d':' -f2- \
  | cut -d'/' -f1 | head -1 | tr -d ' '

echo "IPv6 Using Perl, just for fun"
/sbin/ifconfig -a | perl -ne 'if ( m/^\s*(?:inet6)? \s*addr(?:ess)?: ([0-9A-Fa-f:]+)/ ) { print qq($1\n); exit 0; }'

# command_substitution

# send mails

# multiple remote servers
# for host in host1 host2 host3; do echo -n "On $host, I am: " ; ssh $host 'whoami' ; done
