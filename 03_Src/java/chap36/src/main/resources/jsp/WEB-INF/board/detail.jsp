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
<link rel="icon" href="/heart_like_love_icon.png"> 
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script src="/webjars/jquery/jquery.min.js"></script>

<title>detail.jsp</title>
</head>
<body>
<h1>board detail</h1>
<hr>
<a href="/">Home</a>
<hr>
<a href="/board/list">/board/list</a>
<hr>
<a href="/board/create" class="btn btn-warning">게시판 작성</a>
<hr>
<section class="container">
	<table class="table">
		<tbody>
			<tr><th>id</th> 		<td>${board.id}	</td></tr>
			<tr><th>title</th> 		<td>${board.title}	</td></tr>
			<th>content</th>        <td>${board.content}	</td></tr>
			<tr><th>day</th>		<td>${board.day}	</td></tr>
			<tr><th>writer</th>   		<td>${board.writer}		</td></tr>
		</tbody>
	</table>
		<hr>
<!-- 	<menu class="btn-group"> -->
<%-- 		<a href="/board/update?id=${board.id}" class="btn btn-secondary">수정</a> --%>
<%-- 		<a href="/board/delete?id=${board.id}" class="btn btn-danger">삭제</a> --%>
<!-- 	</menu> -->
	<hr>
<!-- 	<ul> -->
<!-- 		<li><a href="/emp/create">/emp/create</a></li> -->
<%-- 		<li><a href="/emp/update?empno=${emp.empno}">/emp/update?empno=${emp.empno}</a></li> --%>
<%-- 		<li><a href="/emp/delete?empno=${emp.empno}">/emp/delete?empno=${emp.empno}</a></li> --%>
<!-- 	</ul> -->
</section>
</body>
</html>