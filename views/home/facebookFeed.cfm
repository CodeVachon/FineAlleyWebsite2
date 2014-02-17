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
			fields="feed.limit(5).fields(from,full_picture,message,link,comments,likes,story,picture),cover,picture,bio,name,band_members,band_interests,hometown,genre,likes,link"
		);

		fbUtilities = new services.facebookUtilities();
	</cfscript>

	<cfoutput>
		<div class='facebook-feed social-media-feed'>
			<header>
				<img src="#LOCAL.facebookData.cover.source#" class="img-responsive" alt="facebook Cover Image" />
				<div class='fb-titleblock'>
					<img src="https://graph.facebook.com/#LOCAL.facebookData.id#/picture?width=200&amp;height=200" class="img-responsive img-thumbnail img-fbthumb" alt="facebook Profile Image">
					<a href='#replace(LOCAL.facebookData.link,"&","&amp;","all")#' class='fb-title' title='goto #LOCAL.facebookData.name# facebook profile'>#LOCAL.facebookData.name#</a>
				</div>
			</header>

			<ul class="nav nav-pills nav-justified data-selection">
				<li class="active"><a href="##wall_fb_#LOCAL.facebookData.id#" data-toggle="tab">Wall</a></li>
				<li><a href="##about_fb_#LOCAL.facebookData.id#" data-toggle="tab">About</a></li>
			</ul>

			<div class="tab-content">
				<div class="tab-pane active" id="wall_fb_#LOCAL.facebookData.id#">
					<cfscript>
						RC.fbWallData = LOCAL.facebookData.feed.data;
						writeOutput(view("home/facebook/wall"));
					</cfscript>
				</div>
				<div class="tab-pane" id="about_fb_#LOCAL.facebookData.id#">
					<div class='wall-item'>
						<dl>
							<dt>Band Members</dt>
							<dd>#LOCAL.facebookData.band_members#</dd>
							<dt>Genre</dt>
							<dd>#LOCAL.facebookData.genre#</dd>
							<dt>Hometown</dt>
							<dd>#LOCAL.facebookData.hometown#</dd>
						</dl>
					</div>
				</div>
			</div><!-- close .tab-content -->
			<footer>
				<div class="fb-follow" data-href="#replace(LOCAL.facebookData.link,"&","&amp;","all")#" data-colorscheme="dark" data-layout="button" data-show-faces="false"></div>
			</footer>
		</div>
	</cfoutput>
<cfelseif REQUEST.security.checkPermission("isAdmin")>
	<cfoutput>
		<h2>Can Not Load Facebook Content</h2>
		<p>Some Required Values are missing from the facebook settings section of the website settings.</p>
	</cfoutput>
</cfif>

