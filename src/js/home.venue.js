$(document).ready(function() {
	$('[data-address]').each(function() {
		console.log("Draw Map For: " + $(this).attr("data-address"));
		$(this).gmap3({
			marker: {
				address: $(this).attr("data-address"),
			},
			map:{
				options:{
					zoom:16
				}
			}
		}).after(
			$('<a>').addClass('btn btn-info btn-xs').text("Get Directions").prop({
				"href":"https://maps.google.ca/maps?saddr=&daddr=" + $(this).attr("data-address").replace(/\s{1,}/gi,"+"),
				"target":"_blank"
			})
		);
	});
});