<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Users</title>
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
					Users Lists <a href="${pageContext.request.contextPath }/Add-Users"><i
						class="fa fa-plus"></i></a> <span class="tooltip">add more</span>
				</h3>

				<div class="input-group search-input">
					<input type="text" class="form-control"
						placeholder="Search this Users">
					<div class="input-group-append">
						<button class="btn btn-secondary" type="button">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</div>

				<button data-toggle="modal" data-target="#AddModal"
					class="btn btn-dark">Add New Users</button>


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
							<th>User Name</th>
							<th>Password</th>
							<th>Phone</th>

							<th>View</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
					</thead>
					<c:forEach var="tempUser" items="${user}">
						<c:url var="DeleteLink" value="/Delete-User">
							<c:param name="userId" value="${tempUser.id}"></c:param>
						</c:url>
						<tr>
							<td>${tempUser.id}</td>
							<td> ${tempUser.fullName} </td>
							<td> ${tempUser.userName} </td>
							<td> ${tempUser.password} </td>
						 	<td> ${tempUser.phone} </td>
							<td>
								<button data-toggle="modal"
									data-target="#DetailsModal${tempUser.id }"
									class="btn btn-info btn-sm">View</button>
							</td>
							<td>
								<button data-toggle="modal"
									data-target="#EditModal${tempUser.id }"
									class="btn btn-primary btn-sm">Edit</button>
							</td>
							<td><button class="btn btn-danger btn-sm"
									data-toggle="modal" data-target="#deleteModal${tempUser.id }">
									Delete</button></td>
						</tr>
							<!-- Delete Modal -->
							<div class="modal fade" id="deleteModal${tempUser.id }" tabindex="-1" role="dialog"
								aria-labelledby="deleteModalLabel" aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="deleteModalLabel">Delete Users</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">Are You Want To Delete this Users ID = ${tempUser.id }</div>
										<div class="modal-footer">
											<a type="button" href="${DeleteLink }" class="btn btn-danger">Confirm</a>
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">No</button>
										</div>
									</div>
								</div>
							</div>
						<!-- Modal Detalis -->
						<div class="modal fade" id="DetailsModal${tempUser.id }"
							role="dialog">
							<div class="modal-dialog">

								<div class="modal-content">
									<div class="modal-header modal-custom">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">Users Detalis</h4>
									</div>
									<div class="modal-body">


										<div class="form-group">
											<label for="id"> Users Id: ${tempUser.id }</label>

										</div>

										<div class="form-group">
											<label for="fullName">FullName : ${tempUser.fullName }</label>
										</div>
										<div class="form-group">
											<label for="userName">UserName: ${tempUser.userName }</label>
										</div>
										<div class="form-group">
											<label for="password">Password: ${tempUser.password }</label>
										</div>
										<div class="form-group">
											<label for="phone">Phone: ${tempUser.phone }</label>
										</div>
									


									</div>
									<div class="modal-footer">
										<input type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#EditModal${tempUser.id }"
											value="Edit">
										<button type="button" class="btn btn-danger"
											data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>

						<!-- Modal edit -->
						<div class="modal fade" id="EditModal${tempUser.id }"
							role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->

								<form:form action="Save-User" modelAttribute="theUsers" id="pr"
									method="post">
									<span>${tempUser.id }</span>
									<div class="modal-content">
										<div class="modal-header modal-custom">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">Edit Users</h4>
										</div>
										<div class="modal-body">

											<div class="form-group">
												<label for="id">Id:</label> <input value="${tempUser.id }"
													type="text" class="form-control" name="id" id="id"
													readonly="readonly" />

											</div>

											<div class="form-row">
												<div class="form-group col-md-12">
													<label for="fullName">Full Name:</label> <input type="text"
														class="form-control" value="${tempUser.fullName }"
														name="fullName" id="fullName">
												</div>
									
											</div>
											<div class="form-row">

												<div class="form-group col-md-6">
													<label for="userName">User Name:</label> <input type="text"
														class="form-control" value="${tempUser.userName }"
														name="userName" id="userName">

												</div>
												<div class="form-group col-md-6">
													<label for="password">Password:</label> <input type="password"
														class="form-control" value="${tempUser.password }"
														name="password" id="password">
												</div>

												<div class="form-group col-md-4">
													<label for="phone">phone:</label> <input type="text"
														class="form-control" value="${tempUser.phone }"
														name="phone" id="phone">
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

					<c:url value="/Users" var="prev">
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
								<c:url value="/Users" var="url">
									<c:param name="page" value="${i.index}" />
								</c:url>
								<li class="page-item"><a class="page-link"
									href='<c:out value="${url}" />'>${i.index}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:url value="/Users" var="next">
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
					<h4 class="modal-title">Add New Users</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>

				</div>
				<div class="modal-body">

					<form:form action="Save-User" modelAttribute="theUsers"
						method="post">

						<input type="hidden" name="id" value="0" />
						<div class="form-group">
							<label for="inputAddress">Full Name</label> 
							<input name="fullName"	type="text" class="form-control" id="fullName"
								placeholder="Enter FullName" />
						</div>


						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="inputEmail4">User Name</label> 
								<input name="userName" type="text" class="form-control" id="userName"
									placeholder="Enter UserName" />
							</div>
							<div class="form-group col-md-6">
								<label for="inputPassword4">Password</label> 
								<input name="password" type="password" class="form-control" id="inputEmail4"
									placeholder="Enter Password" />

							</div>
						</div>


						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="inputEmail4">Phone</label> 
								<input name="phone"
									type="text" class="form-control" id="phone"
									placeholder="Enter Phone Number" />
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
