<cfoutput>
	<h2>Upcoming Events</h2>
	<table class='table'>
		<thead>
			<tr>
				<th>Event</th>
				<th>Date</th>
				<th>Location</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<td colspan='3'></td>
			</tr>
		</tfoot>
		<tbody>
			<cfloop array="#RC.events#" index="LOCAL.event">
				<tr>
					<td><a href='/event#LOCAL.event.getURI()#'>#LOCAL.event.getTitle()#</a></td>
					<td>#dateFormat(LOCAL.event.getDateTime(),"MMMM D, YYYY")#</td>
					<td>
						<cfif LOCAL.event.hasVenue()>
							<a href='/venue/#LOCAL.event.getVenue().getEncodedName()#'>#LOCAL.event.getVenue().getName()#</a>
						<cfelseif len(LOCAL.event.getLocation()) GT 0>
							#LOCAL.event.getLocation()#
						</cfif>
					</td>
				</tr>
			</cfloop>
		</tbody>
	</table>
</cfoutput>