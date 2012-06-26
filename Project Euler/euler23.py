import eulerutils as eu

abundants = []
for i in range(1, 28124):
	#print "looking at %i" % i
	if eu.abundantOrDeficient(i) > 0:
		#print "was abundant."
		abundants.append(i)
	#else:
		#print "wasn't abundant."

#now we need to create this list of 'abundant sums'
print abundants
print "Abundant length: %i" % len(abundants)
abundantSums = set([])

for i in range(0, len(abundants)):
	#print "Looping i: %i" % i
	for j in range(i, len(abundants)):
		abundantSums.add(abundants[i] + abundants[j])

print "Abundant sum calc complete, length= %i" % len(abundantSums)
#print abundantSums


somesum = 0
print "Starting sumrange"

for i in range(1, 28124):
	if i not in abundantSums:
		#print "Not Abundant: %i" % i
		somesum += i	
print somesum

