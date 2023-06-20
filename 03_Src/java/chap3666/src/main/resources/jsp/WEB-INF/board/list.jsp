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
<title>list.jsp</title>
</head>
<body>
<div class= "box">
<h1>Board list / 게시판 목록</h1>
<section class="container">
	<table class="table table-striped table-bordered table-hover">
		<thead>
			<tr>
				<th>id</th>
				<th>title</th>
<!-- 				<th>content</th> -->
				<th>day</th>
				<th>reply</th>
				<th>writer</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="b" items="${list}">
			<tr>
				<td><a href="/board/detail/${b.id}">${b.id}</a></td>
<%-- 				<td><a href="/emp/detail/${e.empno}">${e.ename}</a></td> --%>
				<td>${b.title}</td>
<%-- 				<td>${b.content}</td> --%>
				<td>${b.day}</td>
				<td>${b.reply}</td>
				<td >${b.writer}</td>
<%-- 				<td align="right">${e.comm}</td> --%>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</section>
</div>
</body>
</html>