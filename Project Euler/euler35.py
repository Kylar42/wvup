import eulerutils as eu
import OrderedSet
import time


def currentMillis():
    return int(round(time.time() * 1000))

startTime = currentMillis()

primes = eu.getPrimesBelowAsSet(1000000)
 
print "Got Primes. Time: %d" % (currentMillis() - startTime)
    
print len(primes)

circularPrimes = []
primecount = 0
for prime in primes:
	primecount += 1
	rots = eu.numericRotations(prime)
	count = 0
	good = True
	for rotation in rots:
	    if(rotation not in primes):
		good = False
		break
	
	if good:
	    circularPrimes.append(prime)
	

print "Primes found: %d" % len(circularPrimes)
print circularPrimes
print "End Run. Time: %d" % (currentMillis() - startTime)

	
	#while(running and count < len(rots)):
	#	curRot = rots[count]
	#	count += 1
	#	if curRot not in primes:
	#		running = False
	#
	#if(running):
	#	print "Circular Prime Found: %i" % prime
	
	#if 0 == (primecount % 1000):
	#	print "On Prime # %i" % primecount
	#	
	
		
		
		
