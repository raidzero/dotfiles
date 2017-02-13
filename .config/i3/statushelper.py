#!/usr/bin/env python
import sys
import subprocess
import re


## BATTERY
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

	return "{:1.3}W".format(consumption)

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

print get_consumption()
print get_charge_level()
print get_remaining_till_full()
print get_remaining()
print get_status()

## WIFI
wifi_data = subprocess.Popen('iwconfig wlp1s0', shell=True, stdout=subprocess.PIPE).stdout.read().split('\n')

def get_wifi_ssid():
	for line in wifi_data:
		m = re.search('ESSID:"(.*)"', line)
		if m:
			return m.group(1)

def get_wifi_frequency():
	for line in wifi_data:	
		m = re.search('Frequency:([0-9\.]+ [GM]Hz)', line)
		if m:
			return m.group(1)

def get_wifi_bitrate():
	for line in wifi_data:
		m = re.search('Bit Rate=([0-9]+ M?b/s)', line)
		if m:
			return m.group(1)


print get_wifi_ssid()
print get_wifi_frequency()
print get_wifi_bitrate()

##Volume
def get_volume():
	mixer_data = subprocess.Popen('amixer -D pulse get Master', shell=True, stdout=subprocess.PIPE).stdout.read().split('\n')
	for line in mixer_data:
		m = re.search('\[([0-9]+%)\]', line)
		if m:
			return m.group(1)

print get_volume()
