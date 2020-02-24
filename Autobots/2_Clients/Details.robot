*** Settings ***

Documentation	Details verification

Resource	../../Keywords/Settings.robot
Resource	../../Keywords/Navigation.robot
Resource	../../Keywords/Generic_Commands.robot
Resource	../../Keywords/Validations.robot

*** Variables ***
${SRCHFILTER}  //div[contains(@class,'x-selectfield x-pickerfield x-textfield x-field x-component x-body-align-stretch x-animate-underline x-label-align-placeholder x-label-align-vertical x-label-text-align-left x-no-label-wrap x-labeled x-widthed x-error-target-qtip x-selectfield-dvmax_textfield x-pickerfield-dvmax_textfield x-textfield-dvmax_textfield x-field-dvmax_textfield x-component-dvmax_textfield x-size-monitored x-paint-monitored x-layout-auto-item')]//label[@class='x-label-el'][contains(.,'Search By')]/..

*** Test Cases ***

Details navigation
	[Tags]  TC  Navigation
	Run DVMAX in web browser
	Ensure User is on DVMAX Login Page
	Login as Administrator
	Left Menu items are available
	Navigate to [Clients]
	Ensure Title on page is [Clients]
	Select client Brian Adams
	Within Clients panel I navigate to [Details]

Labels verification
	#Ensure label with text [First Name] is present
	#Ensure label with text [Last Name] is present
	Ensure label with text [Address] is present
	Ensure label with text [Address 2] is present
	Ensure label with text [City] is present
	Ensure label with text [State] is present
	Ensure label with text [Zip Code] is present
	Ensure label with text [Home Phone:] is present
	Ensure label with text [Work Phone1:] is present
	Ensure label with text [Work Phone2:] is present
	Ensure label with text [Ext] is present
	Ensure label with text [Email] is present
	Ensure label with text [Item 1] is present
	Ensure label with text [Item 2] is present
	Ensure label with text [Referred By] is present
	Ensure label with text [Practice Name] is present
	Ensure label with text [Phone] is present
	Ensure label with text [Email] is present

Input verification
	#Ensure [First Name] input text field is present
	#Ensure [First Name] input text field is present
	Ensure [Address] input text field is present
	Ensure [Address 2] input text field is present
	Ensure [City] input text field is present
	Ensure [State] input text field is present
	Ensure [Zip Code] input text field is present
	Ensure [Phone] input text field is present
	Ensure [Phone 2] input text field is present
	Ensure [Phone 3] input text field is present
	Ensure [Ext] input text field is present
	Ensure [Email] input text field is present
	Ensure [Item 1:] input text field is present
	Ensure [Item 2:] input text field is present
	
	[Teardown]  Close all open browsers and clear cookies