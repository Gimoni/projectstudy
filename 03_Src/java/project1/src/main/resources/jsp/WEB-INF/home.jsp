<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
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
<link rel="icon" href="/img/heart_like_love_icon.png"> 
	
<link rel="stylesheet" type="text/css" href="/css/home.css"/>
<link rel="stylesheet" href="/webjars/bootstrap/5.2.3/css/bootstrap.css">
<script src="/webjars/bootstrap/5.2.3/js/bootstrap.js"></script>
<script src="/webjars/jquery/jqurey.min.js"></script>

<title>home.jsp</title>
</head>
<body>
  <header>
    <!-- heading: 제목을 작성할 때 주로 쓴다. -->
    <p>World Music Web</p>
  </header>
<div class="bigdiv">
  	<sec:authorize access="isAnonymous()">
	<a class="hi" href="/user/login">Login</a>
	</sec:authorize>
	
	<sec:authorize access="isAuthenticated()">
	<a  class="hi" href="/user/logout">Logout</a>
	</sec:authorize>
<!-- <h1>HELLO PEOPLE</h1> -->
<hr class="nonhr">
<div class="container-fluid p-5 bg-danger text-white text-center">
	  <h1>World Music</h1>
	  <div class="d-flex justify-content-end">
	  <p><sec:authorize access="isAuthenticated()">
	&nbsp; Hello ! Login User : &nbsp; <sec:authentication property="name"/> <br>How are you today?!
	</sec:authorize></p> 
	  </div>
  <div class="d-flex justify-content-front">

  </div>
</div>
  
    <!-- header : semantic tag (element 의 이름이 목적을 의미한다.) -->
  <!-- nav: navigation, 메뉴 -->
  <nav>
    <h2>menu</h2>
    <ul>
      <li>
        <a href="">info</a>
      </li>
      <li>
        <a href="">part</a>
      </li>
      <li>
        <a href="">us</a>
      </li>
      <li>
        <a href="">board</a>
      </li>
      <li>
        <a href="">more</a>
      </li>
    </ul>
  </nav> 

	<asid id="secondary" class="secondary-widget-area">
	<div class="widget fb-social-widget-1">
		<div class="widget_title">
		<h3>Social</h3>
		</div>
		<div class="widget-container">
		<div class="social-icons">
		<ul class="social-icons-list">
		<li>
		<a class="tool-tip" data-tippy-content="Follow on Facebook" href="https://facebook.com/" target="blank"><i class="fa fa-facebook" aria-hidden="true"></i></a>
		</li>
		<li>
		<a class="tool-tip" data-tippy-content="Follow on Twitter" href="https://twitter.com/"><i class="fa fa-twitter" aria-hidden="true"></i></a>
		</li>
		<li>
		<a class="tool-tip" data-tippy-content="Follow on Instagram" href="https://instagram.com/"><i class="fa fa-instagram" aria-hidden="true"></i></a>
		</li>
		<li>
		<a class="tool-tip" data-tippy-content="Follow on Pinterest" href="https://pinterest.com/"><i class="fa fa-pinterest" aria-hidden="true"></i></a>
		</li>
		<li>
		<a class="tool-tip" data-tippy-content="Subscribe at YouTube" href="https://youtube.com/"><i class="fa fa-youtube-play" aria-hidden="true"></i></a>
		</li>
		<li>
		<a class="tool-tip" data-tippy-content="Connect on LinkedIn" href="https://linkedin.com/"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
		</li>
		<li>
		<a class="tool-tip" data-tippy-content="Follow on VK" href="https://vk.com/"><i class="fa fa-vk" aria-hidden="true"></i></a>
		</li>
		</ul>
		</div>
		</div>
		</div>
	</asid>
	<div class="main-container">
	<div class="row">
	<div class=col-lg-8 col-md-12>
	 <ul>
	  <li>
		<a href="?theme=one-hive" rel="https://demo.themebeez.com/one-hive/,https://themebeez.com/themes/one-hive/" class>
		One Hive <span class="type free">free</span>
		<input type="hidden" class="theme-type" value="free">
		<input type="hidden" class="theme-download-link" value="https://themebeez.com/themes/one-hive/">
		<input type="hidden" class="theme-name" value="One Hive">
		</a>
		</li>
	</ul>
	
	<p class="notes textcenter">If you experience any issue(s) with these demos, please try closing the demo bar using the 'x' at the top right of your screen.</p>
	</aside>
	<!--   hr: horixontal rule : 수평선  -->
  <!-- 닫힘 태그가 없으면 컨텐츠(태그 안에 text 또는 element)를 가질 수 없다. -->
  <hr>
  <!-- main: main contants(내용)가 주로 온다. -->
  <main>
  div
    <section>
      <h2>Time to catch your soul with our festival events</h2>
      <iframe width="640" height="360" src="https://www.youtube.com/embed/82-5u3H1-yk" title="a &amp; Chris Avantgarde - Eternity [Live from Afterlife Tulum]" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
    </section>
      
      
      <!-- 모델소개 -->
      <section>
        <h2> </h2>

        <article> 
          <h3>What are we? </h3>
          <!--div: divide 다양한 목적으로 사용 될 수 있다. 대표적인 non-sementic tag////-->
          <div>
            <img src="/img/face_grin_tongue_icon.png" alt="img" width="200px">
            <p>
              <!-- span: 문자열 안에서 특정한 효과를 줄 때 사용한다.  -->
              <span>
                Lorem ipsum dolor, sit amet consectetur adipisicing elit.
              </span>
              <!-- br: breaking rules // self closing (줄바꿈) -->
              <br>
              Vero provident cum consequatur, odit laborum at rem! 
              <br> 
              Sequi modi esse sapiente nemo natus optio. 
              <br>
              Molestias odio suscipit ipsum, ducimus doloribus adipisci?
            </p>
          </div>
        </article>
        
		<article id="post-94" class="post-94">
		<div class="top-wrap">
		<div class="entry-cats"><ul class="post-categories">
		<li><a href="https://demo.themebeez.com/demos-2/fascinate/category/travel/" rel="category tag">Travel</a></li></ul></div> <div class="post-title">
		<h3>
		<a href="https://demo.themebeez.com/demos-2/fascinate/it-was-a-romantic-day-at-the-beach/">It was a romantic day at the beach</a>
		</h3>
		</div>
		<div class="entry-metas">
		<ul>
		<li class="posted-date"><a href="https://demo.themebeez.com/demos-2/fascinate/it-was-a-romantic-day-at-the-beach/" rel="bookmark"><time class="entry-date published" datetime="2019-06-25T14:59:55+00:00">June 25, 2019</time><time class="updated" datetime="2019-06-26T06:46:17+00:00">June 26, 2019</time></a></li> <li class="posted-by">by <a href="https://demo.themebeez.com/demos-2/fascinate/author/themebeezdemo/">Cester Kinner</a></li> </ul>
		</div>
		</div>
		<div class="mid-block is-post-format-block">
		<div class="is-audio-format">
		<iframe loading="lazy" title="Love Me Like You Do From &quot;Fifty Shades of Grey&quot; - Ellie Goulding (Cover) by ☾ Kiana ☽" width="640" height="400" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?visual=true&amp;url=https%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F190490447&amp;show_artwork=true&amp;maxwidth=640&amp;maxheight=960&amp;dnt=1&amp;in=user-738156868%2Fsets%2Frehana"></iframe> </div>
		</div>
		<div class="bottom-wrap">
		<div class="the-content dropcap">
		<p>A music festival is a community event with performances of singing and instrument playing that is often presented with a theme such as musical genre (e.g., rock, blues, folk, jazz, classical music), nationality, locality of musicians, or holiday. Music festivals are generally organized by individuals or organizations within networks of music production, typically music scenes, the music industries, or institutions of music education.</p>
		</div>
		<div class="post-content-link">
		<a href="https://en.wikipedia.org/wiki/Music_festival" class="post-link-btn" target="_blank">Continue Reading about Music Festivals</a>
		</div>
		</div>
		</article>
		<hr id="nonhr">
        <article>
          <h3>Art of Our time</h3>
          <div>
            <img src="/img/blue.png" alt="캐스퍼" width="200px">
            <p>
              <span style= font-weight:bold;>
                Lorem ipsum dolor sit amet consectetur adipisicing elit.
              </span>
               <br>
               Quidem quasi numquam illum totam dolore. 
               <br>
               Saepe, consectetur quo et ipsam, illo vel vitae labore impedit 
               <br>
               necessitatibus numquam eligendi laudantium quod alias?
            </p>
          </div>
        </article>
      </section>
		<hr id="nonhr">
		
        <!-- 모델 비교표 -->
        <section>
        <h2>subscribe</h2>
        
        <table border="1">
          <tr><th>list</th><th>level</th><th>Qualitly</th><th>price</th></tr>
          <tr><th>week</th><th>Basic</th><th>Good</th><th>$10</th></tr>
          <tr><th>month</th><th>Standard</th><th>Better</th><th>$30</th></tr>
          <tr><th>year</th><th>Primium</th><th>-</th>Best<th>$78</th></tr>
        </table>Contact us about VIP <a herf="">info</a> 
        
        </section>

		<hr id="nonhr">
		
       
        <section>
          <!-- 오시는 길 -->
          <div>
            <h2>Map</h2>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3164.691475961479!2d126.72433907647614!3d37.51519422706945!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357b7ddc31b20e45%3A0xf3ecb74e912462b9!2z7J247LKcIO2FjO2BrOuFuOuwuOumrFUx7IS87YSw!5e0!3m2!1sko!2skr!4v1687143777748!5m2!1sko!2skr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
          </div>
          <!-- 연락하기 -->
          <div>
          
          		<hr id="nonhr">
          		
          		
            <!-- form:양식, 서버에 제출하는 데잍터 예) 로그인, 회원가입, Contact 등 -->
            <form action="">
              <h2>연락하기</h2>
              <div>
                <!-- label: input 에 대한 설명을 입력한다. 대체 가능 -->
                <!-- label for: 어떤 input 에 연결된 label 인지 나타낸다.(element 의 id 를 작성한다.) -->
                <label for="">성함</label>
                <!-- input: 사용자로붙터 데이터를 입력받는다. -->
                <input type="text" placeholder="이름을 입력하세요.">
              </div>
              
              
              <div>
                <label for="">이메일</label>
                <input type="text" placeholder="username@exmple.com">
              </div>
              <div>
              
              		<hr id="nonhr">
              		
              		
                <h3>관심분야</h3>
                <input type="text" name="" id="">
                <label for="">자동차구매</label>
                <input id="branch" type="radio" name="interests" value="대리점 개설" >
                <label for="">대리점 개설</label>
              </div>

              <div>
                <textarea name="message" id="" cols="30" rows="10" placeholder="내용을 입력하세요."></textarea>
              </div>

              <div>
                <input type="check" name="agree" id="" checked>
                <label for="">
                  <a href="www.google.com" target="_blank">개인정보 처리방침에 동의합니다.</a>
                </label>
              </div>
            </form>
          </div>

    </section>
    </div>
    </div>
    </div>
  </main>
  <br>
  <hr>
  <!-- footer: 웹페이지 가장 하단에 위치한다.
  웹페이지의 기타 정보들 (sns adress, 회사의 정책, 서비스 이용약관 등..)-->
  <footer>
    <!-- small: 기본 폰트 사이즈 보다 약간 작다. -->
    <!-- &copy : 엔티티 네임 (Entity name) -->
    <!-- &(ampersand) + name -->
    <!-- html내에서 특수문자를 사용할 수 있다. -->
    <small>2022 & copy; World Company Office Web</small>
    <p>&#128516</p>

    <!-- ol: ordered list : 리스트에 자동으로 번호가 붙는다.  -->
    <ol>
      <li>이용약관</li>
      <li>개인정보 처리방침</li>
      <li>사이트맵</li>
    </ol>

    <!-- 엔티티넘버 (Entitiy number) -->
    <!-- &# + number  -->
    <!-- html 내에서 특수한 문자를 사용할 수 있다. / 특수문자 사용  -->

  </footer>
  
</body> 

</div>
</div>
</body>
</html>