*** Settings ***

Resource	../../Keywords/Settings.robot
Resource	../../Keywords/Navigation.robot
Resource	../../Keywords/Generic_Commands.robot
Resource	../../keywords/Validations.robot

*** Test Cases ***

User can login and logout successfully 
	[Tags]  TC Authentication
	Run DVMAX in web browser
	Ensure User is on DVMAX Login Page
	Login as Administrator
	Left Menu items are available 
	Verify that the User has landed on the Home page
	Logout from DVMAX
	Ensure User is on DVMAX Login Page
	[Teardown]  Close all open browsers and clear cookies