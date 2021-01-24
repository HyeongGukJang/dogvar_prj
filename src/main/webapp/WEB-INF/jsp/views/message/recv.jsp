<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/messageheader.jsp"%>
				<!-- Content -->
				<section>
					<header class="main">
						<h4>
							<strong>친구에게 받은 쪽지를 확인하세요</strong>
						</h4>
					</header>
					<div class="col-4 col-12-small">
						<table class="alt2">
							<thead>
								<tr>
									<th class>no</th>
									<th class>보낸사람</th>
									<th class>내용</th>
									<th class>날짜</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="row" items="${recv }">
									<tr>
										<td style="width: 100px">${row.seq }</td>
										<td style="width: 150px">${row.send_id}</td>
										<td style="width: 500px"><a href="recv_detail?seq=${row.seq }">${row.content }</a></td>
										<td style="width: 200px">${row.send_date }</td>
									</tr>
								</c:forEach>
							</tbody>
							
						</table>
						<div id="bottom">
							<ul class="pagination" id="paging">
									<li><a href="recv${pageMaker.makeQuery(pageMaker.startPage)}&recv_id=<%=(String) session.getAttribute("loginID")%>" class="button">Prev</a></li>
					
								<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
									<li><a href="recv${pageMaker.makeQuery(idx)}&recv_id=<%=(String) session.getAttribute("loginID")%>"class="page active">${idx}</a></li>
								</c:forEach>
									<li><a href="recv${pageMaker.makeQuery(pageMaker.endPage)}&recv_id=<%=(String) session.getAttribute("loginID")%>" class="button">Next</a></li>
							</ul>
						</div>
						
						</div>
						
				</section>
			</div>
		</div>

		<%@ include file="../inc/messagefooter.jsp"%>
</body>
</html>