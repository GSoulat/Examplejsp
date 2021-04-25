<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Exemple choose</title>
</head>
<body>
	<h3>CHOOSE</h3>

	<c:choose>
		<c:when test="${param.color eq'yellow'}">
			<h3 style="color:yellow">Message 1</h3>
		</c:when>
		<c:when test="${param.color eq 'red'}">
			<h3 style="color:red">Message 2</h3>
		</c:when>
		<c:when test="${param.color eq 'blue'}">
			<h3 style="color:blue">Message 3</h3>
		</c:when>
		<c:otherwise>
			<h3>Message 4</h3>
		</c:otherwise>

	</c:choose>

</body>
</html>