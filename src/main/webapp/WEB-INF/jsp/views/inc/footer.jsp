<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Sidebar -->
		<div id="sidebar">
			<div class="inner">

				<!-- Search -->
				<section id="search" class="alt">
					<form method="post" action="#">
						<input type="text" name="query" id="query" placeholder="Search" />
					</form>
				</section>

				<!-- Menu -->
				<nav id="menu">
					<header class="major">
						<h2>Menu</h2>
					</header>	
					<ul>
						<li><a href="index">Home</a></li>
						<li><a href="boardList?bgno=1">News</a></li>
						<li><a href="community">Community</a></li>
						<li><a href="job">Job</a></li>
						<li><a href="boardList?bgno=4">Buy & Sell</a></li>
						<li><a href="list?send_id=<%=(String) session.getAttribute("loginID")%>">Send Message</a></li>
						<li><a href="recv?recv_id=<%=(String) session.getAttribute("loginID")%>">Recv Message</a></li>
						<li><a href="chatting">Chatting</a></li>
						<li><a href="boardList?bgno=2">Q & A</a></li>
						<li><a href="profile?id=<%=(String) session.getAttribute("loginID")%>">MyPage</a></li>
					</ul>
				</nav>

				<!-- Section -->
				<section>
					<header class="major">
						<h2>운영진 연락망</h2>
					</header>
					<p>건전한 사이트 이용 부탁드립니다.</p>
					<ul class="contact">
						<li class="icon solid fa-envelope"><a href="#">chang71892@naver.com</a></li>
						<li class="icon solid fa-phone">(010) 4181-4153</li>
						<li class="icon solid fa-home">GBSB BitCamp<br />
						</li>
					</ul>
				</section>

				<!-- Footer -->
				<footer id="footer">
					<p class="copyright">GBSB All rights reserved.</p>
				</footer>

			</div>
		</div>

	</div>

	<!-- Scripts -->

	<script src="<c:url value="/resources/assets/js/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/browser.min.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/breakpoints.min.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/util.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/main.js"/>"></script>
