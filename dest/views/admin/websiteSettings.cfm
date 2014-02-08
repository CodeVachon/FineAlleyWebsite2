<cfoutput>
	<form name="editEvent" action="/admin/websiteSettings" method="post">
		<cfif structKeyExists(RC,"websiteSettingsID")>
			<input type="hidden" name="websiteSettingsID" value="#RC.websiteSettingsID#" />
		</cfif>

		<div class='form-group'>
			<label for="siteName">Site Name</label>
			<input type='text' name='siteName' class="form-control" value="#((structKeyExists(RC,"siteName"))?RC.siteName:"")#" placeholder='' />
		</div>

		<div class='form-group'>
			<label for="description">Description</label>
			<input type='text' name='description' class="form-control" value="#((structKeyExists(RC,"description"))?RC.description:"")#" placeholder='' />
			<span class="help-block">Used as Meta Description for Search Engines</span>
		</div>


		<div class='form-group'>
			<label for="FB_appID">Facebook App ID</label>
			<input type='text' name='FB_appID' class="form-control" value="#((structKeyExists(RC,"FB_appID"))?RC.FB_appID:"")#" placeholder='' />
		</div>
		<div class='form-group'>
			<label for="FB_appSecret">Facebook App Secret</label>
			<input type='text' name='FB_appSecret' class="form-control" value="#((structKeyExists(RC,"FB_appSecret"))?RC.FB_appSecret:"")#" placeholder='' />
		</div>
		<div class='form-group'>
			<label for="FB_pageID">Facebook Page ID</label>
			<input type='text' name='FB_pageID' class="form-control" value="#((structKeyExists(RC,"FB_pageID"))?RC.FB_pageID:"")#" placeholder='' />
		</div>


		<div class='form-group'>
			<label for="Google_gaCode">Google Analyatics Code</label>
			<input type='text' name='Google_gaCode' class="form-control" value="#((structKeyExists(RC,"Google_gaCode"))?RC.Google_gaCode:"")#" placeholder='' />
		</div>
		<div class='form-group'>
			<label for="Google_APICode">Google API Code</label>
			<input type='text' name='Google_APICode' class="form-control" value="#((structKeyExists(RC,"Google_APICode"))?RC.Google_APICode:"")#" placeholder='' />
		</div>


		<div class='form-group'>
			<label for="Mail_SMTPServer">SMTP Server</label>
			<input type='text' name='Mail_SMTPServer' class="form-control" value="#((structKeyExists(RC,"Mail_SMTPServer"))?RC.Mail_SMTPServer:"")#" placeholder='' />
		</div>
		<div class='form-group'>
			<label for="Mail_Port">SMTP Server Port</label>
			<input type='text' name='Mail_Port' class="form-control" value="#((structKeyExists(RC,"Mail_Port"))?RC.Mail_Port:"")#" placeholder='' />
		</div>
		<div class='form-group'>
			<label for="Mail_Username">SMTP Username</label>
			<input type='text' name='Mail_Username' class="form-control" value="#((structKeyExists(RC,"Mail_Username"))?RC.Mail_Username:"")#" placeholder='' />
		</div>
		<div class='form-group'>
			<label for="Mail_Password">SMTP Password</label>
			<input type='password' name='Mail_Password' class="form-control" value="#((structKeyExists(RC,"Mail_Password"))?RC.Mail_Password:"")#" placeholder='' />
		</div>
		<div class='form-group'>
			<label for="Mail_UseSSL">Use SSL</label>
			<select name="Mail_UseSSL"  class="form-control">
				<option value="false"#((structKeyExists(RC,"Mail_UseSSL") && !RC.Mail_UseSSL)?" selected='selected'":"")#>No</option>
				<option value="true"#((structKeyExists(RC,"Mail_UseSSL") && RC.Mail_UseSSL)?" selected='selected'":"")#>Yes</option>
			</select>
		</div>


		<div class='form-group'>
			<label for="Mail_FromName">Mail From Name</label>
			<input type='text' name='Mail_FromName' class="form-control" value="#((structKeyExists(RC,"Mail_FromName"))?RC.Mail_FromName:"")#" placeholder='' />
		</div>
		<div class='form-group'>
			<label for="Mail_FromEmailAddress">Mail From Email Address</label>
			<input type='text' name='Mail_FromEmailAddress' class="form-control" value="#((structKeyExists(RC,"Mail_FromEmailAddress"))?RC.Mail_FromEmailAddress:"")#" placeholder='' />
		</div>
		<div class='form-group'>
			<label for="Mail_SendToEmailAddress">Sent Mail To Address</label>
			<input type='text' name='Mail_SendToEmailAddress' class="form-control" value="#((structKeyExists(RC,"Mail_SendToEmailAddress"))?RC.Mail_SendToEmailAddress:"")#" placeholder='' />
		</div>

		<input type='submit' name="btnSave" value="Save" class='btn btn-primary btn-lg' />
	</form>
</cfoutput>