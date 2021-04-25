<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Responsive META -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>customers</title>
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
	integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk"
	crossorigin="anonymous">

<link
	href="https://unpkg.com/bootstrap-table@1.18.3/dist/bootstrap-table.min.css"
	rel="stylesheet">

<script
	src="https://unpkg.com/tableexport.jquery.plugin/tableExport.min.js"></script>
<script
	src="https://unpkg.com/bootstrap-table@1.18.3/dist/bootstrap-table.min.js"></script>
<script
	src="https://unpkg.com/bootstrap-table@1.18.3/dist/bootstrap-table-locale-all.min.js"></script>
<script
	src="https://unpkg.com/bootstrap-table@1.18.3/dist/extensions/export/bootstrap-table-export.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
	crossorigin="anonymous"></script>
<link
	href="https://unpkg.com/bootstrap-table@1.18.3/dist/bootstrap-table.min.css"
	rel="stylesheet">
<script
	src="https://unpkg.com/bootstrap-table@1.18.3/dist/bootstrap-table.min.js"></script>


</head>
<body class="bg-warning">
<!-- 	<div class="page"> -->
<!-- 		<div class="content"> -->
			<header>
				<jsp:include page="navbar.jsp"></jsp:include>
			</header>
			
			<div class="container-fluid">
				<c:set var="customers" value="${customers}" scope="session" />
				<div class="table-customerlist">
					<div>
						<table
							class="table table-striped table-hover border border-primary shadow-lg p-3 bg-white rounded "
							data-toggle="table" data-search="true" data-show-columns="true"
							class="display">
							<thead class="table-dark">
								<tr id="tr-id-1" class="tr-class-1  text-center"
									data-title="bootstrap table" data-object='{"key": "value"}'>
									<th rowspan=2 data-field="custId">Id</th>
									<th rowspan=2 data-field="address">Address</th>
									<th rowspan=2 data-field="city">City</th>
									<th rowspan=2 data-field="state">State</th>
									<th rowspan=2 data-field="custTypeCd">Customer type</th>
									<th rowspan=2 data-field="fedId">Customer Fed Id</th>
									<th rowspan=2 data-field="postalCode">Code postal</th>
									<th colspan=2>Action</th>
								</tr>
								<tr id="tr-id-1" class="tr-class-1  text-center"
									data-title="bootstrap table" data-object='{"key": "value"}'>
									<th>Edit</th>
									<th>Delete</th>
								</tr>
							</thead>
							<c:if test="${not empty customers}">
								<c:forEach items="${customers}" var="customer">
									<!-- 							<tbody> -->
									<tr id="tr-id-1" class="tr-class-1"
										data-title="bootstrap table" data-object='{"key": "value"}'>
										<td class="text-center" data-value="${customer.custId}">${customer.custId}<input
											type="checkbox" class="ml-3"></td>
										<td class="text-center" data-value="${customer.address}">${customer.address}</td>
										<td class="text-center" data-value="${customer.city}">${customer.city}</td>
										<td class="text-center" data-value="${customer.state}">${customer.state}</td>
										<td class="text-center" data-value="${customer.custTypeCd}">${customer.custTypeCd}</td>
										<td class="text-center" data-value="${customer.fedId}">${customer.fedId}</td>
										<td class="text-center" data-value="${customer.postalCode}">${customer.postalCode}</td>
										<td class="text-center" data-value="" class="td-actions"><a
											href="updateget?id=${customer.custId}"
											class="btn btn-small btn btn-outline-warning m-n2"
											onclick="return myModif(this.href);"> <i
												class="fas fa-marker"></i></a></td>
										<td class="text-center" data-value="" class="td-actions"><a
											href="delete?id=${customer.custId}"
											class="btn btn-small btn btn-outline-danger m-n2"
											onClick="return myDelete(this.href);"> <i
												class="far fa-trash-alt"></i></a></td>
									</tr>
									<!-- 							</tbody> -->
								</c:forEach>
							</c:if>
						</table>


						<nav class="d-flex justify-content-center" aria-label="...">
							<ul class="pagination">
								<c:if test="${currentPage != 1}">
									<li class="page-item "><a class="page-link"
										href="listcustomer?page=${currentPage - 1}">Précédent</a></li>
								</c:if>
								<c:forEach begin="1" end="${noOfPages}" var="i">
									<li class="page-item"><a class="page-link"
										href="listcustomer?page=${i}">${i}</a></li>
								</c:forEach>
								<c:if test="${currentPage lt noOfPages}">
									<li class="page-item"><a class="page-link"
										href="listcustomer?page=${currentPage + 1}">Suivant</a></li>
								</c:if>
							</ul>
						</nav>
					</div>
				</div>
			</div>

			<footer>
				<jsp:include page="footer.jsp"></jsp:include>
			</footer>
<!-- 		</div> -->
<!-- 	</div> -->
	<script>
		function myModif() {
			var r = confirm("Appuie sur !\n OK or Cancel.\n Souhaitez vous modifier.");
			console.log(r);
			if (r == true) {
				return true;
			} else {
				return false;
			}

		}

		function myDelete() {
			var r = confirm("Appuie sur !\n OK or Cancel.\n Souhaitez vous supprimer.");
			if (r == true) {
				return true;
			} else {
				return false;
			}
		}
	</script>

	<script>
		$('#tableCustomer').dataTable({
			"scrollY" : "450px",
			"scrollCollapse" : true,
			"paging" : true
		});
	</script>


</body>
</html>
