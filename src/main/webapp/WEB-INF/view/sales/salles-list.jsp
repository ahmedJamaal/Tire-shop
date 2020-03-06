<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Salles</title>
    <!-- Font Awesome -->

        <link href="css/bootstrap.min.css" rel="stylesheet">

      	 <link href="css/fontAwsome/css/all.css" rel="stylesheet">

<link href="css/styles.css" rel="stylesheet">
  </head>
  <body>
	<jsp:include page="/WEB-INF/view/navbar.jsp"></jsp:include>
	<div class="row">
		<div class="container">
			<div class="Header-p">

				<h3>
					Sales Lists <a href="${pageContext.request.contextPath }/Add-Sales"><i
						class="fa fa-plus"></i></a> <span class="tooltip">add more</span>
				</h3>

				<div class="input-group search-input">
					<input type="text" class="form-control"
						placeholder="Search this Sales">
					<div class="input-group-append">
						<button class="btn btn-secondary" type="button">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</div>

				<a  href="${pageContext.request.contextPath }/Sales" class="btn btn-dark">Add New Sales</a>
		



			</div>
		</div>
	</div>

	<div class="row">
		<div class="container">

			<div class="col-md-12">

				<table class="table table-striped table-responsive-md">
					<thead>
						<tr>
							<th>ID</th>
							<th>Product Name</th>
							<th>Customer Car</th>
							<th>Type</th>
							
							<th>date</th>
							<th>product Id</th>
							<th>Quanity</th>
							<th>Price</th>

							<th>View</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
					</thead>
					<c:forEach var="tempSales" items="${sales}">

						<c:url var="DeleteLink" value="/Delete-Sales">
							<c:param name="salesId" value="${tempSales.id}"></c:param>
						</c:url>
						<tr>
							<td>${tempSales.id}</td>
							<td>${tempSales.productName}</td>
							<td>${tempSales.customerCar}</td>
							<td>${tempSales.type}</td>
							<td> <fmt:formatDate pattern="dd-MM-yyyy" value="${tempSales.date}" /> </td>
							<td>${tempSales.productId}</td>
							<td>${tempSales.quantity}</td>
							<td>${tempSales.price}</td>
							<td>
								<button data-toggle="modal"
									data-target="#DetailsModal${tempSales.id }"
									class="btn btn-info btn-sm">View</button>
							</td>
							<td>
								<button data-toggle="modal"
									data-target="#EditModal${tempSales.id }"
									class="btn btn-primary btn-sm">Edit</button>
							</td>
							<td><button class="btn btn-danger btn-sm"
									data-toggle="modal" data-target="#deleteModal${tempSales.id }">
									Delete</button></td>
						</tr>

						<!-- Modal Detalis -->
						<div class="modal fade" id="DetailsModal${tempSales.id }"
							role="dialog">
							<div class="modal-dialog">

								<div class="modal-content">
									<div class="modal-header modal-custom">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">Sales Detalis</h4>
									</div>
									<div class="modal-body">


										<div class="form-group">
											<label for="id"> Sales Id: ${tempSales.id }</label>

										</div>

										<div class="form-group">
											<label for="salesName">Product Name : ${tempSales.productName }</label>
										</div>
										<div class="form-group">
											<label for="salesSize">Customer Car : ${tempSales.customerCar }</label>
										</div>
										<div class="form-group">
											<label for="country">Type :
												${tempSales.type }</label>
										</div>
										<div class="form-group">
											<label for="date">Date: ${tempSales.date }</label>
										</div>
										<div class="form-group">
											<label for="price">Product Id: ${tempSales.productId }</label>
										</div>
										<div class="form-group">
											<label for="price">Quantity: ${tempSales.quantity }</label>
										</div>
										<div class="form-group">
											<label for="price">Price: ${tempSales.price }</label>
										</div>


									</div>
									<div class="modal-footer">
										<input type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#EditModal${tempSales.id }"
											value="Edit">
										<button type="button" class="btn btn-danger"
											data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>

						<!-- Modal edit -->
						<div class="modal fade" id="EditModal${tempSales.id }"
							role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->

								<form:form action="Save-Sales" modelAttribute="theSales" id="pr" method="post">
									<span>${tempSales.id }</span>
									<div class="modal-content">
										<div class="modal-header modal-custom">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">Edit Sales</h4>
										</div>
										<div class="modal-body">
										
										<div class="form-row">
											<div class="form-group col-md-6">
												<label for="id">Id:</label> <input value="${tempSales.id }"
													type="text" class="form-control" name="id" id="id"
													readonly="readonly" />

											</div>
											<div class="form-group col-md-6">
													<label for="customerCar">Customer Car:</label> 
													<input type="text"
														class="form-control" value="${tempSales.customerCar }"
														name="customerCar" id="customerCar">
												</div>
											<div class="form-group col-md-6">
													<label for="type">Type:</label> <input type="text"
														class="form-control" value="${tempSales.type }"
														name="type" id="type">

												</div>
												<div class="form-group col-md-6">
													<label for="salesName">Product Name:</label> <input type="text"
														class="form-control" value="${tempSales.productName }"
														name="name" id="salesName">
												</div>

											</div>
											<div class="form-row">

												<div class="form-group col-md-4">
													<label for="quantity">Quatity:</label> <input type="number"
														class="form-control" value="${tempSales.quantity }"
														name="quantity" id="quantity">
												</div>

												<div class="form-group col-md-4">
													<label for="price">Price:</label> <input type="number"
														class="form-control" value="${tempSales.price }"
														name="price" id="price">
												</div>

											</div>


										</div>
										<div class="modal-footer">
											<input type="submit" class="btn btn-success" value="Save">
											<button type="button" class="btn btn-danger"
												data-dismiss="modal">Close</button>
										</div>
									</div>
								</form:form>
							</div>
						</div>

	<!-- Delete Modal -->
	<div class="modal fade" id="deleteModal${tempSales.id }" tabindex="-1" role="dialog"
		aria-labelledby="deleteModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header modal-custom">
					<h5 class="modal-title" id="deleteModalLabel">Delete Sales</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">Are You Want To Delete this Sales ID = ${tempSales.id }</div>
				<div class="modal-footer">
					<a type="button" href="${DeleteLink }" class="btn btn-danger">Confirm</a>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">No</button>
				</div>
			</div>
		</div>
	</div>
					</c:forEach>

				</table>
			<nav aria-label="page navigation example">
				<ul class="pagination" id="pagination">

					<c:url value="/Sales-list" var="prev">
						<c:param name="page" value="${page-1}" />
					</c:url>
					<c:if test="${page > 1}">
						<li class="page-item">
							<a href="<c:out value=" ${prev}" />" class="page-link">Previous</a>
						</li>
					</c:if>

					<c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
						<c:choose>
							<c:when test="${page == i.index}">

								<li class="page-item active"><span class="page-link">${i.index}</span></li>
							</c:when>
							<c:otherwise>
								<c:url value="/Sales-list" var="url">
									<c:param name="page" value="${i.index}" />
								</c:url>
								<li class="page-item"><a class="page-link"
										href='<c:out value="${url}" />'>${i.index}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:url value="/Sales-list" var="next">
						<c:param name="page" value="${page + 1}" />
					</c:url>
					<c:if test="${page + 1 <= maxPages}">
						<li class="page-item">
							<a href='<c:out value="${next}" />' class="page-link">Next</a>
						</li>
					</c:if>
				</ul>
			</nav>
			</div>
		</div>
	</div>



<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/script.js"></script>
  </body>
</html>
