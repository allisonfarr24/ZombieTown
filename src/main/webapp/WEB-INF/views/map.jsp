<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
    crossorigin="anonymous">

<script>
var map, infoWindow;
function initMap() {

	 var myLatLng1 = {lat: ${lat}, lng: ${lng}};
	var myLatLng =  ${locations};
	

	
	
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
	    } initAutocomplete();
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
	height: 600px; /* The height is 400 pixels */
	width: 800px; /* The width is the width of the web page */
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">

			<div class="col">
				<div class="container centered">
					<div class="container">
						<h1>Here is the score break-down:</h1>
						<h1>${percent }%</h1>
						<h2>${tester}</h2>
						<br>
					</div>
						<h2>Shelter/Resources</h2>
						<a href="/viewdetailsgood"><button class="btn">View Details</button></a>
					<div class="container">
						<table class="table table-dark table-hover">
							<thead align="center">
							<tr>
			
							</tr>
								<tr>
									<th align="center">Type of establishment</th>
									<th align="center">Number within specified radius</th>
								</tr>
							</thead>
							<tbody>
								<tr>
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
					<br><br>
					
					<h2>Danger Zones</h2>
					<a href="/viewdetailsbad"><button class="btn">View Details</button></a>
					<div class="container">
						<table class="table table-dark table-hover">
							<thead align="center">
							<tr>
							
							</tr>
							
								<tr>
									<th align="center">Type of establishment</th>
									<th align="center">Number within specified radius</th>
								</tr>
							</thead>
							<tbody>
								<tr>
								<tr>
									<td>Hospitals</td>
									<td>${place[0] }</td>
								</tr>
								<tr>
									<td>Casinos</td>
									<td>${place[5] }</td>
								</tr>
								<tr>
									<td>Shopping Malls</td>
									<td>${place[6] }</td>
								</tr>
								<tr>
									<td>Stadiums</td>
									<td>${place[7] }</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					
					
				</div>
			</div>
			<div class="col">
				<div id="map"></div>
			</div>
		</div>


	</div>

<br><a href="/"><button class="btn">Search a New Location</button></a>


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