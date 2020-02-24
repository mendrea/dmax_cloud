*** Settings ***

Resource	../../../Keywords/Settings.robot
Resource	../../../Keywords/Navigation.robot
Resource	../../../Keywords/Generic_Commands.robot
Resource	../../../Keywords/Validations.robot

*** Test Cases ***

Weight
	[Tags]  Patients Overview Weight
	Run DVMAX in web browser
	Ensure User is on DVMAX Login Page
	Login as Administrator
	Left Menu items are available
	Verify that the User has landed on the Home page
	Navigate to [Patients]
	Ensure Title on page is [Patients]
	Open the record and validate correct parameters are present on the screen  388083
	Ensure that element is visible  //div[@data-title='Visits']
	Ensure that element is visible  //div[@data-title='Upcoming Appointments']
	Ensure that element is visible  //div[@data-title='Reminders']
	Ensure that element is visible  //div[@data-title='Recalls']
	Ensure that element is visible  //div[@data-title='Weight']

Remove Weight
	
	[Teardown]  Close all open browsers and clear cookies

