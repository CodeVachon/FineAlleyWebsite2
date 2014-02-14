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
	writeDump(LOCAL.MyDetails);

	LOCAL.feedItems = LOCAL.objMonkehTweet.getUserTimeline(screen_name=APPLICATION.websiteSettings.getTW_UserName(),count=5);
</cfscript>
<cfoutput>
	<section class='twitterDetails'>
		<img src='#replaceNoCase(LOCAL.MyDetails.profile_image_url,"_normal","","once")#' alt='twitter background image' width="148" class='img-responsive' />
	</section>


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
				#LOCAL.feedItem.retweet_count# Retweets
			</footer>
		<article>
	</cfloop>
</cfoutput>