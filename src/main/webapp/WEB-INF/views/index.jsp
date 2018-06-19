<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- The is for auto complete -->
<script type="text/javascript">
 function initAutocomplete() {
    autocomplete = new google.maps.places.Autocomplete(
        (document.getElementById('address')),
        {types: ['geocode']});


    autocomplete.addListener('place_changed', fillInAddress);
  }

  function fillInAddress() {
   
    var place = autocomplete.getPlace();

  } 
  
 
    </script>
    
    <style>
    .center-screen {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  text-align: center;
  min-height: 100vh;
}

.centered {
  position: fixed;
  top: 50%;
  left: 50%;
  /* bring your own prefixes */
  transform: translate(-50%, -50%);
}
    </style>
    
</head>
<body class="text-center">
<div class="centered">
<form class="form-group form-inline" action="location" >
<input class="form-control form-control-lg" type="text" id="address" oninput="getCoordinates();">
<input type="hidden" id="lat" name="lat"></input>
<input type="hidden" id="lng" name="lng"></input>
<input class="btn" type="submit" value="Search">
</form>
</div>
<!-- this the key for auto complete -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBBv02Hfn1WGHxGSpihcZjOQHiPoK1hG88
&libraries=places&callback=initAutocomplete" async defer></script>
<!-- this is to get the getCoordinates to send data to our location -->
<script type="text/javascript">
function getCoordinates() {
	var btn = document.getElementById("address").value;
	
	
	var ourRequest = new XMLHttpRequest();
	// this will open the connection and allow us to get data
	// first param is what we want to do "GET", second param is the json url
	
	ourRequest.open("GET", "https://maps.googleapis.com/maps/api/geocode/json?address=" + btn + "&key=AIzaSyBBv02Hfn1WGHxGSpihcZjOQHiPoK1hG88");

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