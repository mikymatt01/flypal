<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.ArrayList, model.Viaggio, model.Prenotazione"%>
<!DOCTYPE html>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"><script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

    <header>
      <style>
        /* Carousel styling */
        #introCarousel,
        .carousel-inner,
        .carousel-item,
        .carousel-item.active {
          height: 100vh;
        }

        .carousel-item:nth-child(1) {
          background-image: url('image/p1.jpg');
          background-repeat: no-repeat;
          background-size: cover;
          background-position: center center;
        }

        /* Height for devices larger than 576px */
        @media (min-width: 992px) {
          #introCarousel {
            margin-top: -58.59px;
          }
          #introCarousel,
          .carousel-inner,
          .carousel-item,
          .carousel-item.active {
            height: 80vh;
          }
        }

		.navbar{
		  margin-left: 20%;
          margin-right: 20%;
		}
        .navbar .nav-link {
          margin-right:25px;
          font-size:16px;
          font-weight:600;
          color: #fff !important;
        }
      </style>

      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-light d-none d-lg-block" style="z-index: 2000;">
        <div class="container-fluid">
          <!-- Navbar brand -->
          <a class="navbar-brand" style="font-size:20px;" target="_blank" href="http://localhost:8080/FlyPal">
            FlyPal
          </a>
          
          <div class="collapse navbar-collapse" id="navbarExample01">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">

            </ul>
            <ul class="navbar-nav d-flex flex-row" style="margin-right:20px">
               <li class="nav-item">
               <button type='button' class='btn btn-outline-dark' data-toggle='modal' onclick="history.back()">indietro</button>
              </li>
			
            </ul>
          </div>
        </div>
      </nav>
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
      	      <th scope="col">partenza</th>
      	      <th scope="col">arrivo</th>
      	      <th scope="col">orario partenza</th>
       	      <th scope="col">orario arrivo</th>
       	      <th scope="col">utente</th>
       	      <th scope="col">costo</th>
       	       <th scope="col">quantita</th>
      	       <th scope="col">pagato</th>
      	    </tr>
      	  </thead>
      	  <tbody>
      <%
      	ArrayList<Prenotazione> list = (ArrayList<Prenotazione>) request.getAttribute("viaggi");
      	for(Prenotazione v: list){
      	    out.write("<tr>");
	      	out.write("<td scope='row'><img width='20%' src='" + v.getUrl() + "'/></td>");
	      	out.write("<td scope='row'>" + v.getCitta_p() + "</td>");
	      	out.write("<td scope='row'>" + v.getCitta_a() + "</td>");
	      	out.write("<td scope='row'>" + v.getOrario_p() + "</td>");
	      	out.write("<td scope='row'>" + v.getOrario_a() + "</td>");
	      	out.write("<td scope='row'>" + v.getUsername() + "</td>");
	      	out.write("<td scope='row'>" + v.getCosto() + "</td>");
	      	out.write("<td scope='row'>" + v.getQuantita() + "</td>");
	      	out.write("<td scope='row'>" + v.getPagato() + "</td>");
      	}
      %>
      	  </tbody>
      	</table>
      <!-- Carousel wrapper -->
    </header>

</body>
</html>