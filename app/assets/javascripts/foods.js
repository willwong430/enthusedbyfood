$(function() {
	$("#food_search input").keyup(function() {
		$.get($("#food_search").attr("action"), $("#food_search").serialize(), null, "script");
		return false;
	});
	$("#search").focus(
		function() {
			$("#logo span").hide();
	});
	$("#search").blur(
		function() {
			$("#logo span").show();
	});
});