
digit = 1
#stringDig = "1"
#count = 0

def nextDigit():
    #global stringDig
    global digit
    #global count
    toReturn = ""
    #if not, increment digit, convert to a string and assign it to stringdig
    #if stringDig == None or len(stringDig) < 1:
    #    digit = digit + 1
    #    stringDig = str(digit)
    if digit     
    #See if there's anything left in string. if there is, return the first piece, and reassign string to what's left.
    toReturn = stringDig[0]
    stringDig=stringDig[1:]
    #stringDig count
#    count = count + 1    
    return toReturn

sumVal = 1
modVal = 10

for i in range(1, 1000001):
    
    if (i % modVal) == 0:
        nextDig = nextDigit()
        print "found NextDigit:"+nextDig
        sumVal = sumVal * int(nextDig)
        modVal = modVal * 10
    else:
        nextDigit()
        

print sumVal    
    
    
