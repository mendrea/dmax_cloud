*** Settings ***

Resource	../Keywords/Settings.robot
Resource	../Keywords/Generic_Commands.robot
Resource	../Keywords/Validations.robot

*** Keywords ***

Accept Automation Alert
	SeleniumLibrary.Handle Alert
	#${message} =	Handle Alert

Navigate to [${LEFTMENUITEM}]
	SeleniumLibrary.Click Element  //div[@class='x-text-el'][.='${LEFTMENUITEM}']/../../..
	#SeleniumLibrary.Go To  https://dvmax-cloud-qa.appspot.com/#${LEFTMENUITEM}
	#SeleniumLibrary.Reload Page
	Wait for Ajax

Navigate to the sub-item [${LEFTMENUSUBITEM}]
	SeleniumLibrary.Click Element  //div[@class='x-treelist-item-text x-treelist-item-text-noicon'][.='${LEFTMENUSUBITEM}']

Navigate to DVMAX News page
	Ensure that element is visible  //a[@data-componentid='tab-1072']
	SeleniumLibrary.Click Element  //a[@data-componentid='tab-1072']
	Wait for Ajax
	Ensure that the element is not visible  //div[@class='loader']
	SeleniumLibrary.Select Frame  //iframe[@class='x-component x-fit-item x-component-default']
	Ensure that element is visible  //html[contains(@class, 'js flexbox canvas')]
	${frames} =  Current Frame Contains  ${DVMAXTITLE}
	${frames} =  Current Frame Contains  ${DVMAXDESC}
	${frames} =  Current Frame Contains  ${DVMAXBTN}
	SeleniumLibrary.Unselect Frame

Within Clients panel I navigate to [${HISTNAV}]
	Wait for Ajax
	Ensure that element is visible  //div[@class='x-tab x-component x-button x-has-text x-icon-align-top x-arrow-align-right x-layout-box-item x-layout-hbox-item x-flexed']//div[@class='x-text-el'][.='${HISTNAV}']/../../..
	SeleniumLibrary.Wait Until Element Is Not Visible  //div[@class='loading']
	SeleniumLibrary.Wait Until Element Is Not Visible  //div[@class='x-mask-message'][.='Loading...']
	Sleep  3
	SeleniumLibrary.Click Element  //div[@class='x-tab x-component x-button x-has-text x-icon-align-top x-arrow-align-right x-layout-box-item x-layout-hbox-item x-flexed']//div[@class='x-text-el'][.='${HISTNAV}']/../../..
	Wait for Ajax
	SeleniumLibrary.Wait Until Element Is Not Visible  //div[@class='loading']
	SeleniumLibrary.Wait Until Element Is Not Visible  //div[@class='x-mask-message'][.='Loading...']
	Sleep  1
	
Within Appointments panel in the Info tab - Navigate to [${APINFO}]
	Ensure that element is visible  //div[@class='x-box-inner x-box-scroller-body-horizontal']//span[@class='x-tab-inner x-tab-inner-dvmax-tabpanel'][.='${APINFO}']
	SeleniumLibrary.Click Element  //div[@class='x-box-inner x-box-scroller-body-horizontal']//span[@class='x-tab-inner x-tab-inner-dvmax-tabpanel'][.='${APINFO}']
	Wait for Ajax
	Sleep  1