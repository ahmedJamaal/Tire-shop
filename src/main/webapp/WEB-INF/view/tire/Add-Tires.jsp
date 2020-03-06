<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>

<html>

<head>
    <title>Add Tires</title>
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
	      <h3>Add Tires <a href="${pageContext.request.contextPath }/Tires"><i class="far fa-eye"></i></a>
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
		<form:form action="Save-Tires" modelAttribute="tires" method="POST">
			<form:input path="id" type="hidden" value="0"/>
	<div class="form-group">
	    <label for="inputAddress">Tire Name</label>
	    <form:input path="name" type="text" class="form-control" id="inputAddress" placeholder="Like ...Michelin "/>
  </div>
    <div class="form-row">
    <div class="form-group col-md-4">
      <label for="inputCity">deminsion</label>
      <form:input path="deminsion" type="text" class="form-control" id="inputCity" placeholder="225/45R18 91V"/>
    </div>
    <div class="form-group col-md-4">
      <label for="inputState">productionCountry</label>
     	<form:select  path="productionCountry" items="${CountryList}" type="text" class="form-control" id="inputState"/>
 
    </div>
    <div class="form-group col-md-4">
      <label for="inputZip">Production Date</label>
      <form:input path="ProductionDate" type="week" class="form-control" id="inputDate" placeholder="Week,Year"/>
    </div>
  </div>
  
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Quantity</label>
      <form:input path="quatity" type="number" class="form-control" id="inputEmail4" placeholder="Quantity" min="1"/>
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">price</label>
      <form:input path="price" type="number" class="form-control" id="inputPassword4" min="1" placeholder="Price in Egy"/>
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