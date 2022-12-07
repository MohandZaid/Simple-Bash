#####################
#Made By: Mohand Zaid
#####################

#!/bin/bash

function newscript(){

    local TYPE="${1,,}"
    local NAME="$2"
    local SHBANG="#!/bin/bash"

    case $TYPE in

    "p" | "py" | "python" | "-p" | "-py" | "-python" )

    NAME=$NAME.py
    SHBANG="#!/bin/python3"
        ;;

    "s" | "sh" | "shell" | "-s" | "-sh" | "-shell" ) 
    
    NAME=$NAME.sh
        ;;

    * )

    echo "< "$TYPE" > : Invalid Option"
    echo -e "Options\n  -s\sh <shell> \n  -p\py <python>"
    exit 22

    esac


    [ -f "$NAME" ] && echo "(New Script) File Already Exist" && exit 11

    test ! -f "$NAME" && touch "$NAME" \
    && echo "$SHBANG" > "$NAME"

    chmod +x "$NAME"

    echo -n "(New Script) vim "$NAME" ? (y|N) > "
    read ans

    [ "$ans" == "y" ] && vim "$NAME" && exit 0
    [ "$ans" != "y" ] && exit 12

    }

[[ "$#" -eq "2" ]] && newscript "$1" "$2" && exit

echo -e "\nnewscript <Option> <Script-Name>\n"
echo -e "Options\n  -s\sh <shell> \n  -p\py <python>"