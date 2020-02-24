*** Settings ***

Resource	../../Keywords/Settings.robot
Resource	../../Keywords/Navigation.robot
Resource	../../Keywords/Generic_Commands.robot
Resource	../../Keywords/Validations.robot

*** Test Cases ***

To Dos navigation
	[Tags]  TC  Navigation
	Run DVMAX in web browser
	Ensure User is on DVMAX Login Page
	Login as Administrator
	Left Menu items are available
	Verify that the User has landed on the Home page
	Navigate to [To Dos]
	Ensure Title on page is [To Dos]
	#Date #Staff #Patient #MRC # #Room #Title
	[Teardown]  Close all open browsers and clear cookies