*** Settings ***

Resource	../../Keywords/Settings.robot
Resource	../../Keywords/Navigation.robot
Resource	../../Keywords/Generic_Commands.robot
Resource	../../Keywords/Validations.robot

*** Test Cases ***

Scheduling navigation
	[Tags]  TC  Navigation
	Run DVMAX in web browser
	Ensure User is on DVMAX Login Page
	Login as Administrator
	Left Menu items are available
	Verify that the User has landed on the Home page
	Navigate to [Scheduling]
	Ensure Title on page is [Appointments for]
	#APPT #Patient #Client Home_Phone #Work_Phone #Staff #Notes
	[Teardown]  Close all open browsers and clear cookies