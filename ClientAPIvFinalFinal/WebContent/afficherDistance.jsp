<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Access-Control-Allow-Origin" content="*">
<meta charset="ISO-8859-1">
<title>Distance</title>
</head>
<body>
	Distance entre les villes sélectionnées :
	<% String distance = request.getSession().getAttribute("distance").toString(); %>
	<%=distance %> km
</body>
</html>

