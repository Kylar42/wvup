first, second = 1,2
sum = 2 #start at 2 since we know it will get added.
while True:
	next = first + second
	first = second
	second = next
	if(next > 4000000):
		break
	if(0 == next % 2):
		sum += next
		
print sum
	