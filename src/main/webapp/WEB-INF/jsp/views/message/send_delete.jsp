<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/messageheader.jsp"%>

				<section>
					<header class="main">
						<h4>
							<strong>Are you sure?</strong>
						</h4>
						<h3>
							<strong>${send_message.seq } 번 메시지를 삭제하시겠습니까?</strong>
						</h3>
					</header>
					<div id="btn">
						<ul class="actions">
						<li><a href="list?send_id=<%=(String) session.getAttribute("loginID")%>" class="button primary">NO</a></li>
						<li><form action="send_delete" method="post">
							<input type="hidden" name="seq" value="${send_message.seq }" />
							<input type="hidden" name="name" value="<%=(String) session.getAttribute("loginID")%>" />
							<input type="submit" value="YES" />
						</form></li>
						</ul>
					</div>
				</section>
			</div>
		</div> 

		<%@ include file="../inc/messagefooter.jsp"%>
</body>
</html>