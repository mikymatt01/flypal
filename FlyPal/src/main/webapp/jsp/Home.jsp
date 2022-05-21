<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body class="bg-light">
	<%@ include file="header.jsp" %> 
	<div class="row justify-content-center">
	<div class="mt-5 row text-center">
		<h1 id="offerte">
	           <strong>Offerte su misura per te</strong>
	    </h1>
   	</div>
   	<% for(int i=0;i<5;i++) {
   		out.print("<div class=\"col-sm-3 mt-4\">");
   		out.print("<div class=\"shadow-lg card\" style=\"width: 90%;\">");
   		out.print("<img src=\"https://th.bing.com/th/id/OIP.IBqw83F6Nl5fvYPKErhkHAHaEo?w=246&h=180&c=7&r=0&o=5&pid=1.7\" class=\"card-img-top\" alt=\"\">");
   		out.print("<div class=\"card-body\">");
   		out.print("<h5 class=\"card-title\">Card title</h5>");
   		out.print("<p class=\"card-text\">Some quick example text to build on the card title and make up the bulk of the card\'s content.</p>");
   		out.print("<a href=\"#\" class=\"btn btn-primary\">Go somewhere</a>");
	    out.print("</div>");
	    out.print("</div>");
	    out.print("</div>");    	
   	}%>
	</div>
	
	<%@ include file="footer.jsp" %> 
	
</body>
</html>