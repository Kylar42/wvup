import time

listOfPowers=[]
for i in range(0, 50):
	listOfPowers.append(pow(2,i))
	
def divisiblePowerOf2odd(someNumber):
	#print "number looking at is: %i" % someNumber
	for i in range(0, len(listOfPowers)):
		pow = listOfPowers[i]
		if(0 == someNumber % pow):
			dividend = someNumber / pow
			if(0 == dividend % 2):
				continue
			else:
				return pow


def leftOrRight(someNumber):
	pow2 = divisiblePowerOf2odd(someNumber)
	oddNum = someNumber / pow2
	mod = oddNum % 4
	#print "lr somenum: %i pow: %i mod %i" % (someNumber, pow2, mod)
	if(mod == 3):
		return True#L
	elif(mod == 1):
		return False#R
	else:
		print "Found bad value: %i 2pow: %i mod: %i" % (someNumber, pow2, mod)

def nextTuple(currentlocation, move):
	x = currentlocation[0]
	y = currentlocation[1]
	direction = currentlocation[2]
	#print "x: %i y: %i d: %i" % (x,y,direction)
	step = False
	if(0 == direction):
		y += 1
	elif(1 == direction):
		x += 1
	elif(2 == direction):
		y -= 1
	elif(3 == direction):
		x -= 1
	step = True
	return (step, (x, y, direction))

def rotate(currentlocation, move):
	dir = currentlocation[2]
	if(move):
		dir = (dir-1) %4
	else: 
		dir = (dir+1) %4
	return (currentlocation[0], currentlocation[1], dir)

#	x: 2 y: -1 d: 2 is step #5.
#curTuple = (2,0,1)#after turn 3?
curTuple = (2,-1,2)#turn 4

#print leftOrRight(6)
dest = 1000000
startTime = time.time()
for i in range(5,dest):
	nextchar = leftOrRight(i)
	#print "i: %i %c" % (i, nextchar)
	#(didStep, curTuple) = nextTuple(curTuple, nextchar)
	curTuple = rotate(curTuple, nextchar)
	(didStep, curTuple) = nextTuple(curTuple, 'F')
	#if(i % 10000 == 0):
	#	print "running val: %i" % i
		
print time.time() - startTime
		

print curTuple
	