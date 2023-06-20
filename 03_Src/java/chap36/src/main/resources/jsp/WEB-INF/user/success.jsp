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
<link rel="icon" href="/favicon.png">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script src="/webjars/jquery/jquery.min.js"></script>

<title>success.jsp</title>
</head>
<body>
<h1>User create Successful </h1>
<hr>
<a href="/">Home</a>
<hr>
<a href="/user/logout">user/logout</a>
<hr>
<br>

<hr>
<section class="container">
	<table class="table">
		<tbody>
				<tr><th>code</th> <td>${e.code}</td></th>
			<tr><th>code2</th><td>${e.code2}</td></th>
		</tbody>
	</table>
	<hr>
</section>
</body>
</html>