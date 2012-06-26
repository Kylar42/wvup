import eulerutils as eu

primes = eu.getPrimesBelowAsSet(87400)
print "got primes"

def calc(n, a, b):
	return (n*n) + (a*n) + b
most = 0
num = -1
aval = -1
bval = -1
for a in range(-1000, 1001):
	print a
	for b in range(-1000, 1001):
		count = 0		
		for n in range(0, 80):
			val = calc(n,a,b)
			if(val in primes):
				count += 1
			else:
				if(count > most):
					most = count
					num = n
					aval = a
					bval = b
				n = 90
print most
print num
print aval
print bval

