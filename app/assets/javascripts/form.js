$( document ).ready (function () {
	$("select").change(function () {
		var attached = $("select option:selected").val();
		if (attached === "photo") {
			$("#attach_photo, #upload-row").show();
			$("#attach_link").hide();
		} else if (attached === "link") {
			$("#attach_link").show();
			$("#attach_photo").hide();
		} else {
			$("#attach_link, #attach_photo").hide();
    }
  });
});