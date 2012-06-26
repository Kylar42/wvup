def sumDigits(bignum):
	cursum=0
	while(bignum > 0):
		cursum += bignum%10
		bignum /= 10
	
	return cursum

numfile = open("bignums.txt", "r")
myList = numfile.readlines()
#sum
mySum = 0
for line in myList:
	mySum += int(line)
	
print mySum