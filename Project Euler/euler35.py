import eulerutils as eu

def uniqueList(seq): 
    # not order preserving 
    set = {} 
    map(set.__setitem__, seq, []) 
    return set.keys()

def getNumberAsList(number):
	toReturn = []
	while(number > 0):
		toReturn.append(number % 10)
		number /= 10
	#print toReturn
	return toReturn
	


def getRotations(numberList):
	toReturn = [];
	#print "c"
	#print numberList
	if(len(numberList) == 2):
		#print "a"
		#2 digits. return both rotations.
		firstDigit = numberList[0]
		secondDigit = numberList[1]
		toReturn.append((firstDigit*10 + secondDigit))
		toReturn.append((secondDigit*10 + firstDigit))
	elif(len(numberList) < 2):
		print("Can't check single Digit")
	else:
		#print "b"
		multiplier = 10**(len(numberList)-1)
		for i in range(0, len(numberList)):
			tmplist = numberList[:]
			del tmplist[i]
			for num in getRotations(tmplist):
			    toReturn.append((multiplier*numberList[i])+num)
		
	return uniqueList(toReturn)

#for prime in primes:
#	getRotations(prime)
#getNumberAsList(1799)

primes = eu.getPrimesBelow(1000000000000);
print len(primes);
circularPrimes = []
primecount = 0
for prime in primes:
	primecount += 1
	rots = getRotations(getNumberAsList(prime))
	running = True
	count = 0;
	while(running and count < len(rots)):
		curRot = rots[count]
		count += 1
		if curRot not in primes:
			running = False
	
	if(running):
		print "Circular Prime Found: %i" % prime
		circularPrimes.append(prime)
	
	if 0 == (primecount % 1000):
		print "On Prime # %i" % primecount
		
print "Primes found: %i" % len(circularPrimes)
print circularPrimes
	
		
		
		
