<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<div class="contentWrap">
	<div class="bg_type01" id="container">
		<!-- sub content s -->
		<div id="content">
			<div class="inquiry_wrapper">
				<h2 class="subTitle">Suhbuway 매장 전용 Site 입니다.</h2>
		</div>
		
		<sec:authorize access="isAnonymous()" >
			<h2 class="subTitle" style="color: red">
				매장회원만 로그인 후 이용 가능합니다.
			</h2>
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
			<sec:authorize access="hasRole('ROLE_STORE')">
				<h2 class="subTitle" style="color: red">
					인증이 완료되었습니다.					
				</h2>
			</sec:authorize>
		</sec:authorize>
	</div>
</div>
</body>
</html>


