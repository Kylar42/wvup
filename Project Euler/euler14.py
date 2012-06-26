def even(num):
	return num/2
	

def odd(num):
	return (3*num)+1

def iterateAndCount(num):
	tmp = num
	count = 0
	while(tmp != 1):
		if(tmp % 2 == 0):
			tmp = even(tmp)
		else:
			tmp = odd(tmp)
		
		count += 1
	
	return count

maxCount = 0
maxNum = 0
for i in range(1, 1000000):
	count = iterateAndCount(i)		
	if(count > maxCount):
		maxCount = count
		maxNum = i
	if(i % 1000 == 0):
		print "iter: %i max: %i maxCount: %i" % (i,maxNum,maxCount)


