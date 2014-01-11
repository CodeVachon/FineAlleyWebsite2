<cfoutput>
	<h2>List Users</h2>
	<table class='table'>
		<thead>
			<tr>
				<th>Person</th>
				<th>username</tH>
				<th></th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<td colspan='3'>
					<div class='btn-group'>
						<a href='#buildURL('admin.editUser')#' class='btn btn-default'>Add New User</a>
					</div>
				</td>
			</tr>
		</tfoot>
		<tbody>
			<cfloop array="#RC.people#" index="RC.person">
				<tr>
					<td>#RC.person.getFirstName()# #RC.person.getLastName()#</td>
					<td>#RC.person.getusername()#</td>
					<td>
						<div class='btn-group'>
							<a href='#buildURL('admin.editUser')#/personID/#RC.person.getID()#' class='btn btn-xs btn-default'>Edit</a>
						</div>
					</td>
				</tr>
			</cfloop>
		</tbody>
	</table>
</cfoutput>