<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/boardheader.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="<c:url value="resources/assets/css/board_write.css" />"
	rel="stylesheet">
<script src="resources/jquery-2.2.3.min.js"></script>
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
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
		if (!chkInputValue("#brdwriter", "작성자를"))
			return;
		if (!chkInputValue("#brdtitle", "글 제목을"))
			return;

		$("#form1").submit();
	}		
	window.onload = function() {
		var brdWriter = document.getElementById("brdwriter");
		brdWriter.readOnly = true;
		if(brdWriter.value != null) {
			brdWriter.value = "<%=(String) session.getAttribute("nickName")%>";
		}
	}
</script>

				<!-- Content -->
				<section>
					<header class="main">
						<!-- <h1>글쓰기</h1> -->
					</header>
					<div class="board_write_content">
						<form id="form1" name="form1" action="boardSave" method="post"
							enctype="multipart/form-data">
							제목 <input type="text" id="brdtitle" name="brdtitle"
								maxlength="250" value="<c:out value="${boardInfo.brdtitle}"/>"
								style="margin-bottom: 25px;"> 작성자 <input type="text"
								id="brdwriter" name="brdwriter" maxlength="20"
								value="<c:out value="${boardInfo.brdwriter}"/>"
								style="margin-bottom: 25px;"> 파일첨부
							<table style="border-radius: 0.375em;">
								<tr style="border-radius: 0.375em;">
									<td
										style="background-color: white; border: 1px solid rgba(210, 215, 217, 0.75); border-radius: 0.375em;">
										<c:forEach var="listview" items="${listview}"
											varStatus="status">
											<input type="checkbox" name="fileno"
												value="<c:out value="${listview.fileno}"/>">
											<a
												href="fileDownload?filename=<c:out value="${listview.filename}"/>&downname=<c:out value="${listview.realname }"/>">
												<c:out value="${listview.filename}" />
											</a>
											<c:out value="${listview.size2String()}" />
											<br />
										</c:forEach> <input type="file" name="uploadfile" multiple="" />
									</td>
								</tr>
							</table>

							내용
							<textarea id="brdmemo" name="brdmemo" rows="5" cols="60"
								style="margin-bottom: 25px; height: 280px;"><c:out
									value="${boardInfo.brdmemo}" /></textarea>
							<input type="hidden" name="bgno" value="<c:out value="${bgno}"/>">
							<input type="hidden" name="brdno"
								value="<c:out value="${boardInfo.brdno}"/>"> <a href="#"
								onclick="fn_formSubmit()">저장</a>
						</form>
					</div>
				</section>
			</div>
		</div>

		<%@ include file="../inc/footer.jsp"%>
		<script type="text/javascript">
			$(function() {
				CKEDITOR.replace('brdmemo', {
					filebrowerUploadUrl : "resources/upload/"
				});
			});
		</script>
</body>
</html>