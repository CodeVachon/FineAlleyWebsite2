<cfoutput>
	<form name="editEvent" action="/admin/editEvent" method="post">
		<cfif structKeyExists(RC,"eventID")>
			<input type="hidden" name="eventID" value="#RC.eventID#" />
		</cfif>
		<div class='control-group'>
			<label for="title" class='control-label'>Title</title>
			<div class='controls'>
				<input type='text' name='title' value="#((structKeyExists(RC,"title"))?RC.title:"")#" placeholder='Title' />
			</div>
		</div>
		<div class='control-group'>
			<label for="dateTime" class='control-label'>Date / Time</title>
			<div class='controls'>
				<input type='text' name='dateTime' value="#((structKeyExists(RC,"dateTime"))?trim(dateFormat(RC.dateTime,"YYYY-MM-DD") & " " & timeFormat(RC.dateTime,"HH:MM")):"")#" placeholder='#dateFormat(now(),"YYYY-MM-DD")# #timeFormat(now(),"HH:00")#' class='dateTimeSelector' />
			</div>
		</div>
		<div class='control-group'>
			<label for="body" class='control-label'>Description</title>
			<div class='controls'>
				<textarea name="body">#((structKeyExists(RC,"body"))?RC.body:"")#</textarea>
			</div>
		</div>
		<div class='control-group'>
			<label for="location" class='control-label'>Location</title>
			<div class='controls'>
				<input type='text' name='location' value="#((structKeyExists(RC,"location"))?RC.location:"")#" placeholder='location' />
			</div>
		</div>
		<div class='control-group'>
			<label for="isDeleted" class='control-label'>Remove / Delete</title>
			<div class='controls'>
				<select name="isDeleted">
					<option value="false"#((structKeyExists(RC,"isDeleted") && !RC.isDeleted)?" selected='selected'":"")#>No</option>
					<option value="true"#((structKeyExists(RC,"isDeleted") && RC.isDeleted)?" selected='selected'":"")#>Yes</option>
				</select>
			</div>
		</div>
		<div class='control-group'>
			<div class='controls'>
				<input type='submit' name="btnSave" value="Save" class='btn btn-primary btn-large' />
			</div>
		</div>
	</form>
</cfoutput>