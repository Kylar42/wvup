#!/usr/bin/python

import random

numbertoguess=random.randint(0, 9)

print "I've picked a number between 0 and 9. Now, you should try to guess it."

guess = raw_input("Please Guess A Number:")

numberwrong = 0

while(int(guess) != numbertoguess):
	print "I'm sorry, that's not it. Try again!"
	numberwrong = numberwrong + 1
	if numberwrong > 3:
		difference = numbertoguess - int(guess)
		if difference < 0:
			print("Here's a hint: It's lower than that!")
		else: 
			print("Here's a hint: It's higher than that!")
	guess = raw_input("Please Guess another Number:")
	

print "Congratulations! You guessed it!"