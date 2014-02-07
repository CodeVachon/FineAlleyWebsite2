<cfscript>
	LOCAL.personService = new services.personService();

	LOCAL.adminSettings = {
		firstName="Site",
		lastName="Administrator",
		username="admin",
		password="password",
		isAdmin=true
	};

	LOCAL.admin = personService.editPersonAndSave(LOCAL.adminSettings);
</cfscript>

<cfoutput>
	<h2>Setup Complete</h2>
	<dl>
		<cfloop collection="#LOCAL.adminSettings#" item="LOCAL.key">
			<dt>#LOCAL.key#</dt>
			<dd>#LOCAL.adminSettings[LOCAL.key]#</dd>
		</cfloop>
	</dl>
</cfoutput>