*** Settings ***

Resource	../Keywords/Settings.robot
Resource	../Keywords/Navigation.robot
Resource	../Keywords/Validations.robot
Resource	../Keywords/Context.robot

*** Variables ***
${IsAjaxComplete}    ${EMPTY}

*** Keywords ***
  
Open Browser And Go To Login Page
    SeleniumLibrary.Open Browser  ${ServerName}  ${Browser}
    SeleniumLibrary.Maximize Browser Window
    SeleniumLibrary.Set Selenium Speed  0.1

Run DVMAX in web browser
	Open Browser And Go To Login Page
	Generic_Commands.Wait for Ajax
	
Login as Administrator
	#aSeleniumLibrary.Scroll Element Into View  //span[@data-ref='btnInnerEl'][contains(.,'Login')]
	SeleniumLibrary.Input Text  //span[contains(.,'Password')]/../..//div/input  foobar123
	Ensure that element is visible  //div[@class='x-text-el'][.='Login']
    SeleniumLibrary.Click Element  //div[@class='x-text-el'][.='Login']/../../..

Login as [${USERN}] with password [${PSWD}]
	#SeleniumLibrary.Scroll Element Into View  //div[@class='x-text-el'][.='Login']/../../..
	SeleniumLibrary.Input Text  //span[contains(.,'Username')]/../..//div/input  ${USERN}
	SeleniumLibrary.Input Text  //span[contains(.,'Password')]/../..//div/input  ${PSWD}
	SeleniumLibrary.Click Element  //div[@class='x-text-el'][.='Login']/../../..
    Wait for Ajax
	
Logout from DVMAX
	Ensure that element is visible  //div[@class='x-text-el'][.='Logout']
	SeleniumLibrary.Click Element  //div[@class='x-text-el'][.='Logout']/../../..

I select [${$CALDATE}] from the date picker
	Validations.Ensure that element is visible  //span[.='Date']/../..//input[contains(@data-componentid,'ext-datepickernativefield')]
	SeleniumLibrary.Input Text  //span[.='Date']/../..//input[contains(@data-componentid,'ext-datepickernativefield')]  ${$CALDATE}

Open the record and validate correct parameters are present on the screen
	[Arguments]  ${APPTDATE}
	Wait for Ajax
	Ensure that element is visible  //div[@class='x-body-el x-gridcell-body-el'][contains(.,'${APPTDATE}')]
	SeleniumLibrary.Double Click Element  //div[@class='x-body-el x-gridcell-body-el'][contains(.,'${APPTDATE}')]/../../..
	SeleniumLibrary.Go To  https://dvmax-cloud-qa.appspot.com/#patient/5AB575664C444C0A958679CD88ADC800
	SeleniumLibrary.Reload Page
	Accept Automation Alert
	Wait for Ajax
	Sleep  1
	Ensure that element is visible  //span[@class='patientIdentifier'][.='ID: 388083']
	
Select client Brian Adams
	Ensure that element is visible  //div[@class='x-body-el x-gridcell-body-el'][contains(.,'Brian Adams')]
	SeleniumLibrary.Double Click Element  //div[@class='x-body-el x-gridcell-body-el'][contains(.,'Brian Adams')]
	SeleniumLibrary.Go To  https://dvmax-cloud-qa.appspot.com/#client/0357F565E0FA834B81A913AF27CC4FDF
	SeleniumLibrary.Reload Page
	Accept Automation Alert
	Wait for Ajax
	Sleep  1
	Ensure that element is visible  //span[@class='clientName'][contains(.,'Brian Adams')] 
	Ensure that element is visible  //div[@class='signalmentInfo'][contains(.,'123-0000')]
	Ensure that element is visible  //div[@class='signalmentInfo'][contains(.,'Charming Avenue')]
	Ensure that element is visible  //div[@class='signalmentInfo'][contains(.,'Carrollton GA')]
	Ensure that element is visible  //div[@class='signalmentInfo'][contains(.,'No email')]
	
Open the same record and validate Patient open since is present on the screen
	SeleniumLibrary.Double Click Element  //div[@class='x-grid-cell-inner '][contains(.,'11/21/2017')]
	Ensure that element is visible  //div[contains(.,'Abby - Canine - Labrador Mix')]
	Ensure that element is visible  //div[contains(.,'Valerie Maloian 1516 Arthur Ave')]
	Ensure that element is visible  //label[contains(.,'Patient open since')]

I select Hospitalized patient with ID [${HOSPITALIZEDID}] and Name [${HOSPITALIZEDNAME}]
	Sleep  1
	Wait for Ajax
	Ensure that element is visible  //div[.='${HOSPITALIZEDID}']
	Ensure that element is visible  //div[.='${HOSPITALIZEDNAME}']
	SeleniumLibrary.Double Click Element  //div[.='${HOSPITALIZEDID}']
	Wait for Ajax
	Ensure that element is visible  //div[@class='x-form-display-field x-form-display-field-default'][.='${HOSPITALIZEDID}']
	
From the To Do by Patients list I select [${PATIENT}] with [${MRC}] and [${TITLE}]
	Sleep  1
	Wait for Ajax
	Ensure that element is visible  //div[.='${PATIENT}']/../..//div[contains(.,'${MRC}')]/../..//div[contains(.,'${TITLE}')]
	SeleniumLibrary.Double Click Element  //div[.='${PATIENT}']/../..//div[contains(.,'${MRC}')]/../..//div[contains(.,'${TITLE}')]
	Wait for Ajax	

Enable and Disable the Automatically Refresh check box
	Ensure that element is visible  //span[@class='x-form-item-label-text'][.='Automatically Refresh:']//../../../div/div/input[@role='checkbox']
	SeleniumLibrary.Click Element  //span[@class='x-form-item-label-text'][.='Automatically Refresh:']//../../../div/div/span
	Ensure that element is visible  //span[@class='x-form-item-label-text'][.='Automatically Refresh:']//../../../div/div/input[@aria-checked='true']
	SeleniumLibrary.Click Element  //span[@class='x-form-item-label-text'][.='Automatically Refresh:']//../../../div/div/span
	Ensure that element is visible  //span[@class='x-form-item-label-text'][.='Automatically Refresh:']//../../../div/div/input[@aria-checked='false']

I click the Add Medical Record button
	Wait for Ajax
	SeleniumLibrary.Wait Until Page Does Not Contain Element  //div[@class='x-component x-mask dvmax-mask x-has-message x-root x-floating']//div[.='Loading...']
	Ensure that element is visible  //div[@class='x-text-el'][.='Add Medical Record']/../../..
	SeleniumLibrary.Click Element  //div[@class='x-text-el'][.='Add Medical Record']/../../..
	
I select [${CATEGORYITEM}] from the category list with code [${CODE}] and description [${DESC}]
	Wait for Ajax
	Validations.Ensure that element is visible  //div[contains(@class, 'x-text-el')][.='Category']/../../../../../../../..//div[@class='x-dock x-dock-vertical']//div[@class='x-body-el x-gridcell-body-el'][.='${CATEGORYITEM}'] 
	SeleniumLibrary.Click Element  //div[contains(@class, 'x-text-el')][.='Category']/../../../../../../../..//div[@class='x-dock x-dock-vertical']//div[@class='x-body-el x-gridcell-body-el'][.='${CATEGORYITEM}']
	Ensure that element is visible	//div[@class='x-text-el'][.='Code']/../../../../../../../..//div[@class='x-dock x-dock-vertical']//div[@class='x-body-el x-gridcell-body-el'][.='${CODE}']
	Ensure that element is visible	//div[@class='x-text-el'][.='Description']/../../../../../../../..//div[@class='x-dock x-dock-vertical']//div[@class='x-body-el x-gridcell-body-el'][.='${DESC}']
	Sleep  2
	SeleniumLibrary.Double Click Element  //div[@class='x-text-el'][.='Code']/../../../../../../../..//div[@class='x-dock x-dock-vertical']//div[@class='x-body-el x-gridcell-body-el'][.='${CODE}']
	I [Select] the selected form

Verify Primary Provider dialog box
	Ensure that element is visible  //div[@data-title='Select Primary Provider']
	Ensure that element is visible  //div[@data-title='Select Primary Provider']/../../../../..//span[@class='x-label-text-el'][.='Provider']
	Ensure that element is visible  //div[@data-title='Select Primary Provider']/../../../../..//div[@class='x-text-el'][.='Save']
	SeleniumLibrary.Click Element  //div[@data-title='Select Primary Provider']/../../../../..//div[@class='x-text-el'][.='Save']/../../..
	Wait for Ajax
	Sleep  1


I [${SAVECANCEL}] the selected form
	Ensure that element is visible  //div[@class='x-text-el'][.='${SAVECANCEL}']/../../..
	SeleniumLibrary.Click Element  //div[@class='x-text-el'][.='${SAVECANCEL}']/../../..
	Wait for Ajax
	Sleep  3
	#Ensure that element is visible  //div[@class='x-text-el'][.='Save Medical Record Entry']

I type [${VALUE}] in the [${INPUTFIELD}] input field
	SeleniumLibrary.Input Text  //span[contains(.,'${INPUTFIELD}')]/../..//input  ${VALUE}

Verify that the [${LABELNAME}] input has text value [${GETNAMEFROMINPUT}]
	${GETNAMEFROMINPUT}=  SeleniumLibrary.Get Value  //label[contains(.,'${LABELNAME}')]/..//input
	Log  ${GETNAMEFROMINPUT}
	SeleniumLibrary.Textfield Value Should Be  //label[contains(.,'${LABELNAME}')]/..//input  ${GETNAMEFROMINPUT}

I select [${ULITEM}] from the [${DDLNAME}] drop down list
	Wait for Ajax
	Ensure that element is visible  //span[@class='x-label-text-el'][contains(.,'${DDLNAME}')]/../..//input
	SeleniumLibrary.Click Element  //span[@class='x-label-text-el'][contains(.,'${DDLNAME}')]/../..//div[@class='x-expandtrigger x-trigger x-interactive x-expandtrigger-dvmax_textfield x-trigger-dvmax_textfield']
	Wait for Ajax
	Sleep  2
	SeleniumLibrary.Click Element  //span[@class='x-list-label'][contains(.,'${ULITEM}')]
	#SeleniumLibrary.Click Element  //span[@class='x-label-text-el'][contains(.,'Species')]/../..//div[@class='x-expandtrigger x-trigger x-interactive']
	#Ensure that element is visible  //span[@class='x-list-label'][.='${ULITEM}']
	#SeleniumLibrary.Click Element  //span[@class='x-list-label'][.='${ULITEM}']
	
Increase Qty value by 1
	${QTYVAL}=  SeleniumLibrary.Get Text  //div[@class='x-title-text x-title-text-default x-title-item'][.='Invoice']/../../../../..//table[1]//tr[1]//td[1]/div[@class='x-grid-cell-inner ']
	Set Global Variable  ${QTYVAL}
	SeleniumLibrary.Element Text Should Be  //div[@class='x-title-text x-title-text-default x-title-item'][.='Invoice']/../../../../..//table[1]//tr[1]//td[1]/div[@class='x-grid-cell-inner ']  ${QTYVAL}
	SeleniumLibrary.Click Element  //div[@class='x-title-text x-title-text-default x-title-item'][.='Invoice']/../../../../..//table[1]//tr[1]//td[2]//span[@class='x-btn-inner x-btn-inner-default-small'][.='+']
	Wait for Ajax

Decrease Qty value by 1
	${QTYVAL1}=  SeleniumLibrary.Get Text  //div[@class='x-title-text x-title-text-default x-title-item'][.='Invoice']/../../../../..//table[1]//tr[1]//td[1]/div[@class='x-grid-cell-inner ']
	Set Global Variable  ${QTYVAL1}
	SeleniumLibrary.Element Text Should Be  //div[@class='x-title-text x-title-text-default x-title-item'][.='Invoice']/../../../../..//table[1]//tr[1]//td[1]/div[@class='x-grid-cell-inner ']  ${QTYVAL1}
	SeleniumLibrary.Click Element  //div[@class='x-title-text x-title-text-default x-title-item'][.='Invoice']/../../../../..//table[1]//tr[1]//td[3]//span[@class='x-btn-inner x-btn-inner-default-small'][.='-']
	Wait for Ajax
	SeleniumLibrary.Element Text Should Be  //div[@class='x-title-text x-title-text-default x-title-item'][.='Invoice']/../../../../..//table[1]//tr[1]//td[1]/div[@class='x-grid-cell-inner ']  ${QTYVAL}

Within the Major Problems text area I type [${MPTEXT}]
	${GETMPVAL000}=  SeleniumLibrary.Get Text  //span[@class='x-form-item-label-text'][contains(.,'Major Problems')]/../../..//textarea
	Set Global Variable  ${GETMPVAL000}
	SeleniumLibrary.Input Text  //span[@class='x-form-item-label-text'][contains(.,'Major Problems')]/../../..//textarea  ${MPTEXT}

Within the Comments text area I type [${CMTTEXT}]	
	${GETCMVAL000}=  SeleniumLibrary.Get Text  //span[@class='x-form-item-label-text'][contains(.,'Major Problems')]/../../..//textarea
	Set Global Variable  ${GETCMVAL000}
	SeleniumLibrary.Input Text  //span[@class='x-form-item-label-text'][contains(.,'Comments')]/../../..//textarea  ${CMTTEXT}

I Save the cuurent panel
	SeleniumLibrary.Click Element  //span[@class='x-btn-inner x-btn-inner-default-toolbar-small'][.='Save']
	
Within New Appointment I [${VALUE}] the current form
	Ensure that element is visible  //div[@class='x-toolbar x-container x-component x-noborder-trbl x-toolbar-footer x-container-footer x-component-footer x-dock-item x-docked-bottom x-panel-outer-border-rbl x-container-outer-border-rbl x-component-outer-border-rbl']//div[@class='x-component x-button x-has-text x-widthed x-icon-align-left x-arrow-align-right x-button-action x-component-action x-layout-box-item x-layout-hbox-item']//div[@class='x-inner-el'][.='${VALUE}']
	SeleniumLibrary.Click Element  //div[@class='x-toolbar x-container x-component x-noborder-trbl x-toolbar-footer x-container-footer x-component-footer x-dock-item x-docked-bottom x-panel-outer-border-rbl x-container-outer-border-rbl x-component-outer-border-rbl']//div[@class='x-component x-button x-has-text x-widthed x-icon-align-left x-arrow-align-right x-button-action x-component-action x-layout-box-item x-layout-hbox-item']//div[@class='x-inner-el'][.='${VALUE}']/..
	Wait for Ajax
	
Wait for Ajax
  	#: FOR    ${INDEX}    IN RANGE    1    5000
    #\    ${IsAjaxComplete}    Execute JavaScript    return window.jQuery!=undefined && jQuery.active==0
    #\    Log    ${INDEX}
    #\    Log    ${IsAjaxComplete}
    #\    Run Keyword If    ${IsAjaxComplete}==True    Exit For Loop
	SeleniumLibrary.Execute JavaScript  "return jQuery.active == 0"
	Sleep  0.5
    #Wait for Condition  return window.jQuery.active == 0;
    #Wait for Condition  return $(':animated').length == 0;
	
Close all open browsers and clear cookies
	SeleniumLibrary.Delete All Cookies
	SeleniumLibrary.Close All Browsers