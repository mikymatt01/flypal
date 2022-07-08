<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FLYPAL</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/home.css">
</head>
<body style="background-color:#fff;">
	
	<%@ include file="shared/Header.jsp" %>
	
	<div class="cont">
	<div class="row justify-content-center">
	<div class="mt-5 row text-center">
		<h1 id="offerte">
	           <strong>Offerte su misura per te</strong>
	    </h1>
   	</div>
   	<% for(int i=0;i<5;i++) {
   		out.print("<div class=\"col-sm-3 mt-4\">");
   		out.print("<div class=\"card\" style=\"width: 100%;\">");
   		out.print("<img src=\"https://th.bing.com/th/id/OIP.IBqw83F6Nl5fvYPKErhkHAHaEo?w=246&h=180&c=7&r=0&o=5&pid=1.7\" class=\"card-img-top\" style=\"height: 250px;\" alt=\"\">");
   		out.print("<div style=\"position:absolute;color:white; margin-top:5%;margin-left:5%;\" >");
   		out.print("<h5 class=\"card-title\">Card title</h5>");
   		out.print("<p class=\"card-text\">10 posti</p>");
   		out.print("<a href=\"detail\" class=\"btn btn-primary\">Go somewhere</a>");
	    out.print("</div>");
	    out.print("</div>");
	    out.print("</div>");    	
   	}%>
	</div>
	</div>
	<%@ include file="shared/Footer.jsp" %> 
	
</body>
</html>