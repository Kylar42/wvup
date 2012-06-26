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
	temp_p = pentagonalNum( bottomP )
	temp_h = hexagonalNum( bottomH)

	if (num == temp_p) and (num == temp_h):
		return True

	while (temp_p < num ):
		bottomP += 1
		temp_p = pentagonalNum( bottomP )

	while (temp_h < num ):
		bottomH += 1
		temp_h = hexagonalNum(bottomH)

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


