<h2>More Coming Soon</h2>
<p>We are still setting up our webpage.  In the mean time, check us out on 
<a href="https://www.facebook.com/FineAlleyTheBand">Facebook</a> or follow 
us on <a href="https://twitter.com/FineAlley">Twitter</a> for more information 
and upcoming events.  Or <a href='/contact-us'>Contact Us</a> for more information.</p>


<h2>Upcoming Events</h2>

<div class='upcomingEvents'>
	<cfoutput>
		<cfset RC.useVenueSummary = true />
		<cfloop array="#RC.events#" index="RC.event">
			#view('home/eventSummary')#
		</cfloop>
	</cfoutput>
</div>