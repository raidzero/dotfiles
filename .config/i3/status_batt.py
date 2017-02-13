#!/usr/bin/env python

## BATTERY STATUS
BAT_DATA_LOC = '/sys/class/power_supply/BAT0'

def readFile(filename):
	f = open(BAT_DATA_LOC + '/' + filename, 'r')
	return f.read().strip()


voltage = int(readFile('voltage_now'))
current = int(readFile('current_now'))
charge_now = float(readFile('charge_now'))
charge_full = float(readFile('charge_full'))
charge_status = readFile('status')

def get_consumption():
	rate = (voltage / 1000.0) * (current / 1000.0)
	consumption = rate / 1e6

	return "{:1.03}W".format(consumption)

def get_charge_level():
	level = charge_now / charge_full
	
	if level < 1: 
		return "{:1.3}%".format(level * 100)
	else:
		return '100%'

def get_remaining_till_full():
	hours = (charge_full - charge_now) / current
	minutes = (hours * 60) % 60
	
	return "{:02}:{:02}".format(int(hours), int(minutes))

def get_remaining():
	hours = charge_now / current
	minutes = (hours * 60) % 60
 
	return "{:02}:{:02}".format(int(hours), int(minutes))

def get_status():
	return charge_status

# put it all together into a nice display
if get_charge_level() != '100%':
	print "{} {} {}".format(get_charge_level(), get_consumption(), get_remaining())
else:
	print "{} {}".format(get_charge_level(), get_consumption())
