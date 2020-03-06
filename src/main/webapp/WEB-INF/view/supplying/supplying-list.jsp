<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Supplying</title>
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
					Supplying Lists 
				</h3>

				<div class="input-group search-input">
					<input type="text" class="form-control"
						placeholder="Search this Supplying">
					<div class="input-group-append">
						<button class="btn btn-secondary" type="button">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</div>

				<a  href="${pageContext.request.contextPath }/Supplying" class="btn btn-dark">Add New Supplying</a>


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
							<th>Type</th>
							<th>product Id</th>
							<th>date</th>
							
							<th>Quantity Before</th>
							<th>Quantity</th>

							<th>View</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
					</thead>
					<c:forEach var="tempSupplying" items="${theSupplying}">

						<c:url var="DeleteLink" value="/Delete-Supplying">
							<c:param name="supplyingId" value="${tempSupplying.id}"></c:param>
						</c:url>
						<tr>
							<td>${tempSupplying.id}</td>
							<td>${tempSupplying.name}</td>
							<td>${tempSupplying.type}</td>
							<td>${tempSupplying.productId}</td>
							<td> <fmt:formatDate pattern="dd-MM-yyyy" value="${tempSupplying.date}" /> </td>
							<td>${tempSupplying.quantity_Before}</td>
							<td>${tempSupplying.quantity}</td>
							<td>
								<button data-toggle="modal"
									data-target="#DetailsModal${tempSupplying.id }"
									class="btn btn-info btn-sm">View</button>
							</td>
							<td>
								<button data-toggle="modal"
									data-target="#EditModal${tempSupplying.id }"
									class="btn btn-primary btn-sm">Edit</button>
							</td>
							<td><button class="btn btn-danger btn-sm"
									data-toggle="modal" data-target="#deleteModal${tempSupplying.id }">
									Delete</button></td>
						</tr>

						<!-- Modal Detalis -->
						<div class="modal fade" id="DetailsModal${tempSupplying.id }"
							role="dialog">
							<div class="modal-dialog">

								<div class="modal-content">
									<div class="modal-header modal-custom">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">Supplying Detalis</h4>
									</div>
									<div class="modal-body">


										<div class="form-group">
											<label for="id"> Supplying Id: ${tempSupplying.id }</label>

										</div>

										<div class="form-group">
											<label for="supplyingName">Product Name : ${tempSupplying.name }</label>
										</div>
									
										<div class="form-group">
											<label for="country">Type :
												${tempSupplying.type }</label>
										</div>
										<div class="form-group">
											<label for="date">Date: ${tempSupplying.date }</label>
										</div>
										<div class="form-group">
											<label for="price">Product Id: ${tempSupplying.productId }</label>
										</div>
										<div class="form-group">
											<label for="price">Quantity Before: ${tempSupplying.quantity_Before }</label>
										</div>
										<div class="form-group">
											<label for="price">Quantity: ${tempSupplying.quantity }</label>
										</div>


									</div>
									<div class="modal-footer">
										<input type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#EditModal${tempSupplying.id }"
											value="Edit">
										<button type="button" class="btn btn-danger"
											data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>

						<!-- Modal edit -->
						<div class="modal fade" id="EditModal${tempSupplying.id }"
							role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->

								<form:form action="Save-Supplying" modelAttribute="theSupplying" id="pr" method="post">
									<span>${tempSupplying.id }</span>
									<div class="modal-content">
										<div class="modal-header modal-custom">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">Edit Supplying</h4>
										</div>
										<div class="modal-body">
										
										<div class="form-row">
											<div class="form-group col-md-6">
												<label for="id">Id:</label> <input value="${tempSupplying.id }"
													type="text" class="form-control" name="id" id="id"
													readonly="readonly" />

											</div>
	
												<div class="form-group col-md-6">
													<label for="type">Type:</label> 							
													<select name="type" value="${tempSupplying.type }" class="form-control" id="type">
														<option value="none" label="none">Select Catgory</option>
														<option value="Tire" label="Tire">Tire</option>
														<option value="Battry" label="Battry">Battry</option>
														<option value="Rimes" label="Rimes">Rimes</option>
													</select>

												</div>
												<div class="form-group col-md-6">
													<label for="supplyingName">Product Name:</label> 
													<select name="name" class="form-control" id="product" required="true">
														<option value="none">Select Product</option>
													</select>
												</div>

											</div>
											<div class="form-row">

												<div class="form-group col-md-4">
													<label for="quantity">Quatity:</label> <input type="number"
														class="form-control" value="${tempSupplying.quantity }"
														name="quantity" id="quantity">
												</div>

												<div class="form-group col-md-4">
													<label for="price">Quantity Before:</label> 
													<input type="number" readonly="readonly"
														class="form-control" value="${tempSupplying.quantity_Before }"
														name="quantity_Before" id="quantity_Before">
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
	<div class="modal fade" id="deleteModal${tempSupplying.id }" tabindex="-1" role="dialog"
		aria-labelledby="deleteModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header modal-custom">
					<h5 class="modal-title" id="deleteModalLabel">Delete Supplying</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">Are You Want To Delete this Supplying ID = ${tempSupplying.id }</div>
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

					<c:url value="/Supplying-list" var="prev">
						<c:param name="page" value="${page-1}" />
					</c:url>
					<c:if test="${page > 1}">
						<li class="page-item"><a href="<c:out value=" ${prev}" />"
							class="page-link">Previous</a></li>
					</c:if>

					<c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
						<c:choose>
							<c:when test="${page == i.index}">

								<li class="page-item active"><span class="page-link">${i.index}</span></li>
							</c:when>
							<c:otherwise>
								<c:url value="/Supplying-list" var="url">
									<c:param name="page" value="${i.index}" />
								</c:url>
								<li class="page-item"><a class="page-link"
									href='<c:out value="${url}" />'>${i.index}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:url value="/Supplying-list" var="next">
						<c:param name="page" value="${page + 1}" />
					</c:url>
					<c:if test="${page + 1 <= maxPages}">
						<li class="page-item"><a href='<c:out value="${next}" />'
							class="page-link">Next</a></li>
					</c:if>
				</ul>
				</nav>
			</div>
		</div>
	</div>



<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/myAjax.js"></script>
  </body>
</html>
