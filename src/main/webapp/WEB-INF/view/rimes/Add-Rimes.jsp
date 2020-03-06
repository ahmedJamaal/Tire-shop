<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>

<html>

<head>
    <title>Add Rimes</title>
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
	      <h3>Add Rimes <a href="${pageContext.request.contextPath }/Rimes"><i class="far fa-eye"></i></a>
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
	  
 <form:form action="Save-Rimes" modelAttribute="Rimes" method="POST">
   
   <form:hidden path="id"/>
	  <div class="form-group">
	    <label for="rimesName">Product Name</label>
	    <form:input   path="name" type="text" class="form-control" id="rimesName" placeholder="like ..ACDelco"/>
  	</div>
  
  	
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="capacity">size</label>
      <form:input  path="size" type="number" class="form-control" id="size" placeholder="18 Inche"/>
    </div>
    <div class="form-group col-md-6">
      <label for="productionCountry">Production Country</label>
      <form:select  path="productionCountry" items="${CountryList}" type="text" class="form-control" id="productionCountry"/>
 
    </div>
  </div>
  
  
    <div class="form-row">
    <div class="form-group col-md-6">
      <label for="quatity">Quantity</label>
      <form:input path="quatity" type="number" class="form-control" id="quatity" placeholder="Quantity"/>
    </div>
    <div class="form-group col-md-6">
      <label for="price">price</label>
      <form:input path="price" type="number" class="form-control" id="price" placeholder="Price ...egy"/>
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