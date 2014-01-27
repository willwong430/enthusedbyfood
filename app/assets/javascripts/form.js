$(function() {
	$("select").change(function() {
		var attached = $("select option:selected").val();
		if (attached == "photo") {
			$("#attach_photo").show();
			$("#attach_link").hide();
			$("#attach_story").hide();
		}
		else if (attached == "link") {
			$("#attach_link").show();
			$("#attach_photo").hide();
			$("#attach_story").hide();
		}
		else {
			$("#attach_story").hide();
			$("#attach_link").hide();
			$("#attach_photo").hide();
		}
	});

});



