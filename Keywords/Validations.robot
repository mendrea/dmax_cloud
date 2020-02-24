*** Settings ***

Resource	../Keywords/Settings.robot
Resource	../Keywords/Navigation.robot
Resource	../Keywords/Generic_Commands.robot
Resource	../Keywords/Context.robot

*** Keywords ***

Ensure User is on DVMAX Login Page
	Ensure that element is visible  //span[contains(.,'Username')]/../..//div/input
    Ensure that element is visible  //span[contains(.,'Password')]/../..//div/input
    #SeleniumLibrary.Scroll Element Into View  //div[@class='x-text-el'][.='Login']
    Ensure that element is visible  //div[@class='x-text-el'][.='Login']
    
Left Menu items are available
	#Ensure that element is visible  //div[@class='x-treelist-item-text'][.='Home']
    Ensure that element is visible  //div[@class='x-text-el'][.='Clients']
    Ensure that element is visible  //div[@class='x-text-el'][.='Patients']
    Ensure that element is visible  //div[@class='x-text-el'][.='Scheduling']
    #Ensure that element is visible  //div[@class='x-text-el'][.='Messaging']
    Ensure that element is visible  //div[@class='x-text-el'][.='To Dos']
    #Ensure that element is visible  //div[@class='x-text-el'][.='Whiteboard']
    Ensure that element is visible  //div[@class='x-text-el'][.='Settings']
   
Upper Menu items: [Carrollton Animal Hospital] [ToDos] [Appts] [Todays Date] and [Local Time] are available
	Ensure that element is visible  //*[@id='component-1035'][contains(.,'Carrollton Animal Hospital')]
	Ensure that element is visible  //*[@id='component-1037'][contains(.,'ToDos')]
	Ensure that element is visible  //*[@id='component-1039'][contains(.,'Appts')]
	Ensure that element is visible  //*[@id='component-1041']
	Ensure that element is visible  //*[@id='component-1043']

Verify Home Page contains 2 tabs: [${DVMAXNEWS}] and [${LLR}]
	Ensure that element is visible  //div[@class='x-text-el'][contains(.,'${LLR}')]
	Ensure that element is visible  //div[@class='x-text-el'][contains(.,'${DVMAXNEWS}')]
	
Verify that the User has landed on the Home page
	Wait for Ajax 
	Ensure that element is visible  //div[@class='x-component x-img x-img-background x-layout-fit-item']

Ensure that element is visible
	[Arguments]  ${elementXpathIdentifier}
	SeleniumLibrary.Wait Until Element Is Visible  ${elementXpathIdentifier}
	
Ensure that the element is not visible
	[Arguments]  ${elementXpathIdentifier}
	SeleniumLibrary.Page Should Not Contain Element  ${elementXpathIdentifier}
	
Verify that on [${DATEVAL}] the patient [${PATIENTNAME}] and client [${HOMEADDRESS}] has Staff [${DRNAME}]
	Wait for Ajax
	Sleep  1
	Ensure that element is visible  //table//div[contains(.,'${DATEVAL}')] 
	Ensure that element is visible  //table//div[contains(.,'${PATIENTNAME}')]
	Ensure that element is visible  //table//div[contains(.,'${HOMEADDRESS}')]
	Ensure that element is visible  //table//div[contains(.,'${DRNAME}')]
	
Above the tabs is a Quick Glance bar, with number of To Dos, number of Appointments and Date and Time boxes
	Ensure that element is visible  //div[@class='x-component x-box-item x-component-default'][contains(.,'Carrollton Animal Hospital')]
	Ensure that element is visible  //div[@class='x-component x-box-item x-component-default'][contains(.,'ToDos')]
	Ensure that element is visible  //*[@id='dashboard_info_block-1040']
	Ensure that element is visible  //*[@id='dashboard_info_block-1042']
	
Ensure label with text [${LABELTEXT}] is present
	Ensure that element is visible  //label[@class='x-label-el'][contains(.,'${LABELTEXT}')]

Ensure [${LABELINPUT}] input text field is present
	Ensure that element is visible  //label[@class='x-label-el'][.='${LABELINPUT}']/..//input
	
Ensure Filter is present for Medical Record
	Ensure that element is visible  //input[@placeholder='Search for Code or Description']

#Ensure that [${LABELINPUT}] input text field contains [${VALUE}]
#	Ensure that element is visible  //span[contains(.,'${LABELINPUT}')]/../..//input[contains(.,'${VALUE}')]
	
Ensure Title on page is [${PAGETITLE}]
	#Ensure that element is visible  //div[@data-title='${PAGETITLE}']
	Ensure that element is visible  //div[contains(@class,'x-field-toolbar_displayfield')]//div[@class='x-input-el'][contains(.,'${PAGETITLE}')]

Within the [${PAGETITLE}] page ensure the header of the table has value [${H_VAL}]
	#Ensure that element is visible  //div[contains(@class,'x-field-toolbar_displayfield')]//div[@class='x-input-el'][contains(.,'${PAGETITLE}')]/../../../../../../..//div[contains(@data-componentid,'ext-client_output')]//div[@class='x-header-el']//div[@data-qoverflow='true'][contains(.,'Name')]
	Ensure that element is visible  //div[contains(@data-componentid,'ext-${PAGETITLE}_output')]//div[@class='x-header-el']//div[contains(@class,'x-title-el')][contains(.,'${H_VAL}')]

Ensure that Super Items pop up appears
	Ensure that element is visible  //div[@data-title='Super Item DS015: Dental Cleaning-Feline']/../../../../..//div[@class='x-text-el'][.='Include']
	Ensure that element is visible  //div[@data-title='Super Item DS015: Dental Cleaning-Feline']/../../../../..//div[@class='x-text-el'][.='Quantity']
	Ensure that element is visible  //div[@data-title='Super Item DS015: Dental Cleaning-Feline']/../../../../..//div[@class='x-text-el'][.='Description']
	Ensure that element is visible  //div[@data-title='Super Item DS015: Dental Cleaning-Feline']/../../../../..//div[@class='x-text-el'][.='Price']
	
Ensure Category list contains [${CATLSVAL}] value
	Ensure that element is visible  //div[contains(@class, 'x-text-el')][.='Category']/../../../../../../../..//div[@class='x-dock x-dock-vertical']//div[@class='x-body-el x-gridcell-body-el'][.='${CATLSVAL}']
	
Verify the User has an invoice with Qty [${QTY}] Date [${DATE}] Staff [${STAFF}] Patient [${PATIENT}] Code [${CODE}] Description [${DESC}] Price [${PRICE}] and Ext [${EXT}]	
	Validations.Ensure that element is visible  //table//tr//div[@class='x-grid-cell-inner '][.='${QTY}']
	SeleniumLibrary.Page Should Contain Element  //div[contains(@class,'x-title-text')][.='Invoice']/../../../../..//table//tr//div[@class='x-grid-cell-inner '][.='${DATE}']
	Validations.Ensure that element is visible  //div[contains(@class,'x-title-text')][.='Invoice']/../../../../..//table//tr//div[.='${STAFF}']
	Validations.Ensure that element is visible  //div[contains(@class,'x-title-text')][.='Invoice']/../../../../..//table//tr//div[.='${PATIENT}']
	Validations.Ensure that element is visible  //div[contains(@class,'x-title-text')][.='Invoice']/../../../../..//table//tr//div[.='${CODE}']
	Validations.Ensure that element is visible  //div[contains(@class,'x-title-text')][.='Invoice']/../../../../..//table//tr//div[contains(.,'${DESC}')]
	SeleniumLibrary.Page Should Contain Element  //div[contains(@class,'x-title-text')][.='Invoice']/../../../../..//table//tr//div[.='${PRICE}']
	SeleniumLibrary.Page Should Contain Element  //div[contains(@class,'x-title-text')][.='Invoice']/../../../../..//table//tr//div[.='${EXT}']
	
Ensure invoice with Medical Record Entry [${MRE}] is shown
	Sleep  1
	Wait for Ajax
	SeleniumLibrary.Click Element  //div[@class='x-text-el'][.='Text View']/../../..//button
	SeleniumLibrary.Scroll Element Into View  //span[@class='medical-description'][.='${MRE}']
	#Ensure that element is visible  //div[@class='x-text-el'][.='Medical Record Entry']/../../../../../../../../div[@class='x-dock x-dock-vertical']//div[@class='x-body-el x-gridcell-body-el'][.='${MRE}']
	SeleniumLibrary.Page Should Contain Element  //span[@class='medical-description'][.='${MRE}']
	#SeleniumLibrary.Open Context Menu  //table//div[.='${MRE}']
	#SeleniumLibrary.Click Element  //span[.='Mark MRE as Hidden']
	#Ensure that the element is not visible  //table//div[.='${MRE}']
	
Submit Request for Special Codes
	Wait for Ajax
	Ensure that element is visible  //div[@data-title='Request']
	Ensure that element is visible  //span[@class='x-label-text-el'][.='Weight:']
	Ensure that element is visible  //div[@class='x-text-el'][.='OK']
	Ensure that element is visible  //div[@data-title='Request']/../../../../..//div[@class='x-text-el'][.='Cancel']
	
Verify that User has landed on Notes page
	Ensure that element is visible  //canvas[@class='x-surface-canvas']
	Ensure that element is visible  //span[@class='x-form-item-label-text'][contains(.,'Major Problems')]/../../..//textarea
	Ensure that element is visible  //span[@class='x-form-item-label-text'][contains(.,'Comments')]/../../..//textarea
	Ensure that element is visible  //div[@class='x-title-text x-title-text-default x-title-item'][.='Reminders']
	Ensure that element is visible  //div[@class='x-title-text x-title-text-default x-title-item'][.='Recalls']
	Ensure that element is visible  //span[@class='x-btn-inner x-btn-inner-default-toolbar-small'][.='Cancel']
	Ensure that element is visible  //span[@class='x-btn-inner x-btn-inner-default-toolbar-small'][.='Save']

Ensure that within the [${TEXTAREA}] textarea does not contain [${TEXT}]
	SeleniumLibrary.Element Should Not Contain  //span[@class='x-form-item-label-text'][contains(.,'${TEXTAREA}')]/../../..//textarea  ${TEXT}
	