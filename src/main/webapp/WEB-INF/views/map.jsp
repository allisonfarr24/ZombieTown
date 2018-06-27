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

</script>

<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB6Ye_VKh4Q8ewJl2p7mhvUZafcMN5aWZE
&libraries=places&callback=initMap"
	async defer></script>

<style>
/* Set the size of the div element that contains the map */
#map {
	height: 600px; /* The height is 400 pixels */
 	width: 100%;/* The width is the width of the web page */
}
</style>
</head>
<body>

	<div class="container mt-3">
		<h1 style="text-align: center">Here is the score break-down: ${percent }%</h1>
		<br>
	</div>

<div class="container mt-2">
<div class="row">
<div class="col-4">

<h2>Shelter/Resources</h2>
<a href="/viewdetailsgood2"><button class="btn">View
										Details</button></a>
<table class="table table-hover table-sm">
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
<h2>Danger Zones</h2>
								<a href="/viewdetailsbad2"><button class="btn">View
										Details</button></a>
								<table class="table table-hover table-sm">
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

<div id ="map" class="col-8">
</div>
</div>

</div>


	<a href="/"><button class="btn">Search a New Location</button></a>


</body>
</html>