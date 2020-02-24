*** Settings ***

Resource	../Keywords/Settings.robot
Resource	../Keywords/Navigation.robot
Resource	../Keywords/Generic_Commands.robot
Resource	../Keywords/Validations.robot

*** Test Cases ***

Left menu items navigation
	[Tags]  TC  Navigation
	Run DVMAX in web browser
	Ensure User is on DVMAX Login Page
	Login as Administrator
	Left Menu items are available
	Verify that the User has landed on the Home page

Clients
	[Tags]  TC  Navigation	
	Navigate to [Clients]
	Ensure Title on page is [Clients]
	#Name #Home_Phone #Work_Phone #Notes
	#Client Input - Overview Details Finaces WP

Patients
	[Tags]  TC  Navigation
	Navigate to [Patients]
	Ensure Title on page is [Patients]

Scheduling
	[Tags]  TC  Navigation
	Navigate to [Scheduling]
	Ensure Title on page is [Appointments for]

To Dos
	[Tags]  TC  Navigation
	Navigate to [To Dos]
	Ensure Title on page is [To Dos]

Settings
	[Tags]  TC  Navigation
	Navigate to [Settings]
	Ensure Title on page is [Settings]

Logout
	Logout from DVMAX
	[Teardown]  Close all open browsers and clear cookies