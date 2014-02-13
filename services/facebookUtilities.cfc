/**
*
* @file  /Users/Christopher/Documents/sites/finealley/FineAlleyWebsite2/services/facebookUtilities.cfc
* @author  
* @description
*
*/

component output="false" displayname=""  {

	public function init(){
		return this;
	}

	public date function createDateTimeFromFBTimeStamp(required string timestamp) {
		var regEx_timestamp = "(\d{2,4})-(\d{1,2})-(\d{1,2})T(\d{1,2}):(\d{1,2}):(\d{1,2})(\+\d{4})";
		var dateParts = {
			year = reReplace(ARGUMENTS.timestamp, regEx_timestamp, "\1", "one"),
			month = reReplace(ARGUMENTS.timestamp, regEx_timestamp, "\2", "one"),
			day = reReplace(ARGUMENTS.timestamp, regEx_timestamp, "\3", "one"),
			hour = reReplace(ARGUMENTS.timestamp, regEx_timestamp, "\4", "one"),
			min = reReplace(ARGUMENTS.timestamp, regEx_timestamp, "\5", "one"),
			sec = reReplace(ARGUMENTS.timestamp, regEx_timestamp, "\6", "one"),
			offset = reReplace(ARGUMENTS.timestamp, regEx_timestamp, "\7", "one")
		};

		var localTimeOffset = -5;

		var cf_dateTime = createDateTime(dateParts.year,dateParts.month,dateParts.day,(dateParts.hour+localTimeOffset),dateParts.min,dateParts.sec);
		return cf_dateTime;
	}
}