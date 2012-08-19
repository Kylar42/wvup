import eulerutils as eu

import eulerutils as eu
import OrderedSet
import time

def currentMillis():
    return int(round(time.time() * 1000))

startTime = currentMillis()

def getTruncLeftList(someNumber):
	#truncate left, ie if 3437 is passed in, I should return 437, 37 and 7.
	numAsStr = str(someNumber)
	size = len(numAsStr)	
	returnList = []
	end = size-1
	for index in range(0, end):
		char = numAsStr[index]
		value = int(char)*(10**(size-1))
		someNumber = someNumber - value
		returnList.append(someNumber)
		size = size - 1 
		#print someNumber
	return returnList

def getTruncRightList(someNumber):
	#truncate right - 3437 should return 343, 34 and 3
	numAsStr = str(someNumber)
	size = len(numAsStr)
	returnList = []
	end = size-1
	for index in range(0, end):
		someNumber = someNumber/10
		returnList.append(someNumber)
	
	return returnList

resultList = []	
primes = eu.getPrimesBelowAsSet(1000000)
for prime in primes:
	if len(str(prime)) < 2:
		continue
	
	good = True
	for num in getTruncLeftList(prime):
		if num not in primes:
			good = False
			break
	
	if good:
		for num in getTruncRightList(prime):
			if num not in primes:
				good = False
				break
	
	if good:
		resultList.append(prime)
	
	if len(resultList) > 10:
		break

print "Result List found."
print resultList
print "Sum is: %d" % sum(resultList)





