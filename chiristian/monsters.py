#!/usr/bin/python

import random
import sys


#Here we'll define something called a Monster. Since they'll exist seperately, we'll make different Monsters, but 
# they all behave the same. They have a name, some hit points, and a maximum damage.
class Monster(object):
	name = ""
	hp = 0
	damage = 0
	
	# The class "constructor" - It's actually an initializer
	#this will get called whenever we create a monster. creating a monster
	#will set the name, hitpoints and max damage. 
	def __init__(self, name, hp, damage):
		self.name = name
		self.hp = hp
		self.damage = damage
	
	#this method is what we will call to find out if the monster is still alive.
	def isAlive(self):
		#return (self.hp > 0)
		if(self.hp > 0):
			return True
		else:
			return False

#here's a special piece of code that will create us a new monster, using the class above.
def make_monster(name, hp, damage):
    monster = Monster(name, hp, damage)
    return monster




#We'll have 7 locations to start with. 
numberOfLocations = 7
locations = ["forest", "desert", "beach", "meadow", "volcanic pit", "small village", "pitch black area"]

#now we'll make a monster for each location. The first monster will live in the first location, and so on, until the Grue, which will live in the pitch_black_area
monsters = [make_monster("orc", 7, 6), make_monster("camel", 20, 4), make_monster("sea harpy", 15, 8), make_monster("butterfly", 1, 1), make_monster("lava elemental", 40,10), make_monster("villager", 12, 2), make_monster("grue", 100, 8)]


#And now we need to set up our player! Our player could even be a "Monster" too, since he has hitpoints and does damage, but we'll just use
#some variables.
playerHP = 100
weapon = "iron sword"
weaponDamage = 10



#Let;s print something out to tell the player what's going on.
print "You decide to go aventuring. You take along your trusty "+weapon+". If you reach the end you will have ALL THE TREASURE!"

#Our program needs to loop through all the locations, in order.
for x in range(0, numberOfLocations):
	#get the location and monster that correspond to x. 
	current_location = locations[x]
	currentMonster = monsters[x]
	
	#Now let's print out the location and monster. 
	print "-----NEW LOCATION------------------"
	print "You are standing in a "+current_location+"."
	print "You see a "+currentMonster.name+". It attacks."
	
	#A monster! We'll battle until either the player is dead or the monster is dead.
	while currentMonster.isAlive() and playerHP > 0:
		raw_input("Press enter to attack.")
		
		print "---BATTLE----------------BATTLE"
		
		#generate the amount of damage that the player and the monster both do. 
		#this is random, between 0 and their maximum damage.
		playerDamage = random.randint(0, weaponDamage)
		monsterDamage = random.randint(0, currentMonster.damage)
		
		#now that we know how much damage each does, let's adjust our hitpoints.
		playerHP = playerHP - monsterDamage
		currentMonster.hp = currentMonster.hp - playerDamage
		
		#now we can print out what happened so the user knows.
		print "You did "+str(playerDamage)+" damage to the monster."
		print "The "+currentMonster.name+" did "+str(monsterDamage)+" to you."
		print "Your HP: "+str(playerHP)+" Monster HP:"+str(currentMonster.hp)
		
	#now either the player died, or the monster died. Let's print out what happened.
	if(playerHP > 0):
		print "You killed the "+currentMonster.name+"! Congratulations! "
		print ""
	else:
		print " Oh No! The monster killed you!"
		sys.exit(0)



#now if we get here, we've gone through all the locations! Yay!
print "Congratulations! You've reached the end of the adventure! ALL THE TREASURE IS YOURS!"
	
