*** Settings ***

Resource	../../../Keywords/Settings.robot
Resource	../../../Keywords/Navigation.robot
Resource	../../../Keywords/Generic_Commands.robot
Resource	../../../Keywords/Validations.robot

*** Test Cases ***

Overview
	[Tags]  Patients Overview
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

Create Upcoming Appointment
	SeleniumLibrary.Click Element  //div[@data-title='Upcoming Appointments']/../../..//div[@class='x-icon-el x-font-icon icon-Addcircle01']/..
	Ensure that element is visible  //div[@class='x-input-el'][.='New Appointment']
	Within New Appointment I [Save] the current form

Verify Upcoming Appointment has been created
	Ensure that element is visible  //div[@class='x-text-el'][.='Abby Maloian']
	SeleniumLibrary.Click Element  //div[@class='x-text-el'][.='Abby Maloian']/../../..
	Wait for Ajax
	Ensure that element is visible  //div[@data-title='Upcoming Appointments']/../../../../..//div[@class='x-cells-el']
	
Delete Upcoming Appointment
	SeleniumLibrary.Double Click Element  //div[@data-title='Upcoming Appointments']/../../../../..//div[@class='x-listitem x-gridrow x-component x-listitem-internalgridnested x-gridrow-internalgridnested x-component-internalgridnested x-listitem-patient_grid x-gridrow-patient_grid x-component-patient_grid x-layout-auto-item x-first x-last']
	Within New Appointment I [Delete] the current form
	Ensure that element is visible  //div[@data-title='Confirm']
	Ensure that element is visible  //div[@class='x-input-el'][.='Permanently remove this appointment?']
	Ensure that element is visible  //div[@class='x-text-el'][.='OK']
	#Ensure that element is visible  //div[@class='x-text-el'][.='Cancel']
	SeleniumLibrary.Click Element  //div[@class='x-text-el'][.='OK']/../../..

Verify Upcoming Appointment has been deleted
	Ensure that element is visible  //div[@class='x-text-el'][.='Abby Maloian']
	SeleniumLibrary.Click Element  //div[@class='x-text-el'][.='Abby Maloian']/../../..
	Wait for Ajax
	SeleniumLibrary.Page Should Not Contain Element  //div[@data-title='Upcoming Appointments']/../../../../..//div[@class='x-cells-el']
	[Teardown]  Close all open browsers and clear cookies
