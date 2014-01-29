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
		RC.page = 1;
		RC.itemsPerPage = 4;
		VARIABLES.fw.service("eventService.getEvents","events");
		RC.cononicalURI = "/";
		REQUEST.template.setDescription("Get more information on Fine Alley and Upcoming Events!");
	}


	public void function event(required struct RC) {
		REQUEST.template.setPageTitle("View Event");
		VARIABLES.fw.service("eventService.getEvent","event");
	}
	public void function endEvent(required struct RC) {
		REQUEST.template.setPageTitle("Event #dateFormat(RC.event.getDateTime(),"MMM d, yyyy")# - #RC.event.getTitle()#");
		RC.cononicalURI = "/event" &  RC.event.getURI();
		REQUEST.template.setDescription("Get Information about our #RC.event.getTitle()# event on #dateFormat(RC.event.getDateTime(),"MMMM D, YYYY")#");
	}


	public void function venue(required struct RC) {
		REQUEST.template.setPageTitle("View Venue");
		REQUEST.template.addFile("https://maps.googleapis.com/maps/api/js?key=#APPLICATION.websiteSettings.getGoogle_APICode()#&amp;sensor=false");
		REQUEST.template.addFile("/includes/js/gmap3.min.js");
		REQUEST.template.addFile("/includes/js/home.venue.min.js");
		VARIABLES.fw.service("venueService.getVenue","venue");
	}
	public void function endVenue(required struct RC) {
		REQUEST.template.setPageTitle("Venue - #RC.venue.getName()#");
		RC.cononicalURI = "/venue/" &  RC.venue.getEncodedName();
		REQUEST.template.setDescription(reReplaceNoCase("Get more information about #RC.venue.getName()#","<[^>]+>","","ALL"));
	}


	public void function listEvents(required struct RC) {
		REQUEST.template.setPageTitle("Upcoming Events");
		RC.cononicalURI = "/events";
		RC.page = 1;
		RC.itemsPerPage = 10;
		VARIABLES.fw.service("eventService.getEvents","events");
		REQUEST.template.setDescription("Check out our upcoming events");
	}


	public void function startContactUs(required struct RC) {
		if (structKeyExists(RC,"btnSave")) {
			RC.SMTPServer = APPLICATION.websiteSettings.getProperty("Mail_SMTPServer");
			RC.SMTPPort = APPLICATION.websiteSettings.getProperty("Mail_Port");
			RC.SMTPUsername = APPLICATION.websiteSettings.getProperty("Mail_Username");
			RC.SMTPPassword = APPLICATION.websiteSettings.getProperty("Mail_Password");
			RC.SMTPuseSSL = APPLICATION.websiteSettings.getProperty("Mail_UseSSL");

			RC.SMTPFromName = APPLICATION.websiteSettings.getProperty("Mail_FromName");
			RC.SMTPFromEmailAddress = APPLICATION.websiteSettings.getProperty("Mail_FromEmailAddress");
			RC.toAddress = APPLICATION.websiteSettings.getProperty("Mail_SendToEmailAddress");

			VARIABLES.fw.service("mailService.validateContactUsFormAndSend","validationErrors");
		}
	}
	public void function contactUs(required struct RC) {
		REQUEST.template.addFile("/includes/js/formOptions.min.js");
		REQUEST.template.setPageTitle("Contact Us");
		REQUEST.template.setDescription("Contact Fine Alley about upcoming events, or request a few songs for us to play");
		RC.cononicalURI = "/contact-us";
	}
	public void function endContactUs(required struct RC) {}
}