numfile = open("2020square.txt", "r")
myList = numfile.readlines()
#sum
lines = []
for line in myList:
	curline = line.split(' ')
	numList = []
	for cur in curline:
		numList.append(int(cur))
	lines.append(numList)

#across
acrossBiggestProduct=0
for row in range(0,20):
	for col in range(0,16):
		curProduct=lines[row][col] * lines[row][col+1] * lines[row][col+2] * lines[row][col+3]
		if(curProduct > acrossBiggestProduct):
			acrossBiggestProduct = curProduct

print "AcrossBP: %i" % acrossBiggestProduct
#now down.

downBiggestProduct=0
for row in range(0,16):
	for col in range(0,20):
		curProduct=lines[row][col] * lines[row+1][col] * lines[row+2][col] * lines[row+3][col]
		if(curProduct > downBiggestProduct):
			downBiggestProduct = curProduct

print "Down BP: %i" % downBiggestProduct

diagBP=0
for row in range(0,16):
	for col in range(0,16):
		curProduct=lines[row][col] * lines[row+1][col+1] * lines[row+2][col+2] * lines[row+3][col+3]
		if(curProduct > diagBP):
			diagBP = curProduct
print "Diag1 BP: %i" % diagBP


odiagBP=0
for row in range(19,3,-1):
	for col in range(0,16):
		curProduct=lines[row][col] * lines[row-1][col+1] * lines[row-2][col+2] * lines[row-3][col+3]
		if(curProduct > odiagBP):
			odiagBP = curProduct
print "Diag2 BP: %i" % odiagBP

