$(document).ready(function() {
	$('form').each(function() {
		var _form = $(this);
		if (_form.find("[data-datepicker]")) {
			console.log("Date Picker Found");
			_fileLoad = loadFileForFN("/includes/js/bootstrap-datepicker.js","datepicker");
			_fileLoad.done(function() {
				_form.find("[data-datepicker]").each(function() {
					var _options = {"format":"yyyy/mm/dd","todayBtn": true};
					$(this).datepicker(_options);
				});
			});
		} // close if date-picker


		if (_form.find("[data-timepicker]")) {
			console.log("Time Picker Found");
			_fileLoad = loadFileForFN("/includes/js/bootstrap-timepicker.min.js","timepicker");
			_fileLoad.done(function() {
				_form.find("[data-timepicker]").each(function() {
					var _options = {"showMeridian":false};
					$(this).timepicker(_options);
				});
			});
		} // close if time-picker
	});
});


function loadFileForFN(_src,_fnName) {
	var d = $.Deferred();

	if ($.isFunction(_fnName)) {
		console.log('found: ' + _fnName);
		d.resolve();
	} else {
		console.log('Fetch: ' + _src);
		$.getScript(_src, function( data, textStatus, jqxhr ) {
			console.log('Fetch Complete: ' + _src);
			d.resolve();
		}).fail(function(e) {
			console.log("Failed to Laod: " + _src);
			console.log(e);
			d.fail();
		});
	}

	return d.promise();
}