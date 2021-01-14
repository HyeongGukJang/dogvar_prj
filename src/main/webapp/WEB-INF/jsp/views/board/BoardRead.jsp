<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/boardheader.jsp"%>

<link href="<c:url value="resources/assets/css/board_view.css" />"
	rel="stylesheet">
<link href="<c:url value="resources/assets/css/boardreply.css" />"
	rel="stylesheet">
<script src="resources/jquery-2.2.3.min.js"></script>
<script>
	function chkInputValue(id, msg) {
		if ($.trim($(id).val()) == "") {
			alert(msg + " 입력해주세요.");
			$(id).focus();
			return false;
		}
		return true;
	}
	function fn_formSubmit() {
		if (!chkInputValue("#rewriter1", "작성자를"))
			return;
		if (!chkInputValue("#rememo1", "글 내용을"))
			return;

		var formData = $("#form1").serialize();
		$.ajax({
			url : "boardReplySave",
			type : "post",
			data : formData,
			success : function(result) {
				if (result !== "") {
					$("#rewriter1").val("");
					$("#rememo1").val("");
					$("#replyList").append(result);
					alert("저장되었습니다.");
				} else {
					alert("서버에 오류가 있어서 저장되지 않았습니다.");
				}
			}
		})
	}

	function fn_replyDelete(reno) {
		if (!confirm("삭제하시겠습니까?")) {
			return;
		}
		$.ajax({
			url : "boardReplyDelete",
			type : "post",
			data : {
				"reno" : reno
			},
			success : function(result) {
				if (result == "OK") {
					$("#replyItem" + reno).remove();
					alert("삭제되었습니다.");
				} else {
					alert("댓글이 있어서 삭제할 수 없습니다.");
				}
			}
		})
	}

	var updateReno = updateRememo = null;
	function fn_replyUpdate(reno) {
		hideDiv("replyDialog");

		$("#replyDiv").show();

		if (updateReno) {
			$("#replyDiv").appendTo(document.body);
			$("#reply" + updateReno).text(updateRememo);
		}

		$("#reno2").val(reno);
		$("#rememo2").val($("#reply" + reno).text());
		$("#reply" + reno).text("");
		$("#replyDiv").appendTo($("#reply" + reno));
		$("#rememo2").focus();
		updateReno = reno;
		updateRememo = $("#rememo2").val();
	}

	function fn_replyUpdateSave() {
		if (!chkInputValue("#rememo2", "글 내용을"))
			return;

		var formData = $("#form2").serialize();
		$.ajax({
			url : "boardReplySave",
			type : "post",
			data : formData,
			success : function(result) {
				if (result !== "") {
					$("#reply" + updateReno).text($("#rememo2").val());
					$("#replyDiv").hide();
					alert("저장되었습니다.");
				} else {
					alert("서버에 오류가 있어서 저장되지 않았습니다.");
				}
			}
		})
	}

	function fn_replyUpdateCancel() {
		hideDiv("#replyDiv");

		$("#reply" + updateReno).text(updateRememo);
		updateReno = updateRememo = null;
	}

	function hideDiv(id) {
		$(id).hide();
		$(id).appendTo(document.body);
	}

	function fn_replyReply(reno) {
		$("#replyDialog").show();

		if (updateReno) {
			fn_replyUpdateCancel();
		}

		$("#reparent3").val(reno);
		$("#rememo3").val("");
		$("#replyDialog").appendTo($("#reply" + reno));
		$("#rewriter3").focus();
	}
	function fn_replyReplyCancel() {
		hideDiv("#replyDialog");
	}

	function fn_replyReplySave() {
		if (!chkInputValue("#rewriter3", "작성자를"))
			return;
		if (!chkInputValue("#rememo3", "글 내용을"))
			return;

		var formData = $("#form3").serialize();
		$.ajax({
			url : "boardReplySave",
			type : "post",
			data : formData,
			success : function(result) {
				if (result !== "") {
					var parent = $("#reparent3").val();
					$("#replyItem" + parent).after(result);
					$("#replyDialog").hide();
					alert("저장되었습니다.");
					$("#rewriter3").val("");
					$("#rememo3").val("");
				} else {
					alert("서버에 오류가 있어서 저장되지 않았습니다.");
				}
			}
		})
	}
	window.onload = function() {
		var rewriter1 = document.getElementById("rewriter1");
		var rewriter3 = document.getElementById("rewriter3");
		rewriter1.readOnly = true;
		rewriter3.readOnly = true;
		if(rewriter1.value != null) {
			rewriter1.value = "<%=(String) session.getAttribute("nickName")%>";
		}
		if(rewriter3.value != null) {
			rewriter3.value = "<%=(String) session.getAttribute("nickName")%>";
		}
	}	
</script>

				<!-- Content -->
				<section>
					<header class="main">
						<h2>Q&A</h2>
					</header>
					<div class="contentBox">

						<!-- ========================= 게시글 view ========================= -->
						<div class="content_view">
							<table class="content_table">
								<colgroup>
									<col width='15%' />
									<col width='*%' />
								</colgroup>
								<tbody>
									<tr>
										<td class="title">작성자</td>
										<td><c:out value="${boardInfo.brdwriter}" /></td>
									</tr>
									<tr>
										<td class="title">제목</td>
										<td><c:out value="${boardInfo.brdtitle}" /></td>
									</tr>
									<tr>
										<td class="title">내용</td>
										<td style="letter-spacing: 1px; line-height: 10px;"><c:out value="${boardInfo.brdmemo}"
												escapeXml="false" /></td>
									</tr>
									<tr>
										<td class="title">첨부</td>
										<td><c:forEach var="listview" items="${listview}"
												varStatus="status">
												<a
													href="fileDownload?filename=<c:out value="${listview.filename}"/>&downname=<c:out value="${listview.realname }"/>">
													<c:out value="${listview.filename}" />
												</a>
												<c:out value="${listview.size2String()}" />
											</c:forEach></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="commentBox">
							<!-- ========================= 댓글 입력 부분 ========================= -->
							<div>
								<h3>댓글</h3>
							</div>

							<!-- ============================= 댓글 view ============================= -->
							<div>
								<ul class="comment_view">
									<li>
										<div style="padding: 5px">
											<form id="form1" name="form1">
												<input type="hidden" id="brdno1" name="brdno"
													value="<c:out value="${boardInfo.brdno}"/>"> 작성자: <input
													type="text" id="rewriter1" name="rewriter" size="20"
													maxlength="20"> <br />
												<textarea id="rememo1" name="rememo" rows="3" cols="60"
													maxlength="500" placeholder="댓글을 달아주세요."></textarea>
												<a href="#" onclick="fn_formSubmit()">저장</a>
											</form>
										</div>

										<div id="replyList">
											<c:forEach var="replylist" items="${replylist}"
												varStatus="status">
												<div id="replyItem<c:out value="${replylist.reno}"/>"
													style="padding: 5px; margin-top: 5px; margin-left: <c:out value="${20*replylist.redepth}"/>px; display: inline-block">
													<c:out value="${replylist.rewriter}" />
													<c:out value="${replylist.redate}" />
													<a href="#"
														onclick="fn_replyDelete('<c:out value="${replylist.reno}"/>')">삭제</a>
													<a href="#"
														onclick="fn_replyUpdate('<c:out value="${replylist.reno}"/>')">수정</a>
													<a href="#"
														onclick="fn_replyReply('<c:out value="${replylist.reno}"/>')">댓글</a>
													<br />
													<div id="reply<c:out value="${replylist.reno}"/>">
														<c:out value="${replylist.rememo}" />
													</div>
												</div>
												<br />
											</c:forEach>
										</div>

										<div id="replyDiv" style="width: 99%; display: none">
											<form id="form2" name="form2" action="boardReplySave"
												method="post">
												<input type="hidden" id="brdno2" name="brdno"
													value="<c:out value="${boardInfo.brdno}"/>"> <input
													type="hidden" id="reno2" name="reno">
												<textarea id="rememo2" name="rememo" rows="3" cols="60"
													maxlength="500"></textarea>
												<a href="#" onclick="fn_replyUpdateSave()">저장</a> <a
													href="#" onclick="fn_replyUpdateCancel()">취소</a>
											</form>
										</div>

										<div id="replyDialog" style="width: 99%; display: none">
											<form id="form3" name="form3" action="boardReplySave"
												method="post">
												<input type="hidden" id="brdno3" name="brdno"
													value="<c:out value="${boardInfo.brdno}"/>"> <input
													type="hidden" id="reno3" name="reno"> <input
													type="hidden" id="reparent3" name="reparent"> 작성자:
												<input type="text" id="rewriter3" name="rewriter" size="20"
													maxlength="20"> <br />
												<textarea id="rememo3" name="rememo" rows="3" cols="60"
													maxlength="500"></textarea>
												<a href="#" onclick="fn_replyReplySave()">저장</a> <a href="#"
													onclick="fn_replyReplyCancel()">취소</a>
											</form>
										</div>
									</li>
								</ul>
							</div>
							<!--end of comment-->
						</div>
						<!-- ==========================하단 버튼========================== -->
						<div>
							<div class="listBtn_left">
								<input type="button"
									onclick="location.href='boardList?bgno=<c:out value="${boardInfo.bgno}'"/>"
									value="돌아가기"> <input type="button"
									onclick="location.href='boardForm?brdno=<c:out value="${boardInfo.brdno}'"/>"
									value="수정"> <input type="button"
									onclick="location.href='boardDelete?bgno=<c:out value="${boardInfo.bgno}"/>&brdno=<c:out value="${boardInfo.brdno}'"/>"
									value="삭제">
							</div>
						</div>
					</div>
				</section>

				<hr class="footer_hr">

				<!-- Content_footer -->
				<footer class="footer">
					<ul class="footer_list">
						<li class="footer_GBSB">GBSB</li>
						<li class="footer_url">http://bitcamp_GBSB_.com</li>
					</ul>
				</footer>
			</div>
		</div>

		<%@ include file="../inc/footer.jsp"%>
</body>
</html>