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
count = 0;
count = matrix[0][0]

print "matrix length is: %i" % len(matrix[0])
while(curRow < 79 and curCol < 79):
	#Ok look at the number to the left and below.
	print "looking at row:%i col:%i" % (curRow, curCol)
	print "matrix size: %i rowSize = %i" % (len(matrix), len(matrix[curRow]))
	
	left = matrix[curRow][curCol+1]
	below = matrix[curRow+1][curCol]
	if left == below:
		print "They're trying to trick me at row:%i col:%i" % (curRow, curCol)
	if(left > below):
		count += left
		curCol += 1
	else:
		count += below
		curRow += 1

print "curRow: %i curCol: %i" % (curRow, curCol)

while curRow < 79:
	curRow += 1
	count += matrix[curRow][79]
	

while curCol < 79:
	curCol += 1
	count += matrix[79, curCol]
	

print count
	