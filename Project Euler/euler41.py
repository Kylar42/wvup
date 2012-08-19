#!/usr/bin/env python
import eulerutils as eu


pandigitals = [4321, 54321, 654321, 7654321, 87654321,987654321]

biggestPrime = 2

tmpList = []
for num in pandigitals:
    tmpList = tmpList + eu.getCombinationsOfNumber(num)

for num in tmpList:
    if eu.isPrime(num):
        if num > biggestPrime:
            biggestPrime = num
            print "Found Prime! %d" % num     