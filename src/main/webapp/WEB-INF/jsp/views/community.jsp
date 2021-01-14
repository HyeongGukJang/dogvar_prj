<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="inc/header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<%
	if (session.getAttribute("loginMember") != null) {
%>


				<!-- Content -->
				<section>
					<header class="main">
						<h1>
							<span id="pageText">Community</span>
						</h1>
					</header>
					<div class="board_list_content">
						<table class="board_list">
							<thead>
								<tr>
									<th width="200px">개발자</th>
									<th width="200px">일상생활</th>
									<th width="200px">게임</th>
									<th width="200px">연예인</th>
									<th width="200px">예능</th>
									<th width="200px">스포츠</th>
								</tr>
							</thead>
							<tbody>	
									<tr>
										<td>
										<a href="boardList?bgno=10">Java</a><br>
										<a href="boardList?bgno=11">JavaScript</a><br>
										<a href="boardList?bgno=12">Python</a><br>
										<a href="boardList?bgno=13">C</a><br>
										<a href="boardList?bgno=14">C++</a><br>
										<a href="boardList?bgno=15">Node js</a><br>
										<a href="boardList?bgno=16">Firebase</a><br>
										<a href="boardList?bgno=17">Oracle</a><br>
										<a href="boardList?bgno=18">BigData</a><br>
										<a href="boardList?bgno=19">JSP</a><br>
										<a href="boardList?bgno=20">CSS</a><br>
										<a href="boardList?bgno=21">Spring</a><br>
										<a href="boardList?bgno=22">JQuery</a><br>
										</td>
										<td>
										<a href="boardList?bgno=23">여행</a><br>
										<a href="boardList?bgno=24">요리</a><br>
										<a href="boardList?bgno=25">독서</a><br>
										<a href="boardList?bgno=26">맛집</a><br>
										<a href="boardList?bgno=27">취업</a><br>
										<a href="boardList?bgno=28">연애</a><br>
										<a href="boardList?bgno=29">공부</a><br>
										<a href="boardList?bgno=30">소설</a><br>
										<a href="boardList?bgno=31">만화</a><br>
										<a href="boardList?bgno=32">유머</a><br>
										<a href="boardList?bgno=33">유투브</a><br>
										</td>
										<td>
										<a href="boardList?bgno=34">스타크래프트</a><br>
										<a href="boardList?bgno=35">워크래프트</a><br>
										<a href="boardList?bgno=36">리그 오브 레전드</a><br>
										<a href="boardList?bgno=37">오버워치</a><br>
										<a href="boardList?bgno=38">서든어택</a><br>
										<a href="boardList?bgno=39">카트라이더</a><br>
										<a href="boardList?bgno=40">카스</a><br>
										<a href="boardList?bgno=41">메이플스토리</a><br>
										<a href="boardList?bgno=42">삼국지</a><br>
										<a href="boardList?bgno=43">풋볼매니저</a><br>
										<a href="boardList?bgno=44">사이버펑크</a><br>
										<a href="boardList?bgno=45">문명</a><br>
										<a href="boardList?bgno=46">크루세이더 오브 킹덤즈</a><br>
										<a href="boardList?bgno=47">철권</a><br>
										<a href="boardList?bgno=48">킹 오브 파이터즈</a><br>
										<a href="boardList?bgno=49">발로란트</a><br>
										</td>
										<td>
										<a href="boardList?bgno=50">유재석</a><br>
										<a href="boardList?bgno=51">박명수</a><br>
										<a href="boardList?bgno=52">정준하</a><br>
										<a href="boardList?bgno=53">노홍철</a><br>
										<a href="boardList?bgno=54">하하</a><br>
										<a href="boardList?bgno=55">정형돈</a><br>
										<a href="boardList?bgno=56">장동민</a><br>
										<a href="boardList?bgno=57">임요환</a><br>
										<a href="boardList?bgno=58">홍진호</a><br>
										<a href="boardList?bgno=59">트와이스</a><br>
										<a href="boardList?bgno=60">잇지</a><br>
										<a href="boardList?bgno=61">윤하</a><br>
										<a href="boardList?bgno=62">블랙핑크</a><br>
										<a href="boardList?bgno=63">킹갓소년단</a><br>
										</td>
										<td>
										<a href="boardList?bgno=64">무한도전</a><br>
										<a href="boardList?bgno=65">1박 2일</a><br>
										<a href="boardList?bgno=66">삼시세끼</a><br>
										<a href="boardList?bgno=67">윤스테이</a><br>
										<a href="boardList?bgno=68">더 지니어스</a><br>
										<a href="boardList?bgno=69">소사이어티 게임</a><br>
										<a href="boardList?bgno=70">놀라운 토요일</a><br>
										<a href="boardList?bgno=71">서프라이즈</a><br>
										<a href="boardList?bgno=72">라디오스타</a><br>
										<a href="boardList?bgno=73">런닝맨</a><br>
										<a href="boardList?bgno=74">음악중심</a><br>
										<a href="boardList?bgno=75">도시어부</a><br>
										<a href="boardList?bgno=76">비정상회담</a><br>
										<a href="boardList?bgno=77">올리브</a><br>
										<a href="boardList?bgno=78">켠김에 왕까지</a><br>
										<a href="boardList?bgno=79">동상이몽</a><br>
										</td>
										<td>
										<a href="boardList?bgno=80">축구</a><br>
										<a href="boardList?bgno=81">농구</a><br>
										<a href="boardList?bgno=82">야구</a><br>
										<a href="boardList?bgno=83">배구</a><br>
										<a href="boardList?bgno=84">골프</a><br>
										<a href="boardList?bgno=85">헬스</a><br>
										<a href="boardList?bgno=86">권투</a><br>
										<a href="boardList?bgno=87">런닝</a><br>
										<a href="boardList?bgno=88">테니스</a><br>
										<a href="boardList?bgno=89">스쿼시</a><br>
										<a href="boardList?bgno=90">배드민턴</a><br>
										<a href="boardList?bgno=91">등산</a><br>
										<a href="boardList?bgno=92">유도</a><br>
										<a href="boardList?bgno=93">태권도</a><br>
										<a href="boardList?bgno=94">싸이클</a><br>
										<a href="boardList?bgno=95">수영</a><br>									
										</td>
									</tr>
							</tbody>
						</table>
					</div>
				</section>
			</div>
		</div>

		<%@ include file="inc/footer.jsp"%>
		<%
			} else {
				System.out.println("로그인 후 이용 부탁드립니다");
				response.sendRedirect("loginview");
			}
		%>
	
</body>
</html>