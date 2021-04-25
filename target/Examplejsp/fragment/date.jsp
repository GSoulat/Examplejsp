<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page import="java.util.Date" %>
<% Date now = new Date(); 
DateFormat df = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");

%>

<h3> <%=df.format(now) %></h3>