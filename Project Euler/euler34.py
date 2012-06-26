import eulerutils as eu


eu.fillFactorials(20)

somesum = 0

for i in range(3,1000000):
	fctSum = 0
	for fct in eu.digitsOf(i):
		fctSum += eu.fastFactorial(fct)
	if(i%1000 == 0):
		print "looking at: %i" % i
	if(i == fctSum):
		somesum += i
		print i	
				
print somesum

