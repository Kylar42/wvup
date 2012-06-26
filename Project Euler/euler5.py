for test in range(20,400000000, 20):
	canDivide = True
	#print "Looking at: %i" %test
	for i in range(11, 20):
		if(0 != test % i):			
			canDivide = False
			break
			
	if(canDivide):
		print test
		break
	
		
		
