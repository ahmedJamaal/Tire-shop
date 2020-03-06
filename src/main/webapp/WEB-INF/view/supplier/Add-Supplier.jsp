<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>

<html>

<head>
    <title>Supplier</title>
    <!-- Font Awesome -->
	<link href="css/bootstrap.min.css" rel="stylesheet">

        <link href="css/fontAwsome/css/all.css" rel="stylesheet">

		<link href="css/styles.css" rel="stylesheet">
  </head>
  <body>

<jsp:include page="/WEB-INF/view/navbar.jsp"></jsp:include>

<div class="Heaader-p">
	<div class="row">
	  <div class="container">
	    <div class="col-md-12 center">
	      <br>
	      <h3>Add Supplier <a href="${pageContext.request.contextPath }/Supplier"><i class="far fa-eye"></i></a>
	      </h3>
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
	    <form:input path="fullName" type="text" class="form-control" id="supplierName" placeholder="Enter FullName"/>
	  </div>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Phone Number</label>
      <form:input path="phone1" type="text" class="form-control" id="inputEmail4" placeholder="Enter Phone Number"/>
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Home Number</label>
      <form:input path="phone2" type="text" class="form-control" id="inputPassword4" placeholder="Enter Home Number"/>
    </div>
  </div>

  <div class="form-group">
    <label for="inputAddress2">Address</label>
    <form:input path="address" type="text" class="form-control" id="inputAddress2" placeholder="city ,Apartment no., studio, or floor"/>
  </div>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="info">Notes</label>
      <form:textarea path="info" class="form-control" id="infoText" rows="3"/>
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

  </body>
</html>
