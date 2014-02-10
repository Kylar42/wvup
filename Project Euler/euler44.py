import math
import sets

pentsset = set()
pents = []

def pentagonalNum(num):
	return num*(3*num-1)/2

def isSquare(n):
	return math.sqrt(n) % 1 == 0

def isPentagonal(num):
	penTest = (math.sqrt(1 + 24 * num) + 1.0) / 6.0;
	return penTest == int(penTest)

for i in range(1,100001):
	tmpnum = pentagonalNum(i)
	pents.append(tmpnum)
	pentsset.add(tmpnum)
	
	
print "done pents1"

for i in range(1,100000):
	#print "I count: %i" % i
	for j in range(i+1, 100000):
		num1 = pents[i]
		num2 = pents[j]
		#absdiff = abs(num2-num1)
		#if(absdiff > smallestDiff):
	#		j = 100000
#			break
			
		sum1 = num1+num2
		if(isPentagonal(sum1)):
			diff = num2-num1
			if (isPentagonal(diff)):
				print "Num1: %d Num2: %d Sum %d diff %d" % (num1, num2, sum1, diff)
				print "Abs Diff: %d " % absdiff
				smallestDiff = absdiff

