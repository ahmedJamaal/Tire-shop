<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Home</title>
    <!-- Font Awesome -->
		
		<link href="css/home.css" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/fontAwsome/css/all.css" rel="stylesheet">
		<link href="css/styles.css" rel="stylesheet">
		<link href="css/slick.css" rel="stylesheet" >
	
		
  </head>
  <body>

 <jsp:include page="/WEB-INF/view/navbar.jsp"></jsp:include>

  <div class="top-cards">
 	 <div class="header-card">
        <div class="header-card-body">
          <div class="d-flex align-items-center justify-content-between">
            <div>
              <h4>Tires</h4>
              <h4 class="this-month">${tireQuantity } Record</h4>
              <h6 class="text-muted">${tirePrice } Total Prices</h6>
            </div>
            <div class="icon-box color-primary">
              <i class="fas fa-dragon"></i>
            </div>
          </div>
        </div>
      </div>
    
	  <div class="header-card">
        <div class="header-card-body">
          <div class="d-flex align-items-center justify-content-between">
            <div>
              <h4>Battry</h4>
 				<h4 class="this-month">${battaryQuantity } Record</h4>
              <h6 class="text-muted">${battaryPrice } LE Total Prices</h6>
            </div>
            <div class="icon-box color-success">
              <i class="fas fa-car-battery"></i>
            </div>
          </div>
        </div>
      </div>
    
      <div class="header-card">
        <div class="header-card-body">
          <div class="d-flex align-items-center justify-content-between">
            <div>
              <h4>Rimes</h4>
 				<h4 class="this-month">${rimesQuantity } Record</h4>
              <h6 class="text-muted">${rimesPrice } LE Total Prices</h6>
            </div>
            <div class="icon-box color-poper">
              <i class="fas fa-stroopwafel"></i>
            </div>
          </div>
        </div>
      </div>
    
      <div class="header-card">
        <div class="header-card-body">
          <div class="d-flex align-items-center justify-content-between">
            <div>
              <h4>Salles</h4>
              <h4 class="this-month">${sallesThisMonth } LE</h4>
              <h6 class="text-muted">${sallesLastMonth } LE last month</h6>
            </div>
            <div class="icon-box color-danger">
              <i class="fas fa-shopping-cart"></i>
            </div>
          </div>
        </div>
      </div>
    
    
      <div class="header-card">
        <div class="header-card-body">
          <div class="d-flex align-items-center justify-content-between">
            <div>
              <h4>Budget</h4>
              <h4 class="this-month">${budget} LE</h4>
              <h6 class="text-muted">${budgetLastMonth } LE last month</h6>
            </div>
            <div class="icon-box color-info">
             <i class="fas fa-hand-holding-usd"></i>
            </div>
          </div>
        </div>
      </div>
    
  </div>


<div class="row">
  <div class="leftcolumn">
    <div class="card">
      <h3>Most Popular Product</h3>
<ul class="nav nav-pills mb-3 carsoual-nav" id="myTab" role="tablist">
  <li class="nav-item nav-item-padding">
    <a class="nav-link active" id="tires-carsol-tab" data-toggle="tab" href="#tires-carsol" role="tab" aria-controls="tires-carsol" aria-selected="true">Tires</a>
  </li>
  <li class="nav-item nav-item-padding">
    <a class="nav-link" id="battry-carsol-tab" data-toggle="tab" href="#battry-carsol" role="tab" aria-controls="battry-carsol" aria-selected="false">Battry</a>
  </li>
   <li class="nav-item nav-item-padding">
    <a class="nav-link" id="rimes-carsol-tab" data-toggle="tab" href="#rimes-carsol" role="tab" aria-controls="rimes-carsol" aria-selected="false">Rimes</a>
  </li>

</ul>
<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade show active" id="tires-carsol" role="tabpanel" aria-labelledby="tires-carsol-tab">
		 <div class="carousel">
					<c:forEach var="theTires" items="${top15Tires }">
			
			<div class="product">
			<img alt="" src="images/tires/tire.png" class="main-img">
			<div class="product-content img-carousel">
				
				<div class="d-flex justify-content-between">
					
					<h5 class="product-heading">${theTires.name }</h5>
					<h5 class="product-prices">${theTires.price } LE</h5>
				</div>
				<h5 class="product-heading">Made Country <span>${theTires.productionCountry }</span></h5>
				<div class="product-body">
					<h5 class="product-body-heading">Deminsion <span>${theTires.deminsion }</span></h5>
					<h5 class="product-body-heading">Quantity <span>${theTires.quatity } Item</span></h5>
					
				</div>
				
			</div>
		</div>
		
					</c:forEach>
    			</div>
	</div>
  <div class="tab-pane fade" id="battry-carsol" role="tabpanel" aria-labelledby="battry-carsol-tab">
		<div class="carousel">
					<c:forEach var="theBattry" items="${top15Battry }">
			
			<div class="product">
			<img alt="" src="images/battry/battry.png" class="main-img">
			<div class="product-content img-carousel">
				
				<div class="d-flex justify-content-between">
					
					<h5 class="product-heading">${theBattry.name }</h5>
					<h5 class="product-prices">${theBattry.price } LE</h5>
				</div>
				<h5 class="product-heading">Made Country <span>${theBattry.productionCountry }</span></h5>
				<div class="product-body">
					<h5 class="product-body-heading">Capacity <span>${theBattry.capacity }</span></h5>
					<h5 class="product-body-heading">Quantity <span>${theBattry.quatity } Item</span></h5>
					
				</div>
				
			</div>
		</div>
		
					</c:forEach>
    			</div>
	</div>
	
	  <div class="tab-pane fade" id="rimes-carsol" role="tabpanel" aria-labelledby="rimes-carsol-tab">
		<div class="carousel">
					<c:forEach var="theRimes" items="${top15Rimes }">
			
			<div class="product">
			<img alt="" src="images/rimes/Rimes.png" class="main-img">
			<div class="product-content img-carousel">
				
				<div class="d-flex justify-content-between">
					
					<h5 class="product-heading">${theRimes.name }</h5>
					<h5 class="product-prices">${theRimes.price } LE</h5>
				</div>
				<h5 class="product-heading">Made Country <span>${theRimes.productionCountry }</span></h5>
				<div class="product-body">
					<h5 class="product-body-heading">Size <span>${theRimes.size }</span></h5>
					<h5 class="product-body-heading">Quantity <span>${theRimes.quatity } Item</span></h5>
					
				</div>
				
			</div>
		</div>
		
					</c:forEach>
    			</div>
	</div>
</div>
		

	
	</div>
  </div>
  <div class="rightcolumn">
  	   <div class="card">
      <h3>External Links</h3>
 		<div class="external-link">
 			    <a class="link" href="${pageContext.request.contextPath }/Users">User</a>
    			 <a class="link" href="${pageContext.request.contextPath }/Supplier">supplier</a>
    			  <a class="link" href="${pageContext.request.contextPath }/Supplying">supplying</a>
    			 <a class="link" href="${pageContext.request.contextPath }/Add-Users">add users</a>
    			 <a class="link" href="${pageContext.request.contextPath }/Add-Supplier">add suppliers</a>
 		</div>
    </div>
    
    
    <div class="card">
      <h2>Top Salles Product</h2>
      <table class="table">
		  <thead>
		    <tr class="table-success-custom">
		      <th scope="col">Name</th>
		      <th scope="col">Type</th>
		      <th scope="col">Quantity</th>
		    </tr>
		  </thead>
		  <tbody>
		   
		    	<c:forEach var="tempSalles" items="${topSallesProduct }">
		    	 <tr>
		      	<td>${tempSalles[0] }</td>
		    	<td>${tempSalles[1] }</td>
		    	<td>${tempSalles[2] }</td>
		    
		    	

		    </tr>
		    </c:forEach>
		  </tbody>
		</table>
    </div>
    				<div class="card">
              				<h3>Top Refill Product</h3>                  
                            <!-- Nav tabs -->
                            <ul class="nav nav-pills mb-3 custom-nav" id="pills-tab" role="tablist">
								  <li class="nav-item">
								    <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-Battry" role="tab" aria-controls="pills-Battry" aria-selected="true">Battry</a>
								  </li>
								  <li class="nav-item">
								    <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-Tires" role="tab" aria-controls="pills-Tires" aria-selected="false">Tires</a>
								  </li>
								  <li class="nav-item">
								    <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-Rimes" role="tab" aria-controls="pills-Rimes" aria-selected="false">Rimes</a>
								  </li>
								</ul>
								
								      <table class="table">
										  <thead>
										    <tr class="table-success-custom">
										      <th scope="col">Name</th>
	    								      <th scope="col">Quantity</th>
										    </tr>
										  </thead>
									</table>
								<div class="tab-content" id="pills-tabContent">
								  <div class="tab-pane fade show active" id="pills-Battry" role="tabpanel" aria-labelledby="pills-Battry-tab">
										  <table class="table">
		  <tbody>
		   
		    	<c:forEach var="RefillBattry" items="${topRefillBattry }">
		    	 <tr>
		      	<td>${RefillBattry.name }</td>
		    	<td>${RefillBattry.quatity }</td>
		    
		    	

		    </tr>
		    </c:forEach>
		  </tbody>
		</table>
								
								</div>
								  <div class="tab-pane fade" id="pills-Tires" role="tabpanel" aria-labelledby="pills-Tires-tab">
								  										  <table class="table">
		  <tbody>
		   
		    	<c:forEach var="RefillTire" items="${topRefillTires }">
		    	 <tr>
		      	<td>${RefillTire.name }</td>
		    	<td>${RefillTire.quatity }</td>
		    
		    	

		    </tr>
		    </c:forEach>
		  </tbody>
		</table>
												  
									</div>
		 <div class="tab-pane fade" id="pills-Rimes" role="tabpanel" aria-labelledby="pills-Rimes-tab">
								  										  <table class="table">
		  <tbody>
		   
		    	<c:forEach var="RefillRimes" items="${topRefillRimes }">
		    	 <tr>
		      	<td>${RefillRimes.name }</td>
		    	<td>${RefillRimes.quatity }</td>
		    
		    	

		    </tr>
		    </c:forEach>
		  </tbody>
		</table>
												  
									</div>
								  
								</div>

                     
    </div>
 

</div>

 <script src="js/jquery-3.4.1.min.js"></script>

<script src="js/slick.min.js"></script>	
<script src="js/bootstrap.min.js"></script>
<script src="js/script.js"></script>
<script src="js/home.js"></script>
  </body>
</html>
