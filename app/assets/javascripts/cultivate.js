(function ($) {'use strict';
    var $sidebar = $('#ratings_side');
    $sidebar.affix({
        offset: {
            top: function () {
                var offsetTop = $sidebar.offset().top;
                return (this.top === offsetTop);
            }
        }
    });
    $('.rating-list-section').scrollspy({
        target: '#ratings_lists'
    });
    }(jQuery));