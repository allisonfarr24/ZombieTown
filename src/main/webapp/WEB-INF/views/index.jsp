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

    // When the user selects an address from the dropdown, populate the address
    // fields in the form.
    autocomplete.addListener('place_changed', fillInAddress);
  }

  function fillInAddress() {
    // Get the place details from the autocomplete object.
    var place = autocomplete.getPlace();

  } 
  
  var key;
 
    </script>
</head>
<body>
<input type="text" id="address" />


<script src="https://maps.googleapis.com/maps/api/js?key=
&libraries=places&callback=initAutocomplete" async defer></script>
</body>
</html>