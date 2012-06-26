import eulerutils as eu

count = 0
for i in (1,9999998):
	if(i % 1000 == 0):
		print "Count i: %i" % (i)
	for j in (i, 9999999):
		k = 10000000 - (i + j)
		if 1 == eu.gcd(i, j) and 1 == eu.gcd(j, k) and 1 == eu.gcd(i,k):
			print "Found primitive: %i, %i, %i" % (i,j,k)
			count += 1


print "Count: %i" % count
