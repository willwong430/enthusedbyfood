$(function(){

	var $sideBar = $('.bs-sidebar');
	var $rating = $('#ratings_side');
	var $map = $('#map-canvas');

	$sideBar.affix({
		offset: {
			top: function() {
				var offsetTop = $sideBar.offset().top
				var sideBarMargin = parseInt($sideBar.children(0).css('margin-top'), 10)
				var navOuterHeight = $('#header').height()
			
				return (this.top = offsetTop) // - navOuterHeight - sideBarMargin)
			},
			bottom: function() {
				return (this.bottom = $('.footer').outerHeight(true))
			}
		}
	});
	
	$rating.affix({
		offset: {
			top: function() {
				var offsetTop = $rating.offset().top
				var sideBarMargin = parseInt($sideBar.children(0).css('margin-top'), 10)
				var navOuterHeight = $('#header').height()
			
				return (this.top = offsetTop) // - navOuterHeight - sideBarMargin)
			},
			bottom: function() {
				return (this.bottom = $('.footer').outerHeight(true))
			}
		}
	});

	$map.affix({
		offset: {
			top: function() {
				var offsetTop = $map.offset().top
				var sideBarMargin = parseInt($map.children(0).css('margin-top'), 10)
				var navOuterHeight = $('#header').height()

				return (this.top = offsetTop) // - navOuterHeight - sideBarMargin)
			},
			bottom: function() {
				return (this.bottom = $('.footer').outerHeight(true))
			}
		}
	});
})