<cfoutput>
	<form name="editEvent" action="/admin/websiteSettings" method="post">
		<cfif structKeyExists(RC,"websiteSettingsID")>
			<input type="hidden" name="websiteSettingsID" value="#RC.websiteSettingsID#" />
		</cfif>

		<div class='form-group'>
			<label for="siteName">Site Name</label>
			<input type='text' name='siteName' class="form-control" value="#((structKeyExists(RC,"siteName"))?RC.siteName:"")#" placeholder='Title' />
		</div>

		<div class='form-group'>
			<label for="description">Description</label>
			<input type='text' name='description' class="form-control" value="#((structKeyExists(RC,"description"))?RC.description:"")#" placeholder='Title' />
			<span class="help-block">Used as Meta Description for Search Engines</span>
		</div>


		<div class='form-group'>
			<label for="FB_appID">Facebook App ID</label>
			<input type='text' name='FB_appID' class="form-control" value="#((structKeyExists(RC,"FB_appID"))?RC.FB_appID:"")#" placeholder='Title' />
		</div>
		<div class='form-group'>
			<label for="FB_appSecret">Facebook App Secret</label>
			<input type='text' name='FB_appSecret' class="form-control" value="#((structKeyExists(RC,"FB_appSecret"))?RC.FB_appSecret:"")#" placeholder='Title' />
		</div>
		<div class='form-group'>
			<label for="FB_pageID">Facebook Page ID</label>
			<input type='text' name='FB_pageID' class="form-control" value="#((structKeyExists(RC,"FB_pageID"))?RC.FB_pageID:"")#" placeholder='Title' />
		</div>


		<div class='form-group'>
			<label for="Google_gaCode">Google Analyatics Code</label>
			<input type='text' name='Google_gaCode' class="form-control" value="#((structKeyExists(RC,"Google_gaCode"))?RC.Google_gaCode:"")#" placeholder='Title' />
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