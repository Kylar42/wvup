from math import sqrt
import OrderedSet
import time


numericletters = {'A': 1, 'B': 2, 'C': 3, 'D': 4, 'E': 5, 'F': 6, 'G': 7, 'H': 8, 'I': 9, 'J': 10, 'K': 11, 'L':12,
'M': 13, 'N': 14, 'O': 15, 'P': 16, 'Q': 17, 'R': 18, 'S': 19, 'T': 20, 'U': 21, 'V': 22, 'W': 23, 'X': 24,
'Y': 25, 'Z': 26}

def i2b(n):
	'''convert denary integer n to binary string bStr'''
	bStr = ''
	if n < 0:  raise ValueError, "must be a positive integer"
	if n == 0: return '0'
	while n > 0:
		bStr = str(n % 2) + bStr
		n = n >> 1
	
	return bStr
	
def isPalindrome(someNumber):
	strS = str(someNumber)
	return strS == strS[::-1];

fastFactorialList = {}

def fillFactorials(n):
	global fastFactorialList
	if(n < len(fastFactorialList)):
		return		
	fastFactorialList[0] = 1
	fastFactorialList[1] = 1
	for i in range(len(fastFactorialList)-1,n+1):
		fastFactorialList[i] = fastFactorialList[i-1]*i

	
def fastFactorial(n):
	global fastFactorialList
	return fastFactorialList[n]
	
def factorial(n):
  if n == 0:
    return 1
  else:
    recurse = factorial(n-1)
    result = n * recurse
    return result

def allFactorsOf(num):
	factors = []
	for factor in range(1, int(math.sqrt(num))):
		if(0 == num % factor):
			factors.append(factor)
			factors.append(num/factor)
			
	return factors

def isPandigital(number):
    numAsString = str(number)
    size = len(numAsString)
    #need power of
    bitset = (2**(size))-1
    for x in range(0, size):
        digit = number % 10
        remainder = number/10
        bitset = bitset - 2**(digit-1)
        number = remainder

    return bitset == 0


def perfectSquares(belowNumber):
	squares = []
	for i in range(1, belowNumber):
		sq = i*i
		if(sq < belowNumber):
			squares.append(sq)			
	return squares

def getPregeneratedPrimesBelow1M():
	text = open("./1000000primes.txt",'r').read()
	nums = [int(n) for n in text.split()]
	return nums

def getPregeneratedPrimesBelow1MAsSet():
	text = open("./1000000primes.txt",'r').read()
	nums = [int(n) for n in text.split()]
	toReturn = OrderedSet.OrderedSet(nums)
	return toReturn
	

def getPrimesBelow(somevalue):
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
	return primes
	
#def getPrimesBelowAsSet(somevalue):
#	primes = set([2,3])
#	start = 4
#	# range of numbers searching for primes
#	for num in range(start, somevalue):
#	    #intialize not-a-prime as false
#	    nap = 0
#	    # cycle through list of known primes
#	    for prime in primes:    
#	        # check if a previous prime divides evenly
#	        # into the current number -- if so the number
#	        # we are checking (num) is not a prime
#	        if (num % prime) == 0:
#	            nap = 1
#	            break
#	        # if prime squared is bigger than the number 
#	        # than we don't need to check any more
#	        if prime*prime > num:
#	           break
#	    # did we determine it's not a prime
#	    # if not, then we found a prime
#	    if nap != 1:
#	        # add prime to list of known primes
#	        primes.add(num)
#	return primes
def getPrimesBelowAsSet(somevalue):
	primes = OrderedSet.OrderedSet([2,3])
	tempPrimes = [2,3]
	start = 4
	# range of numbers searching for primes
	for num in range(start, somevalue):
		#intialize not-a-prime as false
		nap = 0		
		# cycle through list of known primes
		for prime in tempPrimes:    
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
			primes.add(num)
			tempPrimes.append(num)
	return primes

def getPrimeFactorsForNum(someValue):
	allPrimes = getPrimeList(sqrt(someValue))	
	#print "10000 1 2 %i %i %i" % (allPrimes[9999], allPrimes[10000], allPrimes[10001])	
	primeFactors = []
	for prime in allPrimes:
		if(0 == someValue % prime):
			primeFactors.append(prime)
	return primeFactors
		
def divisorsOf(n):
	divisors = []
	for i in range(1, n):
		if(n%i == 0):
			divisors.append(i)
	return divisors

def abundantOrDeficient(n):
	divisors = divisorsOf(n)
	s = sum(divisors)
	if(s > n):
		return 1# is abundant
	elif(s < n):
		return -1#is deficient
	else: 
		return 0 # is perfect
		

def digitsOf(n):
	listToReturn = []
	while (n > 0):
		listToReturn.append(n % 10)
		n /= 10
	return listToReturn

def findCycleBackwards(number, x):
	number_dec = str(number-int(number))[2:]
	i = len(number_dec)-1
	j = i-1
	if j < 0:
		return 0
	
	#loop backwards from j to 0 until you find a number that matches i. Then count backwards until you see if it's a repeat.
	end=int(number_dec[i])
	
	while j > 0:
		if(int(number_dec[j]) == int(number_dec[i])):
			#let's see how far apart they are, and see if we can count down to make sure there's a cycle.
			cyclesize=i-j
			a = i
			b = j
			good = True
			if cyclesize > 10 and cyclesize < 5000:
				while(b > 0 and a > j):
					if(int(number_dec[a]) != int(number_dec[b])):
						good = False
						b=0
						j = j-1
					
					a = a-1
					b = b-1
				
				if good:
					print "Found recurring cycle of length: %d in X=%d" % (cyclesize, x)
					return cyclesize
			else:
				j = j-1
		else:
			j = j-1
		
	return 0



def findCircleInDecimal(number, x):
	number_dec = str(number-int(number))[2:]
	#number_dec is just the decimal:
	i = 0;
	j = 1;
	#if number_dec[i] = 0, move until it's not.
	while i < len(number_dec) and int(number_dec[i]) == 0:
		i = i+1
		j = i*2
		
	while j < len(number_dec):
		if int(number_dec[i]) == int(number_dec[j]):
			#found a maching number. Now need to walk from i->j to see if it actually repeats.
			a = i;
			b = j;
			if ((b-a)+b) < len(number_dec):
				same = True
				while a < j:
					if int(number_dec[a]) != int(number_dec[b]):
						same = False
						a=j
					a = a+1
					b = b+1
				if same:
					print "Cycle starts for %d at index %d and is %d long." % (x, i, (j-i))
					print "\nDecimal is: %s" % number_dec
					#what if the cycle has multiple cycles in it.
					
					
					return j-i
		#end loop
		i = i+1
		j = i*2
	
	
	return 0

def currentMillis():
    return int(round(time.time() * 1000))

def getCombinationsOfNumberAsString(num):
		num = str(num)
		toReturn = []
		if len(num) == 1:
				toReturn.append(num)
				return toReturn #only one
		elif len(num) == 2:
				#two combinations.
				toReturn.append(num)
				toReturn.append(num[1] + num [0])
				return toReturn
		else:
				stringRotations = numericRotationsAsString(num)
				for rotStr in stringRotations:
				#take the last digit and pass the rest in.
						digit = rotStr[-1]
						passIn = rotStr[0:-1]
						returnList = getCombinationsOfNumberAsString(passIn)
						for tmpNumber in returnList:
								toReturn.append(tmpNumber+digit)
        
				return toReturn


def getCombinationsOfNumber(num):
    #for 541 we need to return 145, 154, 514, 541, 415, 451
    toReturn = []
    if num < 10:
        toReturn.append(num)
        return toReturn #only one
    elif num < 100:
        #two combinations.
        toReturn.append(num)
        toReturn.append( (num/10) + (10*(num%10)) )
        return toReturn
    else:        
        for rot in numericRotations(num):
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
    
    upperBound = int(sqrt(num))+1
    
    for i in xrange(3, upperBound, 2):
        if num % i == 0:
            return False
    
    
    return True
    
    
def numericRotationsAsString(ofNumber):
		numAsString = str(ofNumber)
		size = len(numAsString)
		returnList = []
		for x in range(0, size):
				#chop off first, make it last.				
				numAsString = numAsString[-1]+numAsString[0:-1]
				returnList.append(numAsString)
		
		return returnList

def numericRotations(ofNumber):
    size = len(str(ofNumber))
    powConst = 10**(size-1)
    returnList=[]
    for x in range(0, size):
	#chop off the 1's and multiply it by the size, then add.
	mod = ofNumber % 10
	ofNumber = (mod*powConst)+ofNumber/10
	returnList.append(ofNumber)
    
    return returnList

def sumdigits(n):
    '''sumdigits(long n) --> long
    sumdigits(n) computes the sum of the digits of the absolute value of n.
    The sum is negated if the n was originally negative.
    '''
    if (n < 0):     # test for a negative n
        neg = 1
    else:
        neg = 0

    n = abs(n)      # initialize
    sum = 0

    while (n > 0):
        sum += n % 10
        n /= 10

    if (neg):
        return ((-1) * sum)
    else:
        return sum

def gcd(a, b):
	if a == 0:
		return b
	while b != 0:
		if a > b:
			a -= b
		else:
			b -= a
	return a


def isSquare(n):
	return math.sqrt(n) % 1 == 0

if __name__ == '__main__':
    print getPrimesBelow(100)
