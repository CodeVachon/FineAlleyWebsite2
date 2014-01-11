<h2>Fine Alley - Live Entertainment</h2>
<p>We are still setting up our webpage.  In the mean time, check us out on <a href="https://www.facebook.com/pages/Fine-Alley/417727031647789">Facebook</a> or follow us on <a href="https://twitter.com/FineAlley">Twitter</a>  for more information and upcoming events.  Or send an email to theBand(a)finealley.com for more information.</p>
<h2>Upcoming Events</h2>

<cfoutput>
	<cfloop array="#RC.events#" index="RC.event">
		<article class='col-lg-6 col-md-12'>
			<header><h3>#RC.event.getTitle()#</h3></header>
			#RC.event.getBody()#
			<footer>
				<p>Date: #dateFormat(RC.event.getDateTime(),"MMM D, YYYY")# @ #timeFormat(RC.event.getDateTime(),"H:MM")#</p>
				<p>Location: #RC.event.getLocation()#</p>
			</footer>
			<div class='btn-group btn-mini'>
				<a href='/admin/editEvent/eventID/#RC.event.getID()#' class='btn btn-default'>Edit Event</a>
			</div>
		</article>
	</cfloop>
</cfoutput>

<div class='btn-group btn-mini'>
	<a href='/admin/editEvent' class='btn btn-default'>Add Event</a>
</div>