$(function() {
	var boroughs = [
	['Brooklyn', 40.663973, -73.948975, 2565635, 183000, '24,526', '1,888', '888' ],
	['Queens', 40.75558, -73.793793, 2272771, 283000, '22,757', '1,008', '888' ],
	['Manhattan', 40.802375,-73.959274, 1619090, 59000, '29,552', '1,838', '888'],
	['The Bronx', 40.851216,-73.863831,1408473, 109000, '27,163', '888', '888' ],
	['Staten Island', 40.590492,-74.149475, 470728, 151000, '16,774', '800', '888']];

	var marker, i;	

	var infowindow = new google.maps.InfoWindow({
		maxWidth: 700
	});

	function initialize() {
		var bounds = new google.maps.LatLngBounds(
			new google.maps.LatLng(40.367474,-74.552064),
			new google.maps.LatLng(41.038966,-73.432832));
			
		var mapOptions = {
			zoom: 10,
			minZoom: 10,
			maxZoom: 12,
			zoomControl: false,
			center: new google.maps.LatLng(40.726966,-73.887863),
			mapTypeControl: false,
			panControl: false
		};

		var map = new google.maps.Map(document.getElementById('map-canvas'),
		mapOptions);
		
		for (i = 0; i < boroughs.length; i++) {
			marker = new google.maps.Marker({
				position: new google.maps.LatLng(boroughs[i][1], boroughs[i][2]),
				map: map,
				title: boroughs[i][0]
			});

			google.maps.event.addListener(marker, 'click', (function(marker, i) {
				return function() {
					map.setZoom(10);
					map.fitBounds(bounds);
					infowindow.setContent('<div class="marker some">' + 
					'<div class="overview">' + 
					'<h4>' + boroughs[i][0] + '</h4>' +
					'<p class="full">' + 'Total Number of Yelped Restaurants: ' + boroughs[i][5] + 
					'</p>' + '</div>' + 
					'<div class="more">' +
					'Restaurants that have enthused Yelpers: ' + boroughs[i][6] +
					'</div>' +
					'<div class="most">' +
					'Restaurants that have enthused our community: ' + boroughs[i][7] +
					'</div>' +
					'</div>'
					);
					infowindow.open(map, marker);
					map.setCenter(marker.getPosition());
				}
			})(marker, i));
		}

		google.maps.event.addListener(map, 'zoom_changed', (function() {
			return function() {
				var zoomNow = map.getZoom();
				if (zoomNow == 10){
					$('.marker .full').show();
					$('.marker .more').hide();
					$('.marker .most').hide();					
				}
				else if (zoomNow == 11){
					$('.marker .full').hide();
					$('.marker .more').show();
					$('.marker .most').hide();
				}
				else if (zoomNow == 12){
					$('.marker .more').hide();
					$('.marker .full').hide();
					$('.marker .most').show();
				}
			}
		})());
		
		}	
		
		function addMarker(location) {
			var marker = new google.maps.Marker({
				position: location,
				map: map
			});
			markers.push(marker);
		}

		function setAllMap(map) {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(map);
			}
		}

		function clearMarkers() {
			setAllMap(null);
		}

		function showMarkers() {
			setAllMap(map);
		}

		google.maps.event.addDomListener(window, 'load', initialize);
		
		
		$("body").on("click", '#users_index .pagination a', 
			function() {
				$.getScript(this.href);
				return false;
			});
			
});