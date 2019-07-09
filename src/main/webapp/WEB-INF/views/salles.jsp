<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Salles</title>
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



    <a class="nav-link" href="${pageContext.request.contextPath }/">Home</a>

<a class="nav-link" href="${pageContext.request.contextPath }/Tires">tires</a>


<a class="nav-link" href="${pageContext.request.contextPath }/Battries">batteries</a>


<a class="nav-link" href="${pageContext.request.contextPath }/Supplier">supplier</a>


<a class="nav-link active" href="${pageContext.request.contextPath }/Salles">Salles</a>
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
      <h2>Salles List <a href="${pageContext.request.contextPath }/Add-Salles"><i class="fas fa-plus"></i></a>
      </h2>
      <hr>
    </div>
  </div>
  </div>
</div>

<div class="row">
	  <div class="container">
   			<table class="table">
			<thead class="thead-dark">
				<tr>
					<th>#</th>
					<th>customerCar;</th>
					<th>Product Name</th>
					<th>Type</th>
					<th>Date</th>
					<th>productID</th>
					<th>Quantity</th>
					<th>Price</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
			</thead>	
				<!-- loop over and print our customers -->
			
						<c:forEach var="tempSalles" items="${salles}">
				
					<c:url var="UpdateLink" value="/Update-Salles">
		  				<c:param name="sallesId" value="${tempSalles.id}"></c:param>
		  			</c:url>
		  			
		  			
		  			<c:url var="DeleteLink" value="/Delete-Salles">
		  				<c:param name="sallesId" value="${tempSalles.id}"></c:param>
		  			</c:url>

					<tr>
						<td> ${tempSalles.id} </td>
						<td> ${tempSalles.customerCar} </td>
						<td> ${tempSalles.productName} </td>
						<td> ${tempSalles.type} </td>
						<td> <fmt:formatDate pattern="dd-MM-yyyy" value="${tempSalles.date}" /> </td>
		      			<td> ${tempSalles.productId} </td>
		      			<td> ${tempSalles.quantity} </td>
		      			<td> ${tempSalles.price} </td>
		      			<td><a href="${ UpdateLink }"><i class="far fa-edit"></i></a></td>
		    			<td><a href="${DeleteLink }"><i class="far fa-trash-alt"></i></a></td>
		      
					</tr>
				
				</c:forEach>
			</table>
	 </div>
   </div>			
<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/propper.js"></script>
<script src="js/script.js"></script>
  </body>
</html>
