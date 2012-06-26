import math

bottomP = 165
bottomH = 143

def triangleNum(num):
	return num*(num+1)/2
	
def pentagonalNum(num):
	return num*(3*num-1)/2

def hexagonalNum(num):
	return num*(2*num-1)

def checkPandH(num):
	#check to see if it's a pent first.
	global bottomP
	global bottomH
	found = False
	for i in range(bottomP, 10000000):
		p = pentagonalNum(i)
		if(p > num):
			bottomP = i
			return False
		if(p == num):
			bottomP = i
			found = True
			break
	
	if(found):	
		for i in range(bottomH, 10000000):
			h = hexagonalNum(i)
			if(h > num):
				bottomh = i
				return False
			if(h == num):
				bottomh = i
				return True
	
	return False
	
t = []
p = []
h = []	

i = 285
while True:
	tnum = triangleNum(i)
	if(checkPandH(tnum)):
		print tnum
	i += 1


