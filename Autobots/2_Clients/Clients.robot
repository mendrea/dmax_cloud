*** Settings ***

Documentation	Clients landing page verification

Resource	../../Keywords/Settings.robot
Resource	../../Keywords/Navigation.robot
Resource	../../Keywords/Generic_Commands.robot
Resource	../../Keywords/Validations.robot

*** Variables ***
${SRCHFILTER}  //div[contains(@class,'x-selectfield x-pickerfield x-textfield x-field x-component x-body-align-stretch x-animate-underline x-label-align-placeholder x-label-align-vertical x-label-text-align-left x-no-label-wrap x-labeled x-widthed x-error-target-qtip x-selectfield-dvmax_textfield x-pickerfield-dvmax_textfield x-textfield-dvmax_textfield x-field-dvmax_textfield x-component-dvmax_textfield x-size-monitored x-paint-monitored x-layout-auto-item')]//label[@class='x-label-el'][contains(.,'Search By')]/..

*** Test Cases ***

Clients navigation
	[Tags]  TC  Navigation
	Run DVMAX in web browser
	Ensure User is on DVMAX Login Page
	Login as Administrator
	Left Menu items are available
	Navigate to [Clients]
	Ensure Title on page is [Clients]
	
Table verification
	Within the [client] page ensure the header of the table has value [Name]
	Within the [client] page ensure the header of the table has value [Home Phone]
	Within the [client] page ensure the header of the table has value [Work Phone]
	Within the [client] page ensure the header of the table has value [Notes]
	
Filter by Name
	Ensure that element is visible  ${SRCHFILTER}
	Ensure that element is visible  //div[@class='x-body-el x-gridcell-body-el'][contains(.,'Laurie Adams')]
	Ensure that element is visible  //div[@class='x-body-el x-gridcell-body-el'][contains(.,'Stu & Flo Art')]
	Ensure that element is visible  //div[@class='x-body-el x-gridcell-body-el'][contains(.,'Theodore & Kathie Alston')]
	Ensure that element is visible  //div[@class='x-body-el x-gridcell-body-el'][contains(.,'John Bellos')]
	Ensure that element is visible  //div[@class='x-body-el x-gridcell-body-el'][contains(.,'Dr. Mary Birch')]
	
	Ensure that element is visible  //input[@placeholder='Name']
	SeleniumLibrary.Input Text  //input[@placeholder='Name']  Adams
	
	Ensure that element is visible  //div[@class='x-body-el x-gridcell-body-el'][contains(.,'Brian Adams')]
	Ensure that element is visible  //div[@class='x-body-el x-gridcell-body-el'][contains(.,'Sandra & Edward Adams')]
	#Ensure that element is visible  //div[@class='x-body-el x-gridcell-body-el'][contains(.,'Geoffry & Tasha Adams')]
	#Ensure that element is visible  //div[@class='x-body-el x-gridcell-body-el'][contains(.,'Laurie Adams')]
	#Ensure that the element is not visible  //div[@class='x-body-el x-gridcell-body-el'][contains(.,'Stu & Flo Art')]
	#Ensure that the element is not visible  //div[@class='x-body-el x-gridcell-body-el'][contains(.,'Theodore & Kathie Alston')]
	#Ensure that the element is not visible  //div[@class='x-body-el x-gridcell-body-el'][contains(.,'John Bellos')]
	#Ensure that the element is not visible  //div[@class='x-body-el x-gridcell-body-el'][contains(.,'Dr. Mary Birch')]

Delete filter	
	SeleniumLibrary.Press Key  //input[@placeholder='Name']  \\8
	SeleniumLibrary.Press Key  //input[@placeholder='Name']  \\8
	SeleniumLibrary.Press Key  //input[@placeholder='Name']  \\8
	SeleniumLibrary.Press Key  //input[@placeholder='Name']  \\8
	SeleniumLibrary.Press Key  //input[@placeholder='Name']  \\8
	
	Ensure that element is visible  //div[@class='x-body-el x-gridcell-body-el'][contains(.,'Brian Adams')]
	Ensure that element is visible  //div[@class='x-body-el x-gridcell-body-el'][contains(.,'Sandra & Edward Adams')]
	Ensure that element is visible  //div[@class='x-body-el x-gridcell-body-el'][contains(.,'Geoffry & Tasha Adams')]
	#Ensure that element is visible  //div[@class='x-body-el x-gridcell-body-el'][contains(.,'William Lenk')]
	Ensure that element is visible  //div[@class='x-body-el x-gridcell-body-el'][contains(.,'Stu & Flo Art')]
	Ensure that element is visible  //div[@class='x-body-el x-gridcell-body-el'][contains(.,'Theodore & Kathie Alston')]
	Ensure that element is visible  //div[@class='x-body-el x-gridcell-body-el'][contains(.,'John Bellos')]
	Ensure that element is visible  //div[@class='x-body-el x-gridcell-body-el'][contains(.,'Dr. Mary Birch')]
	
Overview
	Select client Brian Adams
	Ensure that element is visible  //div[@data-title='Patients']
	Ensure that element is visible  //div[@data-title='Account: Client ID 4476, File# 3562']
	Ensure that element is visible  //div[@data-title='Upcoming Appointments']
	Ensure that element is visible  //div[@data-title='Notes']
	
Patients table verification
	Ensure that element is visible  //div[@class='x-title-wrap-el x-gridcolumn-title-wrap-el x-container-title-wrap-el x-component-title-wrap-el x-gridcolumn-internalgridnested-title-wrap-el x-container-internalgridnested-title-wrap-el x-component-internalgridnested-title-wrap-el x-gridcolumn-patient_grid-title-wrap-el x-container-patient_grid-title-wrap-el x-component-patient_grid-title-wrap-el']/div[@class='x-title-el']/div[@class='x-text-el'][.='Name']
	Ensure that element is visible  //div[@class='x-title-wrap-el x-gridcolumn-title-wrap-el x-container-title-wrap-el x-component-title-wrap-el x-gridcolumn-internalgridnested-title-wrap-el x-container-internalgridnested-title-wrap-el x-component-internalgridnested-title-wrap-el x-gridcolumn-patient_grid-title-wrap-el x-container-patient_grid-title-wrap-el x-component-patient_grid-title-wrap-el']/div[@class='x-title-el']/div[@class='x-text-el'][.='Status']
	Ensure that element is visible  //div[@class='x-title-wrap-el x-gridcolumn-title-wrap-el x-container-title-wrap-el x-component-title-wrap-el x-gridcolumn-internalgridnested-title-wrap-el x-container-internalgridnested-title-wrap-el x-component-internalgridnested-title-wrap-el x-gridcolumn-patient_grid-title-wrap-el x-container-patient_grid-title-wrap-el x-component-patient_grid-title-wrap-el']/div[@class='x-title-el']/div[@class='x-text-el'][.='Sex']
	Ensure that element is visible  //div[@class='x-title-wrap-el x-gridcolumn-title-wrap-el x-container-title-wrap-el x-component-title-wrap-el x-gridcolumn-internalgridnested-title-wrap-el x-container-internalgridnested-title-wrap-el x-component-internalgridnested-title-wrap-el x-gridcolumn-patient_grid-title-wrap-el x-container-patient_grid-title-wrap-el x-component-patient_grid-title-wrap-el']/div[@class='x-title-el']/div[@class='x-text-el'][.='Species / Breed']
	Ensure that element is visible  //div[@class='x-title-wrap-el x-gridcolumn-title-wrap-el x-container-title-wrap-el x-component-title-wrap-el x-gridcolumn-internalgridnested-title-wrap-el x-container-internalgridnested-title-wrap-el x-component-internalgridnested-title-wrap-el x-gridcolumn-patient_grid-title-wrap-el x-container-patient_grid-title-wrap-el x-component-patient_grid-title-wrap-el']/div[@class='x-title-el']/div[@class='x-text-el'][.='Next Due']

Upcoming Appointments table verification
	Ensure that element is visible  //div[@class='x-title-wrap-el x-gridcolumn-title-wrap-el x-container-title-wrap-el x-component-title-wrap-el x-gridcolumn-internalgridnested-title-wrap-el x-container-internalgridnested-title-wrap-el x-component-internalgridnested-title-wrap-el x-gridcolumn-patient_grid-title-wrap-el x-container-patient_grid-title-wrap-el x-component-patient_grid-title-wrap-el']/div[@class='x-title-el']/div[@class='x-text-el'][.='Patient']
	Ensure that element is visible  //div[@class='x-title-wrap-el x-gridcolumn-title-wrap-el x-container-title-wrap-el x-component-title-wrap-el x-gridcolumn-internalgridnested-title-wrap-el x-container-internalgridnested-title-wrap-el x-component-internalgridnested-title-wrap-el x-gridcolumn-patient_grid-title-wrap-el x-container-patient_grid-title-wrap-el x-component-patient_grid-title-wrap-el']/div[@class='x-title-el']/div[@class='x-text-el'][.='Date']
	Ensure that element is visible  //div[@class='x-title-wrap-el x-gridcolumn-title-wrap-el x-container-title-wrap-el x-component-title-wrap-el x-gridcolumn-internalgridnested-title-wrap-el x-container-internalgridnested-title-wrap-el x-component-internalgridnested-title-wrap-el x-gridcolumn-patient_grid-title-wrap-el x-container-patient_grid-title-wrap-el x-component-patient_grid-title-wrap-el']/div[@class='x-title-el']/div[@class='x-text-el'][.='Type']
	Ensure that element is visible  //div[@class='x-title-wrap-el x-gridcolumn-title-wrap-el x-container-title-wrap-el x-component-title-wrap-el x-gridcolumn-internalgridnested-title-wrap-el x-container-internalgridnested-title-wrap-el x-component-internalgridnested-title-wrap-el x-gridcolumn-patient_grid-title-wrap-el x-container-patient_grid-title-wrap-el x-component-patient_grid-title-wrap-el']/div[@class='x-title-el']/div[@class='x-text-el'][.='Status/Comments']
	
Actions - Set Alert
	Ensure that element is visible  //div[@class='x-text-el'][.='Actions']
	SeleniumLibrary.Click Element  //div[@class='x-text-el'][.='Actions']/../../..
	Ensure that element is visible  //div[@class='x-text-el'][.='Set Alert Message']
	SeleniumLibrary.Click Element  //div[@class='x-text-el'][.='Set Alert Message']
	Ensure that element is visible  //div[@data-title='Alert for Brian Adams']
	Ensure [Alert Text:] input text field is present
	I type [AutoTestAlert] in the [Alert Text:] input field
	I [OK] the selected form
	#SeleniumLibrary.Simulate  //div[@class='x-text-el'][.='OK']/../../..  return Ext.doEv(this, event);
	#SeleniumLibrary.Reload Page
	Ensure that element is visible  //span[@class='x-fa fa-exclamation-circle fa-lg alertVerticalAdjust']
	Ensure that element is visible  //span[@class='x-fa fa-exclamation-circle fa-lg alertVerticalAdjust']/../../div[contains(.,'AutoTestAlert')]

Revert changes
	Ensure that element is visible  //div[@class='x-text-el'][.='Actions']
	SeleniumLibrary.Click Element  //div[@class='x-text-el'][.='Actions']/../../..
	SeleniumLibrary.Click Element  //div[@class='x-text-el'][.='Set Alert Message']
	Ensure that element is visible  //div[@data-title='Alert for Brian Adams']
	Ensure [Alert Text:] input text field is present
	#I type [${EMPTY}] in the [Alert Text:] input field
	SeleniumLibrary.Press Key  //label[@class='x-label-el'][.='Alert Text:']/..//input  \\8
	SeleniumLibrary.Press Key  //label[@class='x-label-el'][.='Alert Text:']/..//input  \\8
	SeleniumLibrary.Press Key  //label[@class='x-label-el'][.='Alert Text:']/..//input  \\8
	SeleniumLibrary.Press Key  //label[@class='x-label-el'][.='Alert Text:']/..//input  \\8
	SeleniumLibrary.Press Key  //label[@class='x-label-el'][.='Alert Text:']/..//input  \\8
	SeleniumLibrary.Press Key  //label[@class='x-label-el'][.='Alert Text:']/..//input  \\8
	SeleniumLibrary.Press Key  //label[@class='x-label-el'][.='Alert Text:']/..//input  \\8
	SeleniumLibrary.Press Key  //label[@class='x-label-el'][.='Alert Text:']/..//input  \\8
	SeleniumLibrary.Press Key  //label[@class='x-label-el'][.='Alert Text:']/..//input  \\8
	SeleniumLibrary.Press Key  //label[@class='x-label-el'][.='Alert Text:']/..//input  \\8
	SeleniumLibrary.Press Key  //label[@class='x-label-el'][.='Alert Text:']/..//input  \\8
	SeleniumLibrary.Press Key  //label[@class='x-label-el'][.='Alert Text:']/..//input  \\8
	SeleniumLibrary.Press Key  //label[@class='x-label-el'][.='Alert Text:']/..//input  \\8
	I [OK] the selected form
	SeleniumLibrary.Wait Until Element Is Not Visible  //span[@class='x-fa fa-exclamation-circle fa-lg alertVerticalAdjust']
	
Details
	Within Clients panel I navigate to [Details]
	#Ensure label with text [First Name] is present
	#Ensure label with text [Last Name] is present
	Ensure label with text [Address] is present
	Ensure label with text [Address 2] is present
	Ensure label with text [City] is present
	Ensure label with text [State] is present
	Ensure label with text [Zip Code] is present
	Ensure label with text [Home Phone] is present
	Ensure label with text [Work Phone1:] is present
	Ensure label with text [Work Phone2:] is present
	Ensure label with text [Ext] is present
	Ensure label with text [Email] is present
	#Ensure label with text [Item 1] is present
	Ensure label with text [Item 2] is present
	Ensure label with text [Referred By] is present
	Ensure label with text [Practice Name] is present
	Ensure label with text [Phone] is present
	Ensure label with text [Email] is present

Finances
	Within Clients panel I navigate to [Finances]
	Ensure that element is visible  //div[@class='x-innerhtml'][.='Transactions']
	Ensure that element is visible  //div[@data-title='Unfinished Invoices']
	
WP
	Within Clients panel I navigate to [WP]
	[Teardown]  Close all open browsers and clear cookies