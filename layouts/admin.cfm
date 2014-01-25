<div class='row'>
	<div class='col-sm-9 pull-right'><cfoutput>#body#</cfoutput></div>
	<div class='col-sm-3 pull-left'>
		<ul class='well nav nav-pills nav-stacked'>
			<li><a href='#buildURL('admin')#'>Admin</a></li>
			<li><a href='#buildURL('admin.websiteSettings')#'>Manage Website Settings</a></li>
			<li><a href='#buildURL('admin.listUsers')#'>Manage Members</a></li>
			<li><a href='#buildURL('admin.listEvents')#'>Manage Events</a></li>
			<li><a href='#buildURL('admin.listSlides')#'>Manage Slides</a></li>
			<li><a href='#buildURL('admin.listVenues')#'>Manage Venues</a></li>
			<li><a href='#buildURL('admin.mailHistory')#'>Mail History</a></li>
		</uL>
	</div>
</div>