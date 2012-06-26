import eulerutils as eu

digitsum = 0

for i in range(1,100):
	print i
	for j in range(1,100):
		tmp = eu.sumdigits(pow(i,j))
		if(digitsum < tmp):
			digitsum = tmp


print digitsum
