<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/fontAwsome/css/all.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">

<title>Rimes</title>
</head>

<body>
	<jsp:include page="/WEB-INF/view/navbar.jsp"></jsp:include>
	<div class="row">
		<div class="container">
			<div class="Header-p">

				<h3>
					Rimes Lists <a href="${pageContext.request.contextPath }/Add-Rimes"><i
						class="fa fa-plus"></i></a> <span class="tooltip">add more</span>
				</h3>

				<div class="input-group search-input">
					<input type="text" class="form-control"
						placeholder="Search this Rimes">
					<div class="input-group-append">
						<button class="btn btn-secondary" type="button">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</div>

				<button data-toggle="modal" data-target="#AddModal"
					class="btn btn-dark">Add New Rimes</button>


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
							<th>Size</th>
							<th>Made Country</th>
							<th>Quanity</th>
							<th>Price</th>

							<th>View</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
					</thead>
					<c:forEach var="tempRimes" items="${rimes}">

						<c:url var="DeleteLink" value="/Delete-Rimes">
							<c:param name="rimesId" value="${tempRimes.id}"></c:param>
						</c:url>
						<tr>
							<td>${tempRimes.id}</td>
							<td>${tempRimes.name}</td>
							<td>${tempRimes.size}</td>
							<td>${tempRimes.productionCountry}</td>
							<td>${tempRimes.quatity}</td>
							<td>${tempRimes.price}</td>
							<td>
								<button data-toggle="modal"
									data-target="#DetailsModal${tempRimes.id }"
									class="btn btn-info btn-sm">View</button>
							</td>
							<td>
								<button data-toggle="modal"
									data-target="#EditModal${tempRimes.id }"
									class="btn btn-primary btn-sm">Edit</button>
							</td>
							<td><button class="btn btn-danger btn-sm"
									data-toggle="modal" data-target="#deleteModal${tempRimes.id }">
									Delete</button></td>
						</tr>

						<!-- Modal Detalis -->
						<div class="modal fade" id="DetailsModal${tempRimes.id }"
							role="dialog">
							<div class="modal-dialog">

								<div class="modal-content">
									<div class="modal-header modal-custom">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">Rimes Detalis</h4>
									</div>
									<div class="modal-body">


										<div class="form-group">
											<label for="id"> Rimes Id: ${tempRimes.id }</label>

										</div>

										<div class="form-group">
											<label for="rimesName">Name : ${tempRimes.name }</label>
										</div>
										<div class="form-group">
											<label for="rimesSize">Size: ${tempRimes.size }</label>
										</div>
										<div class="form-group">
											<label for="country">Made Country:
												${tempRimes.productionCountry }</label>
										</div>
										<div class="form-group">
											<label for="quatity">Quatity: ${tempRimes.quatity }</label>
										</div>
										<div class="form-group">
											<label for="price">Price: ${tempRimes.price }</label>
										</div>


									</div>
									<div class="modal-footer">
										<input type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#EditModal${tempRimes.id }"
											value="Edit">
										<button type="button" class="btn btn-danger"
											data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>

						<!-- Modal edit -->
						<div class="modal fade" id="EditModal${tempRimes.id }"
							role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->

								<form:form action="Save-Rimes" modelAttribute="theRimes" id="pr"
									method="post">
									<span>${tempRimes.id }</span>
									<div class="modal-content">
										<div class="modal-header modal-custom">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">Edit Rimes</h4>
										</div>
										<div class="modal-body">

											<div class="form-group">
												<label for="id">Id:</label> <input value="${tempRimes.id }"
													type="text" class="form-control" name="id" id="id"
													readonly="readonly" />

											</div>

											<div class="form-row">
												<div class="form-group col-md-6">
													<label for="tiresName">Name:</label> <input type="text"
														class="form-control" value="${tempRimes.name }"
														name="name" id="tiresName">
												</div>
												<div class="form-group col-md-6">
													<label for="country">production Country:</label> 
													<select name="productionCountry" class="form-control">
														<c:forEach var="tempcountry" items="${CountryList}">
															<c:if
																test="${tempRimes.productionCountry == tempcountry }">
																<option selected="selected" value="${tempcountry }">${tempcountry }</option>
															</c:if>
															<option value="${tempcountry }">${tempcountry }</option>

														</c:forEach>
													</select>
												</div>
											</div>
											<div class="form-row">

												<div class="form-group col-md-4">
													<label for="size">Size:</label> <input type="text"
														class="form-control" value="${tempRimes.size }"
														name="size" id="size">

												</div>
												<div class="form-group col-md-4">
													<label for="quantity">Quatity:</label> <input type="number"
														class="form-control" value="${tempRimes.quatity }"
														name="quatity" id="quantity">
												</div>

												<div class="form-group col-md-4">
													<label for="price">Price:</label> <input type="number"
														class="form-control" value="${tempRimes.price }"
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
	<div class="modal fade" id="deleteModal${tempRimes.id }" tabindex="-1" role="dialog"
		aria-labelledby="deleteModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header modal-custom">
					<h5 class="modal-title" id="deleteModalLabel">Delete Rimes</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">Are You Want To Delete this Rimes</div>
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

					<c:url value="/Rimes" var="prev">
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
								<c:url value="/Rimes" var="url">
									<c:param name="page" value="${i.index}" />
								</c:url>
								<li class="page-item"><a class="page-link"
									href='<c:out value="${url}" />'>${i.index}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:url value="/Rimes" var="next">
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
					<h4 class="modal-title">Add New Rimes</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>

				</div>
				<div class="modal-body">

					<form:form action="Save-Rimes" modelAttribute="theRimes"
						method="post">

						<input type="hidden" name="id" value="0" />
						<div class="form-group ">
							<label for="rimesName">Rimes Name</label> <input name="name"
								type="text" class="form-control" id="rimesName"
								placeholder="like ..BBS" />
						</div>


						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="size">Size</label> <input name="size"
									type="text" class="form-control" id="size"
									placeholder="Like 18 Rimes" />
							</div>
							<div class="form-group col-md-6">
								<label for="inputPassword4">Production Country</label> 
								<select name="productionCountry" class="form-control">
									<c:forEach var="tempcountry" items="${CountryList}">
										<option value="${tempcountry }">${tempcountry }</option>
									</c:forEach>
								</select>

							</div>
						</div>


						<div class="form-row">
							
							<div class="form-group col-md-6">
								<label for="Quantity">Quantity</label> <input name="quatity"
									type="number" class="form-control" id="Quantity"
									placeholder="Quantity" />
							</div>
							<div class="form-group col-md-6">
								<label for="price">price</label> <input name="price"
									type="number" class="form-control" id="price"
									placeholder="Price ...egy" />
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
	<script src="js/proper.min.js"></script>
	<script src="js/proper.js"></script>

</body>

</html>