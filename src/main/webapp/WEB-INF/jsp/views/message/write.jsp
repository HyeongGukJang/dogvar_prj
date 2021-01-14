<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/messageheader.jsp"%>
<script>
	window.onload = function() {
		var demoName = document.getElementById("demo-name");
		demoName.readOnly = true;
		if(demoName.value != null) {
			demoName.value = "<%=(String) session.getAttribute("name")%>";
		}

		var parse = window.location.href;
		var recvId = document.getElementById("recv_id");
		if (parse.indexOf("?") > -1) {
			var splits = parse.split("?");
			var gets = splits[1];
			var para = gets.split("&");
			var len = para.length;
			for (var i = 0; i < len; i++) {
				var param = para[i].split("=");
				var address = param[1];
				console.log(address);
				recvId.value = address;
			}
		}
	}
</script>
<style>
td {
	border: 1px solid white;
	background-color: white; 
}
</style>
				<section>
					<div class="col-6 col-12-small" style="width: 700px">
						<h4>Enter Message</h4>
						<form action="write" method="POST">
							<input type="hidden" name="name" value="<%=(String) session.getAttribute("loginID")%>" />
							<div class="col-2 col-12-small">
								<table border="">
								<tr>
									<td><label><strong>보낸 사람 :</strong></label></td>
									<td><input type="text" name="send_id" value="<%=(String) session.getAttribute("loginID")%>" readonly/></<td> 
								</tr>
								<tr>
									<td><label><strong>받는 사람 :</strong></label></td>
									<td><input type="text" name="recv_id" value="${vo.id}" readonly/></td>
								</tr>
								</table>
							</div>
							<div>
								<hr>
							</div>
							<textarea name="content" placeholder="Enter your message" rows="6" style="margin-bottom: 20px"></textarea>
							<div class="col-12">
								<ul class="actions">
									<li><input type="submit" value="Send Message"
										class="primary" /></li>
									<li><input type="reset" value="Reset" /></li>
								</ul>
							</div>
						</form>
					</div>
				</section>
			</div>
		</div>

		<%@ include file="../inc/messagefooter.jsp"%>
</body>
</html>