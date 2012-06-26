import eulerutils as eu

origprimelist = [3,7,109,673]
primes = eu.getPrimesBelow(1000000)


def isPrime(someNumber):
	return primes.contains(someNumber)

def checkPrimeList(primeList):
	#iterate through the list, concatenate each set and see if each concatination is prime.
	return False


print isPrime(3)
print isPrime(2)
print isPrime(99)
print isPrime()