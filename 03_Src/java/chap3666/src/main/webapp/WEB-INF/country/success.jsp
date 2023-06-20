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

<title>success.jsp</title>
</head>
<body>
<h1>Country Successful 성공</h1>
<hr>
<a href="/">Home</a>
<hr>
<a href="/country/list">/country/list</a>
<hr>
<br>
<br>
<br>
<c:choose>
	<c:when test="${param.create ne null}"><h1>나라 추가 성공</h1></c:when>
	<c:when test="${param.update ne null}"><h1>나라 수정 성공</h1></c:when>
	<c:when test="${param.delete ne null}"><h1>나라 삭제 성공</h1></c:when>
	<c:otherwise></c:otherwise>
</c:choose>

<hr>
<section class="container">
	<table class="table">
		<tbody>
				<tr><th>code</th> <td>${e.code}</td></th>
				<tr><th>name</th> <td><a href="/country/detail/${e.code}">${e.name}</a></td></th>
				<tr><th>continent</th><td>${e.continent.symbol}</td></th>
				<tr><th>region</th><td>${e.region}</td></th>
				<tr><th>surfaceArea</th><td>${e.surfaceArea}</td></th>
				<tr><th>indepYear</th><td>${e.indepYear}</td></th>
				<tr><th>population</th><td>${e.population}</td></th>
				<tr><th>lifeExpectancy</th><td>${e.lifeExpectancy}</td></th>
				<tr><th>gnp</th><td>${e.gnp}</td></th>
				<tr><th>gnpOld</th><td>${e.gnpOld}</td></th>
				<tr><th>localName</th><td>${e.localName}</td></th>
				<tr><th>governmentForm</th><td>${e.governmentForm}</td></th>
				<tr><th>headOfState</th><td>${e.headOfState}</td></th>
				<tr><th>capital</th><td>${e.capital}</td></th>
				<tr><th>code2</th><td>${e.code2}</td></th>
		</tbody>
	</table>
	<hr>
</section>
</body>
</html>