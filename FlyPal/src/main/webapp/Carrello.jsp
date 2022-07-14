<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.Viaggio, java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"><script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>

<%@ include file="shared/HeaderOtherPage.jsp" %>
<!-- Navbar -->
		<script type="text/javascript">
			function exit() {
			    window.location = 'home';
			}
		</script>
   		<table class="table">
      	  <thead>
      	    <tr>
      	      <th scope="col">immagine</th>
      	      <th scope="col">id</th>
      	      <th scope="col">partenza</th>
      	      <th scope="col">arrivo</th>
      	      <th scope="col">orario partenza</th>
       	      <th scope="col">orario arrivo</th>
       	      <th scope="col">posti</th>
       	      <th scope="col">costo</th>
       	      <th scope="col">scadenza</th>
       	      <th scope="col">descrizione</th>
       	      <th scope="col"></th>
      	      <th scope="col"></th>
      	    </tr>
      	  </thead>
      	  <tbody>
      <%
      	ArrayList<Viaggio> list = (ArrayList<Viaggio>) request.getAttribute("viaggi");
      	for(Viaggio v: list){
      		System.out.println(v.getId());
      	    out.write("<tr>");
	      	out.write("<td scope='row'><img width='20%' src='" + v.getUrl() + "'/></td>");
      	  	out.write("<td scope='row'>" + v.getId() + "</td>");
	      	out.write("<td scope='row'>" + v.getCitta_p() + "</td>");
	      	out.write("<td scope='row'>" + v.getCitta_a() + "</td>");
	      	out.write("<td scope='row'>" + v.getOrario_p() + "</td>");
	      	out.write("<td scope='row'>" + v.getOrario_a() + "</td>");
	      	out.write("<td scope='row'>" + v.getNposti() + "</td>");
	      	out.write("<td scope='row'>" + v.getCosto() + "</td>");
	      	out.write("<td scope='row'>" + v.getScadenza() + "</td>");
	      	out.write("<td scope='row'>" + v.getDescrizione() + "</td>");
	      	/*out.write(
    			"<td scope='row'><form method='GET' action='EliminaViaggiServlet'>"+
	      		"<input style='display:none' id='id' name='id' value=" + v.getId() + ">" + 
   				"<input style='display:none' id='id' name='id' value=" + v.getId() + ">" +
      			"<button class=\"btn btn-primary btn-rounded mr-1\" data-toggle=\"tooltip\" title=\"\" data-original-title=\"Add to cart\"><span aria-hidden=\"true\">&times;</span></button>"+ 
      			"</form></td>"
   			);*/
	      	if((String)request.getAttribute("pagato")==null){
	      	out.write(
	    			"<td scope='row'><form method='GET' action='AcquistaViaggiServlet'>"+
		      		"<input style='display:none' id='id' name='id' value=" + v.getId() + ">" +
      				"<input style='display:none' id='value' name='value' value=true>" +
	      			"<button class=\"btn btn-primary btn-rounded mr-1\" data-toggle=\"tooltip\" title=\"\" data-original-title=\"Add to cart\">buy now</button>"+ 
	      			"</form></td>"
	   			);
	      	}
      	}
      %>
      	  </tbody>
      	</table>
      <!-- Carousel wrapper -->
    </header>

</body>
</html>