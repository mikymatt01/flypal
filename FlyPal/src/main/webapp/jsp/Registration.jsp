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
<button type="button" class="btn btn-light" data-toggle="modal" data-target="#exampleModal">
  Registrati
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="RegistrationServlet" method="POST">
      <div class="modal-body">
		  <div class="form-group">
		    <label for="Labelemail">Email address</label>
		    <input type="email" class="form-control" id="Labelemail" aria-describedby="emailHelp" placeholder="Enter email" name="email">
		    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
		  </div>
		  <div class="form-group">
		    <label for="LabelPassword">Password</label>
		    <input type="password" class="form-control" id="LabelPassword" placeholder="Password" name="password">
		  </div>
		  <div class="form-group">
		  	<label for="Labelusername">Username</label>
		  	<input type="text" class="form-control" id="Labelusername" placeholder="Username" name = "username">
		  </div>
		  <div class="form-check">
		    <input type="checkbox" class="form-check-input" id="Labeladmin" name="admin" value="1">
		    <label class="form-check-label" for="Labeladmin">Admin</label>
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