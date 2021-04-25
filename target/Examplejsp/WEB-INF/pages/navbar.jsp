<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<header class="text-center p-1 bg-dark text-white mb-1">
		<div>
			<h1>
				Gestions des customers <a
					class="btn btn-small btn btn-outline-danger float-right"
					href="logout"><i class="fas fa-sign-out-alt"></i></a>
			</h1>
		</div>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="collapse navbar-collapse " id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto d-flex justify-content-between">
					<li class="nav-item ml-3"><a class="nav-link" href="listcustomer"><i class="fas fa-house-user btn btn-small btn btn-outline-primary m-n2 "></i></a></li>
					<li class="nav-item ml-3"><a class="nav-link" href="insertget"><i class="fas fa-plus btn btn-small btn btn-outline-primary m-n2 ">Ajouter</i></a></li>
					<li class="nav-item ml-3"><a class="nav-link" href="listcustomer"><i class="fas fa-clipboard-list btn btn-small btn btn-outline-primary m-n2">Liste</i></a></li>
					<li class="nav-item ml-3"><a class="nav-link" href="pdfExport"><i
							class="far fa-file-pdf btn btn-small btn btn-outline-danger m-n2"></i></a></li>
					<li class="nav-item ml-3"><a class="nav-link" href="xlsExport"><i
							class="far fa-file-excel btn btn-small btn btn-outline-success m-n2 "></i></a></li>
				</ul>
			</div>
		</nav>
	</header>
</body>
</html>