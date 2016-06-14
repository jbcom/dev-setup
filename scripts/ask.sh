#!/usr/bin/env bash

# Based on http://djm.me/ask

if [[ $OVERRIDE_PROMPT ]]; then
	echo -n "$1"
else
	script_name="${1:-this}"
	echo -n "Run ${script_name} script? [y/n]"
fi

read REPLY </dev/tty

if [ -z "$REPLY" ]; then
    REPLY="n"
fi

case "$REPLY" in
    Y*|y*) exit 0 ;;
    *) exit 1 ;;
esac
