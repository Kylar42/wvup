#!/usr/bin/env python
import eulerutils as eu

primes = eu.getPrimesBelowAsSet(10000)

for prime in primes:
    if(prime < 1000):
        primes.remove(prime)
        


dictOfPrimeRotations={}

for prime in primes:
    
