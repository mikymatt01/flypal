<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"><script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
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
          background-image: url('https://mdbootstrap.com/img/Photos/Others/images/76.jpg');
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
      <nav class="navbar navbar-expand-lg navbar-dark d-none d-lg-block" style="z-index: 2000;">
        <div class="container-fluid">
          <!-- Navbar brand -->
          <a class="navbar-brand nav-link" style="font-size:20px;" target="_blank" href="http://localhost:8080/FlyPal">
            FlyPal
          </a>
          <button class="navbar-toggler" type="button" data-mdb-toggle="collapse" data-mdb-target="#navbarExample01"
            aria-controls="navbarExample01" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fas fa-bars"></i>
          </button>
          <div class="collapse navbar-collapse" id="navbarExample01">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">

            </ul>

            <ul class="navbar-nav d-flex flex-row">
              <li class="nav-item active">
              <a class="nav-link" aria-current="page" href="#intro">Home</a>
              </li>
              <li class="nav-item">
              <a class="nav-link" aria-current="page" href="#offerte">Offerte</a>
              </li>
               <li class="nav-item">
               <a class="nav-link" aria-current="page" href="#intro">Ricerca</a>
              </li>
              <!-- Icons -->
              <li class="nav-item me-3 me-lg-0">
              	<%@ include file='Login.jsp' %>
              </li>
              <li class="nav-item me-3 me-lg-0 ms-3">
                <%@ include file='Registration.jsp' %>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      <!-- Navbar -->

      <!-- Carousel wrapper -->
      <div id="introCarousel" class="carousel slide carousel-fade shadow-2-strong" data-mdb-ride="carousel">
        <!-- Indicators -->

        <!-- Inner -->
        <div class="carousel-inner">
          <!-- Single item -->
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
 
</body>
</html>