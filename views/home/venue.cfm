<cfscript>
	LOCAL.events = {
		upcoming = RC.venue.getEvents(),
		past = RC.venue.getEvents("past")
	};
	LOCAL.eventKeyOrder = ["Upcoming","Past"];
</cfscript>
<cfoutput>
	<div class='venue col-md-12'>
		<cfif APPLICATION.websiteSettings.hasAllFacebookInfo() AND (len(RC.venue.getFacebookID()) GT 0)>
			<cfscript>
				LOCAL._appID = APPLICATION.websiteSettings.getFB_appID();
				LOCAL._appSecrect = APPLICATION.websiteSettings.getFB_appSecret();
				LOCAL._pageID = RC.venue.getFacebookID();
				LOCAL._accessToken = "#LOCAL._appID#|#LOCAL._appSecrect#";
				LOCAL.facebookGraphAPI = new services.FacebookGraphAPI().init(LOCAL._accessToken,LOCAL._appID);
				LOCAL.facebookData = LOCAL.facebookGraphAPI.getObject(id=LOCAL._pageID);

				//writeDump(LOCAL.facebookData);
			</cfscript>

			<div class='row'>
				<header>
					<img src="#LOCAL.facebookData.cover.source#" class="img-responsive" alt="facebook Cover Image" />
					<div class='fb-titleblock'>
						<img src="https://graph.facebook.com/#LOCAL.facebookData.id#/picture?width=200&amp;height=200" class="img-responsive img-thumbnail img-fbthumb" alt="facebook Profile Image">
						<a href='#LOCAL.facebookData.link#' class='fb-title' target="_blank">#LOCAL.facebookData.name#</a>
					</div>
				</header>

				<div class='row'>
					<div class='col-xs-12'>
						<dl>
							<dt>About</dt>
							<dd>#LOCAL.facebookData.about#</dd>
							<dt>Category</dt>
							<dd>#LOCAL.facebookData.category#</dd>
						</dl>
					</div>
				</div><!-- close .row -->
				<div class='row'>
					<cfif structKeyExists(LOCAL.facebookData, "location")>
						<div class='col-sm-12 col-md-3'>
							<h4>Address</h4>
							<address>
								#LOCAL.facebookData.location.street#<br />
								#LOCAL.facebookData.location.city#, #LOCAL.facebookData.location.state#<br />
								#LOCAL.facebookData.location.country#<br />
								#LOCAL.facebookData.location.zip#
							</address>
							<cfif structKeyExists(LOCAL.facebookData, "phone")>
								<h4>Phone</h4>
								<p>#LOCAL.facebookData.phone#</p>
							</cfif>
						</div>
						<div class='col-sm-12 col-md-5'>
							<h4>Map</h4>
							<div class='venue-map' data-address="#RC.venue.getName()# #LOCAL.facebookData.location.street# #LOCAL.facebookData.location.city#, #LOCAL.facebookData.location.state# #LOCAL.facebookData.location.country#"></div>
						</div>
					</cfif>
					<cfif structKeyExists(LOCAL.facebookData, "hours")>
						<div class='col-sm-6 col-md-4'>
							<h4>Hours</h4>
							<table class='table table-condensed'>
								<thead>
									<tr>
										<th></th>
										<th>Open</th>
										<th>Close</th>
									</tr>
								</thead>
								<tfoot>
								</tfoot>
								<tbody>
									<cfloop list="Mon,Tue,Wed,Thur,Fri,Sat,Sun" index="LOCAL.dayOfWeek">
										<cfif structKeyExists(LOCAL.facebookData.hours, "#LOCAL.dayOfWeek#_1_open") AND structKeyExists(LOCAL.facebookData.hours, "#LOCAL.dayOfWeek#_1_close")>
											<tr><th>#LOCAL.dayOfWeek#</th><td>#LOCAL.facebookData.hours["#LOCAL.dayOfWeek#_1_open"]#</td><td>#LOCAL.facebookData.hours["#LOCAL.dayOfWeek#_1_close"]#</td></tr>
										</cfif>
									</cfloop>
								</tbody>
							</table>
						</div>
					</cfif>
				</div><!-- close .row -->
				<p class='text-right'><small class='text-muted'>proceeding information from <a href='http://www.facebook.com' target="_blank">facebook.com</a></small></p>
			</div><!-- close .row -->
		<cfelse>
			<header><a href='/venue/#RC.venue.getEncodedName()#'>#RC.venue.getName()#</a></header>
			#RC.venue.getDescription()#
		</cfif>

		<cfloop array="#LOCAL.eventKeyOrder#" index="LOCAL.key">
			<cfif arrayLen(LOCAL.events[LOCAL.key]) GT 0>
				<div class='row'>
					<h4>#LOCAL.key# Events</h4>
					<cfloop array="#LOCAL.events[LOCAL.key]#" index="RC.event">
						#view('home/eventSummary')#
					</cfloop>
				</div>
			</cfif>
		</cfloop>

		<footer>
			<cfif REQUEST.security.checkPermission("isAdmin")>
				<div class='btn-group btn-mini'>
					<a href='/admin/editVenue/venueID/#RC.venue.getID()#' class='btn btn-default btn-xs'>Edit Venue</a>
				</div>
			</cfif>
		</footer>
	</div>
</cfoutput>