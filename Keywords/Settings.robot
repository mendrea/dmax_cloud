*** Settings ***
Library		SeleniumLibrary	timeout=60 s
#Library		Collections			
#Library		RequestsLibrary


*** Variables ***
${ENVIRONMENT}		DVMAX Cloud

${BROWSER}			chrome
#${ServerName}		http://192.168.1.36:8080/anywhere/index.html
${ServerName}		https://dvmax-cloud-qa.appspot.com
${DELAY}			0
${SetDEVMAXframe}	//iframe[@class='x-component x-fit-item x-component-default']
${DVMAXTITLE}		DVMAX Anywhere
${DVMAXDESC}		Flexible, Responsive and Ready to Work Where You Do
${DVMAXBTN}			View more information on DVMAX v8.5
${APPTDATE}
