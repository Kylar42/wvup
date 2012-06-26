from math import sqrt

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

def perfectSquares(belowNumber):
	squares = []
	for i in range(1, belowNumber):
		sq = i*i
		if(sq < belowNumber):
			squares.append(sq)			
	return squares

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
	
def getPrimesBelowAsSet(somevalue):
	primes = set([2,3])
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
	        primes.add(num)
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