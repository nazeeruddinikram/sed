#!/bin/sed -nf
#add all previous lines to end of pattern space
2,$ G
x
$ g
$ p
