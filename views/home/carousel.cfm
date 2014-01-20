<cfscript>
	LOCAL.carousel_ID = "carousel-header";
</cfscript>
<cfoutput>
	<div id="#LOCAL.carousel_ID#" class="carousel slide" data-ride="carousel">
		<ol class='carousel-indicators'>
			<li data-target="###LOCAL.carousel_ID#" data-slide-to="0" class="active"></li>
		</ol>

		<div class="carousel-inner">
			<div class="item active">
				<img src='/includes/img/slideshow/summerama1140x350.jpg' />
				<div class="carousel-caption">Summerama 2013</div>
			</div>
		</div>

		<a class="left carousel-control" href="###LOCAL.carousel_ID#" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
		<a class="right carousel-control" href="###LOCAL.carousel_ID#" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
	</div>
</cfoutput>