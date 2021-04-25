<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="customer" class="fr.formation.afpa.domain.Customer"></jsp:useBean>

<h3> Hello Customer </h3>
<jsp:setProperty property="address" name="customer" value="Rue de la paix"/>
<jsp:getProperty property="addressComplete" name="customer"/>




</body>
</html>