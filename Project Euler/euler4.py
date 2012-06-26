def isPalindrome(someNumber):
	if(someNumber > 99999):
		stringNumber = str(someNumber)
		#look at first & last and second and secondlast.
		if (stringNumber[0] == stringNumber[-1]) and (stringNumber[1] == stringNumber[-2]) and (stringNumber[2] == stringNumber[-3]):
			return True	
	else:
		stringNumber = str(someNumber)
		#look at first & last and second and secondlast.
		if (stringNumber[0] == stringNumber[-1]) and (stringNumber[1] == stringNumber[-2]):
			return True			
		
	return False

myList = []
for i in range(999,100, -1):
	for j in range(999, 100, -1):
		value = i*j
		if(isPalindrome(value)):
			print"Found: i=%i j=%i Number=%i" % (i,j,value)
			myList.append(value)			
		
	

#OK now let's find the biggest one.
myMax = 0
for i in myList:
	if(i > myMax):
		myMax = i
	
print myMax