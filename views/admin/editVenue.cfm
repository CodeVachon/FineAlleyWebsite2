<cfoutput>
	<form name="editVenue" action="/admin/editVenue" method="post">
		<cfif structKeyExists(RC,"venueId")>
			<input type="hidden" name="venueId" value="#RC.venueId#" />
		</cfif>
		<div class='form-group'>
			<label for="name">Name</label>
			<input type='text' name='name' class="form-control" value="#((structKeyExists(RC,"name"))?RC.name:"")#" placeholder='Joes Place' />
		</div>
		<div class='form-group'>
			<label for="description">Description</label>
			<textarea name="description" data-wysiwyg='' class="form-control">#((structKeyExists(RC,"description"))?RC.description:"")#</textarea>
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