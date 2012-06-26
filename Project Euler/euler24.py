

def returnPerms(listOfchars):
	toreturn = []
	#print "List"
	#print listOfchars
	#print listOfchars
	if(len(listOfchars) == 2):
		toreturn.append([listOfchars[0], listOfchars[1]])
		toreturn.append([listOfchars[1], listOfchars[0]])
	else:
		#break out each one and feed the rest in.
		for i in range(0, len(listOfchars)):
			char = listOfchars[i]
			newlist = listOfchars[:]
			newlist.remove(char)
			returnedList = returnPerms(newlist)
			for listElement in returnedList:
				listElement.insert(0, char)
				toreturn.append(listElement)
		
		#print toreturn
	return toreturn


lista = ['1','2','3','4','5','6','7','8','9']
listb = ['0','2','3','4','5','6','7','8','9']
listc = ['0','1','3','4','5','6','7','8','9']

perms = returnPerms(lista)
perms = returnPerms(listb)
perms = returnPerms(listc)
size = len(perms)*3
print size
print len(perms)
print perms[274239]