<cfscript>
	param name="RC.validationErrors" default=structNew();
</cfscript>
<cfoutput>

	<cfif structKeyExists(RC,"btnSave")>
		<cfif structIsEmpty(RC.validationErrors)>
			<div class="alert alert-success"><strong>Success!</strong> Your Message has been sent!</div>
		<cfelse>
			<div class="alert alert-danger"><strong>Oops!</strong> Some errors where found.  Please correct them and send again</div>
		</cfif>
	</cfif>


	<form action='#buildURL("contact-us")#' method="post">
		<div class='form-group col-xs-12 col-md-6<cfif structKeyExists(RC.validationErrors,"firstName")> has-error</cfif>'>
			<label for="firstName">First Name</label>
			<input type='text' name='firstName' class="form-control" value="#((structKeyExists(RC,"firstName"))?RC.firstName:"")#" />
			<cfif structKeyExists(RC.validationErrors,"firstName")><span class="help-block">#RC.validationErrors["firstName"]#</span></cfif>
		</div>
		<div class='form-group col-xs-12 col-md-6<cfif structKeyExists(RC.validationErrors,"lastName")> has-error</cfif>'>
			<label for="lastName">Last Name</label>
			<input type='text' name='lastName' class="form-control" value="#((structKeyExists(RC,"lastName"))?RC.lastName:"")#" />
			<cfif structKeyExists(RC.validationErrors,"lastName")><span class="help-block">#RC.validationErrors["lastName"]#</span></cfif>
		</div>
		<div class='form-group col-xs-12 col-md-6<cfif structKeyExists(RC.validationErrors,"emailAddress")> has-error</cfif>'>
			<label for="emailAddress">E-Mail Address</label>
			<input type='text' name='emailAddress' class="form-control" value="#((structKeyExists(RC,"emailAddress"))?RC.emailAddress:"")#" />
			<cfif structKeyExists(RC.validationErrors,"emailAddress")><span class="help-block">#RC.validationErrors["emailAddress"]#</span></cfif>
		</div>
		<div class='form-group col-xs-12 col-md-6<cfif structKeyExists(RC.validationErrors,"phoneNumber")> has-error</cfif>'>
			<label for="phoneNumber">Phone Number</label>
			<input type='text' name='phoneNumber' class="form-control" value="#((structKeyExists(RC,"phoneNumber"))?RC.phoneNumber:"")#" placeholder="Optional" />
			<cfif structKeyExists(RC.validationErrors,"phoneNumber")><span class="help-block">#RC.validationErrors["phoneNumber"]#</span></cfif>
		</div>
		<div class='form-group col-xs-12<cfif structKeyExists(RC.validationErrors,"subject")> has-error</cfif>'>
			<label for="subject">Subject</label>
			<input type='text' name='subject' class="form-control" value="#((structKeyExists(RC,"subject"))?RC.subject:"")#" />
			<cfif structKeyExists(RC.validationErrors,"subject")><span class="help-block">#RC.validationErrors["subject"]#</span></cfif>
		</div>
		<div class='form-group col-xs-12<cfif structKeyExists(RC.validationErrors,"body")> has-error</cfif>'>
			<label for="body">Your Message</label>
			<cfif structKeyExists(RC.validationErrors,"body")><span class="help-block">#RC.validationErrors["body"]#</span></cfif>
			<textarea name="body" data-wysiwyg='basic' class="form-control">#((structKeyExists(RC,"body"))?RC.body:"")#</textarea>
		</div>
		<div class='form-group col-xs-12 col-md-6'>
			<input type='submit' name="btnSave" value="Send" class='btn btn-primary btn-lg' />
		</div>
	</form>
</cfoutput>