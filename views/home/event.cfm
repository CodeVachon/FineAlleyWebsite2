<cfscript>
	param name="RC.useVenueSummary" default="false";
</cfscript>
<cfoutput>
	<article class='event col-lg-6 col-md-12'>
		<header><h3><a href='/event#RC.event.getURI()#'>#RC.event.getTitle()#</a></h3></header>
		#RC.event.getBody()#
		<footer>
			<p>Date: #dateFormat(RC.event.getDateTime(),"MMM D, YYYY")# @ #timeFormat(RC.event.getDateTime(),"H:MM")#</p>
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
		</footer>
	</article>
</cfoutput>