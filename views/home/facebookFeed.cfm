
<cfif APPLICATION.websiteSettings.hasAllFacebookInfo()>
	<cfscript>
		LOCAL._appID = APPLICATION.websiteSettings.getFB_appID();
		LOCAL._appSecrect = APPLICATION.websiteSettings.getFB_appSecret();
		LOCAL._pageID = APPLICATION.websiteSettings.getFB_pageID();
		LOCAL._accessToken = "#LOCAL._appID#|#LOCAL._appSecrect#";
		LOCAL.facebookGraphAPI = new services.FacebookGraphAPI().init(LOCAL._accessToken,LOCAL._appID);
		LOCAL.facebookData = LOCAL.facebookGraphAPI.getObject(id=LOCAL._pageID);
	</cfscript>
	<cfoutput>
		<header>
			<img src="#LOCAL.facebookData.cover.source#" class="img-responsive" alt="facebook Cover Image" />
			<div class='fb-titleblock'>
				<img src="https://graph.facebook.com/#LOCAL.facebookData.id#/picture?width=200&amp;height=200" class="img-responsive img-thumbnail img-fbthumb" alt="facebook Profile Image">
				<a href='#LOCAL.facebookData.link#' class='fb-title'>#LOCAL.facebookData.name#</a>
			</div>
		</header>
		<div>
			<dl>
				<dt>Band Members</dt>
				<dd>#LOCAL.facebookData.band_members#</dd>
				<dt>Genre</dt>
				<dd>#LOCAL.facebookData.genre#</dd>
				<dt>Hometown</dt>
				<dd>#LOCAL.facebookData.hometown#</dd>
			</dl>
		</div>
		<footer></footer>
	</cfoutput>
<cfelseif REQUEST.security.checkPermission("isAdmin")>
	<cfoutput>
		<h2>Can Not Load Facebook Content</h2>
		<p>Some Required Values are missing from the facebook settings section of the website settings.</p>
	</cfoutput>
</cfif>

