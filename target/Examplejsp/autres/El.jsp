<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<h3> EL Expression Language </h3>

<h1> inferieur : 7 < 5 est : ${7 < 5}</h1>
<h1> inferieur : 7 != 5 est : ${7 != 5}</h1>
<h1> inférieur  lt  => 7 < 5 est : ${7 lt 5}</h1>
<h1> supérieur gt => : 7 < 5 est : ${7 gt 5}</h1>

<h1> inférieur ou égal => le  => 7 < 5 est : ${7 le 5}</h1>
<h1> supérieur ou égal => ge => : 7 < 5 est : ${7 ge 5}</h1>

<h1> eq  => 1==1 est : ${1 eq 1}</h1>
<h1> ne => : 1 != 1 est : ${1 != 1}</h1>

</body>
</html>