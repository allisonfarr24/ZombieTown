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

<title>Details Page</title>
</head>
<body>

	<!-- <!-- <meta name="viewport" content="width=device-width, initial-scale=1">
	<style> -->
<!-- * {
	box-sizing: border-box;
}

/* .column {
	float: left;
	width: 50%;
	padding: 10px;
	height: 300px; .
	row: after{
    content: "";
	display: table;
	clear: both;
} */ -->
<!-- </style>  -->
</head>
<body>

	<h1 align="center">Shelter and Resources</h1>

<div class="container">
	<div class="row">
		<div class="column">
			<br><h2>Pharmacies</h2>
			<p>Pharmacies are more likely more than just medical supplies.
				They're also a great source of food without all the people that a
				hospital would have</p><br>
			<table border="1">
				<thead>
					<tr>
						<th>Name</th>
						<th>Distance in miles</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="pharm" items="${pharm }">
						<tr>
							<td>${pharm.name }</td>
							<td>${pharm.distance }</td>
						</tr>

					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="column">
			<br><h2>Prisons</h2>
			<p>Although built to keep people in, they will also keep zombies
				out. So their a great source of shelter, will provide plenty food,
				and likely to have strong resourceful survivors.</p><br>
				<table border="1">
				<thead>
					<tr>
						<th>Name</th>
						<th>Distance in miles</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="prison" items="${prison }">
						<tr>
							<td>${prison.name }</td>
							<td>${prison.distance }</td>
						

					</c:forEach>
				</tbody>
			</table>
		</div>

	
		<div class="column">
			<br><h2>Police</h2>
			<p>The first line of defense is likely to be abandoned. Officers
				have an obligation to their families before the the public. So the
				armory will be unprotected.</p> <br>
				<table border="1">
				<thead>
					<tr>
						<th>Name</th>
						<th>Distance in miles</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="police" items="${police }">
						<tr>
							<td>${police.name }</td>
							<td>${police.distance }</td>
						</tr>

					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div class="column">
			<br><h2>Gas Stations</h2>
			<p>Gasoline and oil is a valuable resource that's easily
				obtained. It's never anyone's first priority, but their most
				valuable resource.</p><br>
				<table border="1">
				<thead>
					<tr>
						<th>Name</th>
						<th>Distance in miles</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="gas" items="${gas }">
						<tr>
							<td>${gas.name }</td>
							<td>${gas.distance }</td>
						</tr>

					</c:forEach>
				</tbody>
			</table>
		</div>
		</div>
		</div>
			<a href="/viewmap"><button class="btn">View Map</button></a>
</body>
</html>