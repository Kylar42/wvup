#!/usr/bin/env python



maxRemainder = 0
for a in xrange(3,1001):
    for n in xrange(1,2000):
        firstNum = (a-1)**n
        secondNum = (a+1)**n
        sum1 = firstNum+secondNum
        mod = sum1%(a**2)
        if(mod > maxRemainder):
            maxRemainder = mod
        
        #print mod
    
print "Max Remainder = %d" % maxRemainder