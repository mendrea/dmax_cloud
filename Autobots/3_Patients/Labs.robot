*** Settings ***

Resource	../../Keywords/Settings.robot
Resource	../../Keywords/Navigation.robot
Resource	../../Keywords/Generic_Commands.robot
Resource	../../Keywords/Validations.robot

*** Test Cases ***

Labs
	[Tags]  Patients
	Run DVMAX in web browser
	Ensure User is on DVMAX Login Page
	Login as Administrator
	Left Menu items are available
	Verify that the User has landed on the Home page
	Navigate to [Patients]
	Open the record and validate correct parameters are present on the screen  388083
	Within Clients panel I navigate to [Labs]
	[Teardown]  Close all open browsers and clear cookies

