<cfoutput>
	<form name="editSlide" action="/admin/editSlide" method="post">
		<cfif structKeyExists(RC,"carouselSlideId")>
			<input type="hidden" name="carouselSlideId" value="#RC.carouselSlideId#" />
		</cfif>
		<div class='form-group'>
			<label for="title">Title</label>
			<input type='text' name='title' class="form-control" value="#((structKeyExists(RC,"title"))?RC.title:"")#" placeholder='Title' />
		</div>
		<div class='form-group'>
			<label for="slideContents">Contents</label>
			<input type='text' name='slideContents' class="form-control" value="#((structKeyExists(RC,"slideContents"))?RC.slideContents:"")#" placeholder='&lt;img src="" /&gt;' />
		</div>
		<div class='form-group'>
			<label for="caption">Caption</label>
			<input type='text' name='caption' class="form-control" value="#((structKeyExists(RC,"caption"))?RC.caption:"")#" placeholder='Caption' />
		</div>
		<div class='form-group'>
			<label for="startDate">Start Date</label>
			<input type='text' name='startDate' class="form-control" value="#((structKeyExists(RC,"startDate"))?dateFormat(RC.startDate,"YYYY/MM/DD"):"")#" placeholder='#dateFormat(now(),"YYYY/MM/DD")#' data-datepicker='' />
		</div>
		<div class='form-group'>
			<label for="endDate">End Date</label>
			<input type='text' name='endDate' class="form-control" value="#((structKeyExists(RC,"endDate"))?dateFormat(RC.endDate,"YYYY/MM/DD"):"")#" placeholder='#dateFormat(now(),"YYYY/MM/DD")#' data-datepicker='' />
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