#!/usr/bin/env python

import eulerutils as eu
import sets
import math as ma
import OrderedSet

primeSet = eu.getPrimesBelowAsSet(10000)
newSet = set()

#OK, iterate through, and get all primes

def lowestOfList(listOfNumbers):
    smallest = 9999999999999
    for num in listOfNumbers:
        if num < smallest:
            smallest = num
    
    return smallest


def trimNonPrimesFromList(listOfNumbers):
    newList=[]
    for num in listOfNumbers:
        if num in newSet:
            newList.append(num)
    
    return newList

dictOfStuff={}

#trim primes to 4 digit ones.

for prime in primeSet:
    if prime > 1000:
        newSet.add(prime)
        


for prime in newSet:
    if prime == 1487:
        print (1487)
    tmp = set(eu.getCombinationsOfNumber(prime))
     
    primePerms = trimNonPrimesFromList(tmp)
    primePerms.sort()
    tmpList={}
    for prime1 in primePerms:
        for prime2 in primePerms:
            diff = prime2-prime1
            if diff > 0:
                minDiff = min(prime1, prime2)
                if tmpList.has_key(diff) and tmpList[diff] == minDiff:
                    largerWas = tmpList[diff]
                    print "Found multiple diffs with same value: %d, %d, %d, ::[ %d ]" % (diff, prime2, prime1, largerWas)
                    #print primePerms
                else:
                    #need to set the smaller one here.
                    toAdd = max(prime1, prime2)
                    tmpList[diff] = toAdd


    
    lowest = lowestOfList(primePerms)
    
    dictOfStuff[lowest]=set(primePerms)


for key in iter(dictOfStuff):
    listOfPrimes = dictOfStuff[key]
    if len(listOfPrimes) > 2 and len(listOfPrimes) < 4:
        #examine if difference is consistent.
        smallest = min(listOfPrimes)
        biggest = max(listOfPrimes)
        listOfPrimes.remove(smallest)
        listOfPrimes.remove(biggest)
        middle = listOfPrimes.pop()
        #print "Examining Tuple: %d %d %d With Differences: %d %d" % (smallest, middle, biggest, (middle-smallest), (biggest - middle))
        if( (middle - smallest) == (biggest - middle)):
            concat = str(smallest)+str(middle)+str(biggest)
            print "Found. Difference = %d, concat=%s" % ((middle-smallest)), concat



    
    