<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>

<html>

<head>
    <title>Add Battry</title>
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


<a class="nav-link active" href="${pageContext.request.contextPath }/Battries">batteries</a>


<a class="nav-link" href="${pageContext.request.contextPath }/Supplier">supplier</a>


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
	      <h2>Add Battry <a href="${pageContext.request.contextPath }/Battries"><i class="far fa-eye"></i></a>
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
	  
 <form:form action="Save-Battry" modelAttribute="battry" method="POST">
   
   <form:hidden path="id"/>
	  <div class="form-group">
	    <label for="inputAddress">Product Name</label>
	    <form:input   path="name" type="text" class="form-control" id="inputAddress" placeholder="like ..ACDelco"/>
  	</div>
  
  	
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">capacity</label>
      <form:input  path="capacity" type="text" class="form-control" id="inputEmail4" placeholder="12 Volts"/>
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Production Country</label>
      <form:select  path="productionCountry" items="${CountryList}" type="text" class="form-control" id="inputState"/>
 
    </div>
  </div>
  

  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Warranty Year</label>
      <form:input  path="warrantyYear" type="text" class="form-control" id="inputEmail4" placeholder="3 years"/>
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">production Date</label>
      <form:input path="productionDate" type="text" class="form-control" id="inputPassword4"/>
    </div>
  </div>
  
    <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Quantity</label>
      <form:input path="quatity" type="text" class="form-control" id="inputEmail4" placeholder="Quantity"/>
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">price</label>
      <form:input path="price" type="text" class="form-control" id="inputPassword4" placeholder="Price ...egy"/>
    </div>
  </div>
 

  <input type="submit" class="btn btn-secondary" value="Save" onclick="toastr.info('Hi! I am info message.');"/>
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
