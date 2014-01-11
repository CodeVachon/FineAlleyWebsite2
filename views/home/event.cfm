<cfoutput>
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
</cfoutput>