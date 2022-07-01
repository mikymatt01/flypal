<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>Registrazione</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
  
</head>
	<body>
		<!-- Button trigger modal -->
<button type="button" class="btn btn-light" data-toggle="modal" data-target="#registration">
  Registrati
</button>

<!-- Modal -->
<div class="modal fade" id="registration" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">COMPILA I SEGUENTI CAMPI</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="registrationServlet" method="post">
      <div class="modal-body">
		  <div class="form-group">
		    <label for="email1">Indirizzo email</label>
		    <input type="email" name ="email1" class="form-control" id="email1" aria-describedby="emailHelp" placeholder="Inserisci un email valida">
		  </div>
   		  <div class="form-group">
		    <label for="username">Username</label>
		    <input type="text" name="username" class="form-control" id="username" aria-describedby="emailHelp" placeholder="Inserisci username">
		  </div>
		  <div class="form-group">
		    <label for="Password1">Password</label>
		    <input type="password" name="Password1" class="form-control" id="Password1" placeholder="Password">
		  </div>
  		  <div class="form-group">
		    <label for="Password2">Conferma Password</label>
		    <input type="password" name="Password2" class="form-control" id="Password2" placeholder="Conferma Password">
		  </div>
		  <div class="form-check">
		    <input type="checkbox" name="admin" class="form-check-input" id="checkAdmin">
		    <label class="form-check-label" for="checkAdmin">Admin</label>
		  </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>
		  <button type="submit" class="btn btn-primary">Registrati</button>
      </div>
      </form>
    </div>
  </div>
</div>

	</body>
</html>