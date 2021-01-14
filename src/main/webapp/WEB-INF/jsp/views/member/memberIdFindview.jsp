<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script>
	$(function() {
		//1.이메일 휴대폰 선택시 이벤트
		$("#confirmGb").change(function() {

			if ($("#confirmGb option:selected").val() == "email") {
				$("#emailSelect").css("display", "block");
				$("#phoneSelect").css("display", "none");
			} else {
				$("#emailSelect").css("display", "none");
				$("#phoneSelect").css("display", "block");
			}
		});
	});
</script>
<style>
	.IdFind {
		width: 900px;
	}
</style>
				<!-- Content -->
				<section>
					<div class="IdFind">
						<h2>아이디 찾기</h2>

						<form action="memberIdFind" method="POST" style="display: inline;">
							<input type="hidden" name="sendGb" value="1" />
							<table border="1">
								<tr>
									<th>이름</th>
									<td><input type="text" name="name" maxlength="20" value="${sendInfo.name}" style="width: 200px" /></td>
								</tr>
								<tr>
									<th><select name="confirmGb" id="confirmGb" style="width: 200px">
											<option value="email" <c:if test= "${confirmGb eq 'email'}">selected</c:if>>이메일</option>
											<option value="phone" <c:if test= "${confirmGb eq 'phone'}">selected</c:if>>전화번호</option>
									</select></th>
									<td>

										<div id="emailSelect" style="display:${(confirmGb eq 'email'||confirmGb == null) ? 'block' : 'none'}">
											<input type="text" maxlength="50" name="emailId" value="${sendInfo.emailId}" style="width: 200px; display: inline;"/> @ 
											<input type="text" maxlength="50" name="emailDomain" value="${sendInfo.emailDomain}" style="width: 200px; display: inline;" />
										</div>
										<div id="phoneSelect" style="display:${confirmGb eq 'phone' ? 'block' : 'none'}">
											<input type="text" maxlength="3" name="phoneStart" value="${sendInfo.phoneStart}" style="width: 200px; display: inline;"/> - 
											<input type="text" maxlength="4" name="phoneCenter" value="${sendInfo.phoneCenter}" style="width: 200px; display: inline;"/> - 
											<input type="text" maxlength="4" name="phoneEnd" value="${sendInfo.phoneEnd}" style="width: 200px; display: inline;"/>
										</div>

									</td>
								</tr>
								<tr>
									<td colspan="2">
										<div id="msg" style="display:${msgYn eq 'Y' ? 'block' : 'none'}">
											<c:choose>
												<c:when test="${member != null }">
													<div id="ok">
														회원님의 정보가 일치합니다. <br> 이메일 발송버튼을 누르시면 <br> 등록된 메일주소 ${member.emailId}@${member.emailDomain} 으로 아이디를 발송합니다.<br>
													</div>
												</c:when>
												<c:otherwise>
													<div id="fail">회원님의 정보가 일치하지 않습니다.</div>
												</c:otherwise>
											</c:choose>
										</div>
									</td>
								</tr>
							</table>
							
								<input type="submit" value="정보확인" />
							
						</form>
						
							<form action="emailSend" method="POST" style="display: inline;">
							
								<input type="hidden" name="email" value="${member.emailId}@${member.emailDomain}" /> <input type="hidden" name="sendGb" value="1" /> <input type="hidden" name="var" value="${member.id}" />
								<input type="submit" id="emailSendBtn" value="이메일발송" ${member != null ? 'null' : 'disabled' } />
							
							</form>
						
						<div style="margin-top: 20px">
							<a href="loginview">로그인 화면으로 이동</a>
						</div>
					</div>
				</section>
			</div>
		</div>

		<%@ include file="../inc/footer.jsp"%>