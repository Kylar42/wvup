import time
from math import sqrt
	
def getPrimeList(somevalue):
	primes=[2]
	print "Primelist %i" % somevalue
	for i in range(3,int(somevalue), 2):
		#print "Loop: %i" % i
		isPrime = True
		#if it's divisible by any of our previous primes, we throw it away. onwards.
		for prime in primes:
			#print "Prime: %i" % prime
			if(prime >= (i/2)):
				#print "Bigger than half. Breaking."
				break
			if(0 == i % prime):
				#print "Found Modulus. Breaking."
				isPrime = False
				break
		
		if(isPrime):
			#print "Adding prime: %i" % i
			primes.append(i)
			#every 20 primes let's let someone know:
			if(len(primes) % 20 == 0):
				print "Most Recent Prime: %i total Primes: %i" % (i, len(primes))
			#print "Primes"
			#print primes
	
	return primes	

def primeFactors(someValue):
	allPrimes = getPrimeList(sqrt(someValue))	
	print "10000 1 2 %i %i %i" % (allPrimes[9999], allPrimes[10000], allPrimes[10001])	
	primeFactors = []
	for prime in allPrimes:
		if(0 == someValue % prime):
			primeFactors.append(prime)
			
	return primeFactors

		
#start our program
target = 11015132209  #600851475143
t1 = time.time();
factors = primeFactors(target)
print "Time"
print time.time()-t1
print "largest prime is: %i" % (factors[-1])
	
#print factors

#def findPrimes(bignum topCandidate)#
#	{
#	bignum candidate = 2;
#	while(candidate <= topCandidate)
#		{
#		bignum trialDivisor = 2;
#		int prime = 1;
#		while(trialDivisor * trialDivisor <= candidate)
#			{
#			if(candidate % trialDivisor == 0)
#				{
#				prime = 0;
#				break;
#				}
#			trialDivisor++;
#			}
#		if(prime) printPrime(candidate);
#		candidate++;
#		}
#	}
