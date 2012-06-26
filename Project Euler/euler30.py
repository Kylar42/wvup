fivePows = [pow(0,5), pow(1,5), pow(2,5), pow(3,5), pow(4,5), pow(5,5), pow(6,5), pow(7,5), pow(8,5), pow(9,5)]

def sumOfFive(somenum):
	tmp = somenum
	sum = 0
	while(tmp > 0):
		digit = tmp % 10
		#print "digit: %i" % digit
		sum += pow(digit, 5)
		tmp /= 10
	
	return sum

newSum = 0
for i in range(1, 10000000):
	#print "i %i" % i
	sum = sumOfFive(i)
	#print "sum: %i" % sumOfFive(i)
	if(i == sum):
		print "perfect: %i" % sum
		newSum += sum
		
	
print newSum