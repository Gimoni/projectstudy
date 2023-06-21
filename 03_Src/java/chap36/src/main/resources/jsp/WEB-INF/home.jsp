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
<div class="container-fluid p-5 bg-dark text-white text-center">
  <div class="d-flex justify-content-front">
  	<sec:authorize access="isAnonymous()">
	<a class="hi" href="/user/login">Login</a>
	</sec:authorize>
	
	<sec:authorize access="isAuthenticated()">
	<a  class="hi" href="/user/logout">Logout</a>
	</sec:authorize>
  </div>
  <h1>Wakey Techno Wakey House</h1>
  <div class="d-flex justify-content-end">
  <p><sec:authorize access="isAuthenticated()">
&nbsp; Hello ! Login User : &nbsp; <sec:authentication property="name"/> <br>How are you today?!
</sec:authorize></p> 
  </div>
</div>
     <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
         <div class="container">
             <h2><a class="navbar-brand" href="#!">Wakey Party Zone</a></h2>
             <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
             <div class="collapse navbar-collapse" id="navbarSupportedContent">
                 <ul class="navbar-nav ms-auto mb-4 mb-lg-0">
                     <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Home</a></li>
                     <li class="nav-item"><a class="nav-link" href="#wakeytech">Wakey Tech</a></li>
                     <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                     <li class="nav-item"><a class="nav-link" href="#!">Contact</a></li>
                 </ul>
             </div>
         </div>
     </nav>
         <header class="py-5 bg-image-full" style="background-image: url('https://source.unsplash.com/wfh8dDlNFOk/1600x900')">
           <div class="text-center my-5">
               <img class="img-fluid rounded-circle mb-3" src="/img/5171.jpg" alt="..." />
               <h1 class="text-white fs-3 fw-bolder">All kind of music venue events</h1>
               <p class="text-white-50 mb-0">You got to believe in something
Why not believe in me?</p>
           </div>
       </header>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container">
      <a class="navbar-brand" href="#!"><a id="wakeytech" name="wakeytech">Wakey Tech Zone</a></a>
    <u class="navbar-nav row">
      <li class="nav-item col-md-3">
        <a class="nav-link" href="/board/list">Board</a>
      </li>
      <li class="nav-item col-md-3">
        <a class="nav-link" href="/dept/list">Dept</a>
      </li>
      <li class="nav-item col-md-3">
        <a class="nav-link" href="/emp/list">Emp</a>
      </li>
      <li class="nav-item col-md-3">
        <a class="nav-link" href="/salgrade/list">Salgrade</a>
      </li>
      <li class="nav-item col-md-3">
        <a class="nav-link" href="/country/list">Country</a>
      </li>
      <li class="nav-item col-md-3">
        <a class="nav-link" href="/city/list">City</a>
      </li>
      <li class="nav-item col-md-3" >
        <a class="nav-link" href="/language/list">Language</a>
      </li>
      <li class="nav-item col-md-3">
        <a class="nav-link disabled" href="#">Disabled</a>
      </li>
    </ul>
  </div>
</nav>
               <!-- Content section-->
        <section class="py-5">
            <div class="container my-5">
                <div class="row justify-content-center">
                    <div class="col-lg-6">
                        <h2>Full Width Backgrounds</h2>
                        <p class="lead">A single, lightweight helper class allows you to add engaging, full width background images to sections of your page.</p>
                        <p class="mb-0">The universe is almost 14 billion years old, and, wow! Life had no problem starting here on Earth! I think it would be inexcusably egocentric of us to suggest that we're alone in the universe.</p>
                    </div>
                </div>
            </div>
        </section>
        <!-- Image element - set the background image for the header in the line below-->
        <div class="py-5 bg-image-full" style="background-image: url('https://source.unsplash.com/4ulffa6qoKA/1200x800')">
            <!-- Put anything you want here! The spacer below with inline CSS is just for demo purposes!-->
            <div style="height: 20rem"></div>
        </div>
        <!-- Content section-->
        <section class="py-5">
            <div class="container my-5">
                <div class="row justify-content-center">
                    <div class="col-lg-6">
                        <h2>Engaging Background Images</h2>
                        <p class="lead">The background images used in this template are sourced from Unsplash and are open source and free to use.</p>
                        <p class="mb-0">I can't tell you how many people say they were turned off from science because of a science teacher that completely sucked out all the inspiration and enthusiasm they had for the course.</p>
                    </div>
                </div>
            </div>
        </section>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; <small>Wakey Techno Wakey House</small> 2023</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        

<hr>
<ul>
	<li><a href="/board/list">/board/list</a></li>
	<li><a href="/board/create">/board/create</a></li>
	<li><a href="/board/update?id=1">/board/update</a></li>
	<li><a href="/board/delete?id=1">/board/delete</a></li>
</ul>
<hr>
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
<hr>



</div>
</body>
</html>