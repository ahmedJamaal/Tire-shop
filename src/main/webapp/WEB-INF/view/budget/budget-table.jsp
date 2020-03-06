<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Budgets Table</title>
    <!-- Font Awesome -->

       <link href="css/bootstrap.min.css" rel="stylesheet">


<link href="css/styles.css" rel="stylesheet">
  </head>
  <body>
<jsp:include page="/WEB-INF/view/navbar.jsp"></jsp:include>
            <div class="top top-budget-table">
                <div class="budget">
                    <div class="budget__title">
                        Available Budget in <span class="budget__title--month">${year }</span>
                    </div>

                    <div class="budget__value">${totalYearly }</div>
                    </div>
                    <div class="budget-btn">


                    <div class="budget__income clearfix">
                        <div class="budget__income--text">Total Income</div>
                        <fmt:formatNumber var="IncomePrecentage" value="${IncomeYearly/totalYearly*100}" maxFractionDigits="0" />
             
						  <div class="budget__income--value">+ ${IncomeYearly }</div>
                            <div class="budget__income--percentage">${100 - ExpencePrecentage }%</div>

                    </div>
 					 <fmt:formatNumber var="ExpencePrecentage" value="${ExpensesYearly/totalYearly*100}" 
 					 maxFractionDigits="0" />
                    <div class="budget__expenses clearfix">
                        <div class="budget__expenses--text">Total Expenses</div>
                            <div class="budget__expenses--value">- ${ExpensesYearly}</div>
                            <div class="budget__expenses--percentage">${ ExpencePrecentage}%</div>
                    </div>
                    <a href="${pageContext.request.contextPath }/Budget" class="hre"><i class="fas fa-arrow-left"></i>
                    </a>
                    


            </div>
            </div>

<div class="row">
		<div class="container">
			<div class="Header-p">

				<h3>
					Budget Lists <a href="${pageContext.request.contextPath }/Add-Budget"><i
						class="fa fa-plus"></i></a> <span class="tooltip">add more</span>
				</h3>

				<div class="input-group search-input">
					<input type="text" class="form-control"
						placeholder="Search this Budget">
					<div class="input-group-append">
						<button class="btn btn-secondary" type="button">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</div>

				<button data-toggle="modal" data-target="#AddModal"
					class="btn btn-dark">Add New Budget</button>


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
							<th>name</th>
							<th>Type</th>
							<th>Value</th>
							<th>date</th>
							<th>View</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
					</thead>
					<c:forEach var="tempBudget" items="${theBudget}">
						<c:url var="DeleteLink" value="/Delete-Budget">
							<c:param name="budgetId" value="${tempBudget.id}"></c:param>
						</c:url>
						<tr>
							<td>${tempBudget.id}</td>
							<td>${tempBudget.name}</td>
							<td>${tempBudget.type}</td>
							<td>${tempBudget.value}</td>
							<td>${tempBudget.date}</td>
							<td>
								<button data-toggle="modal"
									data-target="#DetailsModal${tempBudget.id }"
									class="btn btn-info btn-sm">View</button>
							</td>
							<td>
								<button data-toggle="modal"
									data-target="#EditModal${tempBudget.id }"
									class="btn btn-primary btn-sm">Edit</button>
							</td>
							<td><button class="btn btn-danger btn-sm"
									data-toggle="modal" data-target="#deleteModal${tempBudget.id }">
									Delete</button></td>
						</tr>

						<!-- Modal Detalis -->
						<div class="modal fade" id="DetailsModal${tempBudget.id }"
							role="dialog">
							<div class="modal-dialog">

								<div class="modal-content">
									<div class="modal-header modal-custom">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">Budget Detalis</h4>
									</div>
									<div class="modal-body">


										<div class="form-group">
											<label for="id"> Budget Id: ${tempBudget.id }</label>

										</div>

										<div class="form-group">
											<label for="budgetName">Name : ${tempBudget.name }</label>
										</div>
										<div class="form-group">
											<label for="budgetType">Type: ${tempBudget.type }</label>
										</div>
										<div class="form-group">
											<label for="value">Value: ${tempBudget.value }</label>
										</div>
										<div class="form-group">
											<label for="date">Date: ${tempBudget.date }</label>
										</div>


									</div>
									<div class="modal-footer">
										<input type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#EditModal${tempBudget.id }"
											value="Edit">
										<button type="button" class="btn btn-danger"
											data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>

						<!-- Modal edit -->
						<div class="modal fade" id="EditModal${tempBudget.id }"
							role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->

								<form:form action="Save-Budget" modelAttribute="theBudget" id="pr"
									method="post">
									<span>${tempBudget.id }</span>
									<div class="modal-content">
										<div class="modal-header modal-custom">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">Edit Budget</h4>
										</div>
										<div class="modal-body">

											<div class="form-group">
												<label for="id">Id:</label> <input value="${tempBudget.id }"
													type="text" class="form-control" name="id" id="id"
													readonly="readonly" />

											</div>

											<div class="form-row">
												<div class="form-group col-md-6">
													<label for="budgetName">Name:</label> <input type="text"
														class="form-control" value="${tempBudget.name }"
														name="name" id="budgetName">
												</div>
												<div class="form-group col-md-6">
													<label for="country">Product Type:</label> 
													<select name="type" class="form-control">
														<option value="${tempBudget.name }"></option>
													</select>
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
	<div class="modal fade" id="deleteModal${tempBudget.id }" tabindex="-1" role="dialog"
		aria-labelledby="deleteModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header modal-custom">
					<h5 class="modal-title" id="deleteModalLabel">Delete Budget</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">Are You Want To Delete this Budget ID = ${tempBudget.id }</div>
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

					<c:url value="/Budget-Table" var="prev">
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
								<c:url value="/Budget-Table" var="url">
									<c:param name="page" value="${i.index}" />
								</c:url>
								<li class="page-item"><a class="page-link"
									href='<c:out value="${url}" />'>${i.index}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:url value="/Budget-Table" var="next">
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
<script src="js/propper.js"></script>
<script src="js/script.js"></script>
  </body>
</html>