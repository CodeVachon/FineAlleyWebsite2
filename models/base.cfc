/**
*
* @file  /C/inetpub/wwwroot/finealley/FineAlleyWebsite2/models/base.cfc
* @author  
* @description
*
*/

component output="false" displayname="base" mappedSuperClass="true" extends="services.object" {

	property name="id" fieldType="id" setter="false" type="string" ormtype="string" sqltype="varchar(50)";
	property name="createdDate" type="datetime" ormtype="timestamp" setter="false" sqltype="datetime";
	property name="lastUpdated" type="datetime" ormtype="timestamp" setter="false" sqltype="datetime";
	property name="isDeleted" type="boolean" ormtype="boolean" sqltype="bit" default="false" notnull="true";


	public any function init() {
		this.refreshProperties();
		return super.init();
	}


	public void function refreshProperties() {
		if (!structKeyExists(VARIABLES,'id')) { VARIABLES.id = createUUID(); }
		if (!structKeyExists(VARIABLES,'lastUpdated')) { VARIABLES.lastUpdated = javacast("null",""); }
		if (!structKeyExists(VARIABLES,'isDeleted')) { VARIABLES.isDeleted = false; }
		if (!structKeyExists(VARIABLES,'createdDate')) { VARIABLES.createdDate = now(); }
	}


	public boolean function hasProperty(required string propertyName) hint="returns if object has the specified property" {
		ARGUMENTS.propertyName = trim(ARGUMENTS.propertyName);

		var objectProperties = getPropertyNames();

		if (arrayFindNoCase(objectProperties,ARGUMENTS.propertyName) > 0) {
			return true;
		} else {
			return false;
		}
	}


	public any function getProperty(required string propertyName) hint="returns the value of the specified property" {
		// I provide functionality to dynamically get a property value 
		ARGUMENTS.propertyName = trim(ARGUMENTS.propertyName);
		if (this.hasProperty(ARGUMENTS.propertyName) && isDefined("variables.#ARGUMENTS.propertyName#")) {
			return variables[ARGUMENTS.propertyName];
		} else {
			return javaCast("null","");
		}
	}


	public boolean function setProperty(required string propertyName,required any value) {
		ARGUMENTS.propertyName = trim(ARGUMENTS.propertyName);
		if (ARGUMENTS.propertyName == "id") { 
			throw("You Can Not set an ID of an Object in this Fashion");
			return false; 
		}
		if (this.hasProperty(ARGUMENTS.propertyName)) {
			if (!len(ARGUMENTS.value)) {
				variables[ARGUMENTS.propertyName] =  javaCast( "null", 0 );
			} else {
				variables[ARGUMENTS.propertyName] = ARGUMENTS.value;
			}
			return true;
		}
		this.setError("Property [#ARGUMENTS.propertyName#] does not exists");
		return false;
	}


	public void function preLoad() hint="call before this being populated" {}
	public void function postLoad() hint="call after this being populated" {
		this.refreshProperties();
	}
	public void function preInsert() hint="call before this being inserted" {}
	public void function postInsert() hint="call after this being inserted" {}
	public void function preUpdate(Struct oldData) hint="call before this being updated" {
		// this automatcially sets the lastUpdated timestamp before updating the object 
		VARIABLES.lastUpdated = now();
	}
	public void function postUpdate() hint="call after this being populated" {}
	public void function preDelete() hint="call before this being deleted" {}
	public void function postDelete() hint="call after this being deleted" {}


	private array function getPropertyNames(struct metaData = GetMetaData(this)) {
		var propertiesNames = [];
		if (structKeyExists(ARGUMENTS.metaData,"Properties")) {
			for (var i=1;i<=arrayLen(ARGUMENTS.metaData.properties);i++) {
				var property = ARGUMENTS.metaData.properties[i];
				arrayAppend(propertiesNames, property.name);
			}
		}
		if (structKeyExists(ARGUMENTS.metaData,"Extends")) {
			var utl = new services.utilities();
			propertiesNames = utl.mergeArrays(propertiesNames,getPropertyNames(ARGUMENTS.metaData.extends));
		}
		return propertiesNames;
	}
}