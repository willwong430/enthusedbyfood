$(function() {
	$("body").on("click", '#users_index .pagination a', 
	 	function() {
			$.getScript(this.href);
			return false;
		});
});
