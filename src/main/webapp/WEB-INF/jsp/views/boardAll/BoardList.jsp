<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/boardheader.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script>
function fn_formSubmit(){
	document.form1.submit();	
}
</script>
</head>
<!-- Content -->
<section>
	<header class="main">
		<h1>
			<span id="pageText">전체 검색</span>
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
					<c:url var="link" value="boardAllRead">
						<c:param name="brdno" value="${listview.brdno}" />
					</c:url>

					<tr>
						<td><c:out value="${searchVO.totRow-((searchVO.page-1)*searchVO.displayRowCount + status.index)}" /></td>
						<td style="max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;"><a href="${link}"><c:out value="${listview.brdtitle}" /></a> <c:if
								test="${listview.replycnt>0}">(<c:out value="${listview.replycnt}" />)</c:if></td>
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
				<jsp:include page="/WEB-INF/jsp/views/common/pagingforSubmit.jsp" />
				<input type="checkbox" name="searchType" id="searchType1" value="brdtitle" <c:if test="${fn:indexOf(searchVO.searchType, 'brdtitle')!=-1}">checked="checked"</c:if> /> <label class="chkselect"
					for="searchType1">제목</label> <input type="checkbox" name="searchType" id="searchType2" value="brdmemo" <c:if test="${fn:indexOf(searchVO.searchType, 'brdmemo')!=-1}">checked="checked"</c:if> />
				<label class="chkselect" for="searchType2">내용</label> <input type="text" name="searchKeyword" style="display: inline; width: 150px; height: 45px; margin: 0 auto;" maxlength="50"
					value='<c:out value="${searchVO.searchKeyword}"/>' onkeydown="if(event.keyCode == 13) { fn_formSubmit();}"> <input name="btn_search" style="margin-left: 5px; height: 43px;" value="검색"
					class="btn_sch" type="button" onclick="fn_formSubmit()" />
			</form>
		</div>
	</div>
</section>
</div>
</div>

<%@ include file="../inc/footer.jsp"%>
</body>
</html>