<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>

				<!-- center -->
				<section id="banner">
					<div class="content">
						<header>회원탈퇴</header>
						<h3>
							<c:out value="${manage.id }" /> 회원을 정말로 강제탈퇴 하시겠습니까?
						</h3>
						<form action="delete" method="post">
							<input type="hidden" name="id" value="${manage.id }" /> <input type="submit" value="강제 탈퇴하기" />
						</form>
					</div>
				</section>
			</div>
		</div>

		<%@ include file="../inc/footer.jsp"%>
</body>
</html>