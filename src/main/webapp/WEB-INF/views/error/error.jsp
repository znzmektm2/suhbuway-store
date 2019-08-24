<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title> 
<link href="${pageContext.request.contextPath}/resources/images/suhbuway_favicon.ico" rel="shortcut icon" type="image/x-icon"/>
<link rel="StyleSheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.bxslider.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/TweenMax.min.js"></script>
<title>서부웨이</title>
</head>
<body>
	<%@ include file="../layout/mainHeader.jsp"%>
	<div id="content">
		<div class="innerWrap errorWrap">
			<h2 class="whoops">WHOOPS!</h2>
			<h2>죄송합니다. 문제가 발생하였습니다.</h2>
			<p class="txt">요청하신 페이지의 주소가 잘못 입력 되었거나,<br>변경 혹은 삭제가 되어 찾을 수 없습니다.<br>입력하신 주소가 정확한지 다시 한번 확인해 주시기 바랍니다.</p>
			<div class="errorBtn">
				<a href="${pageContext.request.contextPath}"><span>메인으로 돌아가기</span></a>
				<a href="javascript:history.back()"><span>뒤로가기</span></a>
			</div>
			<p class="copy">SUBWAY® is a Registered Trademark of Subway IP Inc.© 2018 Subway IP Inc.All Rights Reserved.</p>
		</div>
	</div>
	<%@ include file="../layout/mainFooter.jsp"%>
</body>
</html>
