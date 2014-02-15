<cfscript>
	param name="RC.layoutSideBars" default='true';
	param name="RC.cononicalURI" default='#CGI.PATH_INFO#';

</cfscript>
<cfcontent reset="true" type="text/html" /><cfprocessingdirective suppressWhiteSpace="true"><!doctype html>
<html lang="en">
	<head>
		<title><cfoutput><cfif len(REQUEST.template.getPageTitle()) gt 0>#REQUEST.template.getPageTitle()# | </cfif>#REQUEST.template.getSiteName()#</cfoutput></title>
		<cfoutput><link rel="canonical" href="http://#CGI.HTTP_HOST##lcase(reReplace(RC.cononicalURI,"/$","","one"))#" />
		</cfoutput>
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
		<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
		<![endif]-->
	</head>
	<body>
		<div class='container'>
			<cfoutput>
				<!--- Load in Slide Show --->
				#view('home/carousel')#
				<nav class="col-xs-12 navbar navbar-default" role="navigation">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="##mainNav">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="/">#REQUEST.template.getSiteName()#</a>
					</div>
					<div class="collapse navbar-collapse" id="mainNav">
						<ul class="nav navbar-nav">
							<li<cfif RC.action EQ "home.listevents"> class='active'</cfif>><a href='/events'>Events</a></li>
							<li<cfif RC.action EQ "home.contactus"> class='active'</cfif>><a href='/contact-us'>Contact Us</a></li>
							<cfif REQUEST.security.checkPermission("isAdmin")>
								<li><a href='/admin'>Admin</a></li>
							</cfif>
						</ul>
						<cfif REQUEST.security.isLoggedIn()>
							<ul class="nav navbar-nav navbar-right">
								<li><a href="/admin/logout">Logout</a></li>
							</ul>
						</cfif>
					</div>
				</nav>

				<header class='visible-print'>
					<h1>#REQUEST.template.getSiteName()#</h1>
					<p>#REQUEST.template.getDescription()#</p>
				</header>
				<cfif RC.layoutSideBars>
					<div class='row'>
						<div class='col-xs-12 col-md-8 col-sm-7'>
							#body#
						</div><!--- close .column --->
						<div class='col-xs-12 col-md-4 col-sm-5'>
							<div class='facebook col-sm-12'>
								<h3>#REQUEST.template.getSiteName()# on Facebook</h3>
								#view('home/facebookFeed')#
								<h3>#REQUEST.template.getSiteName()# on Twitter</h3>
								#view('home/twitterFeed')#
							</div>
						</div>
					</div><!--- close .row --->
				<cfelse>
					#body#
				</cfif>
				<footer class='row'>
					<div class='col-sm-12 text-right'>
						<p>We (the band members of Fine Alley and/or the band as a whole) do not claim rights or ownership to any music we play unless otherwise specified.</p>
						<p>Hosted By: <a href="http://www.rabeycreative.com/">Rabey Creative</a></p>
						<p>&copy; Fine Alley #year(now())# <!---| <a href="">Privacy Policy</a> | <a href="">Term of Use</a>---></p>
					</div>
				</footer>
			</cfoutput>
		</div>
		<cfscript>
			for (jsFile in REQUEST.template.getJSFiles()) {
				writeOutput(chr(10) & chr(9) & chr(9) & "<script type='text/javascript' src='#jsFile#'></script>");
			}
		</cfscript>
		<cfif len(APPLICATION.websiteSettings.getFB_appID()) GT 0><cfoutput><div id="fb-root"></div>
		<script>(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) return;
			js = d.createElement(s); js.id = id;
			js.src = "//connect.facebook.net/en_US/all.js##xfbml=1&appId=#APPLICATION.websiteSettings.getFB_appID()#";
			fjs.parentNode.insertBefore(js, fjs);
			}(document, 'script', 'facebook-jssdk'));
		</script></cfoutput></cfif>
		<cfif (NOT ISNULL(APPLICATION.websiteSettings.getGoogle_gaCode())) AND (len(APPLICATION.websiteSettings.getGoogle_gaCode()) GT 0)><cfoutput><script>
			(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
			(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
			m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
			})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

			ga('create', '#APPLICATION.websiteSettings.getGoogle_gaCode()#', '#((listLen(CGI.SERVER_NAME) GT 2)?ReReplaceNoCase(CGI.SERVER_NAME,"^\w+\.","","one"):CGI.SERVER_NAME)#');
			ga('send', 'pageview');
		</script></cfoutput></cfif>
	</body>
</html></cfprocessingdirective>
