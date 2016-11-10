#!/bin/bash

for file in "$@";do

    crc=\[$(crc32 "$file")\]

    [[ "$file" == *.* ]] \
    && newname="${file%%.*}$crc.${file#*.}" \
    || newname="$file$crc"
    mv -n "$file" "$newname"
done

