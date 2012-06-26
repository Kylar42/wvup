

def factorial(n):
  if n == 0:
    return 1
  else:
    recurse = factorial(n-1)
    result = n * recurse
    return result


bignum = factorial(100)
cursum=0
while(bignum > 0):
	cursum += bignum%10
	bignum /= 10

print cursum
