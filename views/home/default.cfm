<h2>Upcoming Events</h2>

<cfoutput>
	<cfloop array="#RC.events#" index="RC.event">
		<article>
			<header><h3>#RC.event.getTitle()#</h3></header>
			#RC.event.getBody()#
			<footer>
				<p>Date: #dateFormat(RC.event.getDateTime(),"MMM D, YYYY")# @ #timeFormat(RC.event.getDateTime(),"H:MM")#</p>
				<p>Location: #RC.event.getLocation()#</p>
			</footer>
			<div class='btn-group btn-mini'>
				<a href='/admin/editEvent/eventID/#RC.event.getID()#' class='btn'>Edit Event</a>
			</div>
		</article>
	</cfloop>
</cfoutput>

<div class='btn-group btn-mini'>
	<a href='/admin/editEvent' class='btn'>Add Event</a>
</div>