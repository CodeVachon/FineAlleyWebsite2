<cfoutput>
	<h2>List Slides</h2>
	<table class='table'>
		<thead>
			<tr>
				<th>Slide Title</th>
				<th>Start</th>
				<th>End</th>
				<th></th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<td colspan='4'>
					<div class='btn-group'>
						<a href='/admin/editSlide' class='btn btn-default'>Add New Slide</a>
					</div>
				</td>
			</tr>
		</tfoot>
		<tbody>
			<cfloop array="#RC.slides#" index="LOCAL.slide">
				<tr>
					<td>#LOCAL.slide.getTitle()#</td>
					<td>#dateFormat(LOCAL.slide.getStartDate(),"MMM D, YYYY")#</td>
					<td>#dateFormat(LOCAL.slide.getEndDate(),"MMM D, YYYY")#</td>
					<td>
						<div class='btn-group'>
							<a href='/admin/editSlide/carouselSlideId/#LOCAL.slide.getID()#' class='btn btn-xs btn-default'>Edit</a>
						</div>
					</td>
				</tr>
			</cfloop>
		</tbody>
	</table>
</cfoutput>