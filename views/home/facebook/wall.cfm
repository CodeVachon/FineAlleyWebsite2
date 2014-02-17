<cfscript>
	param name="RC.fbWallData" default=arrayNew(1);
	param name="REQUEST.CACHE" default=structNew();
	param name="REQUEST.CACHE.facebook" default=structNew();


	LOCAL._appID = APPLICATION.websiteSettings.getFB_appID();
	LOCAL._appSecrect = APPLICATION.websiteSettings.getFB_appSecret();
	LOCAL._pageID = APPLICATION.websiteSettings.getFB_pageID();
	LOCAL._accessToken = "#LOCAL._appID#|#LOCAL._appSecrect#";
	RC.facebookGraphAPI = new services.FacebookGraphAPI().init(LOCAL._accessToken,LOCAL._appID);

	RC.userCache = {};

	function getUserData(id) {
		if (!structKeyExists(RC.userCache,ARGUMENTS.id)) {
			RC.userCache[ARGUMENTS.id] = RC.facebookGraphAPI.getObject(
				id=ARGUMENTS.id,
				fields="name,link,picture"
			);
		}
		return RC.userCache[ARGUMENTS.id];
	}
</cfscript>
<cfoutput>
	<div class='fb-wall'>
		<cfloop array="#RC.fbWallData#" index="LOCAL.feedData">
			<cfscript>
				LOCAL.userData = getUserData(LOCAL.feedData.from.id);
				//writeDump(LOCAL.userData);
			</cfscript>
			<article class='wall-item media'>
				<a href='#LOCAL.userData.link#' class='pull-left' target='_blank'><img src='#LOCAL.userData.picture.data.url#' class='media-object' /></a>
				<div class='media-body'>
					<header class='media-heading'>
						<span class='pull-right post-date'>#dateFormat(fbUtilities.createDateTimeFromFBTimeStamp(LOCAL.feedData.created_time),"MMM D")#</span>
						<a href='#LOCAL.userData.link#'>#LOCAL.feedData.from.name#</a>
					</header>
					<div class='body'>
						<cfif structKeyExists(LOCAL.feedData, "story")>
							<p>#LOCAL.feedData.story#</p>
						</cfif>
						<cfif structKeyExists(LOCAL.feedData, "full_picture")>
							<a href='#LOCAL.feedData.link#'>
								<img src='#LOCAL.feedData.full_picture#' class='img-responsive img-thumbnail' />
							</a>
						</cfif>
						<cfif structKeyExists(LOCAL.feedData, "message")>
							<p>#LOCAL.feedData.message#</p>
						</cfif>
					</div>
					<footer>
						<cfscript>
							if (structKeyExists(LOCAL.feedData, "likes")) {
								LOCAL.likes = arrayLen(LOCAL.feedData.likes.data);
							} else {
								LOCAL.likes = 0;
							}
						</cfscript>
						<span class='label label-primary'>#LOCAL.likes# Like<cfif LOCAL.likes NEQ 1>s</cfif></span>
					</footer>
					<cfif structKeyExists(LOCAL.feedData, "comments")>
						<section class='comments'>
							<header class='row'>
								<p>Comments</p>
							</header>
							<cfloop array="#LOCAL.feedData.comments.data#" index="LOCAL.comment">
								<div class='media'>
									<cfscript>
										//writeDump(LOCAL.comment); abort;
										LOCAL.userData = getUserData(LOCAL.comment.from.id);
										//writeDump(LOCAL.userData);
									</cfscript>
									<cfif structKeyExists(LOCAL.userData,"link")>
									<a href='#LOCAL.userData.link#' class='pull-left' target='_blank'><img src='#LOCAL.userData.picture.data.url#' class='media-object' /></a>
									<cfelse>
										<div class='pull-left'><img src='#LOCAL.userData.picture.data.url#' class='media-object' /></div>
									</cfif>
									<div class='media-body'>
										<header class='media-heading'>
											<span class='pull-right post-date'>#dateFormat(fbUtilities.createDateTimeFromFBTimeStamp(LOCAL.feedData.created_time),"MMM D")#</span>
											<cfif structKeyExists(LOCAL.userData,"link")>
												<a href='#LOCAL.userData.link#'>#LOCAL.userData.name#</a>
											</cfif>
											#LOCAL.userData.name#
										</header>
										<p>#LOCAL.comment.message#</p>
										<footer>
										</footer>
									</div>
								</div>
							</cfloop>
						</section>
					</cfif>
				</div>
			</article>
		</cfloop>
	</div>
</cfoutput>