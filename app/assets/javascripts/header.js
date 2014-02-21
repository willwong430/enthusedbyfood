$(function() {
	var pathname = window.location.pathname;
	var specific_pathname = pathname.substr(pathname.lastIndexOf('/'));
	switch (specific_pathname) {
		case "/": // landing page
		  $('#mission').show();
		break;
		case "/cultivate":
			$('#cultivate').show();
		break;
		case "/food": //explore page
			$('#explore').show();
		break;
		case "/discover": //discover page
			$('#discover').show();
		break;
		case "/ratings":
			$('#foodie').show();
		break;
	}
});