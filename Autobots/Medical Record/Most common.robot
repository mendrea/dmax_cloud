*** Settings ***

Resource	../../Keywords/Settings.robot
Resource	../../Keywords/Navigation.robot
Resource	../../Keywords/Generic_Commands.robot
Resource	../../Keywords/Validations.robot
Resource	../../Keywords/Context.robot


*** Test Cases ***

Most Common
	[Tags]  TC MRC
	Run DVMAX in web browser
	Ensure User is on DVMAX Login Page
	Login as Administrator
	Left Menu items are available
	Verify that the User has landed on the Home page
	Navigate to [Patients]
	Open the record and validate correct parameters are present on the screen  388083
	Within Clients panel I navigate to [History]
	Verify Primary Provider dialog box
	I click the Add Medical Record button
	Within the Medical Record Context Area
	Ensure that element is visible  //div[@data-title='Select a Medical Record Code']
	Ensure Filter is present for Medical Record	
	I select [Most Common] from the category list with code [PP010] and description [Allerspray]
	Ensure that element is visible  //div[@class='x-text-el'][contains(.,'General MRE Info')]
	Ensure that element is visible  //div[@class='x-text-el'][contains(.,'MRE Attachments')]
	Validations.Ensure that element is visible  //span[.='Quantity']
	#Validations.Ensure that element is visible  //span[.='Performed']
	#Date and Time components
	Ensure that element is visible  //div[@class='x-no-min-content x-datepickerfield x-pickerfield x-textfield x-field x-component x-body-align-stretch x-animate-underline x-label-align-placeholder x-label-align-vertical x-label-text-align-left x-no-label-wrap x-error-target-parent x-size-monitored x-paint-monitored x-layout-box-item x-layout-hbox-item x-flexed']//div[@class='x-datetrigger x-trigger x-interactive']
	Ensure that element is visible  //div[contains(@class,'x-timepickerfield x-pickerfield x-textfield x-field x-component x-body-align-stretch x-animate-underline x-label-align-placeholder x-label-align-vertical x-label-text-align-left x-no-label-wrap x-error-target-parent x-size-monitored x-paint-monitored x-layout-box-item x-layout-hbox-item x-flexed')]
	Ensure that element is visible  //div[@class='x-innerhtml'][.='Invoice Line Item Preview']/../..//span[.='Code']
	Ensure that element is visible  //div[@class='x-innerhtml'][.='Invoice Line Item Preview']/../..//span[.='Price']
	Ensure that element is visible  //div[@class='x-innerhtml'][.='Invoice Line Item Preview']/../..//span[.='Ext. Price']
	#Ensure that element is visible  //span[.='Notes']
	I [Save Medical Record Entry] the selected form
	Ensure that element is visible  //div[@class='x-text-el'][.='Add Medical Record']
	Ensure invoice with Medical Record Entry [Allerspray] is shown
	[Teardown]  Close all open browsers and clear cookies
