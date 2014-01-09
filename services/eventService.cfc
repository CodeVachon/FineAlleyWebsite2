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


	public models.event function getEvent() {
		if ((structCount(ARGUMENTS) == 1) && structKeyExists(ARGUMENTS,"1")) { ARGUMENTS = reduceStructLevel(ARGUMENTS[1]); }
		var _event = javaCast("null","");

		if (structKeyExists(ARGUMENTS,"eventId")) {
			_event = ORMExecuteQuery("SELECT DISTINCT e FROM event e WHERE e.id=:id",{id=ARGUMENTS.eventId},true);
		} else if (structKeyExists(ARGUMENTS,"id")) {
			_event = ORMExecuteQuery("SELECT DISTINCT e FROM event e WHERE e.id=:id",{id=ARGUMENTS.id},true);
		}

		if (isNull(_event)) { _event = entityNew("event"); }
		return _event;
	}


	public array function getEvents() {
		if ((structCount(ARGUMENTS) == 1) && structKeyExists(ARGUMENTS,"1")) { ARGUMENTS = reduceStructLevel(ARGUMENTS[1]); }
		if (structKeyExists(ARGUMENTS,"allEvents") && isBoolean(ARGUMENTS.allEvents) && ARGUMENTS.allEvents) {
			return ORMExecuteQuery("SELECT DISTINCT e FROM event e WHERE e.isDeleted=:isDeleted ORDER BY e.dateTime DESC",{isDeleted=false,now=now()},false);
		} else if (structKeyExists(ARGUMENTS,"pastEvents") && isBoolean(ARGUMENTS.pastEvents) && ARGUMENTS.pastEvents) {
			return ORMExecuteQuery("SELECT DISTINCT e FROM event e WHERE e.isDeleted=:isDeleted AND e.dateTime < :now ORDER BY e.dateTime DESC",{isDeleted=false,now=now()},false);
		} else {
			return ORMExecuteQuery("SELECT DISTINCT e FROM event e WHERE  e.isDeleted=:isDeleted AND e.dateTime > :now ORDER BY e.dateTime ASC",{isDeleted=false,now=now()},false);
		}
	}


	public models.event function editEvent() {
		if ((structCount(ARGUMENTS) == 1) && structKeyExists(ARGUMENTS,"1")) { ARGUMENTS = reduceStructLevel(ARGUMENTS[1]); }
		return super.setValuesInObject(this.getEvent(ARGUMENTS),ARGUMENTS);
	}


	public models.event function editEventAndSave() {
		if ((structCount(ARGUMENTS) == 1) && structKeyExists(ARGUMENTS,"1")) { ARGUMENTS = reduceStructLevel(ARGUMENTS[1]); }
		return super.saveObject(this.editEvent(ARGUMENTS));
	}


	public models.event function removeEvent() {
		if ((structCount(ARGUMENTS) == 1) && structKeyExists(ARGUMENTS,"1")) { ARGUMENTS = reduceStructLevel(ARGUMENTS[1]); }
		return super.removeObject(this.getEvent(ARGUMENTS));
	}
}