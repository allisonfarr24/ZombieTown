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
	/* Completes the autocomplete object form google maps 
	 and the parameters are the text input (address) and geocoding*/
	function initAutocomplete() {
		autocomplete = new google.maps.places.Autocomplete((document
				.getElementById("address")), {
			types : [ 'geocode' ]
		});
		
		/* adding an event listener when the user types something we 
		run the fill in address funciton */
		autocomplete.addListener('place_changed', fillInAddress);
	}
	function fillInAddress() {
		var place = autocomplete.getPlace();
		console.log(place);
		getCoordinates();
	}
</script>

<!-- API call for Google Maps Javascript API -->
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB6Ye_VKh4Q8ewJl2p7mhvUZafcMN5aWZE
&libraries=places&callback=initAutocomplete"
	async defer></script>


</head>
<body>
	<div class="centered">
		<div class="container">
			<h1>
				<em>Will You Survive?!</em>
			</h1>
		</div>
		<div class="container mt-5">
			<form class="form-group mt-5" action="location">
				<input required="required" class="form-control form-control-lg" type="text" id="address"
					oninput="getCoordinates();"> <input type="hidden" id="lat"
					name="lat"></input> <input type="hidden" id="lng" name="lng"></input>
					<select name="radius">
					<option value=8045>Code yellow (5 miles to find safety)</option>
					<option value=4827>Code orange (3 miles to find safety)</option>
					<option value=1609>CODE RED (1 mile to find safety)</option>
					</select> <br>
				<input class="btn" type="submit" value="Search">
			</form>
		</div>
	</div>

	<link rel="stylesheet" type="text/css" href="css/main.css"></link>
<body class="text-center">



	<div class="container">
		<h1></h1>
	</div>

	<script type="text/javascript">
		function getCoordinates() {
			var btn = document.getElementById("address").value;
			console.log(btn);
			var ourRequest = new XMLHttpRequest();
			// this will open the connection and allow us to get data
			// first param is what we want to do "GET", second param is the json url

			ourRequest.open("GET",
					"https://maps.googleapis.com/maps/api/geocode/json?address="
							+ btn
							+ "&key=AIzaSyBBv02Hfn1WGHxGSpihcZjOQHiPoK1hG88");

			ourRequest.onload = function() {

				console.log(ourRequest.responseText);
				var ourData = JSON.parse(ourRequest.responseText);
				// renderHTML(ourData);
				document.getElementById("lat").value = ourData.results[0].geometry.location.lat;
				document.getElementById("lng").value = ourData.results[0].geometry.location.lng;
				return true;
			};

			ourRequest.send();
		}
	</script>
</body>


</html>