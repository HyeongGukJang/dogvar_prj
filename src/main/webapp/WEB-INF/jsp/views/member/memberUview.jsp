<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>

<script>
	function myFunction() {
		var x = document.getElementById("password");
		if (x.type === "password") {
			x.type = "text";
		} else {
			x.type = "password";
		}
	}
</script>
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

.profile_img, #img {
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
								src="<spring:url value='/resources/img/${loginMember.id}.jpg'/>">
						</div>

						<div class="profile">
							<form id="join_form" enctype="multipart/form-data" method="POST"
								action="memberModify">
								<input type="hidden" name="id" value="${loginMember.id}">
								<input type="hidden" name="password"
									value="${loginMember.password}"> <input type="hidden"
									name="photoPath" id="photoPath"
									value="${loginMember.photoPath}">
								<table>
									<tr>
										<th>프로필 이미지:</th>
										<td><img class="profile" id="img"
											src="${loginMember.photoPath}" /> <input id="input_img"
											type="file" name="uploadfile" placeholder="파일선택">
											<button type="button" id="img_del">
												<b>삭제</b>
											</button></td>
									</tr>
									<tr>
										<th>이름 :</th>
										<td><input type="text" id="name" name="name"
											value="${loginMember.name}" title="이름" class="int"
											maxlength="6"> <span class="error_next_box"
											id="nameMsg" style="display: none" aria-live="assertive">필수
												정보입니다.</span></td>
									</tr>
									<tr>
										<th>별명 :</th>
										<td><input type="text" id="nickname" name="nickname"
											value="${loginMember.nickname}" title="별칭" class="int"
											maxlength="6"> <span class="error_next_box"
											id="nickNameMsg" style="display: none" aria-live="assertive">필수
												정보입니다.</span></td>
									</tr>
									<tr>
										<th>생일 :</th>
										<td><input type="date" name="birthday" id="birthday"
											value="${loginMember.birthday}" style="width: 200px" /></td>
									</tr>
									<tr>
										<th>웹사이트 :</th>
										<td><input type="text" name="website" id="website"
											value="${loginMember.website}" style="width: 300px" /></td>
									</tr>
									<tr>
										<th>자기소개 :</th>
										<td colspan="2"><textarea id="introduce" name="introduce"
												title="소개" class="int" maxlength="150">${loginMember.introduce}</textarea></td>
									</tr>
									<tr>
										<th>이메일 :</th>
										<td><input type="text" name="emailId" id="emailId"
											value="${loginMember.emailId}"
											style="width: 200px; display: inline;" /> <strong>@</strong>
											<input type="text" name="emailDomain" id="emailDomain"
											value="${loginMember.emailDomain}"
											style="width: 200px; display: inline;" /></td>
									</tr>
									<tr>
										<th>전화번호 :</th>
										<td><input type="text" name="phoneStart" id="phoneStart"
											value="${loginMember.phoneStart}"
											style="width: 100px; display: inline;" /> <strong>
												- </strong> <input type="text" name="phoneCenter" id="phoneCenter"
											value="${loginMember.phoneCenter}"
											style="width: 100px; display: inline" /> <strong> -
										</strong> <input type="text" name="phoneEnd" id="phoneEnd"
											value="${loginMember.phoneEnd}"
											style="width: 100px; display: inline" /></td>
									</tr>
									<tr>
										<th>성별 :</th>
										<td><select name="sex">
												<option value="m"
													<c:if test= "${loginMember.sex eq 'm'}">selected</c:if>>남자</option>
												<option value="w"
													<c:if test= "${loginMember.sex eq 'w'}">selected</c:if>>여자</option>
												<option value="x"
													<c:if test= "${loginMember.sex eq 'x'}">selected</c:if>>비공개</option>
										</select></td>
									</tr>
									<tr>
										<th>계졍 활성화 여부 :</th>
										<td><select name="enableYn">
												<option value="Y"
													<c:if test= "${loginMember.enableYn eq 'Y'}">selected</c:if>>활성화</option>
												<option value="N"
													<c:if test= "${loginMember.enableYn eq 'N'}">selected</c:if>>비활성화</option>
										</select></td>
									</tr>
								</table>
								<div class="btn_area">
									<button type="submit" id="btnchange" name="btn"
										class="btn_type btn_primary" value="수정">
										<span>수정</span>
									</button>
									<button type="submit" id="btndelete" name="btn"
										class="btn_type btn_primary" value="탈퇴">
										<span>탈퇴</span>
									</button>
									<button type="button" id="btnmove" class="btn_type btn_primary"
										value="메인화면이동" onclick="location.href='loginOkview'">
										<span>메인화면 이동</span>
									</button>
								</div>
								
							</form>
						</div>
						<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
						<script>
							$(function() {

								$("#input_img").on('change', function() {
									readURL(this);
								});

								$("#img_del").on('click', function() {
									$('#img').attr('src', '');
									$('#photoPath').val('');
									$('#input_img').val('');
								});

								//패스워드1 keypress시 err문구 초기화		
								$("#password").keypress(function() {
									$("#pswd1Msg").css("display", "none");
								});
								//패스워드2 keypress시 err문구 초기화	
								$("#passwordRe").keypress(function() {
									$("#pswd2Msg").css("display", "none");
								});
								//이름 keydown 시 err문구 초기화	
								$("#name").keydown(function() {
									$("#nameMsg").css("display", "none");
								});
								//nickname keydown시 err문구 초기화
								$("#nickname").keydown(function() {
									$("#nickNameMsg").css("display", "none");
								});

								///이메일 kepress시 err문구 초기화
								$("#emailId").keypress(function() {
									$("#emailMsg").css("display", "none");
								});
								$("#emailDomain").keypress(function() {
									$("#emailMsg").css("display", "none");
								});
								///휴대폰 kepress시 err문구 초기화
								$("#phoneStart").keypress(function() {
									$("#phoneNoMsg").css("display", "none");
								});
								$("#phoneCenter").keypress(function() {
									$("#phoneNoMsg").css("display", "none");
								});
								$("#phoneEnd").keypress(function() {
									$("#phoneNoMsg").css("display", "none");
								});

								//패스워드체크
								$("#password").blur(function() {

									var password = $('#password').val();

									if (password == "") {
										$("#pswd1Msg").css("display", "block");
										$("#pswd1Msg").text('필수 정보입니다.');

										return false;
									}
								});

								//패스워드RE체크
								$("#passwordRe")
										.blur(
												function() {
													var password = $(
															'#password').val();
													var passwordRe = $(
															'#passwordRe')
															.val();

													if (passwordRe == "") {
														$("#pswd2Msg").css(
																"display",
																"block");
														$("#pswd2Msg").text(
																'필수 정보입니다.');

														return false;
													}

													if (passwordRe != password) {
														$("#pswd2Msg").css(
																"display",
																"block");
														$("#pswd2Msg")
																.text(
																		'비밀번호가 일치하지 않습니다.');
														$("#pswd2Msg").css(
																"color", "red");
														return false;
													}
												});

								//이름체크
								$("#name").blur(function() {
									var name = $('#name').val();
									if (name == "") {
										$("#nameMsg").css("display", "block");
										$("#nameMsg").text('필수 정보입니다.');

										return false;
									}
								});

								//별칭체크
								$("#nickname")
										.blur(
												function() {
													var nickname = $(
															'#nickname').val();

													if (nickname == "") {
														$("#nickNameMsg").css(
																"display",
																"block");
														$("#nickNameMsg").text(
																'필수 정보입니다.');

														return false;
													}
												});

								//폰체크
								$("#phoneStart")
										.blur(
												function() {
													var regexp = /^[0-9]*$/

													v = $('#phoneStart').val();

													if (!regexp.test(v)) {
														$("#phoneNoMsg").css(
																"display",
																"block");
														$("#phoneNoMsg").text(
																'숫자만입력하세요');
														$('#phoneStart')
																.val("");
														return false;
													}

													var phoneStart = $(
															'#phoneStart')
															.val();
													var phoneCenter = $(
															'#phoneCenter')
															.val();
													var phoneEnd = $(
															'#phoneEnd').val();

													if (phoneStart == ""
															|| phoneCenter == ""
															|| phoneEnd == "") {
														$("#phoneNoMsg").css(
																"display",
																"block");
														$("#phoneNoMsg").text(
																'필수 정보입니다.');

														return false;
													}
												});
								$("#phoneCenter")
										.blur(
												function() {
													var regexp = /^[0-9]*$/

													v = $('#phoneCenter').val();

													if (!regexp.test(v)) {
														$("#phoneNoMsg").css(
																"display",
																"block");
														$("#phoneNoMsg").text(
																'숫자만입력하세요');
														$('#phoneCenter').val(
																"");
														return false;
													}
													var phoneStart = $(
															'#phoneStart')
															.val();
													var phoneCenter = $(
															'#phoneCenter')
															.val();
													var phoneEnd = $(
															'#phoneEnd').val();

													if (phoneStart == ""
															|| phoneCenter == ""
															|| phoneEnd == "") {
														$("#phoneNoMsg").css(
																"display",
																"block");
														$("#phoneNoMsg").text(
																'필수 정보입니다.');

														return false;
													}
												});
								$("#phoneEnd")
										.blur(
												function() {
													var regexp = /^[0-9]*$/

													v = $('#phoneEnd').val();

													if (!regexp.test(v)) {
														$("#phoneNoMsg").css(
																"display",
																"block");
														$("#phoneNoMsg").text(
																'숫자만입력하세요');
														$('#phoneEnd').val("");
														return false;
													}
													var phoneStart = $(
															'#phoneStart')
															.val();
													var phoneCenter = $(
															'#phoneCenter')
															.val();
													var phoneEnd = $(
															'#phoneEnd').val();

													if (phoneStart == ""
															|| phoneCenter == ""
															|| phoneEnd == "") {
														$("#phoneNoMsg").css(
																"display",
																"block");
														$("#phoneNoMsg").text(
																'필수 정보입니다.');

														return false;
													}
												});

								//이메일아이디체크
								$("#emailId")
										.blur(
												function() {
													var emailId = $('#emailId')
															.val();
													var emailDomain = $(
															'#emailDomain')
															.val();
													var regexp = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;

													if (regexp.test(emailId)) {
														$("#emailMsg").css(
																"display",
																"block");
														$("#emailMsg")
																.text(
																		'이메일아이디는 한글을입력할수 없습니다.');

														$('#emailId').val("");
														return false;
													}

													if (emailId == ""
															|| emailDomain == "") {
														$("#emailMsg").css(
																"display",
																"block");
														$("#emailMsg").text(
																'필수 정보입니다.');

														return false;
													}
												});

								//이메일체크
								$("#emailDomain")
										.blur(
												function() {
													var emailId = $('#emailId')
															.val();
													var emailDomain = $(
															'#emailDomain')
															.val();

													var regexp = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;

													if (regexp
															.test(emailDomain)) {
														$("#emailMsg").css(
																"display",
																"block");
														$("#emailMsg")
																.text(
																		'이메일도메인은 한글을입력할수 없습니다.');
														$('#emailDomain').val(
																"");
														return false;
													}

													if (emailId == ""
															|| emailDomain == "") {
														$("#emailMsg").css(
																"display",
																"block");
														$("#emailMsg").text(
																'필수 정보입니다.');
														return false;
													}
												});

								//가입하기
								$("#btnchange")
										.on(
												'click',
												function() {

													var jb = $(
															'.error_next_box')
															.get();

													for (var i = 0; i < jb.length; i++) {
														var yn = $(
																'.error_next_box')
																.eq(i)
																.css("display");
														if (yn == "block") {
															if (i == 0) {
																$("#name")
																		.focus();
															} else if (i == 1) {
																$("#nickname")
																		.focus();
															} else if (i == 2) {
																$("#emailId")
																		.focus();
															} else if (i == 3) {
																$("#phoneStart")
																		.focus();
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
																return ("0" + parseInt(
																		x)
																		.toString(
																				16))
																		.slice(-2);
															}
															return "#"
																	+ hex(rgb[1])
																	+ hex(rgb[2])
																	+ hex(rgb[3]);
														}
													}

												});
							});

							function readURL(input) {
								if (input.files && input.files[0]) {
									var reader = new FileReader();

									reader.onload = function(e) {
										$('#img').attr('src', e.target.result);
									}
									reader.readAsDataURL(input.files[0]);
								}
							}
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