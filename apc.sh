#!/bin/bash
#-
#- Help
#- ./apc.sh scriptfile scriptfile....
#-

if [ $# -eq 0 ]; then
    /usr/bin/grep ^#- $0 | /usr/bin/cut -c 4-
fi



for scriptfile in "$@"
do
    echo "$scriptfile"
    if [ ! -f "$scriptfile" ]; then
        echo "$scriptfile is not found."
        continue
    fi
done
