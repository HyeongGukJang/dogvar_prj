<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
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

				<!-- Banner -->
				<section id="banner">
					<div class="content">
						<div class="profile_img">
							<img src="<spring:url value='/resources/img/${loginMember.id}.jpg'/>">
						</div>
						<div class="profile">
							<form action="">
								<table>
									<tr>
										<th>별명 : </th>
										<td><c:out value="${member.nickname }" /></td>
									</tr>
									<tr>
										<th>이름 : </th>
										<td><c:out value="${member.name }" /></td>
									</tr>
									<tr>
										<th>자기소개 : </th>
										<td colspan="2"><textarea id="introduce" disabled><c:out value="${member.introduce }" /></textarea></td>
									</tr>
									<tr>
										<th>생일 : </th>
										<td><c:out value="${member.birthday }" /></td>
									</tr>
									<tr>
										<th>전화번호 : </th>
										<td><c:out value="${member.phoneStart }" /> - <c:out value="${member.phoneCenter }" /> - <c:out value="${member.phoneEnd }" /></td>
									</tr>
									<tr>
										<th>이메일 : </th>
										<td><c:out value="${member.emailId }" />@<c:out value="${member.emailDomain }" /></td>
									</tr>
									<tr>
										<th>웹사이트 : </th>
										<td><c:out value="${member.website }" /></td>
									</tr>
									<tr>
										<th>성별 : </th>
										<td><c:out value="${member.sex }" /></td>
									</tr>
								</table>
								<ul class="actions">
									<li style="margin-left: 150px;"><a href="memberUview" class="button primary">프로필 편집</a></li>
									<li style="margin-left: 5px;"><a href="memberPwCview" class="button primary">비밀번호 변경</a></li>
									<li style="margin-left: 5px;"><a href="memberlogOut" class="button primary">로그아웃</a></li>
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

		<%@ include file="../inc/footer.jsp"%>
</body>
</html>