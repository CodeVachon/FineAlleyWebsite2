<h2>Please Log In</h2>
<cfoutput>
	<form name="editEvent" action="/admin/login" method="post">
		<div class='form-group'>
			<label for="username">Username</label>
			<input type='text' name='username' class="form-control" value="#((structKeyExists(RC,"username"))?RC.username:"")#" />
		</div>
		<div class='form-group'>
			<label for="password">Password</label>
			<input type='password' name='password' class="form-control" value="" placeholder='' />
		</div>
		<input type='submit' name="btnSave" value="Save" class='btn btn-primary btn-lg' />
	</form>
</cfoutput>