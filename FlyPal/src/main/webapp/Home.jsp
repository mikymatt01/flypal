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
    <header>
		<%@ include file="shared/Header.jsp" %>
	
        <div id="introCarousel" class="carousel slide carousel-fade shadow-2-strong" data-mdb-ride="carousel">


        <div class="carousel-inner">

          <div class="carousel-item active">
            <div class="d-flex h-100 text-white align-items-center justify-content-center">
	            <div class="container">
	            	<h1 class="text-center display-4"><strong>FlyPal</strong></h1>
	            	<h4 class="text-center display-4">Viaggia sicuro a cazzo duro</h4>
		        </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Carousel wrapper -->
    </header>
    
	<div class="cont">
	<div class="row justify-content-center">
	<div class="mt-5 row text-center">
		<h1 id="offerte">
	           <strong>Offerte su misura per te</strong>
	    </h1>
   	</div>
   	<% 
   		ArrayList<Viaggio> viaggi = new ViaggioDAO().select();
   		for(Viaggio v: viaggi) {
   		out.print("<div class=\"col-sm-3 mt-4\">");
   		out.print("<div class=\"card\" style=\"width: 60%;\">");
   		out.print("<form action=\"detail\" method=\"GET\">");
   		out.print("<input type=\"image\" src=\""+ v.getUrl() +"\" class=\"card-img-top\" style=\"height: 250px;\" alt=\"\">");
   		out.print("<input id=\"id\" name=\"id\" value=\"" + v.getId() + "\" style=\"display:none\" \">");
   		out.print("</form>");
   		out.print("</div>");
   		out.print("<div style=\"color:white; margin-top:0%;margin-left:0%;\" >");
   		out.print("<h6 style=\"color:black;\">" + v.getCitta_p() + " - " + v.getCitta_a() + "</h6>");
   		out.print("<p style=\"color:black;\">" + v.getOrario_p() + " - " + v.getOrario_a() + "</p>");
	    out.print("</div>");
	    out.print("</div>");
   	}%>
	</div>
	
	</div>
	<div style="width:20px;"></div>
	<%@ include file="shared/Footer.jsp" %> 
	
</body>
</html>