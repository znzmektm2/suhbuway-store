<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내정보 확인하기</title>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-1.12.4.min.js"></script>
<script>
	$(function() {
		$("#ErrPwd").hide();
		$("#userPassword").keyup(function(){
			$("#ErrPwd").hide();
		})
		// # 전송
		$("#btn-submit").click(function() {
			// 유효성 체크
			if($("#userPassword").val() == ""){
		            alert("비밀번호를 입력해주세요");
		            $("#userPassword").focus();
		            return;
		    }
			// 비밀번호 체크
			var userId = $("#userId").val();
			var userPassword = $("#userPassword").val();
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/PasswordCheckAjax",		
				dataType: "text",
				data:"${_csrf.parameterName}=${_csrf.token}&userId="+userId+"&userPassword="+userPassword,	 
				success:function(data){
					//alert("ajax: "+data);
					if(data=="ok") {
						location.href="${pageContext.request.contextPath}/myPage/info/infoView?userId="+userId;
					} else {
						$("#ErrPwd").show();
					}
				} ,
				error: function( error ) {
					//alert("에러");
					$("#ErrPwd").show();
				}
			});//ajax
		});// 클릭
	});
</script>
</head>
<body>
	<sec:authorize access="isAnonymous()">
		<div class="info">
			<div class="title">
				<p>로그인하고 접근해주세요</p>
			</div>
		</div>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
		<sec:authorize access="hasRole('ROLE_USER')">
			<div class="info">
				<div class="title">
					<c:if test="${param.msg!=null}">
						<p style="color: red">회원정보가 수정되었습니다.</p>
						<br>
					</c:if>
					<p>개인정보를 안전하게 보호하기 위하여<br>비밀번호를 한번 더 입력해주세요.</p>
				</div>
				<div class="form">
					<table class="tbl">
						<colgroup>
							<col width="20%">
							<col width="auto">
						</colgroup>
						<tbody>
							<tr>
								<th>아이디</th>
								<td><input type="hidden" name="userId" id="userId" value="<sec:authentication property="principal.userId" />" />
								<sec:authentication property="principal.userId" /></td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td><input type="text" type="password" class="wf" name="userPassword" id="userPassword" placeholder="비밀번호를 입력하세요.">
								<span id="ErrPwd" style="color: red">비밀번호를 다시 입력해주세요.</span>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="btn-cover">
					<a href="#" class="btn slim" id="btn-submit">확인</a>
				</div>
			</div>
		</sec:authorize>
	</sec:authorize>
</body>
</html>


