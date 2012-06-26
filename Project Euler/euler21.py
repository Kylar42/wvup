import eulerutils as eu

somesum = 0

#print eu.divisorsOf(220)
#print eu.divisorsOf(284)
for i in range(1, 10000):
	listSum = sum(eu.divisorsOf(i))
	if(i == listSum):
		continue
	if(sum(eu.divisorsOf(listSum)) == i):
		print "AmicablePair Found: %i, %i" % (i, listSum)
		#only add once
		somesum += i

print somesum

