<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Details Page</title>
</head>
<body>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
    box-sizing: border-box;
}


.column {
    float: left;
    width: 50%;
    padding: 10px;
    height: 300px; 



.row:after {
    content: "";
    display: table;
    clear: both;
}
</style>
</head>
<body>

  <h2>Danger Zone</h2>

<div class="row">
  <div class="column">
    <h2>Hospitals</h2>
    <p>Hospitals are certain to be over-populated by the infected, and
		are therefore a very risky place to go when under attack. You may
		think a hospital would be a good place to get medical supplies, but
		the risks of becoming infected certainly outweigh the benefits.
		Pharmacies or Private Practices would be a better choice because they
		carry a lot of the same supplies with a much lower risk.</p>
  </div>
  <div class="column">
    <h2>Casinos</h2>
    <p>Money will get you nowhere right now!</p>
  </div>
</div>
<tr>
   <div class="column">
    <h2>Stadiums</h2>
    <p>Stadiums may be perhaps the worst choice of places to go in
		terms of seeking shelter. They contain a lot of smaller places inside
		one large establishment - perfect for catching you off guard.</p>
  </div>
</div>
   <div class="column">
    <h2>Shopping Malls</h2>
    <p>Think a shopping mall is a good place to take shelter? Well, so
		is everyone else! So, you may want to think again. Malls will quickly
		become populated with potentially infected people, and with so many
		people in a confined area, you may not be as safe as you think.</p>
  </div>
</div>

</body>
</html>