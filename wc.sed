#!/bin/sed -nf
#implements wc, counting tabs, spaces, and newlines as word separators
#all default fields (-l, -c, -m)

bmain

#increment the hold space without using the pattern space
:increment

x
#change 0's to a's
y/0/a/

#change all trailing 9s to 0's
:a
/^[^\n]*90*\n/{
    s/^\([^\n]*\)9\(0*\)\n/\10\2\n/
    ba
}

#find last unmodified digit: increment
/^[^\n]*80*\n/ s/8\(0*\)\n/9\1\n/
/^[^\n]*70*\n/ s/7\(0*\)\n/8\1\n/
/^[^\n]*60*\n/ s/6\(0*\)\n/7\1\n/
/^[^\n]*50*\n/ s/5\(0*\)\n/6\1\n/
/^[^\n]*40*\n/ s/4\(0*\)\n/5\1\n/
/^[^\n]*30*\n/ s/3\(0*\)\n/4\1\n/
/^[^\n]*20*\n/ s/2\(0*\)\n/3\1\n/
/^[^\n]*10*\n/ s/1\(0*\)\n/2\1\n/
/^[^\n]*a0*\n/ s/a\(0*\)\n/1\1\n/
/^0*\n/ s/^/1/

y/a/0/
x

breturn

#increment both character count and word count 
#(put \n marker at beginning to be dealt with in :main/:return)
:incrementboth
s/^/\n/
x
s/^\(.*\)\n\(.*\)\n\(.*\)$/\2\n\1\n\3/
x
bincrement

:main
#initialize counts
1 {
    x
    s/^.*$/0\n0\n0/
    x
}

#beginning of line
#increment line count
#put \n\n marker at beginning of line to be dealt with at :return
s/^/\n\n/
x
s/^\(.*\)\n\(.*\)\n\(.*\)$/\3\n\2\n\1/
x
bincrement

:return

#markers: word or line was counted, now count character as well
/^\n\n/{
    s/^\n\n//
    x
    s/^\(.*\)\n\(.*\)\n\(.*\)$/\3\n\2\n\1/
    x
    bincrement
}
/^\n/ {
    s/^\n//
    x
    s/^\(.*\)\n\(.*\)\n\(.*\)$/\2\n\1\n\3/
    x
    bincrement
}

#end or word
/^[^ \t] / { 
    s/^.//
    bincrementboth
}
/^[^ \t]\t/{
    s/^.//
    bincrementboth
}
/^[^ \t]$/{
    s/^.//
    bincrementboth
}

#ordinary character
/^./{
    s/^.//
    bincrement
}

#end of file: print all counts, similar to wc's format
${
    x
    s/^\(.*\)\n\(.*\)\n\(.*\)$/\t\3\t\2\t\1/
    p
}
