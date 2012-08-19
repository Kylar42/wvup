import eulerutils as eu
import primeutils as pru
import math as ma

startTime = eu.currentMillis()

def getCombinationsOfNumber(num):
    #for 541 we need to return 145, 154, 514, 541, 415, 451
    toReturn = []
    if num < 10:
        toReturn.append[num]
        return toReturn #only one
    elif num < 100:
        #two combinations.
        toReturn.append(num)
        toReturn.append( (num/10) + (10*(num%10)) )
        return toReturn
    else:        
        for rot in eu.numericRotations(num):
            #take the last digit and pass the rest in.
            digit = rot % 10
            passIn = rot/10
            returnList = getCombinationsOfNumber(passIn)
            for tmpNumber in returnList:
                toReturn.append((tmpNumber*10+digit))
        
        return toReturn


def isPrime(num):
    if(num == 2):
        return True
    if(num % 2 == 0):
        return False
    
    upperBound = int(ma.sqrt(num))+1
    
    for i in xrange(3, upperBound, 2):
        if num % i == 0:
            return False
    
    
    return True
    
    
    

#for x in xrange(2, 100):
#    print "Number: %d is Prime: %s" % (x, isPrime(x))

#primeList = pru.primesListLessThan(87654322)

pandigitals = [4321, 54321, 654321, 7654321, 87654321,987654321]

biggestPrime = 2

tmpList = []
for num in pandigitals:
    tmpList = tmpList + getCombinationsOfNumber(num)

for num in tmpList:
    if isPrime(num):
        if num > biggestPrime:
            biggestPrime = num
            print "Found Prime! %d" % num     
            
        
        