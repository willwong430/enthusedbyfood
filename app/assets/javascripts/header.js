var pathname = window.location.pathname;
$(function() {
	if (pathname == "/") {
		$('#mission').show().
		$('#cultivate').hide();
	}
	else if (pathname == "/cultivate") {
		$('.modal-body #mission').hide();
		$('.modal-body #cultivate').show();
	}
});