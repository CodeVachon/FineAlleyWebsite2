<cfscript>
	_appID = "272812729524274";;
	_appSecrect = "597f1635cfe9b5bf85aa9664a023379f";
	facebookFineAlleyID = "417727031647789";
	_accessToken = "#_appID#|#_appSecrect#";
	facebookGraphAPI = new services.FacebookGraphAPI().init(_accessToken,_appID);
	facebookData = facebookGraphAPI.getObject(id=facebookFineAlleyID);
</cfscript>
<cfoutput>
	<header>
		<img src="#facebookData.cover.source#" class="img-responsive" alt="facebook Cover Image" />
		<div class='fb-titleblock'>
			<img src="https://graph.facebook.com/#facebookData.id#/picture?width=200&height=200" class="img-responsive img-thumbnail img-fbthumb" alt="facebook Profile Image">
			<a href='#facebookData.link#' class='fb-title'>#facebookData.name#</a>
		</div>
	<header>
	<div>
		<dl>
			<dt>Band Members</dt>
			<dd>#facebookData.band_members#</dd>
			<dt>Genre</dt>
			<dd>#facebookData.genre#</dd>
			<dt>Hometown</dt>
			<dd>#facebookData.hometown#</dd>
		</dl>
	</div>
	<footer></footer>
</cfoutput>