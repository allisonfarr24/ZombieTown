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

<link rel="stylesheet" type="text/css" href="css/scorecard.css"></link>

<script>
var map, infoWindow;
function initMap() {

	 var myLatLng1 = {lat: ${lat}, lng: ${lng}};
	var myLatLng =  ${locations};
	var myLatLngBad = ${badstuff};
	

	
	
	   var style = [
		    {
		        "featureType": "all",
		        "elementType": "geometry.fill",
		        "stylers": [
		            {
		                "visibility": "on"
		            },
		            {
		                "color": "#a81e1e"
		            }
		        ]
		    },
		    {
		        "featureType": "all",
		        "elementType": "labels.text.fill",
		        "stylers": [
		            {
		                "saturation": 36
		            },
		            {
		                "color": "#000000"
		            },
		            {
		                "lightness": 40
		            }
		        ]
		    },
		    {
		        "featureType": "all",
		        "elementType": "labels.text.stroke",
		        "stylers": [
		            {
		                "visibility": "on"
		            },
		            {
		                "color": "#000000"
		            },
		            {
		                "lightness": 16
		            }
		        ]
		    },
		    {
		        "featureType": "all",
		        "elementType": "labels.icon",
		        "stylers": [
		            {
		                "visibility": "off"
		            }
		        ]
		    },
		    {
		        "featureType": "administrative",
		        "elementType": "geometry.fill",
		        "stylers": [
		            {
		                "color": "#000000"
		            },
		            {
		                "lightness": 20
		            }
		        ]
		    },
		    {
		        "featureType": "administrative",
		        "elementType": "geometry.stroke",
		        "stylers": [
		            {
		                "color": "#000000"
		            },
		            {
		                "lightness": 17
		            },
		            {
		                "weight": 1.2
		            }
		        ]
		    },
		    {
		        "featureType": "landscape",
		        "elementType": "all",
		        "stylers": [
		            {
		                "visibility": "simplified"
		            }
		        ]
		    },
		    {
		        "featureType": "landscape",
		        "elementType": "geometry",
		        "stylers": [
		            {
		                "color": "#000000"
		            },
		            {
		                "lightness": 20
		            }
		        ]
		    },
		    {
		        "featureType": "landscape",
		        "elementType": "geometry.fill",
		        "stylers": [
		            {
		                "visibility": "simplified"
		            },
		            {
		                "color": "#b53838"
		            }
		        ]
		    },
		    {
		        "featureType": "landscape.man_made",
		        "elementType": "geometry.fill",
		        "stylers": [
		            {
		                "visibility": "on"
		            },
		            {
		                "color": "#953030"
		            }
		        ]
		    },
		    {
		        "featureType": "poi",
		        "elementType": "geometry",
		        "stylers": [
		            {
		                "color": "#000000"
		            },
		            {
		                "lightness": 21
		            }
		        ]
		    },
		    {
		        "featureType": "road.highway",
		        "elementType": "geometry.fill",
		        "stylers": [
		            {
		                "color": "#301313"
		            },
		            {
		                "lightness": 17
		            }
		        ]
		    },
		    {
		        "featureType": "road.highway",
		        "elementType": "geometry.stroke",
		        "stylers": [
		            {
		                "color": "#000000"
		            },
		            {
		                "lightness": 29
		            },
		            {
		                "weight": 0.2
		            },
		            {
		                "visibility": "off"
		            }
		        ]
		    },
		    {
		        "featureType": "road.highway",
		        "elementType": "labels.text",
		        "stylers": [
		            {
		                "visibility": "simplified"
		            },
		            {
		                "lightness": "54"
		            },
		            {
		                "color": "#ffb9b9"
		            }
		        ]
		    },
		    {
		        "featureType": "road.arterial",
		        "elementType": "geometry",
		        "stylers": [
		            {
		                "color": "#000000"
		            },
		            {
		                "lightness": 18
		            }
		        ]
		    },
		    {
		        "featureType": "road.arterial",
		        "elementType": "geometry.fill",
		        "stylers": [
		            {
		                "color": "#461313"
		            }
		        ]
		    },
		    {
		        "featureType": "road.arterial",
		        "elementType": "geometry.stroke",
		        "stylers": [
		            {
		                "visibility": "off"
		            },
		            {
		                "color": "#8d2828"
		            }
		        ]
		    },
		    {
		        "featureType": "road.arterial",
		        "elementType": "labels.text",
		        "stylers": [
		            {
		                "visibility": "simplified"
		            },
		            {
		                "color": "#ffd7d7"
		            }
		        ]
		    },
		    {
		        "featureType": "road.local",
		        "elementType": "geometry",
		        "stylers": [
		            {
		                "color": "#000000"
		            },
		            {
		                "lightness": 16
		            }
		        ]
		    },
		    {
		        "featureType": "road.local",
		        "elementType": "geometry.fill",
		        "stylers": [
		            {
		                "color": "#461313"
		            }
		        ]
		    },
		    {
		        "featureType": "road.local",
		        "elementType": "geometry.stroke",
		        "stylers": [
		            {
		                "visibility": "off"
		            }
		        ]
		    },
		    {
		        "featureType": "road.local",
		        "elementType": "labels.text",
		        "stylers": [
		            {
		                "visibility": "simplified"
		            },
		            {
		                "color": "#ffb2b2"
		            }
		        ]
		    },
		    {
		        "featureType": "transit",
		        "elementType": "geometry",
		        "stylers": [
		            {
		                "color": "#000000"
		            },
		            {
		                "lightness": 19
		            }
		        ]
		    },
		    {
		        "featureType": "water",
		        "elementType": "geometry",
		        "stylers": [
		            {
		                "color": "#000000"
		            },
		            {
		                "lightness": 17
		            }
		        ]
		    }
		]
	  var map = new google.maps.Map(document.getElementById('map'), {
	    zoom: 15,
	    center: myLatLng1,
	  });
	  map.setOptions({styles: style});
	  
		
	  
	  
	    var infowindow = new google.maps.InfoWindow();
	    var marker, i;
	    
	    for (i = 0; i < myLatLng.length; i++) { 
	    	
	      marker = new google.maps.Marker({
	        position: new google.maps.LatLng(myLatLng[i][1], myLatLng[i][2]),
	        map: map,
	        animation: google.maps.Animation.DROP
	      });
	        marker.setIcon('http://maps.google.com/mapfiles/ms/icons/green-dot.png');

	      google.maps.event.addListener(marker, 'click', (function(marker, i) {
	        return function() {
	          infowindow.setContent(myLatLng[i][0]);
	          infowindow.open(map, marker);
	        }
	        
	      })(marker, i));
	      
	    } 
	    for (i = 0; i < myLatLngBad.length; i++) { 
	    	
		      marker = new google.maps.Marker({
		        position: new google.maps.LatLng(myLatLngBad[i][1], myLatLngBad[i][2]),
		        map: map,
		        animation: google.maps.Animation.DROP
		      });
		      marker.setIcon('http://maps.google.com/mapfiles/ms/icons/purple-dot.png');
		      
		      google.maps.event.addListener(marker, 'click', (function(marker, i) {
		        return function() {
		          infowindow.setContent(myLatLngBad[i][0]);
		          infowindow.open(map, marker);
		        }
		        
		      })(marker, i));
		      
		    }
	    marker = new google.maps.Marker({
	        position: new google.maps.LatLng(myLatLng1),
	        map: map
	      });
	      

	      google.maps.event.addListener(marker, 'click', (function(marker, i) {
	        return function() {
	          infowindow.setContent('Home Location');
	          infowindow.open(map, marker);
	        }
	        
	      })(marker, i));
	    initAutocomplete();
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
		<h1 style="text-align: center">You have a ${percent }% chance of survival!</h1>
		<br>
		<p>Your score is calculated using a formula we created
		that takes into account your proximity to certain establishments.
		Being near certain places may increase or decrease your odds of 
		survival, depending on the type of establishment and how many are
		within the specified radius.</p>
	</div>

<div class="container mt-2">
<div class="row">
<div class="col-4">

<h2>Shelter/Resources</h2>
<a href="/viewdetailsgood2"><button class="btn">View
										Details</button></a><br>
<br><table class="table table-hover table-sm">
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
										Details</button></a><br>
								<br><table class="table table-hover table-sm">
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

<a href="/"><button class="btn">Search a New Location</button></a>

</div>

<div id ="map" class="col-8">
</div>
</div>

</div>




</body>
</html>