def sumDigits(bignum):
	cursum=0
	while(bignum > 0):
		cursum += bignum%10
		bignum /= 10
	
	return cursum



reallybignum=pow(2,1000)
print reallybignum
print sumDigits(reallybignum)
