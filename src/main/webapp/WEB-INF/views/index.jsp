<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

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
</head>
<body>

${test }

<form action="location">
<input type="text" id="address">
<input type="text" id="lat" name="lat"></input>
<input type="text" id="lng" name="lng"></input>
<button  onclick="getCoordinates();" type="submit">Search</button>
<button type="submit">Search</button>
</form>

<script src="https://maps.googleapis.com/maps/api/js?key=
&libraries=places&callback=initAutocomplete" async defer></script>
<script type="text/javascript">
function getCoordinates() {
	var btn = document.getElementById("address").value;
	
	
	var ourRequest = new XMLHttpRequest();
	// this will open the connection and allow us to get data
	// first param is what we want to do "GET", second param is the json url
	
	ourRequest.open("GET", "https://maps.googleapis.com/maps/api/geocode/json?address=" + btn + "&key=");

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