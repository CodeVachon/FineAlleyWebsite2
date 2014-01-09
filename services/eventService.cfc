/**
*
* @file  /C/inetpub/wwwroot/finealley/FineAlleyWebsite2/services/eventService.cfc
* @author  
* @description
*
*/

component output="false" displayname="" extends="baseService" {

	public function init(){
		return super.init();
	}


	public array function getEvents() {
		if (structKeyExists(ARGUMENTS,"allEvents") && isBoolean(ARGUMENTS.allEvents) && ARGUMENTS.allEvents) {
			return ORMExecuteQuery("SELECT DISTINCT e FROM event e WHERE ORDER BY e.dateTime DESC",{now=now()},false);
		} else if (structKeyExists(ARGUMENTS,"pastEvents") && isBoolean(ARGUMENTS.pastEvents) && ARGUMENTS.pastEvents) {
			return ORMExecuteQuery("SELECT DISTINCT e FROM event e WHERE e.dateTime < :now ORDER BY e.dateTime DESC",{now=now()},false);
		} else {
			return ORMExecuteQuery("SELECT DISTINCT e FROM event e WHERE e.dateTime > :now ORDER BY e.dateTime DESC",{now=now()},false);
		}
	}
}