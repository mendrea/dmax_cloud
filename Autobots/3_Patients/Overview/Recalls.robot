*** Settings ***

Resource	../../../Keywords/Settings.robot
Resource	../../../Keywords/Navigation.robot
Resource	../../../Keywords/Generic_Commands.robot
Resource	../../../Keywords/Validations.robot

*** Test Cases ***

Recalls
	[Tags]  Patients Overview Recalls
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

Create Recalls
	SeleniumLibrary.Click Element  //div[@data-title='Recalls']/../../..//button
	Wait for Ajax
	Ensure label with text [Recall Code] is present
	#Ensure label with text [Due] is present
	Ensure label with text [Delay] is present
	Ensure label with text [Reason] is present 
	Ensure label with text [Department] is present 
	Ensure that element is visible  //div[@data-title='Recalls']/../../../../..//div[@class='x-text-el'][.='Save']/../../../../div[contains(@class,'x-disabled')]
	SeleniumLibrary.Click Element  //label[@class='x-label-el'][contains(.,'Recall Code')]/..//div[@class='x-icon-el x-font-icon']
	#Select Recall Code
	Ensure that element is visible  //div[@data-title='Select Recall Code']
	Ensure that element is visible  //div[@class='x-text-el'][.='Code']
	Ensure that element is visible  //div[@class='x-text-el'][.='Reason']
	Ensure that element is visible  //div[@class='x-body-el x-gridcell-body-el'][.='Corona']
	SeleniumLibrary.Click Element  //div[@class='x-body-el x-gridcell-body-el'][.='Corona']
	Ensure that element is visible  //div[@class='x-text-el'][.='Select']
	SeleniumLibrary.Click Element  //div[@class='x-text-el'][.='Select']/../../..
	Wait for Ajax
	SeleniumLibrary.Page Should Not Contain Element  //div[@data-title='Recalls']/../../../../..//div[@class='x-text-el'][.='Save']/../../../../div[contains(@class,'x-disabled')]
	SeleniumLibrary.Click Element  //div[@data-title='Recalls']/../../../../..//div[@class='x-text-el'][.='Save']/../../..

Verify Recall has been created
	Wait for Ajax
	Ensure that element is visible  //div[@class='x-body-el x-gridcell-body-el x-gridcell-internalgridnested-body-el x-gridcell-patient_grid-body-el'][.='Corona Vaccine']

Delete Recall
	#Select the burger menu
	SeleniumLibrary.Click Element  //div[@data-title='Recalls']/../../../../..//div[@class='x-icon-el x-font-icon x-tool-type-menu']
	Ensure that element is visible  //div[@class='x-text-el'][.='Delete Recall']
	SeleniumLibrary.Click Element  //div[@class='x-text-el'][.='Delete Recall']
	Ensure that element is visible  //div[@data-title='Confirm']
	Ensure that element is visible  //div[@class='x-input-el'][.='Delete Recall "Corona Vaccine"?']
	Ensure that element is visible  //div[@class='x-text-el'][.='OK']
	#Ensure that element is visible  //div[@class='x-text-el'][.='Cancel']
	SeleniumLibrary.Click Element  //div[@class='x-text-el'][.='OK']/../../..
	Wait for Ajax

Verify Recall has been deleted
	SeleniumLibrary.Page Should Not Contain Element  //div[@class='x-body-el x-gridcell-body-el x-gridcell-internalgridnested-body-el x-gridcell-patient_grid-body-el'][.='Corona Vaccine']
	[Teardown]  Close all open browsers and clear cookies

