<cfif len(APPLICATION.websiteSettings.getTW_ConsumerKey()) GT 0>
	<cfscript>
		LOCAL.twHelp = new services.twitterAPI();

		LOCAL.objMonkehTweet = createObject('component','services.monkehTweet.monkehTweet').init(
			consumerKey		= APPLICATION.websiteSettings.getTW_ConsumerKey(),
			consumerSecret	= APPLICATION.websiteSettings.getTW_ConsumerSecret(),
			oauthToken		= APPLICATION.websiteSettings.getTW_AccessToken(),
			oauthTokenSecret = APPLICATION.websiteSettings.getTW_AccessTokenSecret(),
			userAccountName	= APPLICATION.websiteSettings.getTW_UserName(),
			parseResults	= true
		);
		//writeDump(LOCAL.objMonkehTweet.getUserTimeline(screen_name="FineAlley"));

		LOCAL.MyDetails = LOCAL.objMonkehTweet.getUserDetails(screen_name=APPLICATION.websiteSettings.getTW_UserName());
		//writeDump(LOCAL.MyDetails); abort;

		LOCAL.feedItems = LOCAL.objMonkehTweet.getUserTimeline(screen_name=APPLICATION.websiteSettings.getTW_UserName(),count=5);
	</cfscript>
	<cfif !structKeyExists(LOCAL.MyDetails,"errors")>
		<cfoutput>
			<div class='twitter-feed social-media-feed'>
				<header class='twitterDetails'<cfif structKeyExists(LOCAL.MyDetails,"profile_background_image_url")> style='background-image: url("#LOCAL.MyDetails.profile_background_image_url#");'</cfif>>
					<cfif structKeyExists(LOCAL.MyDetails, "profile_image_url")><img src='#replaceNoCase(LOCAL.MyDetails.profile_image_url,"_normal","","once")#' alt='twitter profile image' class='profile-img img-responsive img-thumbnail' /></cfif>
					<p class='screen-name'><a href='https://twitter.com/#LOCAL.MyDetails.screen_name#' target="_blank">#LOCAL.MyDetails.screen_name#</a></p>
				</header>

				<ul class="nav nav-pills nav-justified data-selection">
					<li class="active"><a href="##wall_tw_#LOCAL.MyDetails.screen_name#" data-toggle="tab">Wall</a></li>
					<li><a href="##about_tw_#LOCAL.MyDetails.screen_name#" data-toggle="tab">About</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="wall_tw_#LOCAL.MyDetails.screen_name#">
						<cfloop array="#LOCAL.feedItems#" index="LOCAL.feedItem">
							<article class='wall-item media'>
								<a href='https://twitter.com/#LOCAL.feedItem.user.screen_name#' class='pull-left' target='_blank'><img src='#LOCAL.feedItem.user.profile_image_url#' class='media-object' /></a>
								<div class='media-body'>
									<header class='media-heading'>
										<!---<span class='pull-right post-date'>#dateFormat(LOCAL.twHelp.createDateTimeFromTwitterTimeStamp(LOCAL.feedItem.created_at),"mmm d")#</span>--->
										#LOCAL.feedItem.user.name#
										<a href='https://twitter.com/#LOCAL.feedItem.user.screen_name#' target='_blank' class='screen-name'>@#LOCAL.feedItem.user.screen_name#</a>
									</header>
									<div class='body'>
										#LOCAL.twHelp.formatText(LOCAL.feedItem.text)#
										<cfif structKeyExists(LOCAL.feedItem,"entities")>
											<section class='media'>
												<cfif structKeyExists(LOCAL.feedItem.entities, "media")>
													<cfloop array="#LOCAL.feedItem.entities.media#" index="LOCAL.imgDetails">
														<cfif LOCAL.imgDetails.type EQ "photo">
															<img src='#LOCAL.imgDetails.media_url#' alt='tweeted image' class='img-responsive img-thumbnail' />
														</cfif>
													</cfloop>
												</cfif>
											</section>
										</cfif>
									</div>
									<footer>
										<ul class='pull-right list-unstyled list-inline'>
											<li><a href="https://twitter.com/intent/tweet?in_reply_to=#LOCAL.feedItem.id_str#" class='tw-reply' title='Reply to #LOCAL.feedItem.user.name#'><span class='hidden-md hidden-sm'>Reply</span></a></li>
											<li><a href="https://twitter.com/intent/retweet?tweet_id=#LOCAL.feedItem.id_str#" class='tw-retweet' title='Retweet this Post'><span class='hidden-md hidden-sm'>Retweet</span></a></li>
											<li><a href="https://twitter.com/intent/favorite?tweet_id=#LOCAL.feedItem.id_str#" class='tw-favorite' title='Favorite this Post'><span class='hidden-md hidden-sm'>Favorite</span></a></li>
										</ul>
										<span class='label label-primary'>#LOCAL.feedItem.retweet_count# Retweets</span>
									</footer>
								</div>
							</article>
						</cfloop>
					</div>
					<div class="tab-pane" id="about_tw_#LOCAL.MyDetails.screen_name#">
						<div class='wall-item'>
							<dl>
								<dt>Description</dt>
								<dd>#LOCAL.MyDetails.description#</dd>
								<dt>Followers</dt>
								<dd>#LOCAL.MyDetails.followers_count#</dd>
								<dt>Following</dt>
								<dd>#LOCAL.MyDetails.friends_count#</dd>
								<dt>Location</dt>
								<dd>#LOCAL.MyDetails.location#</dd>
							</dl>
						</div>
					</div>
				</div><!-- close tab-content -->
				<footer>
					<a href="https://twitter.com/#LOCAL.MyDetails.screen_name#" class="twitter-follow-button" data-show-count="false" data-lang="en">Follow @#LOCAL.MyDetails.screen_name#</a>
				</footer>
			</div>
		</cfoutput>
	<cfelse>
		<cfoutput>
			<cfif REQUEST.security.checkPermission("isAdmin")>
				<ul>
					<cfloop array="#LOCAL.MyDetails.errors#" index="LOCAL.error">
						<li>#LOCAL.error.code#: #LOCAL.error.message#</li>
					</cfloop>
				</ul>
			</cfif>
			<a class="twitter-timeline" data-dnt="true" href="https://twitter.com/FineAlley" data-widget-id="429060979180048384">Tweets by @FineAlley</a>
		</cfoutput>
	</cfif>
</cfif>