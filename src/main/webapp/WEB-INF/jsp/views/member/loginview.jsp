<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>

<script>
	$(function() {

		//로그인버튼 클릭
		$("#login").on('click', function() {
			$("#err_empty_id").css("display", "none");
			$("#err_empty_pw").css("display", "none");
			$("#err_idCheckMsg").css("display", "none");
			var id = $("#id").val();
			var password = $("#password").val();

			//아이디 체크
			if (id == "") {
				$("#err_empty_id").css("display", "block");
				$("#err_empty_id").text('아이디를 입력해주세요.');
				return false;
			}

			//비번체크
			if (password == "") {
				$("#err_empty_pw").css("display", "block");
				$("#err_empty_pw").text('비밀번호를 입력해주세요.');
				return false;
			}
		});

		$("#password")
				.on(
						'keypress',
						function(e) {
							var keyCode = 0;

							var shirftKey = false;

							keyCode = e.keyCode;

							shiftKey = e.shiftKey;

							if (((keyCode >= 65 && keyCode < 90) && !shiftKey)
									|| ((keyCode >= 97 && keyCode <= 112) && shiftKey)) {
								$("#err_capslock").css("display", "block");

							} else {
								$("#err_capslock").css("display", "none");

							}

						});

	});
</script>
</head>
<%
	if (session.getAttribute("loginMember") == null) {
%>

				<!-- Content -->
				<section>
					<header class="main">
						<h1><span id="pageText">Login</span></h1>
					</header>
					
					<div class="board_list_content">
						<form action="loginCheck" method="POST">
							<div class="login-input-wrap">
								<input type="text" id="id" name="id" accesskey="L"
									placeholder="아이디" class="int" maxlength="20" style="width:400px;" value="">
							</div>
							<div class="error" id="err_empty_id" style="display: none"
								aria-live="assertive"></div>
							<div class="login-input-wrap password-wrap">
								<input type="password" id="password" name="password"
									placeholder="비밀번호" class="int" maxlength="16" style="width:400px;" >
							</div>
							<div class="ly_v2" id="err_capslock" style="display: none;">
								<div class="ly_box">
									<p>
										<strong>Caps Lock</strong>이 켜져 있습니다.
									</p>
								</div>
								<span class="sp ly_point"></span>
							</div>
							<div class="error" id="err_empty_pw" style="display: none"
								aria-live="assertive"></div>
							<div id="err_idCheckMsg" class="error">${idCheckMsg}</div><br>
							<div class="login-button-wrap">
								<input type="submit" id="loginGo" value="로그인" />
							</div>
						</form>

						<div class="position_a">
							<div class="find_info">
								<a target="_blank" id="idinquiry" href="memberIdFindview">아이디
									찾기</a> <span class="bar" aria-hidden="true">|</span> <a
									target="_blank" id="pwinquiry" href="memberPwFindview">비밀번호
									찾기</a> <span class="bar" aria-hidden="true">|</span> <a
									target="_blank" id="join" href="memberIview">회원가입</a>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>

		<%@ include file="../inc/footer.jsp"%>
	
	<%
		} else {
			System.out.println("로그인 상태입니다.");
			response.sendRedirect("profile?id="+ session.getAttribute("loginID"));
		}
	%>
</body>
</html>