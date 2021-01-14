<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="inc/header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<%
	if (session.getAttribute("loginMember") != null) {
%>


				<!-- Content -->
				<section>
					<div class="board_list_content"><center>
						<a href="site" class="logo"><img src="<spring:url value='resources/images/job1.jpg'/>"></a><br>
						<a href="boardList?bgno=5" class="logo"><img src="<spring:url value='resources/images/job2.jpg'/>"></a><br>
						<a href="boardList?bgno=6" class="logo"><img src="<spring:url value='resources/images/job3.jpg'/>"></a>
					</center></div>
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