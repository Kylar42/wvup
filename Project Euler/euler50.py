#!/usr/bin/env python

import eulerutils as eu
import OrderedSet
import time

def currentMillis():
    return int(round(time.time() * 1000))

startTime = currentMillis()
primes = []
primes = eu.getPrimesBelowAsSet(1000000)

primesList = list(primes)
primeSums = OrderedSet.OrderedSet([])
print "Got Primes. Time: %d" % (currentMillis() - startTime)
#print primesList

#print len(primesList)

slidingWindowSum = 0
smallestPrimesSum = 2 #start at 2, window size = 1, smallest prime
numberOfPrimesInSum = 1
largestWindowSize = 1
largestSum = 1

#loop through length of primes.
listLen = len(primesList)
for windowsize in xrange(1, listLen):
    #for each window size, we loop through to the length, minus the window size.
    slidingWindowSum = smallestPrimesSum
    #here we should do a little optimization to ignore ones that will end up being even.
    endMarker = listLen-windowsize
    if windowsize % 2 == 0:
        endMarker = 1
    # if the windowsize is even, just do 0..1
    for pointer in xrange(0, endMarker):
        #we move the window along the list of primes, adding the next largest prime, and removing the smallest.
        #alternately, we could just add the difference between the largest and the smallest.
        if slidingWindowSum in primes and windowsize > largestWindowSize:
            largestSum = slidingWindowSum
            largestWindowSize = windowsize
            print "Found Sum: %d Pointer: %d WindowSize %d" % (slidingWindowSum, pointer, windowsize)
            
        nextPrime = primesList[windowsize+pointer]
        smallestPrime = primesList[pointer]
        slidingWindowSum = slidingWindowSum + nextPrime - smallestPrime
        

    smallestPrimesSum = smallestPrimesSum + primesList[windowsize] #smallestPrimesSum now equals the sum of all the primes from 0..windowSize+1
    
    if smallestPrimesSum > 1000000:
        print "End Run. Time: %d" % (currentMillis() - startTime)
        exit(0)







#for x in xrange(0,536):
#    cursum = cursum + primesList[x]
#    
#    print "Last prime: %d" % (primesList[x]);


#for x in xrange(0,548):
#    print "Looking at x:%d prime:%d" % (x, primesList[x])
#    cursum = cursum + primesList[x]
#    if cursum in primes:
#        print "It's prime. Cursum:%d." % cursum

#for x in xrange(0,len(primes)):
#    tmp = cursum+primesList[x]
#    if(tmp < maxsum):
#        count = count + 1
#        cursum = tmp
#    else:  
#        count = 0
#
cursum = 0
#       
#    if(cursum in primes):
#            print("cursum: %d x: %d count %d" % (cursum, x, largestx))    
#        
#        




#for x in xrange(1, len(primes)):
    #for each X in the length.
#    for y in xrange(0,(len(primes)-x)):
#        sum = 0
#        for pointer in xrange(y,x+y):
#            sum = sum + primesList[pointer]
        
#        if(sum in primes):
#            if(x > largestx):
#                print ("Prime Sum: %d x = %d y = %d Consecutives: " % (sum, x, y))
#                largestx = x



