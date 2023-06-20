<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="Coche-Control" content="no-store">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="/heart_like_love_icon.png"> 
<link rel="stylesheet" href="/webjars/bootstrap/5.2.3/css/bootstrap.css">
<script src="/webjars/bootstrap/5.2.3/js/bootstrap.js"></script>
<script src="/webjars/jquery/jqurey.min.js"></script>
<title>create.jsp</title>
</head>
<body>
<div class="box">
<h1>board 게시판 작성</h1>
<div class="container-fluid p-5 bg-danger text-white text-center">
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
	    <div class="col-md-10">
	    	<h1 style="margin-bottom: 40px; margin-left: 5%; font-family: 'MBC1961GulimM';">게시글 작성</h1>
			<form action="/board/create?page=${param.page}" method="post">
				<div class="mb-3">
					<label class="form-label mb-2" for="title">제목</label>
					<c:if test="${binding.hasErrors()}">
					<c:set var="titleError" value="false" />
					<c:forEach var="f" items="${binding.fieldErrors}">
						<c:choose>
							<c:when test="${f.field == 'title'}">
							<c:if test="${!titleError}">
								<c:set var="titleError" value="true" />
								<span style="color: #DB0000; margin-left: 20px;">제목을 입력하세요. 제목은 1에서 100자 사이여야 합니다.</span>
							</c:if>
							</c:when>
						</c:choose>
					</c:forEach>
				</c:if>
					<input class="form-control" name="title" id="title" autocomplete="off" style="text-align: left;" value="${post.title}" placeholder="제목을 입력하세요." />
				</div>
				<div class="mb-3">
					<label class="form-label mb-2" for="content">내용</label>
					<textarea class="form-control summernote" name="content" id="content" autocomplete="off"  style="text-align: left; height:600px;" placeholder="내용을 입력하세요.">${post.content}</textarea>
				</div>
				<button type="submit" class="btn" style="background:#4375DB; color:white;">작성 완료</button>
			</form>	    	
	    </div>
	<div class="container">
 <c:if test="${binding.hasErrors()}">
<!-- 	<h2>Error Message</h2> -->
	<c:forEach var="g" items="${binding.globalErrors}">
	<div>${g.code} ${g.defaultMessage}</div>
	</c:forEach>
	</div>
</c:if>
</div>
</div>



</body>
</html>