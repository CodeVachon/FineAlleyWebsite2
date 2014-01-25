<cfoutput>
	<h2>Administration</h2>
	<ul>
		<li><a href='#buildURL('admin.websiteSettings')#'>Manage Website Settings</a></li>
		<li>
			<a href='#buildURL('admin.listUsers')#'>Manage Members</a>
			<ul>
				<li><a href='#buildURL('admin.editUser')#'>Add New Member</a></li>
			</ul>
		</li>
		<li>
			<a href='#buildURL('admin.listEvents')#'>Manage Events</a>
			<ul>
				<li><a href='#buildURL('admin.editEvent')#'>Add New Event</a></li>
			</ul>
		</li>
		<li>
			<a href='#buildURL('admin.listVenues')#'>Manage Venues</a>
			<ul>
				<li><a href='#buildURL('admin.editVenue')#'>Add New Venue</a></li>
			</ul>
		</li>
		<li><a href='#buildURL('admin.listSlides')#'>Manage Slides</a></li>
		<li><a href='#buildURL('admin.mailHistory')#'>Mail History</a></li>
	</ul>
</cfoutput>