<cfoutput>
	<h2>List Venues</h2>
	<table class='table'>
		<thead>
			<tr>
				<th>Name</th>
				<th></th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<td colspan='2'>
					<div class='btn-group'>
						<a href='#buildURL('admin.editVenue')#' class='btn btn-default'>Add New Venue</a>
					</div>
				</td>
			</tr>
		</tfoot>
		<tbody>
			<cfloop array="#RC.venues#" index="LOCAL.venue">
				<tr>
					<td>#LOCAL.venue.getName()#</td>
					<td>
						<div class='btn-group'>
							<a href='#buildURL('admin.editVenue')#/venueId/#LOCAL.venue.getID()#' class='btn btn-xs btn-default'>Edit</a>
						</div>
					</td>
				</tr>
			</cfloop>
		</tbody>
	</table>
</cfoutput>