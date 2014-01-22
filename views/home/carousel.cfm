<cfscript>
	LOCAL.carousel_ID = "carousel-header";


	LOCAL.contentArray = [];
	LOCAL.carouselSlideService = new services.carouselSlideService();
	LOCAL.slides = LOCAL.carouselSlideService.getCarouselSlides();
	for (LOCAL.slide in LOCAL.slides) {
		arrayAppend(LOCAL.contentArray,{
			body=LOCAL.slide.getSlideContents(),
			caption=LOCAL.slide.getCaption()
		});
	}
	/*
		{body="<img src='/includes/img/slideshow/summerama1140x350.jpg' />",caption="Summerama 2013"}//,
		//{body="<img src='/includes/img/slideshow/finealleySlide1140x350.jpg' />",caption="Summerama Banner 2013"}
	];
	*/

</cfscript>
<cfif arrayLen(LOCAL.contentArray) GT 0>
	<cfoutput>
		<div id="#LOCAL.carousel_ID#" class="carousel slide" data-ride="carousel">
			<cfif arrayLen(LOCAL.contentArray) GT 1>
				<ol class='carousel-indicators'>
					<cfloop from="1" to="#arrayLen(LOCAL.contentArray)#" index="LOCAL.index">
						<li data-target="###LOCAL.carousel_ID#" data-slide-to="#(LOCAL.index-1)#"<cfif LOCAL.index EQ 1> class="active"</cfif>></li>
					</cfloop>
				</ol>
			</cfif>
			<div class="carousel-inner">
				<cfset LOCAL.thisClass = " active" />
				<cfloop array="#LOCAL.contentArray#" index="LOCAL.thisSlide">
					<div class="item#LOCAL.thisClass#">
						#LOCAL.thisSlide.body#
						<cfif isDefined("LOCAL.thisSlide.caption") AND (len(LOCAL.thisSlide.caption) GT 0)>
							<div class="carousel-caption">#LOCAL.thisSlide.caption#</div>
						</cfif>
					</div>
					<cfset LOCAL.thisClass = "" />
				</cfloop>
			</div>
			<cfif arrayLen(LOCAL.contentArray) GT 1>
				<a class="left carousel-control" href="###LOCAL.carousel_ID#" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
				<a class="right carousel-control" href="###LOCAL.carousel_ID#" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
			</cfif>
		</div>
	</cfoutput>
</cfif>