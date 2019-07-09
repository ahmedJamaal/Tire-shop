<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>

<html>

<head>
    <title>Battries</title>
    <!-- Font Awesome -->

        <link rel="stylesheet" href="resources/css/Responsive.css">
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



    <a class="nav-link" href="${pageContext.request.contextPath }/">Home</a>

<a class="nav-link" href="${pageContext.request.contextPath }/Tires">tires</a>


<a class="nav-link" href="${pageContext.request.contextPath }/Battries">batteries</a>


<a class="nav-link active" href="${pageContext.request.contextPath }/Supplier">supplier</a>


<a class="nav-link" href="${pageContext.request.contextPath }/Salles">Salles</a>
<a class="nav-link" href="${pageContext.request.contextPath }/Users">Users</a>

<a class="nav-link" href="${pageContext.request.contextPath }/Budget">Budget</a>
  </div>
  </div>
</div>
</div>
<!--/.Navbar-->
<div class="Heaader-p">
	<div class="row">
	  <div class="container">
	    <div class="col-md-12 center">
	      <br>
	      <h2>Add Supplier <a href="${pageContext.request.contextPath }/Supplier"><i class="far fa-eye"></i></a>
	      </h2>
	      <hr>
	    </div>

  </div>
   </div>
   </div>
   <section class="page-forms">
   	<div class="row">
	  <div class="container">
	  	<div class="form">
	  <div class="col-md-10 center">
		
	<form:form action="Save-Supplier" modelAttribute="supplier" method="POST">
		
	<div class="form-group">
	    <label for="inputAddress">Full Name</label>
	    <form:input path="fullName" type="text" class="form-control" id="inputAddress" placeholder="Full Name"/>
	  </div>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">phone 1</label>
      <form:input path="phone1" type="text" class="form-control" id="inputEmail4" placeholder="Mobile 1"/>
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">phone 2</label>
      <form:input path="phone2" type="text" class="form-control" id="inputPassword4" placeholder="Mobile 2"/>
    </div>
  </div>

  <div class="form-group">
    <label for="inputAddress2">Address</label>
    <form:input path="address" type="text" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor"/>
  </div>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputCity">info</label>
      <form:input path="info" class="form-control" id="exampleTextarea" rows="3"/>
    </div>

  </div>
 
  <input type="submit" class="btn btn-secondary" value="Save"/>
</form:form>
</div>
	 </div>
	 </div>
   </div>			
</section>

<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/propper.js"></script>
<script src="js/script.js"></script>
  </body>
</html>
