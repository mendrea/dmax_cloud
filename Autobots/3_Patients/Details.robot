*** Settings ***

Resource	../../Keywords/Settings.robot
Resource	../../Keywords/Navigation.robot
Resource	../../Keywords/Generic_Commands.robot
Resource	../../Keywords/Validations.robot

*** Test Cases ***

Patients
	[Tags]  Patients
	Run DVMAX in web browser
	Ensure User is on DVMAX Login Page
	Login as Administrator
	Left Menu items are available
	Verify that the User has landed on the Home page
	Navigate to [Patients]
	Ensure Title on page is [Patients]
	Open the record and validate correct parameters are present on the screen  388083
	Within Clients panel I navigate to [Details]

Details-labels
	[Tags]  Patients
	Ensure label with text [Name] is present
	Ensure label with text [Species] is present
	Ensure label with text [Breed] is present
	Ensure that element is visible  //label[.='M']
	Ensure that element is visible  //label[.='F']
	Ensure that element is visible  //label[.='Spayed']
	Ensure label with text [Color] is present
	Ensure label with text [File] is present
	Ensure label with text [Status] is present
	Ensure label with text [Provider] is present
	Ensure that element is visible  //span[@class='x-label-text-el'][.='Rabies Tag']/../..//input 
	Ensure that element is visible  //span[@class='x-label-text-el'][.='Rabies Producer']/../..//input
	Ensure that element is visible  //span[@class='x-label-text-el'][.='Lot #']/../..//input
	Ensure that element is visible  //span[@class='x-label-text-el'][.='Last Visit']/../..//input
	Ensure label with text [DOB] is present
	Ensure label with text [Age] is present
	Ensure label with text [Weight] is present
	
Details-inputs
	[Tags]  Patients
	Ensure [DOB] input text field is present
	Ensure [Age] input text field is present
	Ensure [Last Visit] input text field is present
	Ensure [Provider] input text field is present 
	Ensure [Insurance] input text field is present
	Ensure [Insur. #] input text field is present
	Ensure [Chip ID] input text field is present
	Ensure [Tattoo] input text field is present
	Ensure [XRay] input text field is present
	Ensure [License #] input text field is present
	Ensure [Rabies Tag] input text field is present
	Ensure [Rabies Producer] input text field is present
	Ensure [Lot #] input text field is present
	Ensure [Stable] input text field is present
	Ensure [Trainer] input text field is present
	Ensure [Groom] input text field is present

Verify initial input values
	[Tags]  Patients
	Verify that the [Name] input has text value [Abby]
	Verify that the [Show Name] input has text value [${EMPTY}]
	Verify that the [Weight] input has text value [${EMPTY}]
	Ensure that element is visible  //label[.='M']
	Ensure that element is visible  //label[.='Spayed']
	Verify that the [Color] input has text value [${EMPTY}]
	Verify that the [Insurance] input has text value [${EMPTY}]
	Verify that the [Insur. #:] input has text value [${EMPTY}]
	Verify that the [Chip ID:] input has text value [${EMPTY}]
	Verify that the [Tattoo:] input has text value [${EMPTY}]
	Verify that the [XRay:] input has text value [${EMPTY}]
	Verify that the [License #:] input has text value [${EMPTY}]
	Verify that the [Rabies Tag:] input has text value [${EMPTY}]
	Verify that the [abies Producer:] input has text value [${EMPTY}]
	Verify that the [Lot #:] input has text value [${EMPTY}]
	Verify that the [Groom:] input has text value [${EMPTY}]
	Verify that the [Species] input has text value [Canine]
	Verify that the [Breed] input has text value [Labrador Mix]
			
Patient info data manipulation
	[Tags]  TC Details
	I type [Abby_Edited] in the [Name] input field
	I type [Edited] in the [Show Name] input field
	I select [Crocodilian] from the [Species] drop down list
	Sleep  2
	I select [American Alligator] from the [Breed] drop down list
	I type [99] in the [Weight] input field
	SeleniumLibrary.Click Element  //label[.='M']
	I type [Red_Edited] in the [Color] input field
	I type [INS12345] in the [Insurance] input field
	I type [INS67890] in the [Insur. #] input field
	I type [ABC123] in the [Chip ID] input field
	I type [No] in the [Tattoo] input field
	I type [xray_edited] in the [XRay] input field
	I type [Licence_Number123] in the [License #] input field
	I type [None] in the [Rabies Tag] input field
	I type [NaN] in the [Rabies Producer] input field
	I type [LOT_EDITED] in the [Lot #] input field
	I type [No] in the [Groom] input field
	I [Save & Close] the selected form
	Navigate to [Patients]
	Ensure Title on page is [Patients]
	#Verify that on [11/21/2017] the patient [Abby_Edited] and client [Valerie Maloian] has Staff [Dr. Michael Alexander]
	Ensure that element is visible  //div[@class='x-body-el x-gridcell-body-el'][contains(.,'Abby_Edited')]

Select modified patient
	[Tags]  TC Details
	Open the record and validate correct parameters are present on the screen  388083
	Ensure that element is visible  //span[@class='patientName'][.='Abby_Edited Maloian']
	Within Clients panel I navigate to [Details]
	Wait for Ajax
	Sleep  1
	Verify that the [Name] input has text value [Abby_Edited]
	Verify that the [Show Name] input has text value [Edited]
	Verify that the [Weight] input has text value [99]
	Ensure that element is visible  //label[.='Neutered']
	Verify that the [Color] input has text value [Red_Edited]
	Verify that the [Insurance] input has text value [INS12345]
	Verify that the [Insur. #] input has text value [INS67890]
	Verify that the [Chip ID] input has text value [ABC123]
	Verify that the [Tattoo] input has text value [No]
	Verify that the [XRay] input has text value [xray_edited]
	Verify that the [License #] input has text value [Licence_Number123]
	Verify that the [Rabies Tag] input has text value [None]
	Verify that the [abies Producer] input has text value [NaN]
	Verify that the [Lot #] input has text value [LOT_EDITED]
	Verify that the [Groom] input has text value [No]
	Verify that the [Species] input has text value [Crocodilian]
	Verify that the [Breed] input has text value [American Alligator]

Revert edited values
	[Tags]  TC Details
	I type [Abby] in the [Name] input field
	I type [${EMPTY}] in the [Show Name] input field
	I select [Canine] from the [Species] drop down list
	Sleep  2
	I select [Airedale] from the [Breed] drop down list
	I type [${EMPTY}] in the [Weight] input field
	SeleniumLibrary.Click Element  //label[.='F']
	I type [${EMPTY}] in the [Color] input field
	I type [${EMPTY}] in the [Insurance] input field
	I type [${EMPTY}] in the [Insur. #] input field
	I type [${EMPTY}] in the [Chip ID] input field
	I type [${EMPTY}] in the [Tattoo] input field
	I type [${EMPTY}] in the [XRay] input field
	I type [${EMPTY}] in the [License #] input field
	I type [${EMPTY}] in the [Rabies Tag] input field
	I type [${EMPTY}] in the [Rabies Producer] input field
	I type [${EMPTY}] in the [Lot #] input field
	I type [${EMPTY}] in the [Groom] input field
	I [Save & Close] the selected form
	Navigate to [Patients]
	Ensure Title on page is [Patients]
	
Verification that changed paramters have been reverted to initial values
	[Tags]  TC Details
	Open the record and validate correct parameters are present on the screen  388083
	Within Clients panel I navigate to [Details]
	Verify that the [Name] input has text value [Abby]
	Verify that the [Show Name] input has text value [${EMPTY}]
	Verify that the [Weight] input has text value [${EMPTY}]
	#Ensure that element is visible  //label[.='M']/..//input[@aria-checked='false']
	#Ensure that element is visible  //label[.='F']/..//input[@aria-checked='true']
	Ensure that element is visible  //label[.='Spayed']
	Verify that the [Color] input has text value [${EMPTY}]
	Verify that the [Insurance] input has text value [${EMPTY}]
	Verify that the [Insur. #] input has text value [${EMPTY}]
	Verify that the [Chip ID] input has text value [${EMPTY}]
	Verify that the [Tattoo] input has text value [${EMPTY}]
	Verify that the [XRay] input has text value [${EMPTY}]
	Verify that the [License #] input has text value [${EMPTY}]
	Verify that the [Rabies Tag] input has text value [${EMPTY}]
	Verify that the [Rabies Producer] input has text value [${EMPTY}]
	Verify that the [Lot #] input has text value [${EMPTY}]
	Verify that the [Groom] input has text value [${EMPTY}]
	Verify that the [Species] input has text value [Canine]
	Verify that the [Breed] input has text value [Labrador Mix]
	[Teardown]  Close all open browsers and clear cookies

