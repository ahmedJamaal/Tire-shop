<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>

<html>

<head>
    <title>Sales List</title>
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
	      <h3>Add Sales<a href="${pageContext.request.contextPath }/Sales"><i class="far fa-eye"></i></a>
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
	  
	 <form:form action="Save-Sales" modelAttribute="sales" method="POST">
		
	<div class="form-group">
	    <label for="inputAddress">Customer Car</label>
	    <form:input path="customerCar" type="text" class="form-control" id="inputAddress" placeholder="Like ...Mercedes C180 "/>
  </div>
    <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputCity">Product Type</label> 
		<form:select path="type" class="form-control" name="select1" id="type">
		    <form:option value="Tires"  label="Tires"/>
		    <form:option value="Batrry"  label="Batrry"/>
	  </form:select>
    </div>
    
    <div class="form-group col-md-6">
      <label for="inputState">Product Name</label>
      
      <form:select path="productName" class="form-control" name="select2" id="product">
      	<c:if test=""></c:if>
		</form:select>
		
    </div>
 
  </div>
  
  <div class="form-row">
    <div class="form-group col-md-4">
      <label for="inputEmail4">Quantity</label>
      <form:input path="quantity" type="text" class="form-control" id="inputEmail4" placeholder="Quantity"/>
    </div>
    <div class="form-group col-md-4">
      <label for="inputPassword4">Price</label>
      <form:input path="price" type="text" class="form-control" id="inputPassword4" placeholder="Price in Egy"/>
    </div>

  </div>

	 <input type="hidden" path="productId"  id="productId" name="productId" value=""/>
	
  <input type="submit" class="btn btn-secondary" value="Save"/>
  
</form:form>
<p class="msg"></p>

	 </div>
	 </div>
	 </div>
   </div>			
</section>		

<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/script.js"></script>
<script src="js/myAjax.js"></script>
  </body>
</html>