<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Budgets Table</title>
    <!-- Font Awesome -->

        <link rel="stylesheet" href="css/Responsive.css">
        <link rel="stylesheet" href="css/button.css">
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <link href="css/mdb.min.css" rel="stylesheet">
        <link href="css/fontAwsome/css/all.css" rel="stylesheet">
          <link type="text/css" rel="stylesheet" href="css/tableStyle.css">

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


<a class="nav-link" href="${pageContext.request.contextPath }/Salles">Salles</a>

<a class="nav-link" href="${pageContext.request.contextPath }/Users">Users</a>

<a class="nav-link active" href="${pageContext.request.contextPath }/Budget">Budget</a>
  </div>
  </div>
</div>
</div>
            <div class="top">
                <div class="budget">
                    <div class="budget__title">
                        Available Budget in <span class="budget__title--month">%Month%</span>
                    </div>

                    <div class="budget__value">+ 2,345.64</div>
                    </div>
                    <div class="budget-btn">


                    <div class="budget__income clearfix">
                        <div class="budget__income--text">Total Income</div>

                            <div class="budget__income--value">+ 4,300.00</div>
                            <div class="budget__income--percentage">55%</div>

                    </div>

                    <div class="budget__expenses clearfix">
                        <div class="budget__expenses--text">Total Expenses</div>
                            <div class="budget__expenses--value">- 1,954.36</div>
                            <div class="budget__expenses--percentage">45%</div>
                    </div>
                    <a href="${pageContext.request.contextPath }/Budget" class="hre"><i class="fas fa-arrow-left"></i>
                    </a>

            </div>
            </div>
<!--/.Navbar-->
<div class="Heaader-p">
<div class="row">
  <div class="container">
    <div class="col-md-12 center">
      <br>
      <h2>Budgets List <a href="${pageContext.request.contextPath }/View-Expences" ><i class="fas fa-plus"></i></a>
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
					<th>name</th>
					<th>Type</th>
					<th>Value</th>
					<th>Total</th>
					<th>total Income</th>
					<th>total Expences</th>
					<th>date</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
			</thead>	
				<!-- loop over and print our customers -->
			
						<c:forEach var="tempBudget" items="${budget}">
				
					<c:url var="UpdateLink" value="/Update-Budget">
		  				<c:param name="budgetId" value="${tempBudget.id}"></c:param>
		  			</c:url>
		  			
		  			
		  			<c:url var="DeleteLink" value="/Delete-Budget">
		  				<c:param name="budgetId" value="${tempBudget.id}"></c:param>
		  			</c:url>
					<tr>
						<td> ${tempBudget.id} </td>
						<td> ${tempBudget.name} </td>
						<td> ${tempBudget.type} </td>
						<td> ${tempBudget.value} </td>
						<td> ${tempBudget.total} </td>
						 <td> ${tempBudget.totalIncome} </td>
		      			<td> ${tempBudget.totalExpences} </td>
		      			<td> ${tempBudget.date} </td>
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
