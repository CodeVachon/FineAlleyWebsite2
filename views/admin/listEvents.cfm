<cfoutput>
	<h2>List Events</h2>
	<table class='table'>
		<thead>
			<tr>
				<th>event</th>
				<th>date</th>
				<th></th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<td colspan='3'>
					<div class='btn-group'>
						<a href='#buildURL('admin.editEvent')#/' class='btn btn-default'>Add New Event</a>
					</div>
				</td>
			</tr>
		</tfoot>
		<tbody>
			<cfloop array="#RC.events#" index="RC.event">
				<tr>
					<td>#RC.event.getTitle()#</td>
					<td>#dateFormat(RC.event.getDateTime(),"YYYY-MM-DD")# #timeFormat(RC.event.getDateTime(),"HH:MM")#</td>
					<td>
						<div class='btn-group'>
							<a href='#buildURL('admin.editEvent')#/eventID/#RC.event.getID()#' class='btn btn-xs btn-default'>Edit</a>
						</div>
					</td>
				</tr>
			</cfloop>
		</tbody>
	</table>
</cfoutput>