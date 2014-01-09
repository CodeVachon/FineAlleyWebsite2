<cfscript>
	
</cfscript>
<cfcontent reset="true" type="text/html" /><!doctype html>
<html lang="en">
	<head>
		<title><cfoutput><cfif len(REQUEST.template.getPageTitle()) gt 0>#REQUEST.template.getPageTitle()# | </cfif>#REQUEST.template.getSiteName()#</cfoutput></title>
		<cfscript> 

			if (len(REQUEST.template.getDescription()) > 0) { writeOutput("<meta name='description' content='#REQUEST.template.getDescription()#' />" & chr(10) & chr(9) & chr(9)); }
			if (len(REQUEST.template.getKeywords()) > 0) { writeOutput("<meta name='keywords' content='#REQUEST.template.getKeywords()#'/>" & chr(10) & chr(9) & chr(9)); }

			for (metaTagDetails in REQUEST.template.get("metaTags")) {
				writeOutput("<meta ");
				if (structKeyExists(metaTagDetails,"name")) { writeOutput("name='#metaTagDetails.name#' "); }
				if (structKeyExists(metaTagDetails,"property")) { writeOutput("property='#metaTagDetails.property#' "); }
				writeOutput("content='#metaTagDetails.content#' />" & chr(10) & chr(9) & chr(9));
			}
			for (icoFile in REQUEST.template.getICOFiles()) {
				writeOutput("<link rel='icon' type='image/png' href='#icoFile#' />" & chr(10) & chr(9) & chr(9));
			}
			if (arrayLen(REQUEST.template.getCSSFiles()) > 0) {
				writeOutput("<style>" & chr(10));
				for (cssFile in REQUEST.template.getCSSFiles()) {
					writeOutput(chr(9) & chr(9) & chr(9) & "@import url('#cssFile#');" & chr(10));
				}

				if (len(REQUEST.template.getInlineCSS()) gt 0) {
					writeOutput(REQUEST.template.getInlineCSS());
				}
				writeOutput(chr(9) & chr(9) & "</style>");
			}
		</cfscript>
	</head>
	<body>
		<cfoutput>
			<header>
				<h1><a href='/'>#REQUEST.template.getSiteName()#</a></h1>
			</header>
			#body#
		</cfoutput>
		<cfscript>
			for (jsFile in REQUEST.template.getJSFiles()) {
				writeOutput(chr(10) & chr(9) & chr(9) & "<script type='text/javascript' src='#jsFile#'></script>");
			}
		</cfscript>
	</body>
</html>

