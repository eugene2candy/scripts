#!/usr/bin/env bash

# wc < 01.sh
# cat < 01.sh

# 通过'EOF'关闭内部转义
# grep $1 <<'EOF'
# pete $100
# joe $200
# sam $25
# bill $900
# EOF

# grep $2 <<-'EOF'
# lots of data
# can go here
# it's indented with tabs
# to match the script's indenting
# but the leading tabs are 
# discarded when read
# EOF

# read -t 3 ANSWER

function choose {
    local default="$1"
    local prompt="$2"
    local choice_yes="$3"
    local choice_no="$4"
    local answer

    read -p "$prompt" answer
    [ -z "$answer" ] && answer="$default"

    case "$answer" in
        [yY1] ) eval "$choice_yes"
            # error check
            ;;
        [nN0] ) eval "$choice_no"
            # error check
            ;;
        *     ) printf "%b" "Unexpected answer '$answer'!" >&2 ;;
    esac
}
choose "y" \
"Do you wanna play a game? " \
./01.sh \
./02.sh >&2

# cookbook filename: select_dir
# PS1 PS2 PS3 PS4 and PROMPT_COMMAND
directorylist="Finished $(for i in /*;do [ -d "$i" ] && echo $i; done)"

PS3='Directory to process? ' # Set a useful select prompt
until [ "$directory" == "Finished" ]; do

    printf "%b" "\a\n\nSelect a directory to process:\n" >&2
    select directory in $directorylist; do

        # User types a number which is stored in $REPLY, but select
        # returns the value of the entry
        if [ "$directory" == "Finished" ]; then
            echo "Finished processing directories."
            break
        elif [ -n "$directory" ]; then
            echo "You chose number $REPLY, processing $directory..."
            # Do something here
            break
        else
            echo "Invalid selection!"
        fi # end of handle user's selection

    done # end of select a directory
done # end of until dir == finished

# -s 关闭回显
read -s -p "password: " PASSWD
printf "%b" "\n"
