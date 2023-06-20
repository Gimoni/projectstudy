<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="Cache-Control" content="no-store">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="/heart_like_love_icon.png"> 
<link rel="stylesheet" type="text/css" href="/css/home.css">

<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script src="/webjars/jquery/jquery.min.js"></script>

<title>home.jsp</title>

</head>

<body>
<div id="box">
<div class="container-fluid p-5 bg-danger text-white text-center">
  <div class="d-flex justify-content-front">
  	<sec:authorize access="isAnonymous()">
	<a class="hi" href="/user/login">Login</a>
	</sec:authorize>
	
	<sec:authorize access="isAuthenticated()">
	<a  class="hi" href="/user/logout">Logout</a>
	</sec:authorize>
  </div>
  <h1>World Company Office Web</h1>
  <div class="d-flex justify-content-end">
  <p><sec:authorize access="isAuthenticated()">
&nbsp; Hello ! Login User : &nbsp; <sec:authentication property="name"/> <br>How are you today?!
</sec:authorize></p> 
  </div>
</div>
<nav class="navbar navbar-expand-md bg-light navbar-light">
  <div class="container-fluid">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="/dept/list">Dept</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/emp/list">Emp</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/salgrade/list">Salgrade</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/country/list">Country</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/city/list">City</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/language/list">Language</a>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#">Disabled</a>
      </li>
    </ul>
  </div>
</nav>


<ul>
	<li><a href="/dept/list    ">/dept/list</a></li>
	<li><a href="/emp/list     ">/emp/list</a></li>
	<li><a href="/salgrade/list">/salgrade/list</a></li>
</ul>
<hr>
<ul>
	<li><a href="/dept/create    ">/dept/create</a></li>
	<li><a href="/emp/create     ">/emp/create</a></li>
</ul>
<hr>
<ul>
	<li><a href="/dept/detail/10    ">/dept/detail/10</a></li>
	<li><a href="/emp/detail/1001     ">/emp/detail/1001</a></li>
</ul>
<hr>
<ul>
	<li><a href="/dept/update?deptno=10    ">/dept/update?deptno=10</a></li>
	<li><a href="/emp/update?empno=9003   ">/emp/update?empno=9003</a></li>
</ul>
<hr>
<ul>
	<li><a href="/dept/delete?deptno=10    ">/dept/delete?deptno=10</a></li>
	<li><a href="/emp/delete?empno=1001    ">/emp/delete?empno=1001</a></li>
</ul>
<hr>
<ul>
	<li><a href="/city/list">/city/list</a></li>
	<li><a href="/city/page/1/10">/city/page</a></li>
	<li><a href="/country/list">/country/list</a></li>
	<li><a href="/country/page/1/10">/country/page</a></li>
	<li><a href="/language/list">/language/list</a></li>
	<li><a href="/language/page/1/10">/language/page</a></li>
</ul>
<hr>
<ul>
	<li><a href="/city/create">/city/create</a></li>
	<li><a href="/city/update?id=2331">/city/update</a></li>
	<li><a href="/city/delete?id=2331">/city/delete</a></li>
	<li><a href="/dept/create">/dept/create</a></li>
</ul>


</div>
</body>
</html>