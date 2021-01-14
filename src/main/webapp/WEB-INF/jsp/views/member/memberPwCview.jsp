<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

td, th {
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

#password {
	width: 200px;
	margin-right: 30px;
	display: inline;
}

label {
	margin-top: 10px;
	line-height: normal;
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
			<img
				src="<spring:url value='/resources/images/default_profile.jpg'/>">
		</div>

		<div class="profile">
			<form id="join_form" method="POST" action="memberPwChange">
				<input type="hidden" id="id" name="id" value="${loginMember.id}">
				<table>
					<tr>
						<th><label for="id">아이디 : ${loginMember.id}</label></th>
						<td></td>
					</tr>
					<tr>
						<th>이전 비밀번호</th>
						<td><span class="ps_box int_pass" id="pswdbfImg"> <input
								type="password" id="passwordBf" class="int" name="passwordBf"
								title="비밀번호 입력" aria-describedby="pswd1Msg" maxlength="20" style="width:300px;">
								<span class="lbl"><span id="pswdBfSpan" class="step_txt"></span></span>
						</span>
							<div class="ly_v2" id="err_capslock1" style="display: none;">
								<div class="ly_box">
									<p>
										<strong>Caps Lock</strong>이 켜져 있습니다.
									</p>
								</div>
								<span class="sp ly_point"></span>
							</div> <span class="error_next_box" id="pswdBfMsg"
							style="display: block" aria-live="assertive">필수정보입니다.</span></td>
					</tr>
					<tr>
						<th>새 비밀번호</th>
						<td><span class="ps_box int_pass" id="pswd1Img"> <input
								type="password" id="password" name="newpassword" class="int"
								title="비밀번호 입력" aria-describedby="pswd1Msg" maxlength="20" style="width:300px;">
								<span class="lbl"><span id="pswd1Span" class="step_txt"></span></span>
						</span>
							<div class="ly_v2" id="err_capslock2" style="display: none;">
								<div class="ly_box">
									<p>
										<strong>Caps Lock</strong>이 켜져 있습니다.
									</p>
								</div>
								<span class="sp ly_point"></span>
							</div> <span class="error_next_box" id="pswd1Msg"
							style="display: block" aria-live="assertive">필수정보입니다.</span></td>
					</tr>
					<tr>
						<th>새 비밀번호 재확인</th>
						<td><span class="ps_box int_pass_check" id="pswd2Img">
								<input type="password" id="passwordRe" name="newpasswordRe"
								class="int" title="비밀번호 재확인 입력" aria-describedby="pswd2Blind"
								maxlength="20" style="width:300px;">
						</span>
							<div class="ly_v2" id="err_capslock3" style="display: none;">
								<div class="ly_box">
									<p>
										<strong>Caps Lock</strong>이 켜져 있습니다.
									</p>
								</div>
								<span class="sp ly_point"></span>
							</div> <span class="error_next_box" id="pswd2Msg"
							style="display: block" aria-live="assertive">필수정보입니다.</span></td>
					</tr>
				</table>
				<div class="btn_area">
					<button type="submit" id="btnChange" class="btn_type btn_primary">
						<span>비밀번호 수정하기</span>
					</button>
					<input type="button" id="idinquiry"
						onclick="location.href='memberPwFindview'" value="비밀번호 찾기">
					<input type="button" id="idinquiry"
						onclick="location.href='loginOkview'" value="메인화면">
				</div>
			</form>
		</div>
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
		<script>
			$(function() {

				//어전비밀번호 keypress시 err문구 초기화		
				$("#passwordBf")
						.keypress(
								function(e) {
									$("#pswdBfMsg").css("display", "none");
									var keyCode = 0;

									var shirftKey = false;

									keyCode = e.keyCode;

									shiftKey = e.shiftKey;

									if (((keyCode >= 65 && keyCode < 90) && !shiftKey)
											|| ((keyCode >= 97 && keyCode <= 112) && shiftKey)) {
										$("#err_capslock1").css("display",
												"block");

									} else {
										$("#err_capslock1").css("display",
												"none");

									}
								});

				//패스워드1 keypress시 err문구 초기화		
				$("#password")
						.keypress(
								function(e) {
									$("#pswd1Msg").css("display", "none");
									var keyCode = 0;

									var shirftKey = false;

									keyCode = e.keyCode;

									shiftKey = e.shiftKey;

									if (((keyCode >= 65 && keyCode < 90) && !shiftKey)
											|| ((keyCode >= 97 && keyCode <= 112) && shiftKey)) {
										$("#err_capslock2").css("display",
												"block");

									} else {
										$("#err_capslock2").css("display",
												"none");

									}
								});
				//패스워드2 keypress시 err문구 초기화	
				$("#passwordRe")
						.keypress(
								function(e) {
									$("#pswd2Msg").css("display", "none");
									var keyCode = 0;

									var shirftKey = false;

									keyCode = e.keyCode;

									shiftKey = e.shiftKey;

									if (((keyCode >= 65 && keyCode < 90) && !shiftKey)
											|| ((keyCode >= 97 && keyCode <= 112) && shiftKey)) {
										$("#err_capslock3").css("display",
												"block");

									} else {
										$("#err_capslock3").css("display",
												"none");

									}
								});

				//이전 패스워드 ajax 체크
				$("#passwordBf")
						.blur(
								function() {
									var id = $('#id').val();
									var passwordBf = $('#passwordBf').val();
									//널체크
									if (id == "") {
										$("#pswdBfMsg").css("display", "block");
										$("#pswdBfMsg").text('필수정보입니다.');
										$("#pswdBfMsg").css("color", "red");
										return false;
									}

									$
											.ajax({
												url : 'getMemberPwCheck?id='
														+ id + '&password='
														+ passwordBf,
												type : 'get',
												success : function(data) {
													if (data == "Y") {
														$("#pswdBfMsg").css(
																"display",
																"block");
														$("#pswdBfMsg")
																.text(
																		'이전 패스워드가 일치합니다');
														$("#pswdBfMsg").css(
																"color",
																"green");
													} else if (data == "N"){
														$("#pswdBfMsg").css(
																"display",
																"block");
														$("#pswdBfMsg")
																.text(
																		'이전 패스워드가 틀렸습니다.');
														$("#pswdBfMsg").css(
																"color", "red");
													}
												},
												error : function(request,
														status, error) {
													alert("code:"
															+ request.status
															+ "\n"
															+ "message:"
															+ request.responseText
															+ "\n" + "error:"
															+ error);

												}

											});
								});

				//패스워드체크
				$("#password").blur(function() {

					var password = $('#password').val();
					var passwordRe = $('#passwordRe').val();

					if (password == "") {
						$("#pswd1Msg").css("display", "block");
						$("#pswd1Msg").text('필수정보입니다.');

						return false;
					}
					if (passwordRe != password) {
						$("#pswd2Msg").css("display", "block");
						$("#pswd2Msg").text('비밀번호가 일치하지 않습니다.');
						$("#pswd2Msg").css("color", "red");
						return false;
					} else {
						$("#pswd2Msg").css("display", "none");
					}
				});

				//패스워드RE체크
				$("#passwordRe").blur(function() {
					var password = $('#password').val();
					var passwordRe = $('#passwordRe').val();

					if (passwordRe == "") {
						$("#pswd2Msg").css("display", "block");
						$("#pswd2Msg").text('필수정보입니다.');

						return false;
					}

					if (passwordRe != password) {
						$("#pswd2Msg").css("display", "block");
						$("#pswd2Msg").text('비밀번호가 일치하지 않습니다.');
						$("#pswd2Msg").css("color", "red");
						return false;
					} else {
						$("#pswd2Msg").css("display", "none");
					}
				});

				//비밀번호변경하기
				$("#btnChange")
						.on(
								'click',
								function() {

									var pwcheckColor = rgb2hex($("#pswdBfMsg")
											.css("color"));

									if (pwcheckColor != "#008000") {
										$("#passwordBf").focus();
										return false;
									}

									var jb = $('.error_next_box').get();

									for (var i = 1; i < jb.length; i++) {
										var yn = $('.error_next_box').eq(i)
												.css("display");
										if (yn == "block") {
											if (i == 1) {
												$("#password").focus();
											} else if (i == 2) {
												$("#passwordRe").focus();
											}
											return false;
										}
									}

									function rgb2hex(rgb) {
										if (rgb.search("rgb") == -1) {
											return rgb;
										} else {
											rgb = rgb
													.match(/^rgba?\((\d+),\s*(\d+),\s*(\d+)(?:,\s*(\d+))?\)$/);
											function hex(x) {
												return ("0" + parseInt(x)
														.toString(16))
														.slice(-2);
											}
											return "#" + hex(rgb[1])
													+ hex(rgb[2]) + hex(rgb[3]);
										}
									}

								});
			});
		</script>
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