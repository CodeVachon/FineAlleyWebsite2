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

<!---
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
		<cfscript>
			RC.fbWallData = LOCAL.facebookData.feed.data;
			writeOutput(view("home/facebook/wall"));
		</cfscript>
	</cfif>
--->
</cfoutput>