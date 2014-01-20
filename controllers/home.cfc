/**
*
* @file  /C/inetpub/wwwroot/finealley/FineAlleyWebsite2/controllers/home.cfc
* @author  
* @description
*
*/

component output="false" displayname="home"  {

	public void function init(fw = '') {
		VARIABLES.fw = ARGUMENTS.fw;
	}


	public void function default(required struct RC) {
		VARIABLES.fw.service("eventService.getEvents","events");
	}


	public void function event(required struct RC) {
		REQUEST.template.setPageTitle("View Event");
		VARIABLES.fw.service("eventService.getEvent","event");
	}


	public void function startContactUs(required struct RC) {
		if (structKeyExists(RC,"btnSave")) {
			RC.SMTPServer = APPLICATION.websiteSettings.getProperty("Mail_SMTPServer");
			RC.SMTPPort = APPLICATION.websiteSettings.getProperty("Mail_Port");
			RC.SMTPUsername = APPLICATION.websiteSettings.getProperty("Mail_Username");
			RC.SMTPPassword = APPLICATION.websiteSettings.getProperty("Mail_Password");
			RC.SMTPuseSSL = APPLICATION.websiteSettings.getProperty("Mail_UseSSL");
			VARIABLES.fw.service("mailService.validateContactUsFormAndSend","validationErrors");
		}
	}
	public void function contactUs(required struct RC) {
		REQUEST.template.addFile("/includes/js/formOptions.min.js");
		REQUEST.template.setPageTitle("Contact Us");
	}
	public void function endContactUs(required struct RC) {}
}