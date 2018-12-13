#!/bin/bash
#-
#- Help
#- ./apc.sh scriptfile scriptfile....
#-

if [ $# -eq 0 ]; then
    /usr/bin/grep ^#- $0 | /usr/bin/cut -c 4-
fi



for givenfile in "$@"
do
    echo "$givenfile"
    if [ ! -f "$givenfile" ]; then
        echo "$givenfile is not found."
        continue
    fi
    if [ "$( file "$givenfile" | grep -c "shell script text" )" -eq 1 ]; then
        scriptfiles="$scriptfiles $givenfile"
    else
        echo "$givenfile is not shell script"
        file "$givenfile"
    fi
done

for scriptfile in $scriptfiles
do
    grep -v ^# "$scriptfile" | \
        tr ' !|[];\' '\n'| \
        sort | uniq | \
        grep -v -e ^- -e '"' -e ^\$[a-zA-Z0-9.-]
done
