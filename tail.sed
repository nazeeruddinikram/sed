#!/bin/sed -f
1 {
    h
    g
}
2,10 {
    H
    g
}
11,$ { 
    x
    s/^[^\n]*\n//
    G
    h
}
$ !d
