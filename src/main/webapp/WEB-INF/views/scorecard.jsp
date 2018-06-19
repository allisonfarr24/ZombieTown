<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Score Card</title>
</head>
<body>


	<h1>Here is the score break-down:</h1>

	<table border="1">
		<thead>
			<tr>
				<th>Type of establishment</th>
				<th>Number within a 5 mile radius</th>

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





</body>
</html>