<cfscript>
	param name="RC.useVenueSummary" default="false";


</cfscript>
<cfoutput>
	<h2>#RC.event.getTitle()#</h2>
	<p>Date: #dateFormat(RC.event.getDateTime(),"MMM D, YYYY")# @ #timeFormat(RC.event.getDateTime(),"H:MM")#</p>
	<p>#RC.event.getBody()#</p>
	<cfif RC.event.hasVenue()>
		<p>Venue: <a href='/venue/#RC.event.getVenue().getEncodedName()#'>#RC.event.getVenue().getName()#</a></p>
	<cfelseif len(RC.event.getLocation()) GT 0>
		<p>Location: #RC.event.getLocation()#</p>
	</cfif>

	<cfif REQUEST.security.checkPermission("isAdmin")>
		<div class='btn-group btn-mini'>
			<a href='/admin/editEvent/eventID/#RC.event.getID()#' class='btn btn-default btn-xs'>Edit Event</a>
			<cfif RC.event.hasVenue()>
				<a href='/admin/removeVenueFromEvent/eventID/#RC.event.getID()#' class='btn btn-default btn-xs'>Remove Venue</a>
			<cfelse>
				<a href='/admin/addVenueToEvent/eventID/#RC.event.getID()#' class='btn btn-default btn-xs'>Add Venue</a>
			</cfif>
		</div>
	</cfif>

	<cfif len(RC.event.getFacebookEventID()) GT 0>
		<cfscript>
			LOCAL._appID = APPLICATION.websiteSettings.getFB_appID();
			LOCAL._appSecrect = APPLICATION.websiteSettings.getFB_appSecret();
			LOCAL._pageID = APPLICATION.websiteSettings.getFB_pageID();
			LOCAL._accessToken = "#LOCAL._appID#|#LOCAL._appSecrect#";
			LOCAL.facebookGraphAPI = new services.FacebookGraphAPI().init(LOCAL._accessToken,LOCAL._appID);

			LOCAL.facebookData = LOCAL.facebookGraphAPI.getObject(
				id=RC.event.getFacebookEventID(),
				fields="feed.limit(20).fields(from,full_picture,message,link,comments,likes,story,picture),description,name,start_time,owner,cover"
			);

			fbUtilities = new services.facebookUtilities();
		</cfscript>
		<h3>Event on Facebook</h3>
		<header>
			<img src="#LOCAL.facebookData.cover.source#" class="img-responsive" alt="facebook Cover Image" />
			<h3>#LOCAL.facebookData.name#</h3>
		</header>
		<div class='fb-wall'>
			<cfloop array="#LOCAL.facebookData.feed.data#" index="LOCAL.feedData">
				<article>
					<header class='row'>
						<p class='col-xs-8'>#LOCAL.feedData.from.name#</p>
						<p class='col-xs-4 text-right'>#dateFormat(fbUtilities.createDateTimeFromFBTimeStamp(LOCAL.feedData.created_time),"MMM D")#</p>
					</header>
					<cfif structKeyExists(LOCAL.feedData, "story")>
						<p>#LOCAL.feedData.story#</p>
					</cfif>
					<cfif structKeyExists(LOCAL.feedData, "picture")>
						<a href='#LOCAL.feedData.link#'>
							<img src='#LOCAL.feedData.picture#' class='img-responsive img-thumbnail' />
						</a>
					</cfif>
					<cfif structKeyExists(LOCAL.feedData, "message")>
						<p>#LOCAL.feedData.message#</p>
					</cfif>
					<footer>
						<cfif structKeyExists(LOCAL.feedData, "likes")>
							<cfset LOCAL.likes = arrayLen(LOCAL.feedData.likes.data) />
							<span class='label label-primary pull-right'>#LOCAL.likes# Like<cfif LOCAL.likes NEQ 1>s</cfif></span>
						</cfif>

						<cfif structKeyExists(LOCAL.feedData, "comments")>
							<section class='comments'>
								<p>Comments</p>
								<cfloop array="#LOCAL.feedData.comments.data#" index="LOCAL.comment">
									<div class='comment'>
										<header class='row'>
											<p class='col-xs-8'>#LOCAL.comment.from.name#</p>
											<p class='col-xs-4 text-right'>#dateFormat(fbUtilities.createDateTimeFromFBTimeStamp(LOCAL.comment.created_time),"MMM D")#</p>
										</header>
										<p>#LOCAL.comment.message#</p>
									</div>
								</cfloop>
							</section>
						</cfif>
					</footer>
				</article>
			</cfloop>
		</div>
	</cfif>
</cfoutput>