#!/usr/bin/env python
import eulerutils as eu

listOfPrimes = [0,2,3,5,7,11,13,17]

def checkForPrimeCraziness(number):
    number = int(number)
    if(number < 1000000000):
        return False
    
    string = str(number)
    
    for x in xrange(1,8):
        num1 = int(string[x]+string[x+1]+string[x+2])
        prime = listOfPrimes[x]        
        if(num1 % prime != 0):
            return False

    return True

pandigital = 1234567890

combos = eu.getCombinationsOfNumberAsString(pandigital)
    
print "Combo Size: %d" % len(combos)
f = open ("/tmp/combos.txt", 'w+')
for foo in combos:
    f.write("%s\n" % foo)
    
f.close()

listOfPans = []
for pan in combos:
    if(pan == '1406357289'):
        print "You Rock."
    if(checkForPrimeCraziness(pan)):
        print "Ooooooo Yeah. Found it baby: %s" % pan
        listOfPans.append(pan)

total = 0

for foo in listOfPans:
    total = total + int(foo)
    
print "Total: %d" % total
