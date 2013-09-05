#!/bin/sed -f

G
/^\(.*\)\n\1$/ d
s/\n.*//
p
/./x
d
