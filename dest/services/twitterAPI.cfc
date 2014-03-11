/**
*
* @file  /Users/Christopher/Documents/sites/finealley/FineAlleyWebsite2/services/twitterAPI.cfc
* @author  Christopher Vachon
* @description Connects to Twitter REST API
*
*/

component output="false" displayname="twitterAPI"  {

	public function init() {
		return this;
	}

	public string function formatText(required string text) {
		var _returnText = trim(ARGUMENTS.text);

		// URLS
		_returnText = reReplaceNoCase(_returnText,"(http\:\/\/[^\s]+)","<a href='\1' target='_blank'>\1</a>","ALL");

		// HashTags
		_returnText = reReplaceNoCase(_returnText,"(##(\w+))","<a href='https://twitter.com/search?q=%23\2' target='_blank'>\1</a>","ALL");

		// @s
		_returnText = reReplaceNoCase(_returnText,"(@(\w+))","<a href='https://twitter.com/\2' target='_blank'>\1</a>","ALL");

		return _returnText;
	}

	public date function createDateTimeFromTwitterTimeStamp(required string timestamp) {
		var regEx_timestamp = "(\w+)\s(\w+)\s(\d+)\s(\d+)\:(\d+)\:(\d+)\s\+\d+\s(\d+)";
		var dateParts = {
			year = reReplace(ARGUMENTS.timestamp, regEx_timestamp, "\7", "one"),
			month = int(month(reReplace(ARGUMENTS.timestamp, regEx_timestamp, "\2 1 \7", "one"))), // twitter returns Feb instread of 2
			day = int(reReplace(ARGUMENTS.timestamp, regEx_timestamp, "\3", "one")),
			hour = int(reReplace(ARGUMENTS.timestamp, regEx_timestamp, "\4", "one")),
			min = int(reReplace(ARGUMENTS.timestamp, regEx_timestamp, "\5", "one")),
			sec = int(reReplace(ARGUMENTS.timestamp, regEx_timestamp, "\6", "one"))
		};
		var localTimeOffset = -5;

		try {
			var cf_dateTime = createDateTime(dateParts.year, dateParts.month, dateParts.day, dateParts.hour, dateParts.min, dateParts.sec);
			cf_dateTime = DateAdd("h",localTimeOffset,cf_dateTime);
		} catch( any e) {
			var cf_dateTime = createDateTime(dateParts.year, dateParts.month, dateParts.day, (dateParts.hour-1), dateParts.min, dateParts.sec);
		}
		return cf_dateTime;
	}
}