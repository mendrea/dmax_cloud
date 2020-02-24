*** Settings ***

Resource	../../../Keywords/Settings.robot
Resource	../../../Keywords/Navigation.robot
Resource	../../../Keywords/Generic_Commands.robot
Resource	../../../Keywords/Validations.robot

*** Test Cases ***

Overview
	[Tags]  Patients Overvire Visit
	Run DVMAX in web browser
	Ensure User is on DVMAX Login Page
	Login as Administrator
	Left Menu items are available
	Verify that the User has landed on the Home page
	Navigate to [Patients]
	Ensure Title on page is [Patients]
	Open the record and validate correct parameters are present on the screen  388083

Visits
	Ensure that element is visible  //div[@data-title='Visits']
	
Upcoming Appointments
	Ensure that element is visible  //div[@data-title='Upcoming Appointments']
	
Reminders
	Ensure that element is visible  //div[@data-title='Reminders']
	
Recalls
	Ensure that element is visible  //div[@data-title='Recalls']
	
Weight
	Ensure that element is visible  //div[@data-title='Weight']

	[Teardown]  Close all open browsers and clear cookies

