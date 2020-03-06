<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<title>Sales Main</title>
<!-- Font Awesome -->

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/fontAwsome/css/all.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">
</head>
<body>
<jsp:include page="/WEB-INF/view/navbar.jsp"></jsp:include>
	<div class="top-sales">
		<div class="sales">
			<div class="sales__title">
				Available Sales in <span class="sales__title--month">${thisMonthName }</span>
			</div>

			<div class="sales__value">${totalThisMonth }</div>
		</div>
		<div class="sales-btn">

				<fmt:formatNumber var="TirePrecentage"
				value="${totalTire/totalThisMonth*100}" maxFractionDigits="0" />
				
				<fmt:formatNumber var="BattryPrecentage"
				value="${totalBattry/totalThisMonth*100}" maxFractionDigits="0" />
				
				<fmt:formatNumber var="RimesPrecentage"
				value="${totalRimes/totalThisMonth*100}" maxFractionDigits="0" />

			<div class="sales__tire clearfix">
				<div class="sales__tire--text">Total Tire</div>

				<div class="sales__tire--value">${totalTire }</div>
				<div class="sales__tire--percentage">${TirePrecentage }%</div>

			</div>

			<div class="sales__battry clearfix">
				<div class="sales__battry--text">Total Battry</div>
				<div class="sales__battry--value">${totalBattry}</div>
				<div class="sales__battry--percentage">${BattryPrecentage }%</div>
			</div>

			<div class="sales__rimes clearfix">
				<div class="sales__rimes--text">Total Rimes</div>
				<div class="sales__rimes--value">${totalRimes }</div>
				<div class="sales__rimes--percentage">${RimesPrecentage }%</div>
			</div>

		</div>
	</div>

	<div class="bottom">
		<div class="add">
				<div class="container">
						<form:form action="Save-Sales" modelAttribute="sales" method="POST">
			<div class="form-row d-flex justify-content-center">
		
						<div class="form-group col-md-3">
				<form:input path="customerCar" type="text" class="form-control" placeholder="Car Model" required="true"/>
				</div>
				<div class="form-group col-md-3">
				<form:select path="type" class="form-control" id="type">
					<form:option value="none" label="none">Select Catgory</form:option>
					<form:option value="Tire" label="Tire">Tire</form:option>
					<form:option value="Battry" label="Battry">Battry</form:option>
					<form:option value="Rimes" label="Rimes">Rimes</form:option>
				</form:select> 
				</div>
				<div class="form-group col-md-3">
				<form:select path="productName" class="form-control" id="product" required="true">
					<form:option value="none">Select Product</form:option>
				</form:select>
				</div>
			</div>
			</div>
			<div class="add__container_2">
				<form:input path="price" type="number" class="add__price" placeholder="Price" value="null" required="true"/>
				<form:input path="quantity" type="number" class="add__quantity" placeholder="Qaunity" value="null" required="true"/>
				
				<input type="hidden" path="productId"  id="productId" name="productId" value=""/>
				
				<button type="submit" class="btn btn-danger save-btn">Save</button>
			</div>


			</form:form>
			</div>
			<a href="${pageContext.request.contextPath }/Sales-list" class="hre-right"><i class="fas fa-arrow-right"></i>
			</a>
		</div>

		<div class="container clearfix">
			<div class="list-content">

				<div class="tire">
					<h2 class="tire__title">tire</h2>

					<div class="tire__list">
						<c:forEach var="tempSalles" items="${salesThisMonth}">
						
						<c:if test="${tempSalles.type =='Tire' }">
						<div class="item clearfix" id="tire-0">
							<div class="item__description">${tempSalles.productName }</div>
							<div class="right clearfix">
								<div class="item__value">+ ${tempSalles.price *tempSalles.quantity }</div>
								<div class="item__delete">
									<button class="item__delete--btn">
										<i class="fa fa-times-circle"></i>
									</button>
								</div>
							</div>
						</div>
						</c:if>
						</c:forEach>

					</div>
				</div>



				<div class="battry">
					<h2 class="battry__title">battry</h2>

					<div class="battry__list">
						<c:forEach var="tempSalles" items="${salesThisMonth}">
						
						<c:if test="${tempSalles.type =='Battry' }">
						<div class="item clearfix">
							<div class="item__description">${tempSalles.productName }</div>
							<div class="right clearfix">
								<div class="item__value">${tempSalles.price *tempSalles.quantity}</div>
								<div class="item__delete">
									<button class="item__delete--btn">
										<i class="fa fa-times-circle"></i>
									</button>
								</div>
							</div>
						</div>
					</c:if>
					</c:forEach>
					</div>
				</div>


				<div class="rimes">
					<h2 class="rimes__title">rimes</h2>

					<div class="rimes__list">
						<c:forEach var="tempSalles" items="${salesThisMonth}">
							
							<c:if test="${tempSalles.type =='Rimes' }">
								<div class="item clearfix" id="expense-0">
									<div class="item__description">${tempSalles.productName}</div>
									<div class="right clearfix">
										<div class="item__value">${tempSalles.price *tempSalles.quantity}</div>
										<div class="item__delete">
											<button class="item__delete--btn">
												<i class="fa fa-times-circle"></i>
											</button>
										</div>
									</div>
								</div>

							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>


		</div>
	
	<script src="js/jquery-3.4.1.min.js"></script>
	<script src="js/myAjax.js"></script>
		
	
</body>
</html>