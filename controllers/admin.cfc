/**
*
* @file  /C/inetpub/wwwroot/finealley/FineAlleyWebsite2/controllers/admin.cfc
* @author  
* @description
*
*/

component output="false" displayname="admin"  {

	public void function init(fw = '') {
		VARIABLES.fw = ARGUMENTS.fw;
	}


	public void function before(required struct RC) {
		RC.layoutSideBars = false;
		if ((RC.action != "admin.login") && !REQUEST.security.checkPermission("isAdmin")) {
			VARIABLES.fw.redirect(action='admin.login');
		}
	}


	public void function default(required struct RC) {
	}


	public void function startLogin(required struct RC) {
		if (structKeyExists(RC,"btnSave")) {
			VARIABLES.fw.service("security.logIn","void");
		}
	}
	public void function login(required struct RC) {
		REQUEST.template.setPageTitle("Login");
	}
	public void function endLogin(required struct RC) {
		if (structKeyExists(RC,"btnSave")) {
			if (REQUEST.security.checkPermission("isAdmin")) {
				VARIABLES.fw.redirect(action='admin.default');
			}
		}
	}


	public void function logout(required struct RC) {
		VARIABLES.fw.service("security.logout","void");
	}
	public void function endLogout(required struct RC) {
		VARIABLES.fw.redirect(action='admin.login');
	}


	public void function listUsers(required struct RC) {
		REQUEST.template.setPageTitle("List Users");
		VARIABLES.fw.service("personService.getPeople","people");
	}


	public void function startEditUser(required struct RC) {
		if (structKeyExists(RC,"btnSave")) {
			VARIABLES.fw.service("personService.editPersonAndSave","person");
		} else if (structKeyExists(RC,"personID")) {
			VARIABLES.fw.service("personService.getPerson","person");
		}
	}
	public void function editUser(required struct RC) {
		REQUEST.template.setPageTitle("Edit User");
	}
	public void function endEditUser(required struct RC) {
		if (structKeyExists(RC,"btnSave")) {
			VARIABLES.fw.redirect(action='admin.listUsers');
		} else if (structKeyExists(RC,"personID")) {
			for (property in RC.person.getPropertyStruct()) {
				RC[property] = RC.person.getProperty(property);
			}
		}
	}


	public void function listEvents(required struct RC) {
		REQUEST.template.setPageTitle("List Events");
		VARIABLES.fw.service("eventService.getEvents","events");
	}


	public void function startEditEvent(required struct RC) {
		if (structKeyExists(RC,"btnSave")) {
			VARIABLES.fw.service("eventService.editEventAndSave","event");
		} else if (structKeyExists(RC,"eventID")) {
			VARIABLES.fw.service("eventService.getEvent","event");
		}
	}
	public void function editEvent(required struct RC) {
		REQUEST.template.setPageTitle("Edit Event");
		REQUEST.template.addFile("/includes/js/formOptions.min.js");
	}
	public void function endEditEvent(required struct RC) {
		if (structKeyExists(RC,"btnSave")) {
			RC.eventID = RC.event.getID();
			VARIABLES.fw.redirect(action='home.event',append='eventId');
		} else if (structKeyExists(RC,"eventID")) {
			for (property in RC.event.getPropertyStruct()) {
				RC[property] = RC.event.getProperty(property);
			}
		}
	}


	public void function startWebsiteSettings(required struct RC) {
		if (structKeyExists(RC,"btnSave")) {
			VARIABLES.fw.service("websiteSettingsService.editWebsiteSettingsAndSave","websiteSettings");
		}
	}
	public void function websiteSettings(required struct RC) {
		REQUEST.template.setPageTitle("Edit Website Settings");
	}
	public void function endWebsiteSettings(required struct RC) {
		if (structKeyExists(RC,"btnSave")) {
			VARIABLES.fw.redirect(action='admin.default');
		} else {
			for (property in APPLICATION.websiteSettings.getPropertyStruct()) {
				RC[property] = APPLICATION.websiteSettings.getProperty(property);
			}
			RC.websiteSettingsID = APPLICATION.websiteSettings.getID();
		}
	}
}