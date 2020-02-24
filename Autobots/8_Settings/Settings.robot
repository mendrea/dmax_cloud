*** Settings ***

Resource	../../Keywords/Settings.robot
Resource	../../Keywords/Navigation.robot
Resource	../../Keywords/Generic_Commands.robot
Resource	../../keywords/Validations.robot

*** Test Cases ***

Settings
	[Tags]  Settings
	Run DVMAX in web browser
	Ensure User is on DVMAX Login Page
	Login as Administrator
	Left Menu items are available
	Verify that the User has landed on the Home page
	Navigate to [Settings]
	Ensure Title on page is [Settings]
	#Settings
	#Code Setup


	[Teardown]  Close all open browsers and clear cookies