*** Settings ***

Documentation	WP verification

Resource	../../Keywords/Settings.robot
Resource	../../Keywords/Navigation.robot
Resource	../../Keywords/Generic_Commands.robot
Resource	../../Keywords/Validations.robot

*** Variables ***
${SRCHFILTER}  //div[contains(@class,'x-selectfield x-pickerfield x-textfield x-field x-component x-body-align-stretch x-animate-underline x-label-align-placeholder x-label-align-vertical x-label-text-align-left x-no-label-wrap x-labeled x-widthed x-error-target-qtip x-selectfield-dvmax_textfield x-pickerfield-dvmax_textfield x-textfield-dvmax_textfield x-field-dvmax_textfield x-component-dvmax_textfield x-size-monitored x-paint-monitored x-layout-auto-item')]//label[@class='x-label-el'][contains(.,'Search By')]/..

*** Test Cases ***

Finances
	[Tags]  Clients
	Run DVMAX in web browser
	Ensure User is on DVMAX Login Page
	Login as Administrator
	Left Menu items are available
	Navigate to [Clients]
	Ensure Title on page is [Clients]
	Select client Brian Adams
	Within Clients panel I navigate to [WP]
	Ensure that element is visible  //span[@class='clientName'][contains(.,'Brian Adams')] 
	Ensure that element is visible  //div[@class='signalmentInfo'][contains(.,'123-0000')]
	Ensure that element is visible  //div[@class='signalmentInfo'][contains(.,'Charming Avenue')]
	Ensure that element is visible  //div[@class='signalmentInfo'][contains(.,'Carrollton GA')]
	Ensure that element is visible  //div[@class='signalmentInfo'][contains(.,'No email')]

Actions - Set Alert
	Ensure that element is visible  //div[@class='x-text-el'][.='Actions']
	Wait for Ajax
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
	
	[Teardown]  Close all open browsers and clear cookies