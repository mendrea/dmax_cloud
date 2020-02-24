*** Settings ***

Resource	../../Keywords/Settings.robot
Resource	../../Keywords/Navigation.robot
Resource	../../Keywords/Generic_Commands.robot
Resource	../../Keywords/Validations.robot

*** Test Cases ***

DXMAX Anywhere News 
	[Tags]  BLOCKED
	Run DVMAX in web browser
	Ensure User is on DVMAX Login Page
	Login as Administrator
	Validations.Left Menu items are available
	Verify that the User has landed on the Home page
	#DVMAX Anywhere News
	
	Logout from DVMAX
	[Teardown]  Close all open browsers and clear cookies