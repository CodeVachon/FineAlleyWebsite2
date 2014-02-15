<cfscript>
	param name="RC.fbWallData" default=arrayNew(1);
	param name="REQUEST.CACHE" default=structNew();
	param name="REQUEST.CACHE.facebook" default=structNew();
</cfscript>
<cfoutput>
	<div class='fb-wall'>
		<cfloop array="#RC.fbWallData#" index="LOCAL.feedData">
			<article class='wall-item'>
				<header class='row'>
					<p class='col-xs-8'>#LOCAL.feedData.from.name#</p>
					<p class='col-xs-4 text-right'>#dateFormat(fbUtilities.createDateTimeFromFBTimeStamp(LOCAL.feedData.created_time),"MMM D")#</p>
				</header>
				<div class='body'>
					<cfif structKeyExists(LOCAL.feedData, "story")>
						<p>#LOCAL.feedData.story#</p>
					</cfif>
					<cfif structKeyExists(LOCAL.feedData, "full_picture")>
						<a href='#LOCAL.feedData.link#'>
							<img src='#LOCAL.feedData.full_picture#' class='img-responsive img-thumbnail' />
						</a>
					</cfif>
					<cfif structKeyExists(LOCAL.feedData, "message")>
						<p>#LOCAL.feedData.message#</p>
					</cfif>
				</div>
				<footer>
					<cfscript>
						if (structKeyExists(LOCAL.feedData, "likes")) {
							LOCAL.likes = arrayLen(LOCAL.feedData.likes.data);
						} else {
							LOCAL.likes = 0;
						}
					</cfscript>
					<span class='label label-primary'>#LOCAL.likes# Like<cfif LOCAL.likes NEQ 1>s</cfif></span>
				</footer>
				<cfif structKeyExists(LOCAL.feedData, "comments")>
					<section class='comments'>
						<header class='row'>
							<p>Comments</p>
						</header>
						<cfloop array="#LOCAL.feedData.comments.data#" index="LOCAL.comment">
							<div class='comment'>
								<header class='row'>
									<p class='col-xs-8'>#LOCAL.comment.from.name#</p>
									<p class='col-xs-4 text-right'>#dateFormat(fbUtilities.createDateTimeFromFBTimeStamp(LOCAL.comment.created_time),"MMM D")#</p>
								</header>
								<p>#LOCAL.comment.message#</p>
							</div>
						</cfloop>
					</section>
				</cfif>
			</article>
		</cfloop>
	</div>
</cfoutput>