*** Settings ***

Documentation	Finances verification
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
	Within Clients panel I navigate to [Finances]
	
Client name verification
	Ensure that element is visible  //span[@class='clientName'][contains(.,'Brian Adams')] 
	Ensure that element is visible  //div[@class='signalmentInfo'][contains(.,'123-0000')]
	Ensure that element is visible  //div[@class='signalmentInfo'][contains(.,'Charming Avenue')]
	Ensure that element is visible  //div[@class='signalmentInfo'][contains(.,'Carrollton GA')]
	Ensure that element is visible  //div[@class='signalmentInfo'][contains(.,'No email')]
	
Transcations table verification
	Ensure that element is visible  //div[@class='x-innerhtml'][.='Transactions']
	Ensure that element is visible  //div[@class='x-title-wrap-el x-gridcolumn-title-wrap-el x-container-title-wrap-el x-component-title-wrap-el x-gridcolumn-internalgrid-title-wrap-el x-container-internalgrid-title-wrap-el x-component-internalgrid-title-wrap-el']/div[@class='x-title-el']/div[@class='x-text-el'][.='Date']
	Ensure that element is visible  //div[@class='x-title-wrap-el x-gridcolumn-title-wrap-el x-container-title-wrap-el x-component-title-wrap-el x-gridcolumn-internalgrid-title-wrap-el x-container-internalgrid-title-wrap-el x-component-internalgrid-title-wrap-el']/div[@class='x-title-el']/div[@class='x-text-el'][.='Type']
	Ensure that element is visible  //div[@class='x-title-wrap-el x-gridcolumn-title-wrap-el x-container-title-wrap-el x-component-title-wrap-el x-gridcolumn-internalgrid-title-wrap-el x-container-internalgrid-title-wrap-el x-component-internalgrid-title-wrap-el']/div[@class='x-title-el']/div[@class='x-text-el'][.='Comments']
	Ensure that element is visible  //div[@class='x-title-wrap-el x-gridcolumn-title-wrap-el x-container-title-wrap-el x-component-title-wrap-el x-gridcolumn-internalgrid-title-wrap-el x-container-internalgrid-title-wrap-el x-component-internalgrid-title-wrap-el']/div[@class='x-title-el']/div[@class='x-text-el'][.='Amount'] 
	Ensure that element is visible  //div[@class='x-title-wrap-el x-gridcolumn-title-wrap-el x-container-title-wrap-el x-component-title-wrap-el x-gridcolumn-internalgrid-title-wrap-el x-container-internalgrid-title-wrap-el x-component-internalgrid-title-wrap-el']/div[@class='x-title-el']/div[@class='x-text-el'][.='Balance'] 
	Ensure that element is visible  //div[@data-title='Unfinished Invoices']
	
Options
	Ensure that element is visible  //div[@data-title='Options']
	Ensure that element is visible  //label[@class='x-box-label-el'][contains(.,'Detailed Billing')]
	Ensure that element is visible  //label[@class='x-box-label-el'][contains(.,'Delay Interest Until Billed')]
	Ensure that element is visible  //label[@class='x-box-label-el'][contains(.,'Do Not Bill')]
	Ensure that element is visible  //label[@class='x-box-label-el'][contains(.,'Tax Exempt')]
	Ensure that element is visible  //label[@class='x-box-label-el'][contains(.,'Suppress Interest')]
	Ensure that element is visible  //label[@class='x-box-label-el'][contains(.,'Suppress Billing Charge')]
	Ensure that element is visible  //label[@class='x-box-label-el'][contains(.,'Inactive Client')]
	
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