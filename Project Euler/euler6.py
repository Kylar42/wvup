#difference of the sum of the squares and the square of the sums.
squareSums=0
sums = 0
for i in range(1,101):
	sums+= i
	squareSums += i*i

print (sums * sums)-squareSums