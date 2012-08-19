#!/usr/bin/env python

def primesLessThan2(n):
 siv=range(3,n+1,2)
 for i in xrange(int(n**0.5)/2+1):
   if siv[i]:
     m = i*2+3
     siv[i+m:n/m*m+1:m]=[0]*((n/m-1)/2)
 return [2]+filter(None,siv)

def primesLessThan3(n):
 sh = 5
 msk = (1<<sh)-1
 shifts = [1<<(x/2) for x in xrange(msk+1)]
 bits = [0]*((n>>sh)+1)
 for i in xrange(3,int(n**0.5)+1,2):
   if not(bits[i>>sh] & shifts[i&msk]):
     for j in xrange(i*3, n+1, i*2):
       bits[j>>sh] |= shifts[j&msk]
 return [2]+[x for x in xrange(3,n+1,2) if not(bits[x>>sh] & shifts[x&msk])]

def primesLessThan4(n):
 iterSize = 10000000
 base = primesLessThan2(min(n,iterSize))
 for i in [x for x in base if x < n]:
   yield i
 for i in xrange(iterSize,n,iterSize):
   siv=range(i,i+iterSize)
   for j in [x for x in base if x <= int((i+iterSize)**0.5)+1]:
     start = j - i%j
     if i%j == 0:
       start = 0
     siv[start::j]=[0]*((iterSize-start-1)/j+1)
   for j in [x for x in filter(None,siv) if x < n]:
     yield j

def primesListLessThan(n):
    returnList = []
    for x in primesLessThan4(n):
        returnList.append(x)
    
    return returnList