<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>

<head>
    <meta charset="utf-8">
    <title>Supplier</title>
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
      <h2>Supplier List <a href="${pageContext.request.contextPath }/Add-Supplier"><i class="fas fa-plus"></i></a>
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
					<th>Full Name</th>
					<th>Address</th>
					<th>Info</th>
					<th>phone 1</th>
					<th>Phone 2</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
			</thead>	
				<!-- loop over and print our customers -->
			
						<c:forEach var="tempSupplier" items="${suppliers}">
				
					<c:url var="UpdateLink" value="/Update-Supplier">
		  				<c:param name="supplierId" value="${tempSupplier.id}"></c:param>
		  			</c:url>
		  			
		  			
		  			<c:url var="DeleteLink" value="/Delete-Supplier">
		  				<c:param name="supplierId" value="${tempSupplier.id}"></c:param>
		  			</c:url>
					<tr>
						<td> ${tempSupplier.id} </td>
						<td> ${tempSupplier.fullName} </td>
						<td> ${tempSupplier.address} </td>
						<td> ${tempSupplier.info} </td>
						 <td> ${tempSupplier.phone1} </td>
		      			<td> ${tempSupplier.phone2} </td>

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
