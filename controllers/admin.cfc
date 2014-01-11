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
	}


	public void function default(required struct RC) {
	}


	public void function listEvents(required struct RC) {
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

}