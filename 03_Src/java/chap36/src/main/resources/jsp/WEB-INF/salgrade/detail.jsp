<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<title>detail.jsp</title>
</head>
<body>
<h1>Salgrade detail </h1>
<hr>
<button type="button" class="btn btn-warning">
<a href="/">Home</a>
</button>
<hr>
<a href="/salgrade/list">/salgrade/list</a>
<hr>
<section class="container table-responsive" style="border: 10px solid gray">
	<table class="table table-striped table-dark table-bordered table-hover">
		<tbody>
			<tr>
				<tr><th>grade</th> <td>${salgrade.grade}</td></tr>
				<tr><th>losal</th> <td>${salgrade.losal}</td></tr>
				<tr><th>hisal</th> <td>${salgrade.hisal}</td></tr>
			</tr>	
		</tbody>
	</table>
	<hr>
	<sec:authorize access="hasRole('ADMIN')">
	<menu class="btn-group">
		<a href="/salgrade/create" class="btn btn-primary">추가</a>
		<a href="/salgrade/update?grade=${salgrade.grade}" class="btn btn-secondary">수정</a>
		<a href="/salgrade/delete?grade=${salgrade.grade}" class="btn btn-warning">삭제</a>	
	</sec:authorize>
	</menu>
</section>
</body>
</html>