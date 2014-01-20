<cfoutput>
	<h2>View Mail History</h2>

	<div class="panel-group" id="accordion">
		<cfloop array="#RC.mailHistory#" index="LOCAL.thisMail">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="##accordion" href="###LOCAL.thisMail.getID()#">#dateFormat(LOCAL.thisMail.getDateTime(),"YYYY/MM/DD")# @ #timeFormat(LOCAL.thisMail.getDateTime(),"HH:MM:SS")#</a>
					</h4>
				</div>
				<div id="#LOCAL.thisMail.getID()#" class="panel-collapse collapse">
					<div class="panel-body">
						<table class='table'>
							<tr>
								<th>From<th>
								<td>#LOCAL.thisMail.getFromName()# [#LOCAL.thisMail.getFromEmailAddress()#]</td>
							</tr>
							<tr>
								<th>Phone Number<th>
								<td>#LOCAL.thisMail.getFromPhone()#</td>
							</tr>
							<tr>
								<th>Subject<th>
								<td>#LOCAL.thisMail.getSubject()#</td>
							</tr>
							<tr>
								<th>Message<th>
								<td>#LOCAL.thisMail.getBody()#</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</cfloop>
	</div>
</cfoutput>
