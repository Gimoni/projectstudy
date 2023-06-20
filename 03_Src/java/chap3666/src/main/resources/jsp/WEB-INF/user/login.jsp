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
<link rel="stylesheet" href="/webjars/bootstrap/5.2.3/css/bootstrap.css">
<link rel="icon" href="/heart_like_love_icon.png"> 
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link href="css/index.css" rel="stylesheet" type="text/css" />
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script src="/webjars/jquery/jquery.min.js"></script>

<title>login.jsp</title>
</head>
<style type="text/css">
/* div#box { */
/* 	background-image: url("resources/static/img/face_grin_tongue_icon.png"); */
/* } */

.hi {
	border: sold pink;
	background-color: white;
	border-radius: 15%;
	text-decoration: none;
}
.hi a {
	text-align: right;
}
.hi:hover {	
	
	background-color: #A0E71C;
}

hr {
    clear: both;
    visibility: hidden;
}

h1 {
	text-align: center;
}

div.box {
	background-image: url("img/omg.png");
}
</style>
<body>
<div class="box">
<h1>Login</h1>
<hr>
<a class="hi" href="/">HOME</a>
<hr>
<section class="container">
	<form action="/user/login" method="post">
		<input class="form-control" name="username" placeholder="USERNAME" value="${param.username}"/>
		<hr>
		<input class="form-control" name="password" type="password" placeholder="PASSWORD" value="${param.password}"/>
		<hr>
		<input name="remember-me" type="checkbox" checked="checked"> Remember me
		<hr>
		<input class="btn btn-primary" type="submit" value="submit"/>
		<a href="/user/create" >create</a>
	</form>
</section>
<span style="color: red;"> ${param.message}</span>
<c:if test="${exception ne null}">
	<h1>${exception.message}</h1>
</c:if>

</div>
</body>
</html>