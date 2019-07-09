<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Budgets Main</title>
    <!-- Font Awesome -->

        <link rel="stylesheet" href="css/Responsive.css">
        <link rel="stylesheet" href="css/button.css">
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <link href="css/mdb.min.css" rel="stylesheet">
        <link href="css/fontAwsome/css/all.css" rel="stylesheet">

		<link href="css/styles.css" rel="stylesheet">
		<link type="text/css" rel="stylesheet" href="css/Budgetstyle.css">
  </head>
  <body>

    <!--Navbar-->
    <div class="header">
<div class="container">
  <div class="nav">

  <input type="checkbox" id="nav-check">
  <div class="nav-header">
    <div class="nav-title">
  <a href="${pageContext.request.contextPath }/">
    <img alt="image"  src="images/logo.png" style="width:160px;height: 60px;">
</a>
    </div>
  </div>
  <div class="nav-btn">
    <label for="nav-check">
      <span></span>
      <span></span>
      <span></span>
    </label>
  </div>

  <div class="nav-links">



    <a class="nav-link" href="${pageContext.request.contextPath }/">Home</a>

<a class="nav-link" href="${pageContext.request.contextPath }/Tires">tires</a>


<a class="nav-link" href="${pageContext.request.contextPath }/Battries">batteries</a>


<a class="nav-link" href="${pageContext.request.contextPath }/Supplier">supplier</a>


<a class="nav-link" href="${pageContext.request.contextPath }/Salles">Salles</a>

<a class="nav-link" href="${pageContext.request.contextPath }/Users">Users</a>

<a class="nav-link active" href="${pageContext.request.contextPath }/Budget">Budget</a>
  </div>
  </div>
</div>
</div>


        <div class="top">
            <div class="budget">
                <div class="budget__title">
                    Available Budget in <span class="budget__title--month">${expencess.date}</span>:
                </div>
                
				 
                <div class="budget__value">${total }</div>

                <div class="budget__income clearfix">
                    <div class="budget__income--text">Income</div>

                        <div class="budget__income--value">+ ${totIncome }</div>
                        <div class="budget__income--percentage"></div>

                </div>
  <fmt:formatNumber var="ExpencePrecentage" value="${toExpenses/total*100}" maxFractionDigits="0" />
 				 
                <div class="budget__expenses clearfix">
                    <div class="budget__expenses--text">Expenses</div>
                        <div class="budget__expenses--value">- ${toExpenses}</div>
                        <div class="budget__expenses--percentage">${ExpencePrecentage}%</div>
                </div>
                <a href="${pageContext.request.contextPath }/Budget-Table" class="hre"><i class="fas fa-arrow-right"></i>
                </a>
            </div>
        </div>



        <div class="bottom">
            <div class="add">
                <div class="add__container">
                <form:form action="Save-Budget" modelAttribute="budget" method="POST">
                    <form:select path="type" class="add__type">
                        <form:option label="Income" value="Income"/>
                        <form:option label="Expences" value="Expences"/>
                    </form:select>
                    
                    <form:input path ="name" type="text" class="add__description" placeholder="Add description"/>
                    <form:input path="value" type="number" class="add__value" placeholder="Value"/>
                    <input type="submit" class="add__btn" value="Save"/>
             
                    </form:form>
                </div>
            </div>
            
          

            <div class="container clearfix">
              <div class="list-content">
              
				
				
                <div class="income">
                    <h2 class="icome__title">Income</h2>
				
             
              
                    <div class="income__list">
					<c:forEach var="tempIncome" items="${theIncome}">
						<c:url var="DeleteLink" value="/Delete-Budget">
		  					<c:param name="budgetId" value="${tempIncome.id}"></c:param>
		  				</c:url>
		  				
                        <div class="item clearfix" id="income-0">
                            <div class="item__description">${tempIncome.name}</div>
                            <div class="right clearfix">
                                <div class="item__value">+ ${tempIncome.value}</div>
                                <div class="item__delete">
                                    <a href="${DeleteLink }" class="item__delete--btn"><i class="fa fa-times-circle"></i></a>
                                </div>
                            </div>
                        </div>

				</c:forEach>
                    </div>
                </div>
			

			
                <div class="expenses">
                    <h2 class="expenses__title">Expenses</h2>

                    <div class="expenses__list">


                   
					 <c:forEach var="tempExpenses" items="${theExpenses}">
					 	
					 	<c:url var="DeleteLink" value="/Delete-Budget">
		  					<c:param name="budgetId" value="${tempExpenses.id}"></c:param>
		  				</c:url>
		  				
		  				<fmt:formatNumber var="ExpencePre" value="${tempExpenses.value/toExpenses*100}" maxFractionDigits="0" />
                        <div class="item clearfix" id="expense-1">
                            <div class="item__description">${tempExpenses.name}</div>
                            <div class="right clearfix">
                                <div class="item__value">- ${tempExpenses.value}</div>
                                <div class="item__percentage">${ExpencePre}%</div>
                                <div class="item__delete">
                                    <a href="${DeleteLink }" class="item__delete--btn"><i class="fa fa-times-circle"></i></a>
                                </div>
                            </div>
                        </div>
				
					</c:forEach>

                    </div>
                </div>
            </div>

         
        </div>
  </div>
        <script src="js/BudgetApp.js"></script>
         <script src="js/jquery-3.4.1.min.js"></script>
    </body>
</html>
