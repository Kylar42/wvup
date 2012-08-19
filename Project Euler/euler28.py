

total = 1
lastn = 1
for x in xrange(2, 1002):
	lastn = lastn+(2*(x-1))
	total = total + lastn + (x*x) + ((x % 2) and 1 or 0)

print total
	
	#if (x % 2) == 0:
#		total = total + 1
		
	#else:
	#	total = total + (x*x)
	#calc N
	#newn = lastn+(2 * (x-1))
	#total = total + newn
	#print total
	#print ("x=%d lastn=%d newn=%d total=%d" % (x, lastn, newn, total))
	#lastn = newn
	
print total
	