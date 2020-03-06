<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<div class="row">
		<div class="container">
			<div class="Header-p">

				<h3>
					Battry Lists <a href="${pageContext.request.contextPath }/Add-Battry"><i
						class="fa fa-plus"></i></a> <span class="tooltip">add more</span>
				</h3>

				<div class="input-group search-input">
					<input type="text" class="form-control"
						placeholder="Search this Battry">
					<div class="input-group-append">
						<button class="btn btn-secondary" type="button">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</div>

				<button data-toggle="modal" data-target="#AddModal"
					class="btn btn-dark">Add New Battry</button>


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
							<th>Name</th>
							<th>capacity</th>
							<th>production Date</th>
							<th>warrantyYear</th>
							<th>Made Country</th>
							<th>Quanity</th>
							<th>Price</th>

							<th>View</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
					</thead>
					<c:forEach var="tempBattry" items="${battry}">

						<c:url var="DeleteLink" value="/Delete-Battry">
							<c:param name="battryId" value="${tempBattry.id}"></c:param>
						</c:url>
						<tr>
							<td>${tempBattry.id}</td>
							<td>${tempBattry.name}</td>
							<td>${tempBattry.capacity}</td>
							<td>${tempBattry.productionDate}</td>
							<td>${tempBattry.warrantyYear}</td>
							<td>${tempBattry.productionCountry}</td>
							<td>${tempBattry.quatity}</td>
							<td>${tempBattry.price}</td>
							<td>
								<button data-toggle="modal"
									data-target="#DetailsModal${tempBattry.id }"
									class="btn btn-info btn-sm">View</button>
							</td>
							<td>
								<button data-toggle="modal"
									data-target="#EditModal${tempBattry.id }"
									class="btn btn-primary btn-sm">Edit</button>
							</td>
							<td><button class="btn btn-danger btn-sm"
									data-toggle="modal" data-target="#deleteModal${tempBattry.id }">
									Delete</button></td>
						</tr>

						<!-- Modal Detalis -->
						<div class="modal fade" id="DetailsModal${tempBattry.id }"
							role="dialog">
							<div class="modal-dialog">

								<div class="modal-content">
									<div class="modal-header modal-custom">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">Battry Detalis</h4>
									</div>
									<div class="modal-body">


										<div class="form-group">
											<label for="usr"> Battry Id: ${tempBattry.id }</label>

										</div>

										<div class="form-group">
											<label for="name">Name : ${tempBattry.name }</label>
										</div>
										<div class="form-group">
											<label for="capacity">Capacity: ${tempBattry.capacity }</label>
										</div>
											<div class="form-group">
											<label for="productionDate">Production Date: ${tempBattry.productionDate }</label>
										</div>
										<div class="form-group">
											<label for="warrantyYear">WarrantyYear:
												${tempBattry.warrantyYear }</label>
										</div>
										<div class="form-group">
											<label for="productionCountry">Made Country:
												${tempBattry.productionCountry }</label>
										</div>
										<div class="form-group">
											<label for="quatity">Quatity: ${tempBattry.quatity }</label>
										</div>
										<div class="form-group">
											<label for="price">Price: ${tempBattry.price }</label>
										</div>


									</div>
									<div class="modal-footer">
										<input type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#EditModal${tempBattry.id }"
											value="Edit">
										<button type="button" class="btn btn-danger"
											data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>

						<!-- Modal edit -->
						<div class="modal fade" id="EditModal${tempBattry.id }"
							role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->

								<form:form action="Save-Battry" modelAttribute="theBattry" id="pr" method="post">
									<span>${tempBattry.id }</span>
									<div class="modal-content">
										<div class="modal-header modal-custom">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">Edit Battry</h4>
										</div>
										<div class="modal-body">

											<div class="form-group">
												<label for="id">Id:</label> 
												<input value="${tempBattry.id }"  type="text" class="form-control" name="id" id="id"
													readonly="readonly" />

											</div>

											<div class="form-row">
												<div class="form-group col-md-6">
													<label for="name">Name:</label> 
													<input type="text" class="form-control" value="${tempBattry.name }"
														name="name" id="name">
												</div>
												
												<div class="form-group col-md-6">
													<label for="Capacity">Capacity:</label> 
													<input type="text" class="form-control" value="${tempBattry.capacity }"
														name="capacity" id="Capacity">
												</div>
											</div>
												<div class="form-row">
												
												<div class="form-group col-md-6">
													<label for="productionDate">Production Date:</label> 
													<input type="month" class="form-control" value="${tempBattry.productionDate }"
														name="productionDate" id="productionDate">
												</div>
												<div class="form-group col-md-6">
													<label for="warrantyYear">Warranty Year:</label> 
													<input type="number" class="form-control" value="${tempBattry.warrantyYear }" min="1" 
														name="warrantyYear" id="warrantyYear">
												</div>
											</div>
											<div class="form-row">
												<div class="form-group col-md-5">
													<label for="usr">production Country:</label> <select
														name="productionCountry" class="form-control">
														<c:forEach var="tempcountry" items="${CountryList}">
															<c:if
																test="${tempBattry.productionCountry == tempcountry }">
																<option selected="selected" value="${tempcountry }">${tempcountry }</option>
															</c:if>
															<option value="${tempcountry }">${tempcountry }</option>

														</c:forEach>
													</select>
												</div>
												
												<div class="form-group col-md-3">
													<label for="quatity">Quatity:</label> <input type="number"
														class="form-control" value="${tempBattry.quatity }"
														name="quatity" id="quatity">
												</div>

												<div class="form-group col-md-4">
													<label for="price">Price:</label> <input type="number"
														class="form-control" value="${tempBattry.price }"
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
	<div class="modal fade" id="deleteModal${tempBattry.id }" tabindex="-1" role="dialog"
		aria-labelledby="deleteModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="deleteModalLabel">Delete Battry</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">Are You Want To Delete this Battry id= ${tempBattry.id }</div>
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

					<c:url value="/Battries" var="prev">
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
								<c:url value="/Battries" var="url">
									<c:param name="page" value="${i.index}" />
								</c:url>
								<li class="page-item"><a class="page-link"
									href='<c:out value="${url}" />'>${i.index}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:url value="/Battries" var="next">
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
					<h4 class="modal-title">Add New Battry</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>

				</div>
				<div class="modal-body">

					<form:form action="Save-Battry" modelAttribute="theBattry"
						method="post">

						<input type="hidden" name="id" value="0" />

						<div class="form-row">
								<div class="form-group col-md-12">
									<label for="battryName">Battry Name</label> 
									<input name="name" type="text" class="form-control" id="battryName"
										placeholder="Enter Battry Name...." />
								</div>
							
							<div class="form-group col-md-6">
								<label for="battryCapacity">Capacity</label> 
								<input name="battryCapacity" type="text" class="form-control" id="battryCapacity"
									placeholder="Enter Battry Capacity" />
							</div>
							<div class="form-group col-md-6">
								<label for="battryProductionDate">Production Date</label> 
								<input name="battryProductionDate" type="month" class="form-control" id="battryProductionDate"
									placeholder="Enter Production Date" />
							</div>
							<div class="form-group col-md-6">
								<label for="inputEmail4">Warranty Year</label> 
								<input name="warrantyYear" type="number" class="form-control" id="warrantyYear" min="1"
									placeholder="Enter Warranty Year" />
							</div>
							<div class="form-group col-md-5">
								<label for="productionCountry">Production Country</label> 
								<select name="productionCountry" class="form-control">
									<c:forEach var="tempcountry" items="${CountryList}">
										<option value="${tempcountry }">${tempcountry }</option>
									</c:forEach>
								</select>

							</div>
							<div class="form-group col-md-6">
								<label for="quatity">Quantity</label> <input name="quatity" min="1"
									type="number" class="form-control" id="quatity"
									placeholder="Quantity Num" />
							</div>
							<div class="form-group col-md-6">
								<label for="price">price</label> <input name="price"  min="1"
									type="number" class="form-control" id="price"
									placeholder="Price Egy" />
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
