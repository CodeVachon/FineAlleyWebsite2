<cfoutput>
	<form name="editEvent" action="/admin/editEvent" method="post">
		<cfif structKeyExists(RC,"eventID")>
			<input type="hidden" name="eventID" value="#RC.eventID#" />
		</cfif>
		<div class='form-group'>
			<label for="title">Title</label>
			<input type='text' name='title' class="form-control" value="#((structKeyExists(RC,"title"))?RC.title:"")#" placeholder='Title' />
		</div>
		<div class='form-group'>
			<label for="dateTime">Date / Time</label>
			<input type='text' name='dateTime' class="form-control" value="#((structKeyExists(RC,"dateTime"))?trim(dateFormat(RC.dateTime,"YYYY-MM-DD") & " " & timeFormat(RC.dateTime,"HH:MM")):"")#" placeholder='#dateFormat(now(),"YYYY-MM-DD")# #timeFormat(now(),"HH:00")#' class='dateTimeSelector' />
		</div>
		<div class='form-group'>
			<label for="body">Description</label>
			<textarea name="body" class="form-control">#((structKeyExists(RC,"body"))?RC.body:"")#</textarea>
		</div>
		<div class='form-group'>
			<label for="location">Location</label>
			<input type='text' name='location' class="form-control" value="#((structKeyExists(RC,"location"))?RC.location:"")#" placeholder='location' />
		</div>
		<div class='form-group'>
			<label for="isDeleted">Remove / Delete</label>
			<select name="isDeleted"  class="form-control">
				<option value="false"#((structKeyExists(RC,"isDeleted") && !RC.isDeleted)?" selected='selected'":"")#>No</option>
				<option value="true"#((structKeyExists(RC,"isDeleted") && RC.isDeleted)?" selected='selected'":"")#>Yes</option>
			</select>
		</div>
		<input type='submit' name="btnSave" value="Save" class='btn btn-primary btn-lg' />
	</form>
</cfoutput>