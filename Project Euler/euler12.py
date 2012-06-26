import math

def triangleList(num):
	curSum = 0;
	triangleList = []
	for i in range(1, num):
		curSum += i
		triangleList.append(curSum)
	
	
	return triangleList

def factorsOf(num):
	factors = []
	for factor in range(1, int(math.sqrt(num))):
		if(0 == num % factor):
			factors.append(factor)
			factors.append(num/factor)
		
		if(len(factors) > 500):
			print num
			return num
	return 0

tmpList = triangleList(1000000)

for num in tmpList:
	factorsOf(num)