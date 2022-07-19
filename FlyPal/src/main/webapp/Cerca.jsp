<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.Viaggio,java.util.ArrayList,model.ViaggioDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FLYPAL</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/home.css">
</head>
<body style="background-color:#fff;">
    <header class="bg-dark">
		<%@ include file="shared/Header.jsp" %>
    </header>
    
  	<div class="container-fluid">
  		<div class="d-flex" style="width:80%; margin:auto; margin-top:20px">
  			<h1>Cerca</h1>
  		</div>
	    <form action="CercaViaggiServlet" method="GET" class="d-flex" style="width:80%; margin:auto; margin-top:20px">
			<input class="form-control me-2" type="search" placeholder="Provincia partenza" aria-label="Search" name="partenza" id="partenza">
			<input class="form-control me-2" type="search" placeholder="Provincia arrivo" aria-label="Search" name="arrivo" id="arrivo">	      
	      <button class="btn btn-outline-success" type="submit">Search</button>
	    </form>
	</div>
	
	<div class="cont">
	<script type="text/javascript">
	</script>
	<div class="row justify-content-center">
   	<% 
   		ArrayList<Viaggio> viaggi = (ArrayList<Viaggio>) request.getAttribute("viaggi");
   		if(viaggi!=null){
   			System.out.println("citta partenza: " + viaggi.get(0).getCitta_p());
   		out.print("<div class=\"row justify-content-center\" style=\"margin-top:20px;\">");
   		for(Viaggio v: viaggi) {
   		   	out.print("<div class=\"col-sm-3 justify-content-center\">");
	   		out.print("<div class=\"card\" style=\"width: 60%;margin:auto;\">");
	   		out.print("<form action=\"detail\" method=\"GET\">");
	   		out.print("<input type=\"image\" src=\""+ v.getUrl() +"\" class=\"card-img-top\" style=\"height: 250px;\" alt=\"\">");
	   		out.print("<input id=\"id\" name=\"id\" value=\"" + v.getId() + "\" style=\"display:none\" \">");
	   		out.print("</form>");
	   		out.print("</div>");
	   		out.print("<div class=\"text-center \" style=\"color:white; margin-top:0%;margin-left:0%;\" >");
	   		out.print("<h6 style=\"color:black;\">" + v.getCitta_p() + " - " + v.getCitta_a() + "</h6>");
	   		out.print("<p style=\"color:black;\">" + v.getOrario_p() + " - " + v.getOrario_a() + "</p>");
	   		out.print("</div>");
	   		out.print("</div>");
   		}
   		out.print("</div>");
   		}

   		%>
	</div>
	
	</div>
	<div style="height:30px;"></div>
	<%@ include file="shared/Footer.jsp" %> 
	
</body>
</html>