#!/usr/bin/env python
import eulerutils as eu
from decimal import *
debug=True

def debugp(stringToPrint):
    if(debug):
        print(stringToPrint)

longest=0
d=0
getcontext().prec=10000
for x in range(1,1000):
    debugp("value: %d:" % x)
    #decimal
    decimal=Decimal(1)/x
    
    circle=eu.findCycleBackwards(decimal, x)
    if circle > longest:
        print "New Longest Cycle Found: %s" % str(decimal)
        longest=circle
        d=x

print ("Longest found: Circle %s X=%s" % (longest, d))