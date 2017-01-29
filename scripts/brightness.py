#!/usr/bin/env python

import subprocess
import sys

args = sys.argv
if len(args) != 2:
	print 'Arg num errror'
	sys.exit('1')

cmd = args[1]
max = 1.0
min = 0.1
lvlChnge = 0.1

# Get current value
xrandrOut = subprocess.Popen('xrandr --verbose', shell=True, stdout=subprocess.PIPE)
for line in xrandrOut.stdout:
	if 'Brightness' in line:
		line = line.split(':')
		curVal = float(line[1])


# Set paramer for
if cmd == 'inc':
	if curVal < max:
		newVal = curVal + lvlChnge  	
	else:
		newVal = None
elif cmd == 'dec':
	if curVal > min:
		newVal = curVal - lvlChnge
	else:
		newVal = None
else:
	print 'Arg cmd error'
	sys.exit('1')


# Set new value
if newVal is not None:
	newVal = str(newVal)
	subprocess.call(['xrandr', '--output', 'eDP-1', '--brightness', newVal])

sys.exit(0)

