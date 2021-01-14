<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE HTML>

<html>
<head>
<title>profileModify</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link href="<c:url value="/resources/assets/css/main.css" />" rel="stylesheet">
<!-- <link rel="stylesheet" href="assets/css/main.css" /> -->
<script>
function myFunction() {
	  var x = document.getElementById("password");
	  if (x.type === "password") {
	    x.type = "text";
	  } else {
	    x.type = "password";
	  }
	}
</script>
<style>
div.content {
	background-color: #F2F2F2;
}

table {
	width: 1100px;
	height: 500px;
	border-radius: 12px;
	line-height: 40px;
	text-align: left;
	/* padding-left: 160px; */
}

td,th {
	border: 1px solid #F2F2F2;
}

textarea {
	width: 400px;
	height: 150px;
	border: 1px solid #F56A6A;
	background-color: white;
	padding-left: 5px;
	margin-bottom: 10px;
	resize: none;
}


.profile_img {
	float: left;
	width: 102px;
	height: 102px;
	overflow: hidden;
	margin: 20px;
	border-radius: 50%;
}

.profile_img img {
	width: 100%;
	height: 100%;
}
#password{
	width: 200px; 
	margin-right: 30px;  
	display: inline;
}
label{
	margin-top: 10px;
	line-height: normal;
}

@media screen and (max-width: 1680px) {
	div.content, table {
		width: 100%;
	}
}

@media screen and (max-width: 500px) {
	#introduce {
		width: 100%;
	}
}
</style>
<body class="is-preload">

	<!-- Header와 Sidebar는 그대로 두고 Banner쪽을 수정하면 됩니다. -->

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<header id="header">
					<h3>My page</h3>
					<ul class="icons">
						<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
						<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
						<li><a href="#" class="icon brands fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
						<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
						<li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>
					</ul>
				</header>


				<!-- Banner -->
				<section id="banner">
					<div class="content">
						<div class="profile_img">
							<img src="<spring:url value='/resources/images/default_profile.jpg'/>">
						</div>

						<div class="profile">
							<form action="profileModify" method="POST">
								<input type="hidden" name="id" id="id" value="${member.id }" />
								<table>
									<tr>
										<th>프로필 이미지: </th>
										<td><input type="file" name="file" /></td>
									</tr>
									<tr>
										<th>별명 : </th>
										<td><input type="text" name="nickname" id="nickname" value="${member.nickname }" style="width: 200px" /></td>
									</tr>
									<tr>
										<th>이름 : </th>
										<td><input type="text" name="name" id="name" value="${member.name }" style="width: 200px" /></td>
									</tr>
									<tr>
										<th>비밀번호 : </th>
										<td><input type="password" name="password" id="password" value="${member.password }"/>
										<input type="checkbox" id="pw" onclick="myFunction()">
										<label for="pw">비밀번호 표시</label>
										</td>
									</tr>
									 
									<tr>
										<th>자기소개 : </th>
										<td colspan="2"><textarea id="introduce" name="introduce">${member.introduce }</textarea></td>			
									</tr>
									<tr>
										<th>생일 : </th>
										<td><input type="date" name="birthday" id="birthday" value="${member.birthday }" style="width: 200px" /></td>
									</tr>
									<tr>
										<th>전화번호 : </th>
										<td>
											<input type="text" name="phoneStart" id="phoneStart" value="${member.phoneStart }" style="width: 100px; display: inline;" />
											 <strong> - </strong> 
											 <input type="text" name="phoneCenter" id="phoneCenter" value="${member.phoneCenter }" style="width: 100px; display: inline" />
											 <strong> - </strong>
											 <input type="text" name="phoneEnd" id="phoneEnd" value="${member.phoneEnd }" style="width: 100px; display: inline" /></td>
									</tr>
									<tr>
										<th>이메일 : </th>
										<td><input type="text" name="emailId" id="emailId" value="${member.emailId }" style="width: 200px; display: inline;" />
										<strong>@</strong>
										<input type="text" name="emailDomain" id="emailDomain" value="${member.emailDomain }" style="width: 200px; display: inline;" /></td>
									</tr>
									<tr>
										<th>웹사이트 : </th>
										<td><input type="text" name="website" id="website" value="${member.website }" style="width: 300px" /></td>
									</tr>

								</table>
								<ul class="actions">
									<li style="margin-left: 150px;"><input type="submit" value="수정하기" class="primary"></li>
								</ul>
							</form>
							
						</div>
						<!-- 프로필 -->
					</div>
					<!-- 본문 -->
				</section>
				<!-- 배너 -->
			</div>
			<!-- inner -->
		</div>
		<!-- 메인-->


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
						<li><a href="/myapp/index">Homepage</a></li>
						<li><a href="/myapp/generic">Generic</a></li>
						<li><a href="/myapp/elements">Elements</a></li>
						<li><span class="opener">Submenu</span>
							<ul>
								<li><a href="#">Lorem Dolor</a></li>
								<li><a href="#">Ipsum Adipiscing</a></li>
								<li><a href="#">Tempus Magna</a></li>
								<li><a href="#">Feugiat Veroeros</a></li>
							</ul></li>
						<li><a href="#">Etiam Dolore</a></li>
						<li><a href="#">Adipiscing</a></li>
						<li><span class="opener">Another Submenu</span>
							<ul>
								<li><a href="#">Lorem Dolor</a></li>
								<li><a href="#">Ipsum Adipiscing</a></li>
								<li><a href="#">Tempus Magna</a></li>
								<li><a href="#">Feugiat Veroeros</a></li>
							</ul></li>
						<li><a href="#">Maximus Erat</a></li>
						<li><a href="#">Sapien Mauris</a></li>
						<li><a href="#">Amet Lacinia</a></li>
					</ul>
				</nav>

				<!-- Section -->
				<section>
					<header class="major">
						<h2>Ante interdum</h2>
					</header>
					<div class="mini-posts">
						<article>
							<a href="#" class="image"><img src="<spring:url value='/resources/images/pic07.jpg'/>"></a>
							<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
						</article>
						<article>
							<a href="#" class="image"><img src="<spring:url value='/resources/images/pic08.jpg'/>"></a>
							<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
						</article>
						<article>
							<a href="#" class="image"><img src="<spring:url value='/resources/images/pic09.jpg'/>"></a>
							<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
						</article>
					</div>
					<ul class="actions">
						<li><a href="#" class="button">More</a></li>
					</ul>
				</section>

				<!-- Section -->
				<section>
					<header class="major">
						<h2>Get in touch</h2>
					</header>
					<p>Sed varius enim lorem ullamcorper dolore aliquam aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin sed aliquam facilisis ante interdum. Sed nulla amet lorem feugiat
						tempus aliquam.</p>
					<ul class="contact">
						<li class="icon solid fa-envelope"><a href="#">information@untitled.tld</a></li>
						<li class="icon solid fa-phone">(000) 000-0000</li>
						<li class="icon solid fa-home">1234 Somewhere Road #8254<br /> Nashville, TN 00000-0000
						</li>
					</ul>
				</section>

				<!-- Footer -->
				<footer id="footer">
					<p class="copyright">&copy; Untitled. All rights reserved.</p>
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

	<!-- <script src="assets/js/jquery.min.js"></script> 
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script> -->

</body>
</html>
