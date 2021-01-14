<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="inc/header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<style>
.board_list_content img{
	padding: 20px;
}
</style>
<%
	if (session.getAttribute("loginMember") != null) {
%>

				<!-- Content -->
				<section>
					<center><div class="board_list_content">
						<a href="http://saramin.co.kr" class="logo"><img src="<spring:url value='resources/images/site1.png'/>"></a>
						<a href="http://jobkorea.co.kr" class="logo"><img src="<spring:url value='resources/images/site2.png'/>"></a>
						<a href="http://incruit.com" class="logo"><img src="<spring:url value='resources/images/site3.png'/>"></a><br>
						<a href="http://work.go.kr" class="logo"><img src="<spring:url value='resources/images/site4.png'/>"></a>
						<a href="http://albamon.com" class="logo"><img src="<spring:url value='resources/images/site5.png'/>"></a>
						<a href="http://alba.co.kr" class="logo"><img src="<spring:url value='resources/images/site6.png'/>"></a>
					</div></center>
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