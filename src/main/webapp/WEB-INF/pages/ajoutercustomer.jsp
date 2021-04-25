<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>Ajouter un customer</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
	integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk"
	crossorigin="anonymous">

</head>
<body class="bg-warning">
	
	<header>
		<jsp:include page="navbar.jsp"></jsp:include>
	</header>
	
	<div class="container d-flex justify-content-center ">
	<form class="row auto shadow-lg p-3 mb-5 bg-white rounded-lg border border-warning" action="save" method="post">
		<div class="col">
		<input class="form-control" type="hidden" name="custId"
			>

		<div class="input-group mb-3 ">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-default">Address</span>
			</div>
			<input type="text" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-default" name="address"
				>
		</div>

		<div class="input-group mb-3 ">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-default">City</span>
			</div>
			<input type="text" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-default" name="city"
				>
		</div>

		<div class="input-group mb-3 " >
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-default">State</span>
			</div>
			<input type="text" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-default" name="state"
				>
		</div>

		<div class="form-check ">
			<input class="form-check-input" type="radio" NAME="custTypeCd"
				VALUE="B" Onclick="function()" id="custtype1"> <label
				class="form-check-label" for="flexRadioDefault1"> Business </label>
		</div>
		<div class="form-check mb-3 ">
			<input class="form-check-input" type="radio" NAME="custTypeCd"
				VALUE="I" Onclick="function()" id="custtype2"> <label
				class="form-check-label" for="flexRadioDefault2"> Individu </label>
		</div>
		
			<div id=toto>
			<div class="input-group mb-3" id="individu">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-default">fedId</span>
			</div>
			<input type="text" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-default" id="individu" name="fedId" placeholder="123-45-6789" pattern="[0-9]{3}-[0-9]{2}-[0-9]{4}">
			</div>
	

<!-- 				<div class="input-group mb-3 " id="business"> -->
<!-- 			<div class="input-group-prepend"> -->
<!-- 				<span class="input-group-text" id="inputGroup-sizing-default">fedId</span> -->
<!-- 			</div> -->
<!-- 			<input type="text" class="form-control" -->
<!-- 				aria-label="Sizing example input" -->
<!-- 				aria-describedby="inputGroup-sizing-default" id="business" name="fedId" placeholder="12-3456789" pattern="[0-9]{2}-[0-9]{7}"> -->
<!-- 			</div> -->
<!-- 			</div> -->
		
			<div class="input-group mb-3 ">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-default">postalCode</span>
			</div>
			<input type="text" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-default" name="postalCode"
			>
		</div>
		<input class="btn btn-outline-success" type="submit" value="sauvegarder">
			</div>			
	</form>
	</div>
			<footer>
				<jsp:include page="footer.jsp"></jsp:include>
			</footer>
	
<script>
var check = function() {
	if (document.getElementById('custtype1').checked) {
// 	    document.getElementById('individualNom').style.display = 'flex';
	    document.getElementById('individu').style.display = 'flex';
// 	    document.getElementById('datei').style.display = 'flex';
	    document.getElementById('business').style.display = 'none';
// 	    document.getElementById('dateb').style.display = 'none';
	} else if (document.getElementById('custtype2').checked) {
	    document.getElementById('individu').style.display = 'none';
// 	    document.getElementById('individualPrenom').style.display = 'none';
// 	    document.getElementById('datei').style.display = 'none';
	    document.getElementById('business').style.display = 'flex';
// 	    document.getElementById('dateb').style.display = 'flex';
</script>	
</body>
</html>
