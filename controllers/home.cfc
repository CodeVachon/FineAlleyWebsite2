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
		VARIABLES.fw.service("eventService.getEvent","event");
	}
}