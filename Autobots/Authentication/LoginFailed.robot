*** Settings ***

Resource	../../Keywords/Settings.robot
Resource	../../Keywords/Navigation.robot
Resource	../../Keywords/Generic_Commands.robot
Resource	../../keywords/Validations.robot

*** Test Cases ***

User fails to login with invalid credentials 
	[Tags]  TC Authentication
	Run DVMAX in web browser
	Ensure User is on DVMAX Login Page
	Login as [UnknownUser] with password [12345]
	#Ensure that the element is not visible   //div[contains(@class,'x-input-el')][contains(.,'Dashboard')]
	Ensure that element is visible  //div[@data-title='Alert']
	Ensure that element is visible  //div[@class='x-input-el'][contains(.,'Incorrect Login.')]
	SeleniumLibrary.Click Element  //div[@class='x-text-el'][.='OK']/../../..
	
User fails to login without credentials 
	[Tags]  TC Authentication
	#Run DVMAX in web browser
	Ensure User is on DVMAX Login Page
	Login as [${EMPTY}] with password [${EMPTY}]
	#Ensure that the element is not visible  //div[contains(@class,'x-input-el')][contains(.,'Dashboard')]
	Ensure that element is visible  //div[@class='x-text-el'][.='Alert']
	Ensure that element is visible  //div[@class='x-input-el'][contains(.,'Incorrect Login')]
	SeleniumLibrary.Click Element  //div[@class='x-text-el'][.='OK']/../../..
	
User fails to login with wrong password 
	[Tags]  TC Authentication
	#Run DVMAX in web browser
	Ensure User is on DVMAX Login Page
	Login as [Administrator] with password [${EMPTY}]
	#Ensure that the element is not visible  //div[contains(@class,'x-input-el')][contains(.,'Dashboard')]
	Ensure that element is visible  //div[@class='x-text-el'][.='Alert']
	Ensure that element is visible  //div[@class='x-input-el'][contains(.,'Incorrect Login')]
	[Teardown]  Close all open browsers and clear cookies