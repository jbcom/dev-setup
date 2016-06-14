#!/usr/bin/env bash

spacer="$(perl -E 'say "-" x 20')"

#  Based on http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
printf "%-20s | %-40s\n" "TASK" "DESCRIPTION"
printf "%-20s | %-40s\n" "$spacer" "$spacer$spacer$spacer$spacer$spacer"
while read from_makefile; do
	IFS=':' read -ra line <<< "$from_makefile"
	target="${line[0]}"
	
	# Credit for whitespace removal: http://stackoverflow.com/questions/369758/how-to-trim-whitespace-from-a-bash-variable
	description=$(echo "${line[2]}" | sed -n '1h;1!H;${;g;s/^[ \t]*//g;s/[ \t]*$//g;p;}')

	printf "%-20s | %-100s\n" "$target" "$description"
done