#!/usr/bin/env python

#Setup
valueDict = {}
valueDict['M']=1000
valueDict['D']=500
valueDict['C']=100
valueDict['L']=50
valueDict['X']=10
valueDict['V']=5
valueDict['I']=1

def romanToInt(romanNumeral):
    integerToReturn = 0
    x = 0
    while x < (len(romanNumeral)):
        curChar = romanNumeral[x]
        if 'M' == curChar:
            integerToReturn = integerToReturn + 1000
            x = x + 1            
            continue
        elif 'D' == curChar:
            integerToReturn = integerToReturn + 500
            x = x + 1            
            continue
        elif 'C' == curChar:
            #check if the next one is a M or D.
            if( x < len(romanNumeral)-1):
                nextChar = romanNumeral[x+1]
                if('D' == nextChar):
                    integerToReturn = integerToReturn+400
                    x = x + 2
                    continue
                elif('M' == nextChar):
                    integerToReturn = integerToReturn+900
                    x = x + 2
                    continue
            
            integerToReturn = integerToReturn+100
            x = x + 1            
            continue
        elif 'L' == curChar:
            integerToReturn = integerToReturn + 50
            x = x + 1            
            continue
        elif 'V' == curChar:
            integerToReturn = integerToReturn + 5
            x = x + 1            
            continue
        elif 'X' == curChar:
            #check if the next one is a M or D.
            if( x < len(romanNumeral)-1):
                nextChar = romanNumeral[x+1]
                if('L' == nextChar):
                    integerToReturn = integerToReturn+40
                    x = x + 2
                    continue
                elif('C' == nextChar):
                    integerToReturn = integerToReturn+90
                    x = x + 2
                    continue
            
            integerToReturn = integerToReturn+10
            x = x + 1            
            continue
        
        elif 'I' == curChar:
            #check if the next one is a V or X.
            if( x < len(romanNumeral)-1):
                nextChar = romanNumeral[x+1]
                if('V' == nextChar):
                    integerToReturn = integerToReturn+4
                    x = x + 2
                    continue
                elif('X' == nextChar):
                    integerToReturn = integerToReturn+9
                    x = x + 2
                    continue
            
            integerToReturn = integerToReturn+1
            x = x + 1            
            continue
        else:
            print "should never get here."
            

    return integerToReturn


coding = zip(
    [1000,900,500,400,100,90,50,40,10,9,5,4,1],
    ["M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"]
)

def decToRoman(num):
    if num <= 0 or num >= 5000 or int(num) != num:
        raise ValueError('Input should be an integer between 1 and 4999')
    result = []
    for d, r in coding:
        while num >= d:
            result.append(r)
            num -= d
    return ''.join(result)
    


f = open('roman.txt', 'r')

listOfNumsInDec=[]
originalList=[]
newRomans=[]
for line in f:
    listOfNumsInDec.append(romanToInt(line.strip()))
    originalList.append(line.strip())
    
for n in listOfNumsInDec:
    newRomans.append(decToRoman(n))

print len(newRomans)
print len(originalList)

lessChars = 0

for x in xrange(0,1000):
    len1 = len(originalList[x])
    len2 = len(newRomans[x])
    lessChars = lessChars + (len1-len2)
    
print lessChars

#num = romanToInt("MMCDLXII")

#print "Number is: %d" % num