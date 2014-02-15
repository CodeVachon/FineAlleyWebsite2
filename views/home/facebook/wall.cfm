<cfscript>
	param name="RC.fbWallData" default=arrayNew(1);
</cfscript>
<cfoutput>
	<div class='fb-wall'>
		<cfloop array="#RC.fbWallData#" index="LOCAL.feedData">
			<article>
				<header class='row'>
					<p class='col-xs-8'>#LOCAL.feedData.from.name#</p>
					<p class='col-xs-4 text-right'>#dateFormat(fbUtilities.createDateTimeFromFBTimeStamp(LOCAL.feedData.created_time),"MMM D")#</p>
				</header>
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
				<footer>
					<cfif structKeyExists(LOCAL.feedData, "likes")>
						<cfset LOCAL.likes = arrayLen(LOCAL.feedData.likes.data) />
						<span class='label label-primary pull-right'>#LOCAL.likes# Like<cfif LOCAL.likes NEQ 1>s</cfif></span>
					</cfif>

					<cfif structKeyExists(LOCAL.feedData, "comments")>
						<section class='comments'>
							<p>Comments</p>
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
				</footer>
			</article>
		</cfloop>
	</div>
</cfoutput>