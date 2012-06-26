# find a+b+c = 1000 where a^2+b^2=c^2

#we know that a+b+c=1000
from math import sqrt

def perfectSquares(belowNumber):
	squares = []
	for i in range(1, belowNumber):
		sq = i*i
		if(sq < belowNumber):
			squares.append(sq)
			
	return squares
	





squares = perfectSquares(1000000)
for bigsq in reversed(squares):
	#let's try to see if there are any other squares that equal this.
	for i in range(0,len(squares)-2):
		if(squares[i] >= bigsq):
			break
		for j in range(i, len(squares)-1):
			if(squares[j] >= bigsq):
				break
			if((squares[i] + squares[j]) == bigsq):
				#we have a triplet.
				a=sqrt(squares[i])
				b=sqrt(squares[j])
				c=sqrt(bigsq)
				if((a+b+c) == 1000):
					print "Golden Triplet Found"
					print "Triplet Found: A=%i B=%i C=%i" % (a,b,c)
		