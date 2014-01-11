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
		<div class='container'>
			<cfoutput>
				<header class='row'>
					<h1><a href='/'>#REQUEST.template.getSiteName()#</a></h1>
				</header>
				<div class='row'>
					<div class='col-md-8'>
						#body#
					</div><!--- close .column --->
					<div class='col-md-4'>
						<aside class='facebook'>
							<cfscript>
								_appID = "272812729524274";;
								_appSecrect = "597f1635cfe9b5bf85aa9664a023379f";
								facebookFineAlleyID = "417727031647789";
								_accessToken = "#_appID#|#_appSecrect#";
								facebookGraphAPI = new services.FacebookGraphAPI().init(_accessToken,_appID);
								facebookData = facebookGraphAPI.getObject(id=facebookFineAlleyID);
							</cfscript>
							<h3>#REQUEST.template.getSiteName()# on Facebook</h3>
							<header>
								<img src="#facebookData.cover.source#" class="img-responsive" alt="facebook Cover Image" />
								<div class='bar'>
									<div class='image'>
										<img src="https://graph.facebook.com/#facebookData.id#/picture?width=200&height=200" class="img-responsive img-thumbnail" alt="facebook Profile Image">
									</div>
									<div class='title'>
										<a href='#facebookData.link#'>#facebookData.name#</a>
									</div>
								</div>
								<table class="table clearfix"> 
									<tr>
										<th>Band Members</th>
										<td>#facebookData.band_members#</td>
									</tr>
									<tr>
										<th>Genre</th>
										<td>#facebookData.genre#</td>
									</tr>								
								</table>
							<header>
						</aside>
					</div>
				</div><!--- close .row --->
				<footer class='row'>
					<p>We (the band members of Fine Alley and/or the band as a whole) do not claim rights or ownership to any music we play unless otherwise specified.</p>
					<p>Hosted By: <a href="http://www.rabeycreative.com/">Rabey Creative</a></p>
					<p>© Fine Alley 2013 | <a href="">Privacy Policy</a> | <a href="">Term of Use</a></p>
				</footer>
			</cfoutput>
		</div>
		<cfscript>
			for (jsFile in REQUEST.template.getJSFiles()) {
				writeOutput(chr(10) & chr(9) & chr(9) & "<script type='text/javascript' src='#jsFile#'></script>");
			}
		</cfscript>
	</body>
</html>

