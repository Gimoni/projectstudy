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

<title>create.jsp</title>
</head>
<body>
<h1>Emp Create 직원 추가</h1>
<hr>
<a href="/">Home</a>
<hr>
<a href="/emp/list">/emp/list</a>
<hr>
<section class="container">
	<form action="/emp/create" method="post">
		<div class="mb-3">
			<label class="form-lable mb-2" for="empno">empno<span>*</span></label>
			<input class="form-control"    id="empno" name="empno" placeholder="직원번호를 입력하세요." value="${emp.empno}"/>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="ename">ename<span>*</span></label>
			<input class="form-control"    id="ename"  name="ename"  placeholder="직원이름을 입력하세요." value="${emp.ename }"/>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="gender">gender<span></span></label>
			<input class="form-control"    id="gender"  name="gender"  placeholder="성별을 입력하세요" value="${emp.gender}"/>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="job">job<span></span></label>
			<input class="form-control"    id="job"  name="job"  placeholder="직무를 입력하세요" value="${emp.job }"/>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="mgr">mgr<span></span></label>
			<input class="form-control"    id="mgr"  name="mgr"  placeholder="매니저를 입력하세요." value="${emp.mgr}"/>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="hiredate">hiredate<span></span></label>
			<input class="form-control"    id="hiredate"  name="hiredate"  placeholder="입사일을 입력하세요" value="${emp.hiredate }"/>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="sal">sal<span></span></label>
			<input class="form-control"    id="sal"  name="sal"  placeholder="급여를 입력하세요" value="${emp.sal }"/>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="comm">comm<span></span></label>
			<input class="form-control"    id="comm"  name="comm"  placeholder="커미션을 입력하세요."  value=" ${emp.comm}"/>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="deptno">deptno<span></span></label>
			<input class="form-control"    id="deptno"  name="deptno"  placeholder="부서번호를 입력하세요." value="${emp.deptno}"/>
		</div>

		<button type="submit" class="btn btn-primary">Submit</button>
	</form>	
</section>
<hr>
<c:if test="${binding.hasErrors()}">
<h2>Error Massage</h2>
<hr>
<c:forEach var="g" items="${binding.globalErrors}">
	<div>${g.code} ${g.defaultMessage}</div>
</c:forEach>
<hr>
<c:forEach var="f" items="${binding.fieldErrors}">
	<div>${f.field} ${f.defaultMessage}</div>
</c:forEach>

</c:if>

</body>
</html>