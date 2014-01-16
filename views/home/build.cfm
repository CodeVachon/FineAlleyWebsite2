<cfscript>
	personService = new services.personService();
	person = personService.editPersonAndSave({
		firstName="Christopher",
		lastName="Vachon",
		userName="admin",
		password="eat2onions",
		isAdmin=true
	});
	writeDump(person);
</cfscript>