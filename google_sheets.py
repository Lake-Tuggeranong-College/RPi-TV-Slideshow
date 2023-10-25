import os
import subprocess
import datetime
import gspread
from oauth2client.service_account import ServiceAccountCredentials

# Update with the # of Raspberry Pi
RPi_number = 2

'''
#   Pav Name
1	1	Foyer
2	1	Maths
3	1	Science
4	1	Staff Common Room
5	2	Downstairs
6	2	Upstairs
7	3	Careers
8	3	Upstairs
9	4	Downstairs
10	5	Drama Theatre
11	6	Lecture Theatre
12	6	Student Common Room
13	10	Trade Training Centre
14		Library
'''


# Setup connection to Google Sheets
# the json file needs to be in the same directory as this script.
scope = ['https://spreadsheets.google.com/feeds']
credentials = ServiceAccountCredentials.from_json_keyfile_name('RPI_IP_Gsheets_oauth.json', scope)
gc = gspread.authorize(credentials)

# Open the Specific file and Sheet.
wks = gc.open('RPI IP Addresses').sheet1

# Get Local IP Address

command = "hostname -I"
proc = subprocess.Popen(command, stdout=subprocess.PIPE, shell=True)
output = proc.stdout.read()
output = output.replace("\n", "")


# Row and Column for the cell to update
row = 1

timenow = datetime.datetime.now()
wks.update_cell(RPi_number+2,3, output)
wks.update_cell(RPi_number+2,4, timenow)

# Done.
