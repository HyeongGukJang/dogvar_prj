<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/boardheader.jsp"%>

<!-- Content -->
<section>
	<header class="main">
		<h1>
			<span id="pageText">회원관리</span>
		</h1>
	</header>
	<div class="board_list_content">
		<table class="board_list">
			<thead>
				<tr>
					<th width="300px">아이디</th>
					<th width="200px">이름</th>
					<th width="200px">별칭</th>
					<th width="200px">전화번호</th>
					<th width="200px">이메일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="row" items="${list }">
					<tr>
						<td style="width: 150px">${row.id}</td>
						<td style="width: 200px">${row.name}</td>
						<td style="width: 600px"><a href="profile?id=${row.nickname }">${row.content}</a></td>
						<td style="width: 300px">${row.send_date}</td>
						<td style="width: 300px">${row.email}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</section>

</div>
</div>

<%@ include file="../inc/footer.jsp"%>
</body>
</html>