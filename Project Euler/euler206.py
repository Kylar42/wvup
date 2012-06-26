import re

regex = "1.2.3.4.5.6.7.8.9.0"
prog = re.compile(regex)

i = 1000000000
while(i < 1390000000):
	sq = i * i
	if(prog.match(str(sq))):
		print "Found: %i" % sq
	i += 1
	

#for i in range(1000000000, 1390000000):
#	print i
	#sq = i * i
	#print sq
	#if prog.match(str(sq)):
	#	print "Found: %i" % sq


	