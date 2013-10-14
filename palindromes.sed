#!/bin/sed -f
h
s/$/\n/g

#reverse string
:a
s/\(.*\)\(.\)\n\(.*\)/\1\n\3\2/
/.\n/ ba
s/\n//
G
#determine if equal
s/^\(.*\)\n\1$/\1/
#delete if not
/\n/d
