<cfheader statuscode="500" statustext="An Error Occured" />
<h2>an error occured...</h2>
<cfdump var="#REQUEST.exception#" />