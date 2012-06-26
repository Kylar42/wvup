def isPalindrome(someNumber):
	strS = str(someNumber)
	if(len(strS) < 2):
		return False
	return strS == strS[::-1];

lychrels = []

for num in range(1, 10001):
	wr = num
	islychrel = True
	for i in range(1, 51):
		wr += int(str(wr)[::-1])
		#print "num = %i i = %i wr=%i" % (num, i, wr)
		if isPalindrome(wr):
			islychrel = False
			break
	if islychrel:
		#print "is Lychrel: %i" % num
		lychrels.append(num)
		
print len(lychrels)
			
		