*** Settings ***

Resource	../Keywords/Settings.robot
Resource	../Keywords/Navigation.robot
Resource	../Keywords/Generic_Commands.robot
Resource	../Keywords/Validations.robot

*** Test Cases ***

HTTP NEO
	Create Session	neo 	http://neo-pre.coniq.com/application/version/download/7/file
	${resp}=  Get Request  neo		http://neo-pre.coniq.com/application/version/download/7/file
	To Json  ${resp}
	#Create Session	google	http://www.google.com	${resp}=	Get Request	google	/
	#Should Be Equal As Strings	${resp.status_code}	200	
	#${resp}=	Get Request	github	/users/bulkan
	#Should Be Equal As Strings	${resp.status_code}	200	