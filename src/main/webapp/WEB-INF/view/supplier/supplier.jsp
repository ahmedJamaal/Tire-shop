<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Supplier</title>
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
					Supplier Lists <a href="${pageContext.request.contextPath }/Add-Supplier"><i
						class="fa fa-plus"></i></a> <span class="tooltip">add more</span>
				</h3>

				<div class="input-group search-input">
					<input type="text" class="form-control"
						placeholder="Search this Supplier">
					<div class="input-group-append">
						<button class="btn btn-secondary" type="button">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</div>

				<button data-toggle="modal" data-target="#AddModal"
					class="btn btn-dark">Add New Supplier</button>


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
							<th>Full Name</th>
							<th>address</th>
							<th>phone 1</th>
							<th>Phone 2</th>
							<th>Info</th>

							<th>View</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
					</thead>
					<c:forEach var="tempSupplier" items="${supplier}">
						<c:url var="DeleteLink" value="/Delete-Supplier">
							<c:param name="supplierId" value="${tempSupplier.id}"></c:param>
						</c:url>
						<tr>
							<td>${tempSupplier.id}</td>
							<td> ${tempSupplier.fullName} </td>
							<td> ${tempSupplier.address} </td>
						 	<td> ${tempSupplier.phone1} </td>
						 	<td> ${tempSupplier.phone2} </td>
						 	<td> ${tempSupplier.info} </td>
							<td>
								<button data-toggle="modal"
									data-target="#DetailsModal${tempSupplier.id }"
									class="btn btn-info btn-sm">View</button>
							</td>
							<td>
								<button data-toggle="modal"
									data-target="#EditModal${tempSupplier.id }"
									class="btn btn-primary btn-sm">Edit</button>
							</td>
							<td><button class="btn btn-danger btn-sm"
									data-toggle="modal" data-target="#deleteModal${tempSupplier.id }">
									Delete</button></td>
						</tr>
							<!-- Delete Modal -->
							<div class="modal fade" id="deleteModal${tempSupplier.id }" tabindex="-1" role="dialog"
								aria-labelledby="deleteModalLabel" aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="deleteModalLabel">Delete Supplier</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">Are You Want To Delete this Supplier ID = ${tempSupplier.id }</div>
										<div class="modal-footer">
											<a type="button" href="${DeleteLink }" class="btn btn-danger">Confirm</a>
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">No</button>
										</div>
									</div>
								</div>
							</div>
						<!-- Modal Detalis -->
						<div class="modal fade" id="DetailsModal${tempSupplier.id }"
							role="dialog">
							<div class="modal-dialog">

								<div class="modal-content">
									<div class="modal-header modal-custom">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">Supplier Detalis</h4>
									</div>
									<div class="modal-body">


										<div class="form-group">
											<label for="id"> Supplier Id: ${tempSupplier.id }</label>

										</div>

										<div class="form-group">
											<label for="SupplierName">FullName : ${tempSupplier.fullName }</label>
										</div>
										<div class="form-group">
											<label for="address">Address: ${tempSupplier.address }</label>
										</div>
										<div class="form-group">
											<label for="phone1">Phone 1: ${tempSupplier.phone1 }</label>
										</div>
										<div class="form-group">
											<label for="phone2">phone 2: ${tempSupplier.phone2 }</label>
										</div>
										<div class="form-group">
											<label for="info">Notes : ${tempSupplier.info }</label>
										</div>
									


									</div>
									<div class="modal-footer">
										<input type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#EditModal${tempSupplier.id }"
											value="Edit">
										<button type="button" class="btn btn-danger"
											data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>

						<!-- Modal edit -->
						<div class="modal fade" id="EditModal${tempSupplier.id }"
							role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->

								<form:form action="Save-Supplier" modelAttribute="theSupplier" id="pr"
									method="post">
									<span>${tempSupplier.id }</span>
									<div class="modal-content">
										<div class="modal-header modal-custom">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">Edit Supplier</h4>
										</div>
										<div class="modal-body">


											<div class="form-row">
										<div class="form-group col-md-4">
												<label for="id">Id:</label> <input value="${tempSupplier.id }"
													type="text" class="form-control" name="id" id="id"
													readonly="readonly" />

											</div>
												<div class="form-group col-md-8">
													<label for="supplierName">Full Name:</label> <input type="text"
														class="form-control" value="${tempSupplier.fullName }"
														name="fullName" id="supplierName">
												</div>
									
											</div>
											<div class="form-row">

												<div class="form-group col-md-12">
													<label for="address">Address:</label> <input type="text"
														class="form-control" value="${tempSupplier.address }"
														name="address" id="address">

												</div>
												<div class="form-group col-md-6">
													<label for="phone1">Phone Number:</label> <input type="text"
														class="form-control" value="${tempSupplier.phone1 }"
														name="phone1" id="phone1">
												</div>

												<div class="form-group col-md-6">
													<label for="phone2">Home Number:</label> <input type="text"
														class="form-control" value="${tempSupplier.phone2 }"
														name="phone2" id="phone2">
												</div>
												
												<div class="form-group col-md-12">
													<label for="info">Notes :</label> 
													<textarea class="form-control" rows="3" name="info">${tempSupplier.info }</textarea>
												
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
					</c:forEach>

				</table>

				<nav aria-label="page navigation example">
				<ul class="pagination" id="pagination">

					<c:url value="/Supplier" var="prev">
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
								<c:url value="/Supplier" var="url">
									<c:param name="page" value="${i.index}" />
								</c:url>
								<li class="page-item"><a class="page-link"
									href='<c:out value="${url}" />'>${i.index}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:url value="/Supplier" var="next">
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

	<!-- Modal -->
	<div class="modal fade" id="AddModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->

			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Add New Supplier</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>

				</div>
				<div class="modal-body">

					<form:form action="Save-Supplier" modelAttribute="theSupplier"
						method="post">

						<input type="hidden" name="id" value="0" />
						<div class="form-group">
							<label for="supplierName">Full Name</label> 
							<input name="fullName"	type="text" class="form-control" id="supplierName"
								placeholder="Enter Supplier Name" />
						</div>


						<div class="form-row">
							<div class="form-group col-md-12">
								<label for="address">Address</label> 
								<input name="address" type="text" class="form-control" id="address"
									placeholder="Enter Address" />
							</div>
						</div>


						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="inputEmail4">Phone</label> 
								<input name="phone1"
									type="text" class="form-control" id="phone1"
									placeholder="Phone Number" />
							</div>
							<div class="form-group col-md-6">
								<label for="inputEmail4">Home Number</label> 
								<input name="phone2"
									type="text" class="form-control" id="phone2"
									placeholder="Home Number" />
							</div>
								<div class="form-group col-md-12">
										<label for="info">Notes :</label> 
										<textarea class="form-control" rows="3" name="info"></textarea>
												
								</div>
						
						</div>
				</div>
				<div class="modal-footer">
					<input type="submit" class="btn btn-success" value="Save">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>
			</div>
			</form:form>


		</div>
	</div>


<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>

  </body>
</html>
