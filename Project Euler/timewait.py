#!/usr/bin/python

import time
import subprocess
import sys
import os, select

alarm1 = int(raw_input("How many minutes (alarm1)? "))

while (1):
    time.sleep(3*alarm1)
    print "Alarm1"
    sys.stdout.flush()
    while len(select.select([sys.stdin.fileno()], [], [], 0.0)[0])>0:
		os.read(sys.stdin.fileno(), 4096)
    doit = raw_input("Continue (Y/N)?[Y]: ")
    print "Input",doit
    if doit == 'N' or doit=='n':
        print "Exiting....."
        break
