<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Tires</title>
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

			<h3>Tires Lists <a href="${pageContext.request.contextPath }/Add-Tires"><i class="fa fa-plus"></i></a>
				<span class="tooltip">add more</span>
			</h3>

			<div class="input-group search-input">
				<input type="text" class="form-control" placeholder="Search this Tires">
				<div class="input-group-append">
					<button class="btn btn-secondary" type="button">
						<i class="fa fa-search"></i>
					</button>
				</div>
			</div>

			<button data-toggle="modal" data-target="#AddModal" class="btn btn-primary">Add New Tires</button>


		</div>
	</div>
</div>

<div class="row">
	<div class="container">

		<div class="col-md-12">

			<table class="table table-striped table-responsive-md">
				<thead>
					<tr>
						<th>#</th>
						<th>Tires Name</th>
						<th>Dimension</th>
						<th>production Country</th>
						<th>production date</th>
						<th>Quantity</th>
						<th>Price</th>

						<th>View</th>
						<th>Edit</th>
						<th>Delete</th>
					</tr>
				</thead>
				<c:forEach var="tempTires" items="${tire}">

					<c:url var="DeleteLink" value="/Delete-Tires">
						<c:param name="tiresId" value="${tempTires.id}"></c:param>
					</c:url>
					<tr>
						<td> ${tempTires.id} </td>
						<td> ${tempTires.name} </td>
						<td> ${tempTires.deminsion} </td>
						<td> ${tempTires.productionCountry} </td>
		      			<td> ${tempTires.productionDate}</td>
		      			<td> ${tempTires.quatity} </td>
		      			<td> ${tempTires.price} </td>
						<td>
							<button data-toggle="modal" data-target="#DetailsModal${tempTires.id }"
								class="btn btn-info btn-sm">View</button>
						</td>
						<td>
							<button data-toggle="modal" data-target="#EditModal${tempTires.id }"
								class="btn btn-primary btn-sm">Edit</button>
						</td>
						<td><button class="btn btn-danger btn-sm"
									data-toggle="modal" data-target="#deleteModal">
									Delete</button>
						</td>
					</tr>

					<!-- Modal Detalis -->
					<div class="modal fade" id="DetailsModal${tempTires.id }" role="dialog">
						<div class="modal-dialog">

							<div class="modal-content">
								<div class="modal-header modal-custom">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">Tires Detalis</h4>
								</div>
								<div class="modal-body">


									<div class="form-group">
										<label for="usr"> Tires Id: ${tempTires.id }</label>

									</div>

									<div class="form-group">
										<label for="usr">Name : ${tempTires.name }</label>
									</div>
									<div class="form-group">
										<label for="usr">Size: ${tempTires.deminsion }</label>
									</div>
									<div class="form-group">
										<label for="usr">Made Country: ${tempTires.productionCountry }</label>
									</div>
									
									<div class="form-group">
										<label for="usr">Production Date: ${tempTires.productionDate}</label>
									</div>
									<div class="form-group">
										<label for="usr">Quatity: ${tempTires.quatity }</label>
									</div>
									<div class="form-group">
										<label for="usr">Price: ${tempTires.price }</label>
									</div>


								</div>
								<div class="modal-footer">
									<input type="button" class="btn btn-primary" data-toggle="modal"
										data-target="#EditModal${tempTires.id }" value="Edit">
									<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>

					<!-- Modal edit -->
					<div class="modal fade" id="EditModal${tempTires.id }" role="dialog">
						<div class="modal-dialog">

							<!-- Modal content-->

							<span>${tempTires.id }</span>
								<div class="modal-content">
									<div class="modal-header modal-custom">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">Edit Tires</h4>
									</div>
									<div class="modal-body">
										<form:form modelAttribute="theTires" action="Save-Tires" id="pr" method="post">
										<div class="form-group">
											<label for="usr">Id:</label>

											<input value="${tempTires.id }" type="text" class="form-control"
												name="id" id="usr" readonly="readonly" />

										</div>

										<div class="form-row">
											<div class="form-group col-md-6">
												<label for="usr">Name:</label>
												<input type="text" class="form-control" value="${tempTires.name }"
													name="name" id="usr">
											</div>
											<div class="form-group col-md-6">
												<label for="usr">production Country:</label>
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
												<label for="usr">Deminsion:</label>
												<input type="text" class="form-control" value="${tempTires.deminsion }"
													name="deminsion" id="usr">

											</div>
											<div class="form-group col-md-6">
												<label for="usr">Production Date:</label>
												
												${tempTires.productionDate}
												<input type="week" class="form-control"
												 value="${tempTires.productionDate }"  name="ProductionDate" id="tbDate">
												
											</div>
											<div class="form-group col-md-3">
												<label for="usr">Quatity:</label>
												<input type="number" class="form-control"
													value="${tempTires.quatity }" name="quatity" id="usr">
											</div>

											<div class="form-group col-md-3">
												<label for="usr">Price:</label>
												<input type="number" class="form-control"
													value="${tempTires.price }" name="price" id="usr">
											</div>

										</div>


									</div>
									<div class="modal-footer">
										<input type="submit" class="btn btn-success" value="Save">
										<button type="button" class="btn btn-danger"
											data-dismiss="modal">Close</button>
									</div>
									</form:form>
								</div>
							
						</div>
					</div>
				</c:forEach>

			</table>

			<nav aria-label="page navigation example">
				<ul class="pagination" id="pagination">

					<c:url value="/Tires" var="prev">
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
								<c:url value="/Tires" var="url">
									<c:param name="page" value="${i.index}" />
								</c:url>
								<li class="page-item"><a class="page-link"
										href='<c:out value="${url}" />'>${i.index}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:url value="/Tires" var="next">
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
<!-- Modal -->
<div class="modal fade" id="AddModal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->

		<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Add New Tires</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>

				</div>
				<div class="modal-body">
			
				<form:form  modelAttribute="theTires" action="Save-Tires" method="post">
			
					<input type="hidden" name="id"  value="0"/>
					<div class="form-group">
						<label for="inputAddress">Tires Name</label>
						<input name="name" type="text" class="form-control" id="inputAddress"
							placeholder="like ..BBS" />
					</div>


					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputEmail4">deminsion</label>
							<input name="deminsion" type="text" class="form-control" id="inputEmail4"
								placeholder="Like 265*225 Tires" />
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
							<label for="inputEmail4">Production Date</label>
							<input name="productionDate" type="week" class="form-control" id="inputEmail4"
								placeholder="Production Date" />
						</div>
						<div class="form-group col-md-3">
							<label for="inputEmail4">Quantity</label>
							<input name="quatity" type="number" class="form-control" id="inputEmail4"
								placeholder="Quantity" />
						</div>
						<div class="form-group col-md-3">
							<label for="inputPassword4">price</label>
							<input name="price" type="number" class="form-control" id="inputPassword4"
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
	<!-- Delete Modal -->
	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
		aria-labelledby="deleteModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
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
<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/propper.js"></script>
<script src="js/script.js"></script>
  </body>
</html>