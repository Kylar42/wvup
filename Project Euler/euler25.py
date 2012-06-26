curterm = 1
lastterm = 1
count = 0
while True:
	newterm = curterm+lastterm
	print newterm
	if(len(str(newterm)) > 999):
		print newterm
		print count
		break
	lastterm = curterm
	curterm = newterm
	count += 1