<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:forEach var="tmp" items="${list }">
	<div class="chat_list_box${tmp.room } chat_list_box">
		<div type="button" class="chat_list" room="${tmp.room }" other_nick="${tmp.other_nick }">
			<!-- active-chat -->
			<div class="chat_people">
				<div class="chat_img">
					<a href="#"> <img src="${tmp.profile}" alt="sunil" style="width: 45px; height: 45px;">
					</a>
				</div>
				<div class="chat_ib">
					<h5>${tmp.other_nick }<span class="chat_date"><fmt:formatDate value="${tmp.send_time }" pattern="yyyy-MM-dd HH:mm" /></span>
					</h5>
					<div class="row">
						<div class="col-10" style="text-align: left">
							<p>${tmp.content }</p>
						</div>
						<%-- 만약 현재사용자가 안읽은 메세지 갯수가 0보다 클때만 badge를 표시한다. --%>
						<c:if test="${tmp.unread > 0 }">
							<div class="col-2 unread${tmp.room }">
								<span class="badge bg-danger">${tmp.unread }</span>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:forEach>
