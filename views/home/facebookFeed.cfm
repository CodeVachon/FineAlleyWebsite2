
<cfif APPLICATION.websiteSettings.hasAllFacebookInfo()>
	<cfscript>
		LOCAL._appID = APPLICATION.websiteSettings.getFB_appID();
		LOCAL._appSecrect = APPLICATION.websiteSettings.getFB_appSecret();
		LOCAL._pageID = APPLICATION.websiteSettings.getFB_pageID();
		LOCAL._accessToken = "#LOCAL._appID#|#LOCAL._appSecrect#";
		LOCAL.facebookGraphAPI = new services.FacebookGraphAPI().init(LOCAL._accessToken,LOCAL._appID);
		//LOCAL.facebookData = LOCAL.facebookGraphAPI.getObject(id=LOCAL._pageID);

		LOCAL.facebookData = LOCAL.facebookGraphAPI.getObject(
			id=LOCAL._pageID,
			fields="feed.limit(5),cover,picture,bio,name,band_members,band_interests,hometown,genre,likes,link"
		);

		//writeDump(LOCAL.moreFacebookData);
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
		<div class='fb-wall'>
			<cfloop array="#LOCAL.facebookData.feed.data#" index="LOCAL.feedData">
				<article>
					<p>#LOCAL.feedData.created_time#</p>
					<cfif structKeyExists(LOCAL.feedData, "picture")>
						<a href='#LOCAL.feedData.link#'>
							<img src='#LOCAL.feedData.picture#' class='img-responsive img-thumbnail' />
						</a>
					</cfif>
					<cfif structKeyExists(LOCAL.feedData, "message")>
						<p>#LOCAL.feedData.message#</p>
					</cfif>
				</article>
				<!---  cfdump var="#LOCAL.feedData#" --->
			</cfloop>
		</div>
		<footer>
			<cfif structKeyExists(LOCAL.facebookData, "likes")><span class='label label-primary'>#LOCAL.facebookData.likes# Likes</span></cfif>
		</footer>
	</cfoutput>
<cfelseif REQUEST.security.checkPermission("isAdmin")>
	<cfoutput>
		<h2>Can Not Load Facebook Content</h2>
		<p>Some Required Values are missing from the facebook settings section of the website settings.</p>
	</cfoutput>
</cfif>

