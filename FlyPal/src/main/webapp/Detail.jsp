<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.ViaggioDAO, model.Viaggio,java.util.ArrayList, model.Utente"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/style.css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"><script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<title>Insert title here</title>
</head>
<body>
<%@ include file="shared/HeaderOtherPage.jsp" %>
<div class="container">
    <div class="card">
        <div class="card-body">
        <%
        	String id=request.getParameter("id");
        	ViaggioDAO dao=new ViaggioDAO();
        	Viaggio v=dao.select(Integer.parseInt(id));
        	String username;
        	if(u!=null)
        		username=u.getUsername();
        	else
        		username="";
        	if(v==null)
   				v=new Viaggio();
        %>
            <h3 class="card-title"><%=v.getCitta_p() + " - " + v.getCitta_a() %></h3>
            <div class="row">
                <div class="col-lg-5 col-md-5 col-sm-6">
                    <div class="white-box text-center"><img src=<%=v.getUrl() %> class="img-responsive" style="width:100%"></div>
                </div>
                <div class="col-lg-7 col-md-7 col-sm-6">
                    <h4 class="box-title mt-5">Descrizione</h4>
                    <p><%=v.getDescrizione() %></p>
                    <h2 class="mt-5">
                        <%=v.getCosto() %> &euro;<small class="text-success">(10%off)</small>
                    </h2>
                    <input id="id_viaggio" value="<%=id %>" style="display:none">
                    <input id="client" value="<%=username %>" style="display:none">
					<script>
					function addCart() {
					  const xhttp = new XMLHttpRequest();
					  xhttp.onload = function() {
						 $('#cart').text('!');
					  }
					  var id=document.getElementById('id_viaggio').value;
					  var username=document.getElementById('client').value;
					  if(username==""){
						  var myModal = new bootstrap.Modal(document.getElementById('login'), {});
						  var myInput = document.getElementById('username')
						  myModal.show()
					  }else{
					  	xhttp.open("POST", "AcquistaViaggiServlet");
					  	xhttp.send("id=" + id + "&pay=false");
					  }
					}
					</script>
					
					<script>
					function pay() {
					  const xhttp = new XMLHttpRequest();
					  xhttp.onload = function() {
						  $('#cart').text('!');
					  }
					  var id=document.getElementById('id_viaggio').value;
					  var username=document.getElementById('client').value;
					  if(username==""){
						  var myModal = new bootstrap.Modal(document.getElementById('login'), {});
						  var myInput = document.getElementById('username')
						  myModal.show()
					  }else{
					  	xhttp.open("POST", "AcquistaViaggiServlet");
					  	xhttp.send("id=" + id + "&pay=true");
					  }
					}
					</script>
                    <button onclick="addCart()" class="btn btn-dark btn-rounded mr-1" data-toggle="tooltip" title="" data-original-title="Add to cart">
                        <i class="fa fa-shopping-cart"></i>
                    </button>
                    <button onclick="pay()" class="btn btn-primary btn-rounded">Buy Now</button>
                    <h3 class="box-title mt-5">Orario</h3>
                    <ul class="list-unstyled">
                        <li><i class="fa fa-check text-success"></i>partenza <%=v.getOrario_p() %> - arrivo <%=v.getOrario_a() %></li>
                    </ul>
                </div>
                <!-- <div class="col-lg-12 col-md-12 col-sm-12">
                    <h3 class="box-title mt-5">General Info</h3>
                    <div class="table-responsive">
                        <table class="table table-striped table-product">
                            <tbody>
                                <tr>
                                    <td width="390">Brand</td>
                                    <td>Stellar</td>
                                </tr>
                                <tr>
                                    <td>Delivery Condition</td>
                                    <td>Knock Down</td>
                                </tr>
                                <tr>
                                    <td>Seat Lock Included</td>
                                    <td>Yes</td>
                                </tr>
                                <tr>
                                    <td>Type</td>
                                    <td>Office Chair</td>
                                </tr>
                                <tr>
                                    <td>Style</td>
                                    <td>Contemporary&amp;Modern</td>
                                </tr>
                                <tr>
                                    <td>Wheels Included</td>
                                    <td>Yes</td>
                                </tr>
                                <tr>
                                    <td>Upholstery Included</td>
                                    <td>Yes</td>
                                </tr>
                                <tr>
                                    <td>Upholstery Type</td>
                                    <td>Cushion</td>
                                </tr>
                                <tr>
                                    <td>Head Support</td>
                                    <td>No</td>
                                </tr>
                                <tr>
                                    <td>Suitable For</td>
                                    <td>Study&amp;Home Office</td>
                                </tr>
                                <tr>
                                    <td>Adjustable Height</td>
                                    <td>Yes</td>
                                </tr>
                                <tr>
                                    <td>Model Number</td>
                                    <td>F01020701-00HT744A06</td>
                                </tr>
                                <tr>
                                    <td>Armrest Included</td>
                                    <td>Yes</td>
                                </tr>
                                <tr>
                                    <td>Care Instructions</td>
                                    <td>Handle With Care,Keep In Dry Place,Do Not Apply Any Chemical For Cleaning.</td>
                                </tr>
                                <tr>
                                    <td>Finish Type</td>
                                    <td>Matte</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div> -->
            </div>

        </div>
    </div>
</div>
   	<div class="cont">
	<div class="row justify-content-center">
	<div class="mt-5 row text-center">
		<h1 id="offerte">
	           <strong>Consigliati</strong>
	    </h1>
   	</div>       
  	<% 
   		ArrayList<Viaggio> viaggi = dao.select();
   		for(Viaggio viaggio: viaggi) {
   		out.print("<div class=\"col-sm-3 mt-4\">");
   		out.print("<div class=\"card\" style=\"width: 60%;\">");
   		out.print("<form action=\"detail\" method=\"GET\">");
   		out.print("<input type=\"image\" src=\""+ viaggio.getUrl() +"\" class=\"card-img-top\" style=\"height: 250px;\" alt=\"\">");
   		out.print("<input id=\"id\" name=\"id\" value=\"" + viaggio.getId() + "\" style=\"display:none\" \">");
   		out.print("</form>");
   		out.print("</div>");
   		out.print("<div style=\"color:white; margin-top:0%;margin-left:0%;\" >");
   		out.print("<h6 style=\"color:black;\">" + viaggio.getCitta_p() + " - " + viaggio.getCitta_a() + "</h6>");
   		out.print("<p style=\"color:black;\">" + viaggio.getOrario_p() + " - " + viaggio.getOrario_a() + "</p>");
	    out.print("</div>");
	    out.print("</div>");
		}
   	%>
   	</div>
   	</div>
</body>
</html>