<!---
<a class="twitter-timeline" data-dnt="true" href="https://twitter.com/FineAlley" data-widget-id="429060979180048384">Tweets by @FineAlley</a>
--->

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
	//writeDump(LOCAL.MyDetails);

	LOCAL.feedItems = LOCAL.objMonkehTweet.getUserTimeline(screen_name=APPLICATION.websiteSettings.getTW_UserName(),count=5);
</cfscript>
<cfoutput>
	<div class='twitter-feed social-media-feed'>
		<header class='twitterDetails'<cfif structKeyExists(LOCAL.MyDetails,"profile_background_image_url")> style='background-image: url("#LOCAL.MyDetails.profile_background_image_url#");'</cfif>>
			<img src='#replaceNoCase(LOCAL.MyDetails.profile_image_url,"_normal","","once")#' alt='twitter profile image' class='profile-img img-responsive img-thumbnail' />
			<p class='screen-name'><a href='https://twitter.com/#LOCAL.MyDetails.screen_name#' target="_blank">#LOCAL.MyDetails.screen_name#</a></p>
			<p class='description'>#LOCAL.MyDetails.description#</p>
		</header>

		<ul class="nav nav-pills nav-justified data-selection">
			<li class="active"><a href="##wall_tw_#LOCAL.MyDetails.screen_name#" data-toggle="tab">Wall</a></li>
			<li><a href="##about_tw_#LOCAL.MyDetails.screen_name#" data-toggle="tab">About</a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane active" id="wall_tw_#LOCAL.MyDetails.screen_name#">
				<cfloop array="#LOCAL.feedItems#" index="LOCAL.feedItem">
					<article>
						<header>
							#LOCAL.feedItem.user.name#
						</header>
						<div>
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
							<span class='label label-primary'>#LOCAL.feedItem.retweet_count# Retweets</span>
						</footer>
					<article>
				</cfloop>
			</div>
			<div class="tab-pane" id="about_tw_#LOCAL.MyDetails.screen_name#">
				<div class='about'>
					<dl>
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
			follow fine alley
		</footer>
	</div>
</cfoutput>