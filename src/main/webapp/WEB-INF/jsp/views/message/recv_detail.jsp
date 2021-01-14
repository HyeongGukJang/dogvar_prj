<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/messageheader.jsp"%>

                <section>
					<header class="main">
						<h4>
							<strong>쪽지 상세확인</strong>
						</h4>
					</header>
					
						<div>		
							<table class="alt2" >
								<tr>
									<th>no</th>
									<td>${recv_message.seq }</td>
								
									<th style="width: 200px;">보낸사람</th>
									<td style="width: 700px">${recv_message.send_id }</td>
								</tr>
								<tr>
									<th style="width: 200px">받은날짜</th>
									<td style="width: 400px">${recv_message.send_date}</td>
								</tr>
			
								<tr>
									<td colspan="4" >${recv_message.content }</td>
								</tr>
							</table>
						</div>
				</section>
				
                <div id="btn">
                    <ul class="actions">
                        <li><a href="recv?recv_id=<%=(String) session.getAttribute("loginID")%>" class="button primary">BACK</a></li>
                        <li><a href="recv_delete?seq=${recv_message.seq }" class="button primary">DEL</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <%@ include file="../inc/messagefooter.jsp"%>
</body>
</html>