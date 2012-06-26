import time
from math import sqrt
import os, string
	
def getPrimeList(somevalue):

	#max = 1000000
	primes = [2,3]
	start = 4

	# range of numbers searching for primes
	for num in range(start, somevalue):
	    #intialize not-a-prime as false
	    nap = 0

	    # cycle through list of known primes
	    for prime in primes:    
	        # check if a previous prime divides evenly
	        # into the current number -- if so the number
	        # we are checking (num) is not a prime
	        if (num % prime) == 0:
	            nap = 1
	            break
	        # if prime squared is bigger than the number 
	        # than we don't need to check any more
	        if prime*prime > num:
	           break

	    # did we determine it's not a prime
	    # if not, then we found a prime
	    if nap != 1:
	        # add prime to list of known primes
	        primes.append(num)
	        #print "",num

	return primes

	
#start our program
target = 2000000  #600851475143
t1 = time.time();
primes = getPrimeList(target)
#print primes
print "Time"
print time.time()-t1
sum = 0
for prime in primes:
	sum += prime
	
print sum	
