file = open("matrix.txt", 'r')
lines = file.readlines()
matrix = []

for line in lines:
	splitLine = line.split(",")
	newLine = []
	for cur in splitLine:
		newLine.append(int(cur))
	
	matrix.append(newLine)

curRow = 0
curCol = 0
count = 0
count = matrix[0][0]

def printMatrix(matrix, height, width):
	for x in range(0, width):
		print ""
		for y in range(0, height):
			print (" %d" % matrix[x][y]),


printMatrix(matrix, 20, 20)	

print "matrix length is: %i" % len(matrix[0])

#start at N, N, work X backwards until 0.
#For each X, take X, Y, X-1, Y-1 until X = max.
maxX = 10
maxY = 9 #1 less
# include maxX-1, maxY

for startX in range(maxX,-1, -1):
	curY = maxY
	for curX in range(startX, maxX):
		print "Looking at X,Y: %d,%d" % (curX, curY)
		curY = curY - 1

#Half done, now need to do the same, but minusing the Y's.
for startY in range(maxY, -1, -1):
	curX = 0;
	for curY in range(startY, 0, -1):
		print "Looking at X,Y: %d,%d" % (curX, curY)
		curX = curX + 1


#include 0,0

