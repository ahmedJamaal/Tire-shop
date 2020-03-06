<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!doctype html>
<html lang="en">

<head>
	
	<title>Login Page</title>
	<meta charset="utf-8">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/fontAwsome/css/all.css" rel="stylesheet">
		<link href="css/login-style.css" rel="stylesheet">

</head>

<body>
	
	<div class="login">
		<div class="container-login">
			<div class="login-form">
				<span class="header">
					TireShop
				</span>
				
				<div class="error">
					<c:if test="${param.error != null}">
						<div class="alert alert-danger col-md-12">
							Invalid username and password.
						</div>
					</c:if>
				</div>
			
				<form:form action="${pageContext.request.contextPath}/authenticateTheUser" 
				method="POST" class="form">
					<div class="form-input validate-input">
						<input class="input-form" type="text" name="username" placeholder="User Name">
						<span class="focus-input"></span>
						<span class="symbol-input">
							<i class="fa fa-user"></i>
						</span>
					</div>

					<div class="form-input validate-input">
						<input class="input-form" type="password" name="password" placeholder="Password">
						<span class="focus-input"></span>
												
						<span class="symbol-input">
							<i class="fa fa-lock" ></i>
						</span>
					</div>
					
					<div class="container-login-form-btn">
						<button type="submit" class="login-form-btn">
							Login
						</button>
					</div>

					<div class="bottom-txt">
						<span class="txt">
							Or login with
						</span>
					</div>

					<a href="#" class="btn-face">
						<i class="fab fa-facebook-f"></i>
						Facebook
					</a>

					<a href="#" class="btn-google">
						<i class="fab fa-google"></i>
						Google
					</a>

				</form:form>
			</div>
			<div class="picture">
				`			<img src="images/login-page.jpg">
						</div>
		</div>
		
	</div>


</body>
</html>