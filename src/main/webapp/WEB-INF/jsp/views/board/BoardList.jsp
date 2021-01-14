<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/boardheader.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script>
	function fn_formSubmit() {
		document.form1.submit();
	}
	
	window.onload = function() {
		var pageText = document.getElementById("pageText");	
		var parse = window.location.href;
		var parse1 = parse.split("/");
		var parse2 = parse[parse.length -1];
		var parse3 = parse.split("=");
		var parse4 = parse3[1];
		var writeBtn = document.getElementById("writebtn");
	
		console.log(parse2);
		console.log(parse4);		
		
		if(parse4 == "1") {
			pageText.innerText = "News";
		} else if(parse4 == "2") {
			pageText.innerText = "Q & A";
		} else if(parse4 == "3") {
			pageText.innerText = "Community";
		} else if(parse4 == "4") {
			pageText.innerText = "Buy / Sell";
		} else if(parse4 == "5") {
			pageText.innerText = "Job";
		} else if(parse4 == "6") {
			pageText.innerText = "취업 경험담 게시판";
		} else if(parse4 == "7") {
			pageText.innerText = "미사용 게시판";
		} else if(parse4 == "8") {
			pageText.innerText = "미사용 게시판";
		} else if(parse4 == "9") {
			pageText.innerText = "미사용 게시판";
		} else if(parse4 == "10") {
			pageText.innerText = "Java 게시판";
		} else if(parse4 == "11") {
			pageText.innerText = "JavaScript 게시판";
		} else if(parse4 == "12") {
			pageText.innerText = "Python 게시판";
		} else if(parse4 == "13") {
			pageText.innerText = "C언어 게시판";
		} else if(parse4 == "14") {
			pageText.innerText = "C++ 게시판";
		} else if(parse4 == "15") {
			pageText.innerText = "Node js 게시판";
		} else if(parse4 == "16") {
			pageText.innerText = "Firebase 게시판";
		} else if(parse4 == "17") {
			pageText.innerText = "Oracle 게시판";
		} else if(parse4 == "18") {
			pageText.innerText = "BigData 게시판";
		} else if(parse4 == "19") {
			pageText.innerText = "JSP 게시판";
		} else if(parse4 == "20") {
			pageText.innerText = "CSS 게시판";
		} else if(parse4 == "21") {
			pageText.innerText = "Spring 게시판";
		} else if(parse4 == "22") {
			pageText.innerText = "JQuery 게시판";
		} else if(parse4 == "23") {
			pageText.innerText = "여행 게시판";
		} else if(parse4 == "24") {
			pageText.innerText = "요리 게시판";
		} else if(parse4 == "25") {
			pageText.innerText = "독서 게시판";
		} else if(parse4 == "26") {
			pageText.innerText = "맛집 게시판";
		} else if(parse4 == "27") {
			pageText.innerText = "취업 게시판";
		} else if(parse4 == "28") {
			pageText.innerText = "연애 게시판";
		} else if(parse4 == "29") {
			pageText.innerText = "공부 게시판";
		} else if(parse4 == "30") {
			pageText.innerText = "소설 게시판";
		} else if(parse4 == "31") {
			pageText.innerText = "만화 게시판";
		} else if(parse4 == "32") {
			pageText.innerText = "유머 게시판";
		} else if(parse4 == "33") {
			pageText.innerText = "유투브 게시판";
		} else if(parse4 == "34") {
			pageText.innerText = "스타크래프트 게시판";
		} else if(parse4 == "35") {
			pageText.innerText = "워크래프트 게시판";
		} else if(parse4 == "36") {
			pageText.innerText = "리그 오브 레전드 게시판";
		} else if(parse4 == "37") {
			pageText.innerText = "오버워치 게시판";
		} else if(parse4 == "38") {
			pageText.innerText = "서든어택 게시판";
		} else if(parse4 == "39") {
			pageText.innerText = "카트라이더 게시판";
		} else if(parse4 == "40") {
			pageText.innerText = "카스 게시판";
		} else if(parse4 == "41") {
			pageText.innerText = "메이플스토리 게시판";
		} else if(parse4 == "42") {
			pageText.innerText = "삼국지 게시판";
		} else if(parse4 == "43") {
			pageText.innerText = "풋볼매니저 게시판";
		} else if(parse4 == "44") {
			pageText.innerText = "사이버펑크 게시판";
		} else if(parse4 == "45") {
			pageText.innerText = "문명 게시판";
		} else if(parse4 == "46") {
			pageText.innerText = "크루세이더 오브 킹덤즈 게시판";
		} else if(parse4 == "47") {
			pageText.innerText = "철권 게시판";
		} else if(parse4 == "48") {
			pageText.innerText = "킹 오브 파이터즈 게시판";
		} else if(parse4 == "49") {
			pageText.innerText = "발로란트 게시판";
		} else if(parse4 == "50") {
			pageText.innerText = "유재석 게시판";
		} else if(parse4 == "51") {
			pageText.innerText = "박명수 게시판";
		} else if(parse4 == "52") {
			pageText.innerText = "정준하 게시판";
		} else if(parse4 == "53") {
			pageText.innerText = "노홍철 게시판";
		} else if(parse4 == "54") {
			pageText.innerText = "하하 게시판";
		} else if(parse4 == "55") {
			pageText.innerText = "정형돈 게시판";
		} else if(parse4 == "56") {
			pageText.innerText = "장동민 게시판";
		} else if(parse4 == "57") {
			pageText.innerText = "임요환 게시판";
		} else if(parse4 == "58") {
			pageText.innerText = "홍진호 게시판";
		} else if(parse4 == "59") {
			pageText.innerText = "트와이스 게시판";
		} else if(parse4 == "60") {
			pageText.innerText = "잇지 게시판";
		} else if(parse4 == "61") {
			pageText.innerText = "윤하 게시판";
		} else if(parse4 == "62") {
			pageText.innerText = "블랙핑크 게시판";
		} else if(parse4 == "63") {
			pageText.innerText = "킹갓소년단 게시판";
		} else if(parse4 == "64") {
			pageText.innerText = "무한도전 게시판";
		} else if(parse4 == "65") {
			pageText.innerText = "1박 2일 게시판";
		} else if(parse4 == "66") {
			pageText.innerText = "삼시세끼 게시판";
		} else if(parse4 == "67") {
			pageText.innerText = "윤스테이 게시판";
		} else if(parse4 == "68") {
			pageText.innerText = "더 지니어스 게시판";
		} else if(parse4 == "69") {
			pageText.innerText = "소사이어티 게임 게시판";
		} else if(parse4 == "70") {
			pageText.innerText = "놀라운 토요일 게시판";
		} else if(parse4 == "71") {
			pageText.innerText = "서프라이즈 게시판";
		} else if(parse4 == "72") {
			pageText.innerText = "라디오스타 게시판";
		} else if(parse4 == "73") {
			pageText.innerText = "런닝맨 게시판";
		} else if(parse4 == "74") {
			pageText.innerText = "음악중심 게시판";
		} else if(parse4 == "75") {
			pageText.innerText = "도시어부";
		} else if(parse4 == "76") {
			pageText.innerText = "비정상회담 게시판";
		} else if(parse4 == "77") {
			pageText.innerText = "올리브 게시판";
		} else if(parse4 == "78") {
			pageText.innerText = "켠김에 왕까지 게시판";
		} else if(parse4 == "79") {
			pageText.innerText = "동상이몽 게시판";
		} else if(parse4 == "80") {
			pageText.innerText = "축구 게시판";
		} else if(parse4 == "81") {
			pageText.innerText = "농구 게시판";
		} else if(parse4 == "82") {
			pageText.innerText = "야구 게시판";
		} else if(parse4 == "83") {
			pageText.innerText = "배구 게시판";
		} else if(parse4 == "84") {
			pageText.innerText = "골프 게시판";
		} else if(parse4 == "85") {
			pageText.innerText = "헬스 게시판";
		} else if(parse4 == "86") {
			pageText.innerText = "권투 게시판";
		} else if(parse4 == "87") {
			pageText.innerText = "런닝 게시판";
		} else if(parse4 == "88") {
			pageText.innerText = "테니스 게시판";
		} else if(parse4 == "89") {
			pageText.innerText = "스쿼시 게시판";
		} else if(parse4 == "90") {
			pageText.innerText = "배드민턴 게시판";
		} else if(parse4 == "91") {
			pageText.innerText = "등산 게시판";
		} else if(parse4 == "92") {
			pageText.innerText = "유도 게시판";
		} else if(parse4 == "93") {
			pageText.innerText = "태권도 게시판";
		} else if(parse4 == "94") {
			pageText.innerText = "싸이클 게시판";
		} else if(parse4 == "95") {
			pageText.innerText = "수영 게시판";
		} 
	}
</script>
</head>
<%
	if (session.getAttribute("loginMember") != null) {
%>


				<!-- Content -->
				<section>
					<header class="main">
						<h1>
							<span id="pageText">Notice</span>
						</h1>
					</header>
					<div class="board_list_content">
						<table class="board_list">
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>등록자</th>
									<th>등록일</th>
									<th>조회수</th>
									<th>첨부</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="listview" items="${listview}" varStatus="status">
									<c:url var="link" value="boardRead">
										<c:param name="brdno" value="${listview.brdno}" />
									</c:url>

									<tr>
										<td><c:out
												value="${searchVO.totRow-((searchVO.page-1)*searchVO.displayRowCount + status.index)}" /></td>
										<td
											style="max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
											<a href="${link}"><c:out value="${listview.brdtitle}" /></a>
											<c:if test="${listview.replycnt>0}">(<c:out
													value="${listview.replycnt}" />)</c:if>
										</td>
										<td><c:out value="${listview.brdwriter}" /></td>
										<td><c:out value="${listview.brddate}" /></td>
										<td><c:out value="${listview.brdhit}" /></td>
										<td><c:out value="${listview.filecnt}" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="boardchecklist" style="text-align: center;">
							<form id="form1" name="form1" method="post">
								<jsp:include
									page="/WEB-INF/jsp/views/common/pagingforSubmit.jsp" />
								<input type="checkbox" name="searchType" id="searchType1"
									value="brdtitle"
									<c:if test="${fn:indexOf(searchVO.searchType, 'brdtitle')!=-1}">checked="checked"</c:if> />
								<label class="chkselect" for="searchType1">제목</label> <input
									type="checkbox" name="searchType" id="searchType2"
									value="brdmemo"
									<c:if test="${fn:indexOf(searchVO.searchType, 'brdmemo')!=-1}">checked="checked"</c:if> />
								<label class="chkselect" for="searchType2">내용</label> <input
									type="text" name="searchKeyword"
									style="display: inline; width: 150px; height: 45px; margin: 0 auto;"
									maxlength="50"
									value='<c:out value="${searchVO.searchKeyword}"/>'
									onkeydown="if(event.keyCode == 13) { fn_formSubmit();}">
								<input name="btn_search" style="margin-left: 5px; height: 43px;"
									value="검색" class="btn_sch" type="button"
									onclick="fn_formSubmit()" /> <input type="button" id="writebtn"
									style="height: 43px;"
									onclick="location.href='boardForm?bgno=<c:out value="${searchVO.bgno}'"/>"
									value="글쓰기">
							</form>
						</div>
					</div>
				</section>
			</div>
		</div>

		<%@ include file="../inc/footer.jsp"%>
		<%
			} else {
				System.out.println("로그인 후 이용 부탁드립니다");
				response.sendRedirect("loginview");
			}
		%>
	
</body>
</html>