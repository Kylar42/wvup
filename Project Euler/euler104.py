#!/usr/bin/env python
import eulerutils as eu

def fibonacciSequence(number):
    toReturn = []
    if number == 1:
        toReturn.append(1)
        return toReturn

    if number == 2:
        toReturn.append(1)
        toReturn.append(1)
        return toReturn
    
    restOfList = fibonacciSequence(number-1)
    
    newNumber = restOfList[number-2] + restOfList[number-3]
    
    restOfList.append(newNumber)
    
    return restOfList

def fibonacciSequence2(number):
    if(number < 500):
        return fibonacciSequence(number)
    #more than 500
    listToReturn = fibonacciSequence(500)
    #print listToReturn
    
    for x in xrange(501, number+1):
        newNumber = listToReturn[x-2] + listToReturn[x-3]
        #print newNumber
        listToReturn.append(newNumber)

    return listToReturn


fiblist = fibonacciSequence2(100000)
#string = "abcdefghijklmnopqrstuvwxyz"
#print string[0:10]
#print string[-10:]



a = 7540113804746346429
b = 12200160415121876738

for x in range(94, 1000000):
    cur = a + b
    a = b
    b = cur
    #print "%d = %d" % (x, cur)
    asString = str(cur)        
    first9 = int(asString[0:9])
    last9 = int(asString[-9:])
    if(eu.isPandigital(last9)):
        print "Found where end is pandigital: %d count=%d first9=%d" % (last9, x, first9)
        if eu.isPandigital(first9):
            print "Found matching pandigitals %d and %d. Count=%d" % (first9, last9, x)
            break



#count = 0
#for fib in fiblist:
#    count = count + 1
#    if(fib > 100000000000000000000):
#        asString = str(fib)        
#        first9 = int(asString[0:9])
#        last9 = int(asString[-9:])
#        #if count > 539 and count < 543:
#        #    print "Looking: %d count=%d first9=%d" % (last9, count, first9)
#            
#        if(eu.isPandigital(last9)):
#            print "Found where end is pandigital: %d count=%d first9=%d" % (last9, count, first9)
#            if eu.isPandigital(first9):
#                print "Found matching pandigitals %d and %d. Count=%d" % (first9, last9, count)
        
        