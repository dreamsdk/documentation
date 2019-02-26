(function($) {	
	$(document).ready(function() {
		$("body").removeClass("nojs");		
		$("a.expandable").bind("click", function() {
			var groupName = $(this).data("key");
			
			var $item = $("#" + groupName + '-image');
			var $folder = $("#" + groupName + '-folder');
			var $content = $("#" + groupName);
			
			if ($content.hasClass("collapsed")) {
				$content.removeClass("collapsed");
				$item.attr("src", 'img/minus.png');
				$folder.attr("src", "img/folder_open.gif");
			} else {
				$content.addClass("collapsed");
				$item.attr("src", 'img/plus.png');
				$folder.attr("src", "img/folder_closed.gif");
			}
		});
	});
})(jQuery);