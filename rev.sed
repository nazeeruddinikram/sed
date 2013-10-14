#!/bin/sed -f
s/$/\n/

#reverse line, one character at a time
:a
s/\(.*\)\(.\)\n\(.*\)/\1\n\3\2/
/.\n/ ba

s/\n//
