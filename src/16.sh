#!/usr/bin/env bash

# .inputrc定义readline行为
echo $INPUTRC

echo $PS1
echo $PS2 # 辅助提示符
echo $PS3 # select 提示符
echo $PS4

PROMPT_COMMAND='history -a ; history -n'
echo $PROMPT_COMMAND

# cat ~/.zsh_history
# cat $HISTFILE

# 16.16 - func_mcd
