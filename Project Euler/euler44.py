import math

pents = [0]
def pentagonalNum(num):
	return num*(3*num-1)/2



for i in range(1,5000):
	pents.append(pentagonalNum(i));
print "done pents1"
for i in range(1,4999):
	print "I count: %i" % i
	for j in range(i+1, 5000):
		num1 = pents[i]
		num2 = pents[j]
		sum = num1+num2
		diff = num2-num1
		if sum in pents and diff in pents:
			print diff

