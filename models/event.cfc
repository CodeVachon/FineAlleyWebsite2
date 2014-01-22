/**
*
* @file  /C/inetpub/wwwroot/finealley/FineAlleyWebsite2/models/event.cfc
* @author  
* @description
*
*/

component extends="base" displayname="event" persistent="true" table="events" {

	property name="title" type="string";
	property name="dateTime" type="datetime" ormtype="timestamp";
	property name="body" type="string" length="25000";
	property name="location" type="string" length="250";


	public function init(){
		return super.init();
	}


	public void function refreshProperties() {
		super.refreshProperties();
		if (!structKeyExists(VARIABLES,'title')) { VARIABLES.title = javacast("null",""); }
		if (!structKeyExists(VARIABLES,'dateTime')) { VARIABLES.dateTime = now(); }
		if (!structKeyExists(VARIABLES,'body')) { VARIABLES.body = javacast("null",""); }
		if (!structKeyExists(VARIABLES,'location')) { VARIABLES.location = javacast("null",""); }
	}


	public string function getEncodedTitle() {
		return lCase(reReplace(reReplace(trim(this.getTitle()),"\W{1,}","-","all"),"-{1,}$","","one"));
	}


	public string function getURI() {
		return "/" & year(this.getDateTime()) & "/" & month(this.getDateTime()) & "/" & day(this.getDateTime()) & "/" & this.getEncodedTitle();
	}
}