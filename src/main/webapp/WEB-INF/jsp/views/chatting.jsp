<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="inc/header.jsp"%>

<script>
	window.onload = function() {
		var sender = document.getElementById("sender");
		sender.readOnly = true;
	}
</script>

<!-- Banner -->
<section id="banner">
	<div class="content">
		<form>
			사용자 : <input id="sender" type="text" value="<%=(String) session.getAttribute("loginID")%>" style="width:300px; margin-bottom: 5px;">
			<input id="loginBtn" value="Login" type="button">
			<input id="closeBtn" value="Disconnect" type="button"><br><br>
			받는 사람 : <select id="recipient" style="width:300px; margin-bottom: 5px;"><option value="All">All</option></select><br>
			메세지 : <input id="txtMsg" type="text" value="" style="width:600px; margin-bottom: 5px;">
			<input id="sendBtn" value="Send" type="button">
		</form>
		채팅 기록 : <textarea id="msgTxtArea" rows="10" cols="50"></textarea>
	</div>
</section>
</div>
</div>

<script src="http://code.jquery.com/jquery.js"></script>
<script>
	// 소켓 객체를 생성하면 URL의 소켓 서버와 즉시 연결 되고 서버쪽의 onOpen 메소드가 실행 된다.
	var socket = null;
	function connection() {
		// socket 클라이언트 리스너 함수들 (onopen, onclose, onmessage, onerror)
		socket.onopen = function(event) {
			$("#msgTxtArea").append(">>> open ...\n");
			//$("#msgTxtArea").append($("#sender").val()+"님이 입장하셨습니다!\n");
			//console.dir(event);
		}
		socket.onclose = function(event) {
			$("#msgTxtArea").append(">>> close ...\n");
		}
		socket.onmessage = function(event) {
			//$("#msgTxtArea").append(">>> message ...\n");
			//console.log(event.data)
			try {
				var userList = JSON.parse(event.data);
				$("#recipient").html('<option value="All">All</option>');
				for ( var i in userList) {
					var user = userList[i];
					$("#recipient").append(
							'<option value="'+user+'">' + user + '</option>');
				}
			} catch (e) {
				$("#msgTxtArea").append("<<< " + event.data + "\n");
			}
		}
		socket.onerror = function(event) {
			$("#msgTxtArea").append(">>> error ...\n");
		}
	}

	$("#loginBtn").click(
			function(event) {
				socket = new WebSocket("ws://localhost:8088/GBSB/chatting/"
						+ $("#sender").val());
				connection();
			});

	$("#sendBtn").click(function(event) {
		event.preventDefault();
		$("#msgTxtArea").append("나 : " + $("#txtMsg").val() + "\n");
		socket.send($("#recipient").val() + "|\|" + $("#txtMsg").val());
	});

	$("#closeBtn").click(function(event) {
		socket.close();
	});
</script>

<%@ include file="inc/footer.jsp"%>

</body>
</html>