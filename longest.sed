#!/bin/sed -f

G
h
#compare lines; delete one char at a time
:a
s/.\(.*\)\n.\(.*\)/\1\n\2/
/..*\n..*/ ba

#store longest line as above winner
/.\n$/ {
    x
    s/^\(.*\)\n.*$/\1/
    h
}
/^\n./{
    x
    s/^.*\n\(.*\)$/\1/
    h
}
$!d
