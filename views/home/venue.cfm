<cfoutput>
	<div class='venue col-md-12'>
		<header>
			<h3><a href='/venue/#RC.venue.getEncodedName()#'>#RC.venue.getName()#</a></h3>
		</header>
		#RC.venue.getDescription()#

		<h4>Upcoming Events</h4>
		<cfloop array="#RC.venue.getEvents()#" index="RC.event">
			#view('home/event')#
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