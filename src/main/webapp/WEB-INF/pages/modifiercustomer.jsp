<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Modifier un customer</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
	integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk"
	crossorigin="anonymous">
</head>
<body class="bg-warning">
	<%@page import="fr.formation.afpa.domain.Customer"%>
	<%@page import="fr.formation.afpa.service.CustomerService"%>
	<header>
		<jsp:include page="navbar.jsp"></jsp:include>
	</header>

	<div class="container d-flex justify-content-center ">

		<form
			class="row auto shadow-lg p-3 mb-5 bg-white rounded-lg border border-warning"
			action="update" method="post">
			<div class="col">
				<input class="form-control" type="hidden" name="custId"
					value="${customer.custId}">

				<div class="input-group mb-3 ">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroup-sizing-default">Address</span>
					</div>
					<input type="text" class="form-control"
						aria-label="Sizing example input"
						aria-describedby="inputGroup-sizing-default" name="address"
						value="${customer.address}">
				</div>

				<div class="input-group mb-3 ">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroup-sizing-default">City</span>
					</div>
					<input type="text" class="form-control"
						aria-label="Sizing example input"
						aria-describedby="inputGroup-sizing-default" name="city"
						value="${customer.city}">
				</div>

				<div class="input-group mb-3 ">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroup-sizing-default">State</span>
					</div>
					<input type="text" class="form-control"
						aria-label="Sizing example input"
						aria-describedby="inputGroup-sizing-default" name="state"
						value="${customer.state}">
				</div>

				<div class="form-check ">
					<input class="form-check-input" type="radio" NAME="custTypeCd"
						VALUE="B" ${customer.custTypeCd=='B'?'checked':''}
						Onclick="myFunction()"> <label class="form-check-label"
						for="flexRadioDefault1"> Business </label>
				</div>
				<div class="form-check mb-3 ">
					<input class="form-check-input" type="radio" NAME="custTypeCd"
						VALUE="I" ${customer.custTypeCd=='I'?'checked':''}
						Onclick="myFunction()"> <label class="form-check-label"
						for="flexRadioDefault2"> Individu </label>
				</div>

				<div id="myDIVc">
					<c:if test="${customer.custTypeCd=='I'}">
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text" id="inputGroup-sizing-default">fedId</span>
							</div>
							<input type="text" class="form-control"
								aria-label="Sizing example input"
								aria-describedby="inputGroup-sizing-default" name="fedId"
								value="${customer.fedId}" placeholder="123-45-6789"
								pattern="[0-9]{3}-[0-9]{2}-[0-9]{4}">
						</div>
					</c:if>
					<c:if test="${customer.custTypeCd=='B'}">
						<div class="input-group mb-3 " id="myDIVb">
							<div class="input-group-prepend">
								<span class="input-group-text" id="inputGroup-sizing-default">fedId</span>
							</div>
							<input type="text" class="form-control"
								aria-label="Sizing example input"
								aria-describedby="inputGroup-sizing-default" name="fedId"
								value="${customer.fedId}" placeholder="12-3456789"
								pattern="[0-9]{2}-[0-9]{7}">
						</div>
					</c:if>
				</div>

				<div class="input-group mb-3" id="myDIVi">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroup-sizing-default">fedId</span>
					</div>
					<input type="text" class="form-control"
						aria-label="Sizing example input"
						aria-describedby="inputGroup-sizing-default" name="fedId"
						placeholder="123-45-6789" pattern="[0-9]{3}-[0-9]{2}-[0-9]{4}">
				</div>


				<div class="input-group mb-3 " id="myDIVb">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroup-sizing-default">fedId</span>
					</div>
					<input type="text" class="form-control"
						aria-label="Sizing example input"
						aria-describedby="inputGroup-sizing-default" name="fedId"
						placeholder="12-3456789" pattern="[0-9]{2}-[0-9]{7}">
				</div>


				<div class="input-group mb-3 ">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroup-sizing-default">postalCode</span>
					</div>
					<input type="text" class="form-control"
						aria-label="Sizing example input"
						aria-describedby="inputGroup-sizing-default" name="postalCode"
						value="${customer.postalCode}">
				</div>
				<input class="btn btn-outline-success" type="submit"
					value="modifier">
			</div>
		</form>
	</div>
			<footer>
				<jsp:include page="footer.jsp"></jsp:include>
			</footer>

	<script>
		function myFunction() {
			var i = document.getElementById('myDIVi');
			var b = document.getElementById('myDIVb');
			var c = document.getElementById('myDIVc');
			if (i.style.visibility === 'hidden') {
				i.style.visibility = 'visible';
				b.style.visibility = 'hidden';
				c.style.visibility = 'hidden';
			} else {
				i.style.visibility = 'hidden';
				b.style.visibility = 'visible';
				c.style.visibility = 'hidden';
			}
		}
	</script>
</body>
</html>
