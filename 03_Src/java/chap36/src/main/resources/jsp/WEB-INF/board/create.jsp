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
<div class="box">
<h1>board 게시판 작성</h1>
<div class="container-fluid p-5 bg-light text-blue text-center">
  <div class="d-flex justify-content-front">
  	<sec:authorize access="isAnonymous()">
	<a class="hi" href="/user/login">Login</a>
	</sec:authorize>
	
  <div class="d-flex justify-content-space-around">
	<button type="button" class="btn btn-light">
	<a href="/" >HOME</a>
	</button>
	
	<sec:authorize access="isAuthenticated()">
	<a  class="hi" href="/user/logout">Logout</a>
	</sec:authorize>
  </div>
  <div class="d-flex justify-content-end">
  <p><sec:authorize access="isAuthenticated()">
&nbsp; Hello ! Login User : &nbsp; <sec:authentication property="name"/> <br>How are you today?!
</sec:authorize></p> 
  </div>
<hr>
<a href="/board/list">/board/list</a>
<hr>
</div>
<section class="container">
	<form action="/board/create?list=${param.list}"  method="post">
	<h1 align="center">게시판 작성</h1>
	<div class = "row">	
		<div class="mb-3">
			<label class="form-lable mb-2" for="id">id<span>*</span></label>
			<input class="form-control"    id="id" name="id"  value="${board.id}" type ="text"/>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="title">title<span>*</span></label>
			<input class="form-control"    id="title" name="title"  value="${board.title}" type="text"/>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="content">content<span></span></label>
			<input class="form-control"    id="content"  name="content"  value="${board.content }" disabled = "disabled" type="hidden"/>
			<input class="form-control"    id="gender"  name="content"  placeholder="${board.content}" value="${board.content}" type="text"/>
		</div>
<!-- 		<div class="mb-3" > -->
<!-- 			<label class="form-lable mb-2" for="day" ><span></span></label> -->
<%-- 			<input class="form-control"    id="day"  name="day"  placeholder="${board.day} " value="${board.day}" type="" /> --%>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="writer">writer<span></span></label>
			<input class="form-control"    id="writer"  name="writer"  value="${board.writer }" disabled = "disabled" type="hidden"/>
			<input class="form-control"    id="writer"  name="writer"  placeholder="${board.writer}" value="${board.writer}" type="text"/>
		</div>
	</div>
		<hr>
		<div class = "row">
		<button type="submit" class="btn btn-primary">Submit</button>
		</div>
	</form>	
</section>
<span style="color: red;"> ${param.message}</span>
<c:if test="${exception ne null}">
	<h1>${exception.message}</h1>
</c:if>
<c:if test="${binding.hasErrors()}">
<hr>
<h2>Error Massage</h2>
<hr>
<c:forEach var="g" items="${binding.globalErrors}">
	<div>${g.code} ${g.defaultMessage}</div>
</c:forEach>

<c:forEach var="f" items="${binding.fieldErrors}">
	<div>${f.field} ${f.defaultMessage}</div>
</c:forEach>

</c:if>
</div>
</body>
</html>