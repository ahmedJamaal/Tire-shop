<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Home</title>
    <!-- Font Awesome -->

        <link rel="stylesheet" href="css/Responsive.css">
        <link rel="stylesheet" href="css/button.css">
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <link href="css/mdb.min.css" rel="stylesheet">
        <link href="css/fontAwsome/css/all.css" rel="stylesheet">

		<link href="css/styles.css" rel="stylesheet">
  </head>
  <body>

    <!--Navbar-->
    <div class="header">
<div class="container">
  <div class="nav">

  <input type="checkbox" id="nav-check">
  <div class="nav-header">
    <div class="nav-title">
  <a href="${pageContext.request.contextPath }/">
    <img alt="image"  src="images/logo.png" style="width:160px;height: 60px;">
</a>
    </div>
  </div>
  <div class="nav-btn">
    <label for="nav-check">
      <span></span>
      <span></span>
      <span></span>
    </label>
  </div>

  <div class="nav-links">



    <a class="nav-link active" href="${pageContext.request.contextPath }/">Home</a>

<a class="nav-link" href="${pageContext.request.contextPath }/Tires">tires</a>

<a class="nav-link" href="${pageContext.request.contextPath }/Battries">batteries</a>

<a class="nav-link" href="${pageContext.request.contextPath }/Supplier">supplier</a>


<a class="nav-link" href="${pageContext.request.contextPath }/Salles">Salles</a>

<a class="nav-link" href="${pageContext.request.contextPath }/Users">Users</a>


<a class="nav-link" href="${pageContext.request.contextPath }/Budget">Budget</a>
  </div>
  </div>
</div>
</div>
<!--/.Navbar-->
<div class="row">
  <div class="container">
    <div class="col-md-12 center">
      <br>
      <h2>Project</h2>
      <hr>
    </div>

  </div>
</div>
<div class="row">
  <div class="container">
    <div class="col-md-12 center">
      <div class="alert alert-success" role="alert">
  <h4 class="alert-heading">Well done!</h4>
  <p>Aww yeah, you successfully read this important alert message. This example text is going to run a bit longer so that you can see how spacing within an alert works with this kind of content.</p>
  <div class="row">
    <div class="col-md-4">
      <div class="alert alert-dark" role="alert">
        <a href="${pageContext.request.contextPath }/addBattry" class="alert-link">Add Person Here..addBattry</a>
      </div>
    </div>
    <div class="col-md-4">
      <div class="alert alert-dark" role="alert">
        <a href="${pageContext.request.contextPath }/addSalles" class="alert-link">View Person Here.addSalles</a>
      </div>
    </div>
    <div class="col-md-4">
      <div class="alert alert-dark" role="alert">
        <a href="#" class="alert-link">Edit Person Here..</a>
      </div>
    </div>
  </div>
  <hr>
  <p class="mb-0">Whenever you need to, be sure to use margin utilities to keep things nice and tidy.</p>
</div>
    </div>

  </div>
</div>


    <a href="${pageContext.request.contextPath }/Add-Battry">}Add-Battry</a>

<a href="${pageContext.request.contextPath }/Battries">Add-Battries.....</a>

<a  href="${pageContext.request.contextPath }/Add-Supplier">/Add-Supplier</a>

    <a href="${pageContext.request.contextPath }/Add-Tires">}/Add-Tires</a>

<a href="${pageContext.request.contextPath }/Add-User">}/Add-User</a>

<a  href="${pageContext.request.contextPath }/Add-Salles">batteries</a>

<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#basicExampleModal">
  Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="basicExampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
<div class="alert alert-dark" role="alert">
  A simple dark alert—check it out! <i class="far fa-eye"></i>
</div>


<a class="btn btn-info btn-lg" id="alert-target">Click me!</a>

<button type="button" class="close" data-dismiss="alert" aria-label="Close">
  <span aria-hidden="true">&times;</span>
</button>

<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/propper.js"></script>
<script src="js/script.js"></script>
  </body>
</html>
