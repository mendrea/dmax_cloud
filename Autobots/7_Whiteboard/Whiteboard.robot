*** Settings ***

Resource	../../Keywords/Settings.robot
Resource	../../Keywords/Navigation.robot
Resource	../../Keywords/Generic_Commands.robot
Resource	../../keywords/Validations.robot

*** Test Cases ***

Whiteboard
	[Tags]  ToDos
	Run DVMAX in web browser
	Ensure User is on DVMAX Login Page
	Login as Administrator
	Left Menu items are available
	Verify that the User has landed on the Home page
	Navigate to [Whiteboard]
	Ensure Title on page is [To Do Whiteboard for]
	[Teardown]  Close all open browsers and clear cookies