<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Score Card</title>

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

<link rel="stylesheet" type="text/css" href="css/main.css"></link>

</head>
<body class="text-center">

	<div class="container centered">
	<div class="container">
		<h1>Here is the score break-down:</h1>
	</div>
	<div class="container">
		<table class="table table-dark table-hover">
			<thead  align="center">
				<tr>
					<th align="center">Type of establishment</th>
					<th align="center">Number within a 5 mile radius</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>Hospital</td>
					<td>${place[0] }</td>
				</tr>
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
	</div>
	</div>




</body>
</html>