<%@ page language="java" contentType="text/html; charset=UTF-8"
       pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="Cache-Control" content="no-store">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="/heart_like_love_icon.png"> 
<link rel="stylesheet" type="text/css" href="/css/usercreate.css"> 
<link rel="stylesheet" href="/webjars/bootstrap/5.2.3/css/bootstrap.min.css">
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script src="/webjars/jquery/jquery.min.js"></script>

<title>create.jsp</title>

</head>

<body>
<div class = "box" >

   <div class="login-container" id="create">
       <img src="/img/playdjicon.jpg" alt="">
         <div>
<button class="button "><a href="/" class="home" > home </a></button>
        </div>
       <form action="/user/create" method="post">
          
           <h1>LOGIN</h1>
           <div>
               <label>ID</label>
               <input class="form-control"    id="id" name="id"  type="text"  placeholder="USERNAME" value="${param.id}"/>
           </div>
           <div>
               <label>Password</label>
               <input class="form-control" name="password" type="password" placeholder="PASSWORD" value="${param.password}"/>
           </div>
           <div>
               <label>Name</label>
               <input class="form-control"    id="name" name="name"   type="text"  placeholder="NAME" value="${param.name}"/>
           </div>
           <div>
               <label>Mobile</label>
	           <input class="form-control"    id="mobile"  name="mobile" type="text" placeholder="MOBILE" value="${param.mobile }"/>
           </div>
           <input name="remember-me" type="checkbox" checked="checked"> Remember me
           <input type="submit" name="sign-in" value="SIGN IN">
           <a href="#" onClick="alert('OH!!! Sorry for that !')">Forgot Password?</a>
           <a href="/user/login">login?</a>
           <a href="/user/create">sign up?</a>
       </form>
   </div>
    <span style="color: red;"> ${param.message}</span>
<c:if test="${exception ne null}">
	<h1>${exception.message}</h1>
</c:if>
</div>
</body>
</html>