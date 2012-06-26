def i2b(n):
	'''convert denary integer n to binary string bStr'''
	bStr = ''
	if n < 0:  raise ValueError, "must be a positive integer"
	if n == 0: return '0'
	while n > 0:
		bStr = str(n % 2) + bStr
		n = n >> 1
	
	return bStr
	
def isPalindrome(someNumber):
	strS = str(someNumber)
	return strS == strS[::-1];
	
someSum = 0
for i in range(1, 1000000):
	#print "is Palindrome: %i" % i
	#print isPalindrome(i)
	if(isPalindrome(i)):
		tmp = i2b(i)
		if(tmp == tmp[::-1]):
			someSum += i
			
print someSum
	