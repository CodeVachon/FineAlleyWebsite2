<cfscript>
	LOCAL.events = {
		upcoming = RC.venue.getEvents(),
		past = RC.venue.getEvents("past")
	};
	LOCAL.eventKeyOrder = ["Upcoming","Past"];
</cfscript>
<cfoutput>
	<div class='venue col-md-12'>
		<header>
			<h3><a href='/venue/#RC.venue.getEncodedName()#'>#RC.venue.getName()#</a></h3>
		</header>
		#RC.venue.getDescription()#

		<cfloop array="#LOCAL.eventKeyOrder#" index="LOCAL.key">
			<cfif arrayLen(LOCAL.events[LOCAL.key]) GT 0>
				<h4>#LOCAL.key# Events</h4>
				<cfloop array="#LOCAL.events[LOCAL.key]#" index="RC.event">
					<div class='row'>#view('home/event')#</div>
				</cfloop>
			</cfif>
		</cfloop>

		<footer>
			<cfif REQUEST.security.checkPermission("isAdmin")>
				<div class='btn-group btn-mini'>
					<a href='/admin/editVenue/venueID/#RC.venue.getID()#' class='btn btn-default btn-xs'>Edit Venue</a>
				</div>
			</cfif>
		</footer>
	</div>
</cfoutput>