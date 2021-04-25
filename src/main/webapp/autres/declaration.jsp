<%@ page import="java.util.Date" errorPage="error.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<label for="a"> Entrez 2 chiffres</label>
<form action="#" method="POST">
<input id="input1" type="text" name="a" size="10"><br>
<input id="input2" type="text" name="b" size="10">
<input type="submit" value="add">
</form>


<%! public int sum(int a, int b){
	return a+b;
}
%>

<h2>Somme de l'addition : 
<%= sum(15,3) %>

<%
	String a= (request.getParameter("a") ==null || request.getParameter("a").equals(""))?"0":request.getParameter("a");
	String b= (request.getParameter("b") ==null || request.getParameter("b").equals(""))?"0":request.getParameter("b");
	out.println(a + "," +b + " = ");
%>
<%= sum(Integer.parseInt(a),Integer.parseInt(b)) %>



</h2>



</body>
</html>