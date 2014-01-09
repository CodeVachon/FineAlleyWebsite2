/**
*
* @file  /C/inetpub/wwwroot/finealley/FineAlleyWebsite2/models/event.cfc
* @author  
* @description
*
*/

component extends="base" displayname="event" persistent="true" table="events" {

	property name="title" type="string";
	property name="dateTime" type="string" ormtype="timestamp";
	property name="body" type="string" length="25000";
	property name="location" type="string" length="250";

	public function init(){
		return this;
	}
}