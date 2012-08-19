from sets import Set
import eulerutils as eu
#Found new Highest Value: most=5 num=5 aval=-247 bval=989
def getPrimesBelowAsSet(somevalue):
	primes = set([2,3])
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

def calc(n, a, b):
	return (n*n) + (a*n) + b


a=-59
b=911

primes = getPrimesBelowAsSet(100000)

count = 0
for n in range(0, 100):	
	c = calc(n, a, b)
	if c in primes:
		count = count+1
	else:
		n = 200
	
	print("Count: %d" % count)
	