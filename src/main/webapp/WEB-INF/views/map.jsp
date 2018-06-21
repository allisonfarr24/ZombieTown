<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<script>
	var map, infoWindow;
    function initMap() {
    	 var myLatLng1 = {lat: ${lat}, lng: ${lng}};
    	
    	    var myLatLng = [
      ['Bondi Beach', -33.890542, 151.274856],
      ['Coogee Beach', -33.923036, 151.259052],
      ['Cronulla Beach', -34.028249, 151.157507],
      ['Manly Beach', -33.80010128657071, 151.28747820854187],
      ['Maroubra Beach', -33.950198, 151.259302]
    ];
    	

    	  var map = new google.maps.Map(document.getElementById('map'), {
    	    zoom: 15,
    	    center: myLatLng1
    	  });
    	  
			
    	  
    	  
    	    var infowindow = new google.maps.InfoWindow();

    	    var marker, i;

    	    for (i = 0; i < myLatLng.length; i++) {  
    	      marker = new google.maps.Marker({
    	        position: new google.maps.LatLng(myLatLng[i][1], myLatLng[i][2]),
    	        map: map
    	      });

    	      google.maps.event.addListener(marker, 'click', (function(marker, i) {
    	        return function() {
    	          infowindow.setContent(myLatLng[i][0]);
    	          infowindow.open(map, marker);
    	        }
    	      })(marker, i));
    	    }
    	  initAutocomplete();
    }
    
	function initAutocomplete() {
		autocomplete = new google.maps.places.Autocomplete((document
				.getElementById("address")), {
			types : [ 'geocode' ]
		}); 
		autocomplete.addListener('place_changed', fillInAddress);
	}
	function fillInAddress() {
		var place = autocomplete.getPlace();
		getCoordinates(place);
	}
</script>

<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB6Ye_VKh4Q8ewJl2p7mhvUZafcMN5aWZE
&libraries=places&callback=initMap"
	async defer></script>

<style>
/* Set the size of the div element that contains the map */
#map {
	height: 400px; /* The height is 400 pixels */
	width: 100%; /* The width is the width of the web page */
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				<div id="map"></div>
			</div>
			<div class="col">
				<div class="container centered">
					<div class="container">
						<h1>Here is the score break-down:</h1>
						<h1>${percent }%</h1>
						<h2>${tester}</h2>

					</div>
					<div class="container">
						<table class="table table-dark table-hover">
							<thead align="center">
								<tr>
									<th align="center">Type of establishment</th>
									<th align="center">Number within a 5 mile radius</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Hospital</td>
									<td>${place[0] }</td>
								</tr>
								<tr>
									<td>Gas Stations</td>
									<td>${place[1] }</td>
								</tr>
								<tr>
									<td>Pharmacies</td>
									<td>${place[2] }</td>
								</tr>
								<tr>
									<td>Police Stations</td>
									<td>${place[3] }</td>
								</tr>
								<tr>
									<td>Prisons</td>
									<td>${place[4] }</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>


	</div>


	<form action="location">
		<input type="text" id="address"> <input type="hidden" id="lat"
			name="lat"></input> <input type="hidden" id="lng" name="lng"></input>
		<input type="submit" value="Search">
	</form>

	<div id="map"></div>


	<script type="text/javascript">
		function getCoordinates(place) {
			var btn = place.formatted_address;
			var ourRequest = new XMLHttpRequest();
			ourRequest.open("GET",
					"https://maps.googleapis.com/maps/api/geocode/json?address="
							+ btn
							+ "&key=AIzaSyBBv02Hfn1WGHxGSpihcZjOQHiPoK1hG88");

			ourRequest.onload = function() {
				var ourData = JSON.parse(ourRequest.responseText);
				document.getElementById("lat").value = ourData.results[0].geometry.location.lat;
				document.getElementById("lng").value = ourData.results[0].geometry.location.lng;
				return false;
			};
			ourRequest.send();
		}
		
		
		
	</script>
</body>
</html>