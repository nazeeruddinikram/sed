#!/bin/sed -f

#hold space stores a stack of parentheses
:a
#a ( is encountered
/^[^()]*(/{
    x
    s/^\(.*\)$/\1(/
    x
    s/^[^()]*(//
}
#a ) is encountered
/^[^()]*)/{
    x
    /^$/ {
        bend
    }
    
    s/($//
    x
    s/^[^()]*)//
}
/^[^()]*$/ !ba
$ !d

${
    :end
    x
    /./ s/^.*$/Unbalanced/
    /^$/ s/^.*$/Balanced/
    q
}

