<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

            <ul class="navbar-nav d-flex flex-row">
               <li class="nav-item">
               <button type='button' class='btn btn-outline-dark' data-toggle='modal' data-target='#aggiungiviaggio'>aggiungi viaggio</button>
              </li>
			
            </ul>
          </div>
        </div>
      </nav>
      <!-- Navbar -->


      <!-- Carousel wrapper -->
    </header>
	    
	<!-- Modal -->
	<div class="modal fade" id="aggiungiviaggio" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Aggiungi Viaggio</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <form action="AggiungiViaggiServlet" method="post">
	      <div class="modal-body">
	      	  <div class="form-group">
			    <label for="exampleInputEmail1">Aggiungi immagine</label>
	 			<input type="file" accept="image/png, image/jpeg" name="immagine">
	 		  </div><br>
			  <div class="form-group">
			    <label for="exampleInputEmail1">citta di partenza</label>
			    <input type="text" class="form-control" name="cittaPartenza">
			    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
			  </div><br>
			  <div class="form-group">
			    <label for="exampleInputPassword1">citta di arrivo</label>
			    <input type="text" class="form-control" name="cittaArrivo">
			  </div><br>
	  		  <div class="form-group">
			    <label for="exampleInputPassword1">data e ora di partenza</label><br>
				<input type="datetime-local" id="dataPartenza" name="dataPartenza">
			  </div><br>
	  		  <div class="form-group">
			    <label for="exampleInputPassword1">data e ora di arrivo</label><br>
				<input type="datetime-local" id="dataArrivo" name="dataArrivo">
			  </div><br>
	   		  <div class="form-group">
			    <label for="exampleInputPassword1">posti disponibili</label>
			    <input type="number" class="form-control" name="posti">
			  </div><br>		  
			  <div class="form-group">
			    <label for="exampleInputPassword1">prezzo per posto</label>
			    <input type="number" class="form-control" name="prezzo">
			  </div><br>
	   		  <div class="form-group">
			    <label for="exampleInputPassword1">descrizione</label>
			    <input type="text" class="form-control" name="descrizione">
			  </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Annulla</button>
			  <button type="submit" class="btn btn-primary">Salva</button>
	      </div>
	      </form>
	    </div>
	  </div>
	</div>

</body>
</html>