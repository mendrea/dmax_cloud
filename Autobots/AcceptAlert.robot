*** Settings ***

Resource	../Keywords/Settings.robot
Resource	../Keywords/Navigation.robot
Resource	../Keywords/Generic_Commands.robot
Resource	../Keywords/Validations.robot

*** Test Cases ***

Accept Automation Alert
	[Tags]  TC  Alert
	Run DVMAX in web browser
	Ensure User is on DVMAX Login Page
	Login as Administrator
	Left Menu items are available
	Verify that the User has landed on the Home page
	SeleniumLibrary.Go To  https://dvmax-cloud-qa.appspot.com/#Clients
	SeleniumLibrary.Reload Page
	Accept Automation Alert
	[Teardown]  Close all open browsers and clear cookies