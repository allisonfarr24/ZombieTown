<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
    crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="css/bad.css"></link>
<title>Details Page</title>
</head>
<body>
	
</head>
<body>

  <h1 align ="center">Danger Zones</h1>
<div class="container">
<div class="row">
  <div class="column">
    <br><h2>Hospitals</h2>
    <p>Hospitals are certain to be over-populated by the infected, and
		are therefore a very risky place to go when under attack. You may
		think a hospital would be a good place to get medical supplies, but
		the risks of becoming infected certainly outweigh the benefits.
		Pharmacies or Private Practices would be a better choice because they
		carry a lot of the same supplies with a much lower risk.</p><br>
		<table border="1">
				<thead>
					<tr>
						<th>Name</th>
						<th>Distance in miles</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="hospital" items="${hospital }">
						<tr>
							<td>${hospital.name }</td>
							<td>${hospital.distance }</td>
						</tr>

					</c:forEach>
				</tbody>
			</table>
  </div>
  <div class="column">
   <br> <h2>Casinos</h2>
    <p>Money will get you nowhere right now!</p><br>
    <table border="1">
				<thead>
					<tr>
						<th>Name</th>
						<th>Distance in miles</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="casino" items="${casino }">
						<tr>
							<td>${casino.name }</td>
							<td>${casino.distance }</td>
						</tr>

					</c:forEach>
				</tbody>
			</table>
  </div>


   <div class="column">
    <br><h2>Stadiums</h2>
    <p>Stadiums may be perhaps the worst choice of places to go in
		terms of seeking shelter. They contain a lot of smaller places inside
		one large establishment - perfect for zombies to catch their prey off guard.</p><br>
		<table border="1">
				<thead>
					<tr>
						<th>Name</th>
						<th>Distance in miles</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="stadium" items="${stadium }">
						<tr>
							<td>${stadium.name }</td>
							<td>${stadium.distance }</td>
						</tr>

					</c:forEach>
				</tbody>
			</table>
  </div>

   <div class="column">
    <br><h2>Shopping Malls</h2>
    <p>Thinking a shopping mall is a good place to take shelter? Well, so
		is everyone else! So, you may want to think again. Malls will quickly
		become populated with potentially infected people, and with so many
		people in a confined area, you may not be as safe as you think.</p><br>
		<table border="1">
				<thead>
					<tr>
						<th>Name</th>
						<th>Distance in miles</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="mall" items="${mall }">
						<tr>
							<td>${mall.name }</td>
							<td>${mall.distance }</td>
						</tr>

					</c:forEach>
				</tbody>
			</table>
			
			<a href="/viewmap"><button class="btn">View Map</button></a>
  </div>
</div>
</div>
<<<<<<< HEAD
<div style="text-align: center">
	<a href="/viewmap"><button class="btn">View Map</button></a>
		<a href="/"><button class="btn">Search a New Location</button></a><br>
</div>
=======

>>>>>>> 16d1a8b47f248a95a7ac4b9cafb49d5a83327461

</body>
</html>