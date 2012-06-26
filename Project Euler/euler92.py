def sqDigits(num):
	
	newNum = num
	digits = []
	while newNum > 0:
		digits.append(newNum % 10)
		newNum /= 10;
	
	sum = 0
	for i in range(0, len(digits)):
		sum += digits[i] ** 2
	
	return sum


count = 0
sum = 0
for number in range(1, 10000000):
	if(0 == number % 10000):
		print "Count: %i" % number	
	while(number != 89 and number != 1):
		number = sqDigits(number)
	if 89 == number:
		sum += 1
	


print sum








