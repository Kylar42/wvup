#!/usr/bin/python


name = raw_input("What is your name? ")

print "It's nice to meet you, "+name

year = 2014

age = raw_input("How old are you? ")

age = int(age)

yearborn = year - age

print "You were born in the year "+str(yearborn)

ageIn2050 = 2050-yearborn

print "In 2050 you will be "+str(ageIn2050)+" years old! Wow."

