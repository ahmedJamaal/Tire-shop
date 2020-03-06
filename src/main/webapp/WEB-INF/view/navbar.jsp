<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
       

<style>
.navbar{    font-size: 20px;}
.navbar-nav li{padding: 0px 10px;}
.navbar-nav  a:hover
,.navbar-nav  .active{
  background-color:#a9a6a6;
  color: #efefef !important;
}

</style>
		
<title>Insert title here</title>
</head>
<body>
    <!-- navbar -->
     <nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-color: #efefef !important;">

        <a href="${pageContext.request.contextPath }/" class="navbar-brand px-5"><img alt="image"  src="images/logo.png" style="width:140px;height: 50px;"></a>
        <button type="button" class="navbar-toggler bg-light" data-toggle="collapse" data-target="#nav"><span class="navbar-toggler-icon"></span></button>
        
        <div class="collapse navbar-collapse justify-content-end" id="nav">
            <ul class="navbar-nav">
                <li class="nav-item">
                	<a class="nav-link text-dark text-capitalize font-weight-bold px-3" href="${pageContext.request.contextPath }/">Home</a>
                </li>
                <li class="nav-item">
                	<a class="nav-link text-dark text-capitalize font-weight-bold px-3" href="${pageContext.request.contextPath }/Tires">tires</a>
                </li>
                <li class="nav-item">
                	<a class="nav-link text-dark text-capitalize font-weight-bold px-3" href="${pageContext.request.contextPath }/Battries">battries</a>
                </li>
                <li class="nav-item">
                	<a class="nav-link text-dark text-capitalize font-weight-bold px-3" href="${pageContext.request.contextPath }/Rimes">rimes</a>
                	</li>
                <li class="nav-item">
                	<a class="nav-link text-dark text-capitalize font-weight-bold px-3" href="${pageContext.request.contextPath }/Sales">sales</a>
                	</li>
                <li class="nav-item">
                	<a class="nav-link text-dark text-capitalize font-weight-bold px-3" href="${pageContext.request.contextPath }/Budget">budget</a>
                	</li>
            </ul>

         </div>

     </nav>

</body>
</html>