sum = 0
for i in range (1,1000):
	if (0 == (i % 3)):
		sum += i	
	elif(0 == (i % 5)):
		sum += i	
print sum
