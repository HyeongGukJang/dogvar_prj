<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/messageheader.jsp"%>

				<!-- Content -->
				<section>
					<div class="row">
						<div class="col-2 col-12-small">
							<strong>쪽지쓰기</strong>
							<hr>
							<table class="alt">
								<thead>
									<tr>
										<th>친구목록</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="row" items="${list }">
											<tr>
												<td><a href="write?id=${row.id}"><c:out value="${row.id}" /></a></td>
											</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

						<div class="table-wrapper">
							<strong>보낸편지함</strong>
							<hr>
							<table class="alt2">
								<thead>
									<tr>
										<th>no</th>
										<th>받는사람</th>
										<th>내용</th>
										<th>보낸날짜</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="mrow" items="${Mlist }">
											<tr>
												<td style="width: 150px">${mrow.seq}</td>
												<td style="width: 200px">${mrow.recv_id}</td>
												<td style="width: 600px"><a href="send_detail?seq=${mrow.seq }">${mrow.content}</a></td>
												<td style="width: 300px">${mrow.send_date}</td>
											</tr>									
									</c:forEach>
								</tbody>
							</table>
							
							<div id="bottom">
								<ul class="pagination" id="paging">
										<li><a href="list${pageMaker.makeQuery(pageMaker.startPage)}&send_id=<%=(String) session.getAttribute("loginID")%>" class="button">Prev</a></li>
									
									<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
										<li><a href="list${pageMaker.makeQuery(idx)}&send_id=<%=(String) session.getAttribute("loginID")%>" class="page active">${idx}</a></li>
									</c:forEach>
									
										<li><a href="list${pageMaker.makeQuery(pageMaker.endPage)}&send_id=<%=(String) session.getAttribute("loginID")%>" class="button">Next</a></li>
								</ul>
							</div><!-- 페이징 -->
						</div><!-- 보낸편지함 -->
					</div><!-- Content -->
				</section>
			</div>
		</div> 

		<%@ include file="../inc/messagefooter.jsp"%>
</body>
</html>