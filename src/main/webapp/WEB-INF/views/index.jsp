<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>

<html>
<head>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- The is for auto complete -->



<script>
	var map, infoWindow;
    function initMap() {
    	 var myLatLng = {lat: 42.3359526, lng: -83.04977190000001};	
    	

    	  var map = new google.maps.Map(document.getElementById('map'), {
    	    zoom: 15,
    	    center: myLatLng
    	  });

    	  var marker = new google.maps.Marker({
    	    position: myLatLng,
    	    map: map,
    	    title: 'Hello World!'
    	  }); initAutocomplete();
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
			<h1>
				<em>Will You Survive?!</em>
			</h1>
		</div>
	<div class="container mt-5">
		<form class="form-group mt-5" action="location">
			<input class="form-control form-control-lg" type="text" id="address"
				oninput="getCoordinates();"> <input type="hidden" id="lat"
				name="lat"></input> <input type="hidden" id="lng" name="lng"></input>
			<input class="btn" type="submit" value="Search">
		</form>
	</div>

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

<link rel="stylesheet" type="text/css" href="css/main.css"></link>
<script type="text/javascript">
	function initAutocomplete() {
		autocomplete = new google.maps.places.Autocomplete((document
				.getElementById('address')), {
			types : [ 'geocode' ]
		});

		autocomplete.addListener('place_changed', fillInAddress);
	}

	function fillInAddress() {

		var place = autocomplete.getPlace();

	}
</script>
</head>
<body class="text-center">

	<div class="centered">

		<div class="container">
			<h1>
				<em>Will You Survive?!</em>
			</h1>
		</div>

		<div class="container">
			<form class="form-group form-inline" action="location">
				<input class="form-control form-control-lg" type="text" id="address"
					oninput="getCoordinates();"> <input type="hidden" id="lat"
					name="lat"></input> <input type="hidden" id="lng" name="lng"></input>
				<input class="btn" type="submit" value="Search">
			</form>
		</div>
	</div>
	<!-- this the key for auto complete -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBBv02Hfn1WGHxGSpihcZjOQHiPoK1hG88
&libraries=places&callback=initAutocomplete"
		async defer></script>
	<!-- this is to get the getCoordinates to send data to our location -->
	<script type="text/javascript">
		function getCoordinates() {
			var btn = document.getElementById("address").value;

			var ourRequest = new XMLHttpRequest();
			// this will open the connection and allow us to get data
			// first param is what we want to do "GET", second param is the json url

			ourRequest.open("GET",
					"https://maps.googleapis.com/maps/api/geocode/json?address="
							+ btn
							+ "&key=AIzaSyBBv02Hfn1WGHxGSpihcZjOQHiPoK1hG88");

			ourRequest.onload = function() {

				// console.log(ourRequest.responseText);
				var ourData = JSON.parse(ourRequest.responseText);
				//renderHTML(ourData);
				document.getElementById("lat").value = ourData.results[0].geometry.location.lat;
				document.getElementById("lng").value = ourData.results[0].geometry.location.lng;
				return true;
			};

			ourRequest.send();

		}
	</script>
</body>
</html>