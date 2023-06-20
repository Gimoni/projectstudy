<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="Cache-Control" content="no-store">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="/favicon.png">
<link rel="stylesheet" type="text/css" href="/css/success.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script src="/webjars/jquery/jquery.min.js"></script>

<title>success.jsp</title>
</head>
<body>
<body>
<div class="bigdiv">
  	<sec:authorize access="isAnonymous()">
	<button><a class="hi" href="/">home</a></button>
	
	</sec:authorize>
	
	<sec:authorize access="isAuthenticated()">
	<a  class="hi" href="/user/logout">Logout</a>
	</sec:authorize>
<h1>Success Sign In</h1>
<hr class="nonhr">
<div class="container-fluid p-5 bg-danger text-white text-center">
  <div class="d-flex justify-content-front">

  </div>
  <h1></h1>
		<hr class="nonhr">
		<hr class="nonhr">
  <section class="container">
	<form action="/user/login" method="post">
		<input class="form-control" name="username" placeholder="USERNAME" value="${param.username}"/>
		<hr class="nonhr">
		<input class="form-control" name="password" type="password" placeholder="PASSWORD" value="${param.password}"/>
		<hr class="nonhr">
		<input name="remember-me" type="checkbox" checked="checked"> Remember me
		<hr class="nonhr">
		<input class="btn btn-primary" type="submit" value="submit"/>
		<a href="/user/create" >create</a>
	</form>
</section>
  <div class="d-flex justify-content-end">
  <p>hey</p> 
  </div>
</div>

<span style="color: red;"> ${param.message}</span>
<c:if test="${exception ne null}">
	<h1>${exception.message}</h1>
</c:if>
</div>
</body>
</html>