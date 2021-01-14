<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="inc/header.jsp"%>
<link href="<c:url value="resources/assets/css/gallery.css" />" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		var move_size = parseInt($('.sliderBox').css('width'));
		var length = $('.sliderBox li').length;
		var idx = 0;
		var lblList = $('div.lblGroup label');
		$(lblList[idx]).css("backgroundColor", "skyblue");

		lblList.click(function(item) {
			idx = $(this).index();
			$('.sliderBox ul').animate({
				left : -(idx * move_size) + 'px'
			}, 'fast')
			lblList.css("backgroundColor", "");
			$(lblList[idx]).css("backgroundColor", "skyblue");
		});
	});
</script>

<!-- Banner -->
<section id="banner">
	<div class="content">
		<header>
			<h1>
				안녕하세요!<br /> DogVar입니다.
			</h1>
			<p>세상을 개발하는 우리, 개발자를 위한 커뮤니티</p>
		</header>
		<p>개발자를 꿈꾸는, 개발자에 재직중인, 컴퓨터 언어를 공부하는 모든 분들을 위한 공간 DogVar입니다. 여러분들의 코딩을 위한 쾌적하고 아늑한 커뮤니티가 될 수 있도록 최선을 다하는 DogVar가 되도록 하겠습니다.</p>
		<ul class="actions">
			<li><a href="community" class="button big">커뮤니티 바로가기</a></li>
		</ul>
	</div>
	<span class="image object">
		<div class="gallerymain">
			<div class="sliderBox">
				<ul>
					<li><img src="resources/images/image1.jpg"></li>
					<li><img src="resources/images/image2.jpg"></li>
					<li><img src="resources/images/image3.jpg"></li>
					<li><img src="resources/images/image4.jpg"></li>
				</ul>
				<div class="lblGroup">
					<label>1</label> <label>2</label> <label>3</label> <label>4</label>
				</div>
			</div>
		</div>
	</span>
</section>

<!-- Section -->
<section>
	<header class="major">
		<h2>주요 메뉴</h2>
	</header>
	<div class="features">
		<article>
			<span class="icon fa-gem"></span>
			<div class="content">
				<h3>공지사항</h3>
				<p>DogVar의 새로운 소식을 만나보실 수 있습니다.</p>
				<a href="boardList?bgno=1" class="button big">공지사항 바로가기</a>
			</div>
		</article>
		<article>
			<span class="icon solid fa-paper-plane"></span>
			<div class="content">
				<h3>메시지 보내기</h3>
				<p>DogVar의 회원에게 메시지를 보내실 수 있습니다.</p>
				<a href="list?send_id=<%=(String) session.getAttribute("loginID")%>" class="button big">메시지함 바로가기</a>
			</div>
		</article>
		<article>
			<span class="icon solid fa-rocket"></span>
			<div class="content">
				<h3>구인구직</h3>
				<p>구인구직 사이트 링크를 통해 취업정보를 받아보세요.</p>
				<a href="boardList?bgno=5" class="button big">구인구직 바로가기</a>
			</div>
		</article>
		<article>
			<span class="icon solid fa-signal"></span>
			<div class="content">
				<h3>커뮤니티</h3>
				<p>오늘보다 더 나은 정보를 위한 우리들을 위한 공간</p>
				<a href="community" class="button big">커뮤니티 바로가기</a>
			</div>
		</article>
	</div>
</section>

</div>
</div>

<%@ include file="inc/footer.jsp"%>
</body>
</html>