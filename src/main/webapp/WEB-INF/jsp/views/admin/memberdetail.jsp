<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>

				<!-- center -->
				<section id="banner">
					<div class="content">
						<header>회원 상세보기</header>
						<table width="550" border="1">
							<tr>
								<th>ID</th>
								<td><c:out value="${manage.id }" /></td>
							</tr>
							<tr>
								<th>NAME</th>
								<td><c:out value="${manage.name }" /></td>
							</tr>
							<tr>
								<th>NICKNAME</th>
								<td><c:out value="${manage.nickname }" /></td>
							</tr>
							<tr>
								<th>EMAIL</th>
								<td><c:out value="${manage.email }" /></td>
							</tr>
							<tr>
								<th>PHONE</th>
								<td><c:out value="${manage.phone }" /></td>
							</tr>
						</table>
						<a href="list">목록</a>
						| <a href="delete?no=${manage.id }">삭제</a>
					</div>
				</section>
			</div>
		</div>

		<%@ include file="../inc/footer.jsp"%>
</body>
</html>