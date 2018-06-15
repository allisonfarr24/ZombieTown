<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script type="text/javascript">
  function initAutocomplete() {
    // Create the autocomplete object, restricting the search to geographical
    // location types.
    autocomplete = new google.maps.places.Autocomplete(
        /** @type {!HTMLInputElement} */(document.getElementById('address')),
        {types: ['geocode']});

    // When the user selects an address from the dropdown, populate the address
    // fields in the form.
    autocomplete.addListener('place_changed', fillInAddress);
  }

  function fillInAddress() {
    // Get the place details from the autocomplete object.
    var place = autocomplete.getPlace();

  }
    </script>
</head>
<body>
<<<<<<< HEAD
<input type="text" id="address" />


<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBBv02Hfn1WGHxGSpihcZjOQHiPoK1hG88
&libraries=places&callback=initAutocomplete" async defer></script>
=======

	<h3>Detroit: lat=42.3361, lng=-83.0510</h3>

	<form action="location">
		Latitude: <input type="number" step="any" name="lat"> <br> <br>
		Longitude: <input type="number" step="any" name="lng"><br> <input
			type="submit" value="Submit">
	</form>

	${test }


>>>>>>> 9611ab5513020e02d1e59a0295285549d4a256b3
</body>
</html>