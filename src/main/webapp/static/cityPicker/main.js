$(function() {

	var $citypicker3 = $('#city-picker3');
	$('#reset').click(function() {
		$citypicker3.citypicker('reset');
	});
	$('#destroy').click(function() {
		$citypicker3.citypicker('destroy');
	});
});