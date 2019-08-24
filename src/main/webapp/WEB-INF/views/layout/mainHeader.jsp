<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<script>
	function logout() {
		document.getElementById("logoutForm").submit();
	}
</script>
<header>
	<div id="header1" class="open">
	    <div class="content">
	        <h1 class="logo"><a href="${pageContext.request.contextPath}/">suhbuway</a></h1>
	        <!-- gnb -->
	        <nav id="gnb">
	            <ul>
	                <li>
	                	<span class="dp1">
	               		<a href="${pageContext.request.contextPath}/store/orderList">주문 확인</a>
	               		</span>
	                </li>
	                <li>
	                	<span class="dp1">
	               		<a href="${pageContext.request.contextPath}/store/salesList">매출액 확인</a>
	               		</span>
	                </li>
	            </ul>
	        </nav>
	        <!--// gnb -->
	
	        <!-- util menu -->
	        <div class="util_menu">
	            <ul>
	            	<!-- 비로그인 -->
	            	<c:if test="${sessionScope.kakaoToken==null}">
	            	<sec:authorize access="isAnonymous()">
						<li><a href="${pageContext.request.contextPath}/store/login">로그인</a></li>
						<li><a href="${pageContext.request.contextPath}/store/register">회원가입</a></li>
					</sec:authorize>
					</c:if>
					<!-- 일반 로그인 -->
					<sec:authorize access="isAuthenticated()">
							<sec:authorize access="hasRole('ROLE_STORE')">
								<li><sec:authentication property="principal.storeId" />님 환영합니다.</li>
							</sec:authorize>
							<sec:authorize access="hasRole('ROLE_ADMIN')">
								<li>admin님 환영합니다.</li>
								<li><a href="${pageContext.request.contextPath}/admin/main">관리자 페이지</a></li>
							</sec:authorize>
							<li><a href="javascript:logout();">로그아웃</a></li>
					</sec:authorize>
	            </ul>
	        </div>
	        <!--// util menu -->
	    </div>
	</div>
	
	<!-- logout위한 form -->
	<form id="logoutForm" 
				action="${pageContext.request.contextPath}/store/logout"
				method="post" style="display: none">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
	
</header>
<script>
$(document).ready(function(){
	gnb();
	menuActive();
	if($('.sub_header').length >0){
		bodyScroll();//body scroll
	}
});

function bodyScroll(){//body scroll
	var header = $('#header1');
	var subHeader = $('.sub_header')
	var subLogo = subHeader.find('.logo')
	var subTop = subHeader.find('.top')
	var spd = 0.5;
	var eft = Power3.easeOut;
	var subHeaderTop = subHeader.offset().top

	subTop.on('click', function(){//top button
		$('html,body').stop(true,false).animate({
			scrollTop:0
		},1000,'easeInOutQuint')
		return false;
	})
}
</script>