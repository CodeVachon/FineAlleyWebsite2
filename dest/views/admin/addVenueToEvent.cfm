<cfoutput>
	<form name="addVenueToEvent" action="/admin/addVenueToEvent" method="post">
		<div class='form-group'>
			<label for="eventID">Event</label>
			<p class='form-control-static'><span class="label label-info">#RC.event.getTitle()# [#dateFormat(RC.event.getDateTime(),"MMM d, YYYY")#]<input type='hidden' name="eventID" value="#RC.eventID#" /></span></p>
		</div>
		<div class='form-group'>
			<label for="venueID">Venue</label>
			<select name="venueID" class="form-control">
				<cfloop array="#RC.venues#" index="LOCAL.venue">
					<option value="#LOCAL.venue.getID()#">#LOCAL.venue.getName()#</option>
				</cfloop>
			</select>
		</div>
		<input type='submit' name="btnSave" value="Save" class='btn btn-primary btn-lg' />
	</form>
</cfoutput>