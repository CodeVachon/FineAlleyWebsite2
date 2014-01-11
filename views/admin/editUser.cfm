<cfoutput>
	<form name="editEvent" action="/admin/editUser" method="post">
		<cfif structKeyExists(RC,"personID")>
			<input type="hidden" name="personID" value="#RC.personID#" />
		</cfif>
		<div class='form-group'>
			<label for="firstName">First Name</title>
			<input type='text' name='firstName' class="form-control" value="#((structKeyExists(RC,"firstName"))?RC.firstName:"")#" placeholder='firstName' />
		</div>
		<div class='form-group'>
			<label for="lastName">Last Name</title>
			<input type='text' name='lastName' class="form-control" value="#((structKeyExists(RC,"lastName"))?RC.lastName:"")#" placeholder='lastName' />
		</div>
		<div class='form-group'>
			<label for="username">User / Login Name</title>
			<input type='text' name='username' class="form-control" value="#((structKeyExists(RC,"username"))?RC.username:"")#" placeholder='username' />
		</div>
		<div class='form-group'>
			<label for="password">Password</title>
			<input type='password' name='password' class="form-control" value="" placeholder='' />
		</div>

		<div class='form-group'>
			<label for="isAdmin">Site Administrator</title>
			<select name="isAdmin"  class="form-control">
				<option value="false"#((structKeyExists(RC,"isAdmin") && !RC.isAdmin)?" selected='selected'":"")#>No</option>
				<option value="true"#((structKeyExists(RC,"isAdmin") && RC.isAdmin)?" selected='selected'":"")#>Yes</option>
			</select>
		</div>
		<div class='form-group'>
			<label for="isDeleted">Remove / Delete</title>
			<select name="isDeleted"  class="form-control">
				<option value="false"#((structKeyExists(RC,"isDeleted") && !RC.isDeleted)?" selected='selected'":"")#>No</option>
				<option value="true"#((structKeyExists(RC,"isDeleted") && RC.isDeleted)?" selected='selected'":"")#>Yes</option>
			</select>
		</div>
		<input type='submit' name="btnSave" value="Save" class='btn btn-primary btn-lg' />
	</form>
</cfoutput>