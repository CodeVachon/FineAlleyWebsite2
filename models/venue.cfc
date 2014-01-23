/**
*
* @file  /C/inetpub/wwwroot/finealley/FineAlleyWebsite2/models/venue.cfc
* @author  
* @description
*
*/

component extends="base" displayname="venue" persistent="true" table="venues" {

	property name="name" type="string";
	property name="encodedName" type="string" setter="false";
	property name="description" type="string" length="25000";
	property name="banner" type="string";

	property name="contactInfo" type="array" fieldtype="one-to-many" cfc="contactInfo" fkcolumn="venueId" cascade="all";


	public function init(){
		return super.init();
	}


	public void function refreshProperties() {
		super.refreshProperties();
		if (!structKeyExists(VARIABLES,'name')) { VARIABLES.name = javacast("null",""); }
		if (!structKeyExists(VARIABLES,'encodedName')) { VARIABLES.encodedName = javacast("null",""); }
		if (!structKeyExists(VARIABLES,'description')) { VARIABLES.description = ""; }
		if (!structKeyExists(VARIABLES,'banner')) { VARIABLES.banner = javacast("null",""); }

		if (!structKeyExists(VARIABLES,'contactInfo')) { VARIABLES.contactInfo = javacast("null",""); }
	}

	public void function preInsert() hint="call before this being inserted" {
		super.preUpdate();
		VARIABLES.encodedName = urlEncodeValue(this.getName());
	}
	public void function preUpdate(Struct oldData) hint="call before this being updated" {
		super.preUpdate(ARGUMENTS.oldData);
		VARIABLES.encodedName = urlEncodeValue(this.getName());
	}
}