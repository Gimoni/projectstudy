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
<link rel="stylesheet" type="text/css" href="/css/usercreate.css">

<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link href="css/index.css" rel="stylesheet" type="text/css" />
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script src="/webjars/jquery/jquery.min.js"></script>

<title>login.jsp</title>

<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
  var navbarToggler = document.querySelector(".navbar-toggler");
  var navbarCollapse = document.querySelector(".navbar-collapse");

  navbarToggler.addEventListener("click", function() {
    navbarCollapse.classList.toggle("show");

    // Nav items를 감싸고 있는 div 요소를 가져옵니다.
    var navItemsContainer = navbarCollapse.querySelector(".navbar-nav");

    // .show 클래스가 적용되어 있는 경우에만 Nav items을 숨기도록 합니다.
    if (!navbarCollapse.classList.contains("show")) {
      navItemsContainer.style.display = "none";
    } else {
      navItemsContainer.style.display = "block";
    }
  });
});
</script>
</head>
<body>
<div class = "box" >

   <div class="login-container">
       <img src="/img/playdjicon.jpg" alt="">
         <div>
<button class="button "><a href="/" class="home" > home </a></button>
        </div>
       <form action="/user/login" method="post">
          
           <h1>LOGIN</h1>
           <div>
               <label>Username</label>
               <input class="form-control" name="username"  type="text" placeholder="USERNAME" value="${param.username}"/>
           </div>
           <div>
               <label>Password</label>
               <input class="form-control" name="password" type="password" placeholder="PASSWORD" value="${param.password}"/>
           </div>
           <input name="remember-me" type="checkbox" checked="checked"> Remember me
           <input type="submit" name="login" value="LOGIN">
           <a href="#" onClick="alert('OH!!! Sorry for that !')">Forgot Password?</a>
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
</html>