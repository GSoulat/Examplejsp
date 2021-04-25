<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1> out : javax.servlet.jsp.JspWriter</h1>
<% for(int i=0; i<4 ; i++){
	out.println("i = " + i +"<br>");	
	
}%>
<!-- ----------------------------------------------------------------------------------------------- -->
<h1> Request : javax.servlet.http.HttpServletResquest</h1>
<%
String ServerName = request.getServerName();
%>

<%=ServerName %>

<h1> Response : javax.servlet.http.HttpServletResponse</h1>
<%
	response.sendRedirect("http://google.com");
%>

</body>
</html>