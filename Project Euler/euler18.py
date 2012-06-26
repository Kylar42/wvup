def calcNewMaxRows(maxPrevRows, curRow):
	if(len(maxPrevRows) != (len(curRow)-1)):
		print "uneven row sizes. Ouch."
	newMaxRows = []
	index = 0;
	#print maxPrevRows
	#print curRow
	for val in curRow:
		#print index
		numVal = int(val)
		if(0 == index):
			newMaxRows.append(maxPrevRows[0]+numVal)
		elif(index == (len(curRow)-1)):
			newMaxRows.append(maxPrevRows[index-1]+numVal)
		else:
			#print len(maxPrevRows)
			smv = maxPrevRows[index]
			#print "b"
			smv2 = maxPrevRows[index-1]
			#print "numVals: %i %i %i" % (smv,smv2,max(smv,smv2))
			newMaxRows.append(numVal+max(smv,smv2))
		
		index += 1
	
	return newMaxRows





file = open("triangle - 18.txt", 'r')
lines = file.readlines()
triangle = []

for line in lines:
	splitLine = line.split(" ")
	newLine = []
	for cur in splitLine:
		newLine.append(int(cur))
	
	triangle.append(newLine)

maxRows = [int(triangle[0][0])]
for i in range(1, len(triangle)):
	#print "Triangle"
	#print triangle[i]
	maxRows = calcNewMaxRows(maxRows, triangle[i])
	#print maxRows
	
print sort(maxRows)
#start at row 0, to row n.

	