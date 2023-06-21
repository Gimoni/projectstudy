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
<body>
<div class = "box">
   <div class="login-container">
       <img src="assets/avatar.jpg" alt="avatar image">
       <form action="/user/login" method="post">
           <h1>LOGIN</h1>
           <div>
               <label>Username</label>
               <input class="form-control" name="username" placeholder="USERNAME" value="${param.username}"/>
           </div>
           <div>
               <label>Password</label>
               <input class="form-control" name="password" type="password" placeholder="PASSWORD" value="${param.password}"/>
           </div>
           <input name="remember-me" type="checkbox" checked="checked"> Remember me
           <input type="submit" name="login" value="LOGIN">
           <a href="#">Forgot Password?</a>
           <a href="#">Forgot Username?</a>
       </form>
   </div>
    <span style="color: red;"> ${param.message}</span>
<c:if test="${exception ne null}">
	<h1>${exception.message}</h1>
</c:if>
</div>
</body>
</html>
</html>