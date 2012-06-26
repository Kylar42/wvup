from sets import Set

numbers = []
for a in range(2,101):
	for b in range(2,101):
		numbers.append(pow(a,b))
print len(numbers)
set = Set(numbers) 
sortedList = list(set)
sortedList.sort()

print len(sortedList)