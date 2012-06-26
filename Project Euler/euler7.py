test = 1
while True:
	canDivide = True
	for i in range(11, 20):
		if(0 != canDivide % i):
			canDivide = False
			break
			
	if(canDivide):
		print i
		break
	else:
		canDivide += 1
		
		
