<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link href="../css/message/message.css" rel="stylesheet">

<c:forEach var="tmp" items="${list }" >
	<c:choose>
		<c:when test="${sessionScope.nickname ne tmp.send_nick }">
			<!-- 받은 메세지 -->
			<c:if test="${tmp.send_nick ne sessionScope.nickname }">
			<div class="incoming_msg">
				<div class="incoming_msg_img" style="margin: 6px; display: block">
					<a href="other_profile.do?other_nick=${tmp.send_nick }">
					<%-- <img src="./upload/profile/${tmp.profile }" class='img_circle'> --%>
					</a>
				</div>
				<div class="received_msg" style="display: flex">
				<c:if test="${tmp.image eq null}">
					<div class="received_withd_msg" style="max-width: fit-content;">
						<p id="received_content" style="max-width: 200px">${tmp.content }</p>
					</div>
				</c:if>
				<c:if test="${tmp.image ne null}">
					<img src="${tmp.image }" style="width:50px; height:50px">
				</c:if>
					<div class="received_withd_msg" style="max-width: fit-content;">
						<span class="time_date" style="padding: 8px"> <fmt:formatDate value="${tmp.send_time }" pattern="yyyy-MM-dd HH:mm"/></span>
					</div>
				</div>
			</div>
			</c:if>
		</c:when>
		<c:otherwise>
			<!-- 보낸 메세지 -->
			<c:if test="${tmp.send_nick eq sessionScope.nickname }">
				<div class="outgoing_msg">
					<div class="sent_msg" style="width: auto">
						<c:if test="${tmp.image eq null}">
							<p id="sent_content" style="max-width: 200px">${tmp.content }</p>
						</c:if>
						<c:if test="${tmp.image ne null}">
							<img src="${tmp.image }" style="width:145px; height:145px">
						</c:if>
					</div>
					<div class="sent_msg" style="width: auto">
						<span class="time_date" style="padding: 8px;"> <fmt:formatDate value="${tmp.send_time }" pattern="yyyy-MM-dd HH:mm"/></span>
					</div>
				</div>
			</c:if>
		</c:otherwise>
	</c:choose>


</c:forEach>