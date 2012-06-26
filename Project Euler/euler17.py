units = ["", "", "hundred", "thousand"]
undertwenty = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen","fifteen", "sixteen", 
"seventeen", "eighteen", "nineteen"]
tens = ["", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]

def numberAsString(num):
	toreturn = ""
	print "num: %i" % num
	if(num > 999):
		toreturn += "onethousand"
		num = num % 1000
	
	#print "bnum: %i" % num
	
	hundreds = False
	if(num > 99):
		hundreds = True
		#print "hundreds"
		hval = (num / 100) % 10
		toreturn += undertwenty[hval-1] + "hundred"
		#set num up
		num = num % 100
	
	#print "cnum: %i" % num
		
	#now we get into a weird state - if it's greater than 20 we have to append.
	if(num > 0 and hundreds):
		toreturn += "and"
	if(num > 19):
		onesv = num % 10
		tensv = num / 10
		if(tens > 0):
			#print "tens: " + tens[tensv-1]
			toreturn += tens[tensv-1]
		if(onesv > 0):
			#print "ones: " + undertwenty[onesv-1]
			toreturn += undertwenty[onesv-1]
	elif(num > 0):
		toreturn += undertwenty[num-1]
	
	return toreturn 
	
first =  numberAsString(342)
second = numberAsString(115)

#print len(first)
#print len(second)

sum = 0
for i in range(1, 1001):
	sum += len(numberAsString(i))
	
print sum