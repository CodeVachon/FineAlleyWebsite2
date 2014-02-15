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
}