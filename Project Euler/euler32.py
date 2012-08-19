#!/usr/bin/env python

import eulerutils as eu

productsDict = {}
products = set()

for x in range(1, 10000):
    for y in range(x, 100000):
        number = int(str("%d%d%d" % (x, y, x*y)))
        key = "%d*%d=%d" % (x, y, x*y)
        if number < 1000000000:
            if number > 123456788 and eu.isPandigital(number):
                productsDict[key] = x*y
                products.add(x*y)
        else:
            break
            
            

print products
print sum(products)
print productsDict