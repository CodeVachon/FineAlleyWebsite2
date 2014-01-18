<cfoutput>
	<form action='#buildURL(RC.action)#' method="post">
		<div class='form-group col-xs-12 col-md-6'>
			<label for="firstName">First Name</label>
			<input type='text' name='firstName' class="form-control" value="#((structKeyExists(RC,"firstName"))?RC.firstName:"")#" />
		</div>
		<div class='form-group col-xs-12 col-md-6'>
			<label for="lastName">Last Name</label>
			<input type='text' name='lastName' class="form-control" value="#((structKeyExists(RC,"lastName"))?RC.lastName:"")#" />
		</div>
		<div class='form-group col-xs-12 col-md-6'>
			<label for="emailAddress">E-Mail Address</label>
			<input type='text' name='emailAddress' class="form-control" value="#((structKeyExists(RC,"emailAddress"))?RC.emailAddress:"")#" />
		</div>
		<div class='form-group col-xs-12 col-md-6'>
			<label for="phoneNumber">Phone Number</label>
			<input type='text' name='phoneNumber' class="form-control" value="#((structKeyExists(RC,"phoneNumber"))?RC.phoneNumber:"")#" />
		</div>
		<div class='form-group col-xs-12'>
			<label for="subject">Subject</label>
			<input type='text' name='subject' class="form-control" value="#((structKeyExists(RC,"subject"))?RC.subject:"")#" />
		</div>
		<div class='form-group col-xs-12'>
			<label for="body">Description</label>
			<textarea name="body" data-wysiwyg='basic' class="form-control">#((structKeyExists(RC,"body"))?RC.body:"")#</textarea>
		</div>
		<div class='form-group col-xs-12 col-md-6'>
			<input type='submit' name="btnSave" value="Send" class='btn btn-primary btn-lg' />
		</div>
	</form>
</cfoutput>