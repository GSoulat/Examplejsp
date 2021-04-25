<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h3>List Customer : forEach</h3>
	
	<c:if test="${5 == 6}">
	<h4> test if</h4>
	</c:if>
	
	<table>
		<tr>
			<th>custId</th>
			<th>Address</th>
			<th>city</th>
			<th>state</th>
		</tr>
		<c:if test="${not empty customers}">
			<c:forEach items="${customers}" var="customer">
				<tr>
					<td>${customer.custId}</td>
					<td>${customer.address}</td>
					<td>${customer.city}</td>
					<td>${customer.state}</td>
					<c:if test="${not empty customer.comptes}">
						<c:forEach items="${customer.comptes}" var="compte">
							<td>${compte.login}</td>
							<td>${compte.password}</td>
						</c:forEach>
					</c:if>
				</tr>
			</c:forEach>
		</c:if>
	</table>

</body>
</html>