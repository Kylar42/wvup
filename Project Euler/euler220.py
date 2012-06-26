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


def followTheString(stringToFollow):
	#print "Following String:"
	print len(stringToFollow)
	x = 0
	y = 0
	direction=0#0=up, 1=right 2=down 3=left
	curSteps = 0
	moves = []
	for i in range(0,len(stringToFollow)):
		#print "x: %i y: %i d: %i" % (x,y,direction)
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

def strip(string):
	i = 0
	charArray = array('c',string)
	while i < len(charArray):
		#print "looking at %c" % charArray[i]
		if(charArray[i] == 'a' or charArray[i] == 'b'):
			charArray.pop(i)
			i -= 1
		i += 1
	
	#print charArray.tostring()
	return charArray

def compareA(laststring, curstring):
	#print "Lengths: %i %i" % (len(laststring), len(curstring))
	laststringA = strip(laststring)
	curstringA = strip(curstring)
	#OK, curstring is made up of laststring + somechars + the last half of laststring.
	#print laststringA.tostring(), curstringA.tostring()
	start = len(laststringA)
	endofcurstring = curstringA[start:]
	#now take the last half of laststring, and take it off of the end of cur string.
	endx = start / 2
	remnants = endofcurstring[:endx]
	#print len(remnants)
	
	# Ok now remnant is broken up into groups of 5 + 1. where each 5 is one of these: and the 1 is always an R.
	A="RLFRF"#mv 1f 1r, 90r 2 stp
	B="RLFLF"#mv 1f 1l, 90l 
	C="LLFLF"#mv 1b 1r, 90r
	D="LLFRF"#mv 1b 1l, 90l
	
	
	#print remnants.tostring()
	#print "Size: %i" % len(remnants)
	i = len(remnants)-6
	while i > 4:
		#print i
		remnants.pop(i)
		i-=6
	
	remnantStr = remnants.tostring()

	#print remnantStr
	remnantStr = remnantStr.replace(A, "A")
	remnantStr = remnantStr.replace(B, "B")
	remnantStr = remnantStr.replace(C, "C")
	remnantStr = remnantStr.replace(D, "D")
	#16 steps
	F="ABACABDC"#180 turn
	G="ABACDBDC"#4f 4r
	H="DBACDBDC"#2b2l 180
	I="DBACABDC"#no mv
	#level 2
	remnantStr = remnantStr.replace(F, "F")
	remnantStr = remnantStr.replace(G, "G")
	remnantStr = remnantStr.replace(H, "H")
	remnantStr = remnantStr.replace(I, "I")
	
	#map of x213y243
	J="FGFHFGIH"
	K="FGFHIGIH"
	L="IGFHIGIH"
	M="IGFHFGIH"

	remnantStr = remnantStr.replace(J, "J")
	remnantStr = remnantStr.replace(K, "K")
	remnantStr = remnantStr.replace(L, "L")
	remnantStr = remnantStr.replace(M, "M")
	
	#opqr x214y243
	O="JKJLJKML"
	P="JKJLMKML"
	Q="MKJLMKML"
	R="MKJLJKML"
	
	remnantStr = remnantStr.replace(O, "O")
	remnantStr = remnantStr.replace(P, "P")
	remnantStr = remnantStr.replace(Q, "Q")
	remnantStr = remnantStr.replace(R, "R")
	
			
	print remnantStr
	
	#this is a guess, based on the last one.
	
	#print remnants.tostring()
	
		
string1 = array('c')
string1.append('F')
string1.append('a')
dNum = 9
steps = [ 15, 99, 210, 301, 440, 501, 512]
string2 = ""
for a in range(0,dNum):
	#print "rewriting: %i" % a
	#t1 = time.time()
	string2 = string1.tostring()
	string1 = reWrite(string1)
	print followTheString(string2)
	#print string1
	#print len(string1.tostring())
	#if(a >1):
		#compareA(string2, string1.tostring())
	#print strip(string1.tostring())
	#print string1
	#if(a >= 10):
	#	print "Set: %i" % a
	#	for step in steps:
	#		print "Step: %i loc: %s" % (step, followTheString(string1, step))
	#print "took: "
	#print time.time() - t1
	
#print(len(string1))
#print(string1)
#newString = strip(string1)
#print len(newString)
#print newString
#print followTheString(string1, steps)

