from array import array
import time
a="aRbFR"
b="LFaLb"
def replaceString(characterArray, index, stringVar):
	for i in range(0,len(stringVar)):
		characterArray.insert(index+i, stringVar[i])
	#print "BeforePop"
	#print(characterArray)
	characterArray.pop(index+len(stringVar))
	#print characterArray
	return characterArray

def reWrite2(inString):
	for i in range(len(inString)-1, -1, -1):
		if(inString[i] == 'a'):
			inString.insert(i, "RbFR")
		elif(inString[i] == 'b'):
			inString.insert(i-1, "LFaL")
			i -= 1
	
	return inString

	
def reWrite(inString):
	returnString = inString
	i=0
	while i < len(returnString):
		#print "while loop"
		#print returnString
		#print "::::::"
		char=returnString[i]
		if(char == "a"):
			returnString = replaceString(returnString,i,"aRbFR")
			i+=5
		elif(char == "b"):
			returnString = replaceString(returnString,i,"LFaLb")
			i+=5
		i += 1
	return returnString


def nextTuple(currentlocation, move):
	x = currentlocation[0]
	y = currentlocation[1]
	direction = currentlocation[2]
	#print "x: %i y: %i d: %i" % (x,y,direction)
	step = False
	if 'L' == move:
		direction -= 1
		if(direction == -1):
			direction = 3
	elif 'R' == move:
		direction += 1
		if(direction == 4):
			direction = 0
	else:
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

def followTheString2(stringToFollow):
	curTuple = (0,0,0)
	moves = []
	curSteps = 0
	#print stringToFollow
	for i in range(0,len(stringToFollow)):
		curMove=stringToFollow[i]
		if(curMove == 'a' or curMove == 'b'):
			continue
		else:
			(didStep, tmpTuple) = nextTuple(curTuple, curMove)
			if(didStep):
				curSteps += 1
				moves.append(tmpTuple)
			curTuple = tmpTuple
	
	return moves
			

def followTheString(stringToFollow):
	#print "Following String:"
	#print len(stringToFollow)
	x = 0
	y = 0
	direction=0#0=up, 1=right 2=down 3=left
	curSteps = 0
	moves = []
	for i in range(0,len(stringToFollow)):
		print "x: %i y: %i d: %i" % (x,y,direction)
		cur=stringToFollow[i]
		#print "Evaluating: %c" % cur
		if("F" == cur):
			#print "move"
			#move
			if(0 == direction):
				y += 1
			elif(1 == direction):
				x += 1
			elif(2 == direction):
				y -= 1
			elif(3 == direction):
				x -= 1
			curSteps += 1
			tuple = x,y,direction
			moves.append(tuple)
			if(curSteps % 1000 == 0):
				print(curSteps)
			#if(numOfSteps == curSteps):
				#return str(x)+","+str(y)
		elif("L" == cur):
			#print "Left"
			#decrement
			direction -= 1
			if(direction < 0):
				direction = 3
		elif("R" == cur):
			#increment
			#print "right"
			direction += 1
			if(4 == direction):
			 	direction=0
		
	return moves



def traverse(stringarray, powerof2):
	steps = 0
	for i in range(0, pow(2, powerof2)):
		steps += 1
	print steps



		
string1 = array('c')
string1.append('F')
string1.append('a')
string2 = string1
dNum = 6
#string2 = ""


#for i in range(0, 3):
#	string2 = reWrite(string2)

for a in range(0,dNum):
	#string2 = string1.tostring()
	string1 = reWrite(string1)
	print(string1)
	#print followTheString(string2)

moves = followTheString(string1)

#print moves[499]

moves = followTheString2(string1)

print "try #2"
print moves[499]
#let's start with string2

"""
OK so what we have to do is iterate the number of steps. until we hit the number of steps - we take 
the string that we've 'composed' - and traverse it forward and backwards, adding an R inbetween each one.
"""
string2reverse = string2.reverse()
print "try#3"
curTuple = (0,0,0)
curSteps = 0
first = True
lookingFor = 499
while curSteps < 1000:
	#traverse forwards.
	if(first == False):
		first = False
		(ignore, curTuple) = nextTuple(curTuple, 'R')
		
	for i in range(0, len(string2)):
		curMove = string2[i]
		(didStep, curTuple) = nextTuple(curTuple, curMove)
		if(didStep):
			curSteps += 1
			print curTuple
		if (lookingFor == curSteps):
			print "Tuple Found! %i" % curSteps
			print curTuple
	
	#got to the end of the first string. Now backwards, but reversed.	
	(ignore, curTuple) = nextTuple(curTuple, 'R')

	for i in range(0, len(string2reverse)):
		curMove = string2reverse[i]
		(didStep, curTuple) = nextTuple(curTuple, curMove)
		if(didStep):
			curSteps += 1
			print curTuple
			
		if (lookingFor == curSteps):
			print "Tuple Found! %i" % curSteps
			print curTuple
	first = False
	




#traverse forwards, then add r, then backwards. then return how many steps we're at, then 


