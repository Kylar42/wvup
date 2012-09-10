#!/usr/bin/env python

val = 2

for x in xrange(2,7830458):
    val = (val**val)%10000000000
    


bignum = val*28433+1

print str(bignum)[-10:]
