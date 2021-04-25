<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% for(int i=0; i<20; i++){

	if (i==5){
		%> <h1>HELLO JSP N=5</h1><% }%>
	}
%> <h1>HELLO JSP</h1><% }%>

<% 
Date date = new Date();
%>

<h2>la date aujourd'hui <%= date.toString() %></h2>

</body>
</html>