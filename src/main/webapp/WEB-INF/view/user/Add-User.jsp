<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>

<html>

<head>
    <title>Battries</title>
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
	      <h3>Add User <a href="${pageContext.request.contextPath }/Users"><i class="far fa-eye"></i></a>
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
		<form:form action="Save-User" modelAttribute="user" method="POST">
		
	  <div class="form-group">
	    <label for="fullName">Full Name</label>
	    <form:input path="fullName" type="text" class="form-control" id="fullName" placeholder="Enter Full Name"/>
  </div>
  	
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="userName">User Name</label>
      <form:input path="userName" type="text" class="form-control" id="userNames" placeholder="Enter User Name"/>
    </div>
    <div class="form-group col-md-6">
      <label for="Passwords">Password</label>
      <form:input path="password" type="passwords" class="form-control" id="passwords" placeholder="Password"/>
    </div>
  </div>

	  <div class="form-group">
	    <label for="phone">Phone</label>
	    <form:input path="phone" type="text" class="form-control" id="phone" placeholder="Enter Phone Number"/>
  	</div>

  <input type="submit" class="btn btn-secondary" value="Save">
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