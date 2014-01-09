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


	public void function default(required struct RC) {
		VARIABLES.fw.service("eventService.getEvents","events");
	}


	public void function startEditEvent(required struct RC) {
		if (structKeyExists(RC,"btnSave")) {
			VARIABLES.fw.service("eventService.editEventAndSave","events");
		} else if (structKeyExists(RC,"eventID")) {
			VARIABLES.fw.service("eventService.getEvent","event");
		}
	}
	public void function editEvent(required struct RC) {
		REQUEST.template.setPageTitle("Edit Event");
	}
	public void function endEditEvent(required struct RC) {
		if (structKeyExists(RC,"btnSave")) {
			// GOTO THE EVENT
		} else if (structKeyExists(RC,"eventID")) {
			for (property in RC.event.getPropertyStruct()) {
				RC[property] = RC.event.getProperty(property);
			}
		}
	}

}