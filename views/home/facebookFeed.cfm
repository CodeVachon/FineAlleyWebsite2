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
			fields="feed.limit(5).fields(from,full_picture,message,link,comments,likes,story),cover,picture,bio,name,band_members,band_interests,hometown,genre,likes,link"
		);

		

		function createDateTimeFromFBTimeStamp(required string timestamp) {
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
					<header>
						<p>#LOCAL.feedData.from.name#</p>
						<p>#dateFormat(createDateTimeFromFBTimeStamp(LOCAL.feedData.created_time),"MMMM D, YYYY")#</p>
					</header>
					<cfif structKeyExists(LOCAL.feedData, "full_picture")>
						<a href='#LOCAL.feedData.link#'>
							<img src='#LOCAL.feedData.full_picture#' class='img-responsive img-thumbnail' />
						</a>
					</cfif>
					<cfif structKeyExists(LOCAL.feedData, "story")>
						<p>#LOCAL.feedData.story#</p>
					</cfif>
					<cfif structKeyExists(LOCAL.feedData, "message")>
						<p>#LOCAL.feedData.message#</p>
					</cfif>
					<footer>
						<cfif structKeyExists(LOCAL.feedData, "likes")>
							<cfset LOCAL.likes = arrayLen(LOCAL.feedData.likes.data) />
							<p>#LOCAL.likes# Like<cfif LOCAL.likes NEQ 1>s</cfif></p>
						</cfif>

						<cfif structKeyExists(LOCAL.feedData, "comments")>
							<p>Comments</p>
							<cfloop array="#LOCAL.feedData.comments.data#" index="LOCAL.comment">
								<div class='comment'>
									<p>#LOCAL.comment.from.name#</p>
									<p>#dateFormat(createDateTimeFromFBTimeStamp(LOCAL.comment.created_time),"MMMM D, YYYY")#</p>
									<p>#LOCAL.comment.message#</p>
								</div>
							</cfloop>
						</cfif>
					</footer>
				</article>
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

