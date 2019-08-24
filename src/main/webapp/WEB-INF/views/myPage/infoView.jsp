<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내정보 수정</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.12.4.min.js"></script>
<script>

	$(function(){
		
		// # 연락처 길이 검사
		var phoneState = false;
		$("#userPhone").keyup(function(){
			var userPhone=$(this).val().trim();
			if( userPhone.length>10 ){ // 10글자 이상이면
				alert("연락처는 10글자 이하로 입력해주세요.");
				$("#userPhone").val("");
				return;
			} 
		});//keyup
		
		// # 비빌번호 일치 검사
		$("#checkedPassword").keyup(function(){
			var str = "";
			if( $(this).val()==$("#userPassword").val() ){
				$("#pwdCheck").css("color", "blue")
				str += "비밀번호가 일치합니다.";			
			}else{
				$("#pwdCheck").css("color", "red")
				str += "비밀번호가 일치하지않습니다.";
			}
			$("#pwdCheck").text(str);
		})	
				
		// # 이메일 선택박스 클릭
 		$("#emailDomain").change(function(){
 			console.log( "선택된 이메일 : " + $(this).val() );	
 			var domain = $(this).val();
 			$("#email2").val( domain );
		})
		
		// # 수정하기 버튼 클릭
 		$("#userConfirm").click(function(){
 			//checkValid();
 			if( checkValid()==true ) {
				// 이메일 조합
				var email1 = $("#email1").val(); 
				var email2 = $("#email2").val();
				var userEmail = email1+"@"+email2;
				$("#userEmail").val( userEmail );
				console.log("전송될 userEmail: "+ userEmail );
		
				$("#updateForm").submit();//전송
			} 
		})//click
		
		// # 회원탈퇴   
/* 		$("#userDelete").click(function(){
			// 정말 회원 탈퇴할지 물어보기
			var delConfirm = confirm('정말 탈퇴 하시겠습니까? 탈퇴하시면 마일리지를 복구하실 수 없습니다.');
	   		if (delConfirm) {
	   			// ajax 사용으로 결과 
	   			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/user/userDeleteAjax",		
				dataType: "text",
				data:"${_csrf.parameterName}=${_csrf.token}&userId="+userId,	
				success:function(data){		
						if(data=="ok"){
							alert('회원 탈퇴되었습니다. 이용해주셔서 감사합니다.');
							// 메인으로 이동 or 탈퇴확인 페이지로 이동
							location.href="${pageContext.request.contextPath}/";//메인
						}else{						
							alert('탈퇴 탈퇴에 실패했습니다.');
						}					
					} ,
					error: function( error ) {
						console.log( "아이디체크 검색오류" );
					} 
				});//ajax
	   		} else {
	      		alert('탈퇴가 취소되었습니다.');
	   		}
		})//click */
	});
	// 유효성 체크
	function checkValid() {
   		var f = window.document.updateForm;
   		var kakaoId="${sessionScope.userId}";
   		//console.log("kakaoId"+kakaoId);
   		if(kakaoId=="") {// 쇼셜이면
			if ( f.userPassword.value == "" ) {
				alert( "비밀번호를 입력해 주세요." );
				f.userPassword.focus();
				return false;
			}
			if ( f.checkedPassword.value == "" ) {
				alert( "비밀번호 확인을 입력해 주세요." );
				f.checkedPassword.focus();
				return false;
			}
   		}
		if ( f.userPhone.value == "" ) {
        	alert( "핸드폰번호를 입력해 주세요." );
        	f.userPhone.focus();
        	return false;
    	}
		if ( f.email1.value == "" ) {
        	alert( "이메일을 입력해 주세요" );
        	f.email1.focus();
        	return false;
    	}
		if ( f.email2.value == "" ) {
        	alert( "이메일을 입력해 주세요" );
        	f.email2.focus();
        	return false;
    	}
    	return true;
	}
	
</script>
</head>
<body>	
	<div class="infoView">
		<div class="content">
			<form id="updateForm" method="post" name="updateForm" action="${pageContext.request.contextPath}/user/userUpdate">
				<!-- security csrf 토큰 전송 -->
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
				<div class="info">
					<div class="title">
						<c:if test="${param.msg!=null}">
							<p style="color: red">회원정보가 수정되었습니다.</p>
						</c:if>	
					</div>
				</div>	
				<h3 class="h_title">정보입력</h3>
				<p class="rt_note">필수입력사항<span class="ess"></span></p>
				<!-- board list s -->
				<div class="board_write_wrapper">
					<table>
						<caption>회원가입 테이블</caption>
						<colgroup>
							<col width="130px">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th scope="col">아이디</th>
								<td>
								<input type="hidden" name="userId" id="userId" value="${requestScope.user.userId}" >
								${requestScope.user.userId}</td> 
							</tr>
							
							<c:if test="${sessionScope.userId==null}">
							<tr>
								<th scope="col">새 비밀번호<span class="ess"></span></th>
								<td>
									<span class="form_text" style="width:100%">
										<input maxlength="16" name="userPassword" id="userPassword" placeholder="비밀번호를 입력해주세요" type="password">
									</span>
								</td>
							</tr>
							<tr>
								<th scope="col">새 비밀번호 확인<span class="ess"></span></th>
								<td>
									<span class="form_text" style="width:100%">
										<input maxlength="16" name="checkedPassword" id="checkedPassword" placeholder="비밀번호를 확인해주세요" type="password">
									</span>
									<span style="font-size:13px;" id="pwdCheck"></span>
								</td>
							</tr>
							</c:if>
							<tr>
								<th scope="col">이름</th>
								<td>${requestScope.user.userName}</td>
							</tr>
							<tr>
								<th scope="col">연락처<span class="ess"></span></th>
								<td>
									<span class="form_text color" style="width:100%">
										<input maxlength="15" name="userPhone" id="userPhone" type="text" value="${requestScope.user.userPhone}">
									</span>
								</td>
							</tr>
							<tr>
								<th scope="col">이메일<span class="ess"></span></th>
								<td>
									<span class="form_text color" style="width:200px">
										<input maxlength="50" name="email1" id="email1" type="text" value="${requestScope.email1}">
									</span>
									<span class="em">@</span>
									<span class="form_text color" style="width:200px">
										<input maxlength="50" name="email2" id="email2" type="text" value="${requestScope.email2}">
									</span>
									<div class="form_select" style="width:196px; margin-left:7px;">
										<select id="emailDomain" name="emailDomain">
											<option value="">직접입력</option>
											<option value="naver.com">naver.com</option>
											<option value="hanmail.net">hanmail.net</option>
											<option value="hotmail.com">hotmail.com</option>
											<option value="nate.com">nate.com</option>
											<option value="empas.com">empas.com</option>
											<option value="dreamwiz.com">dreamwiz.com</option>
											<option value="lycos.co.kr">lycos.co.kr</option>
											<option value="korea.com">korea.com</option>
											<option value="gmail.com">gmail.com</option>
											<option value="hanmir.com">hanmir.com</option>
										</select>
									</div>
									<!-- dto의 userEmail 맞춰주기위해서  -->
											<input type="hidden" name="userEmail" id="userEmail" value="" >
								</td>
							</tr>
							<tr>
								<th scope="col">프로필</th>
								<td>
									<div class="profileImg">
										<span>
											<img alt="" src="${pageContext.request.contextPath}/resources/images/common/default.png">
										</span>
									</div>
									<label class="form_file" style="width:466px;">
										<input data-maxsize="2" data-maxupload="1" id="file" name="file" onchange="formFile(this); return false;" type="file" id="fileName">
										<input readonly="readonly" type="text">
									</label>
	
									<span class="file_note">※ 등록 가능 확장자 : jpg, gif, png / 최대 2MB</span>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="btns_wrapper">
					<a class="btn bgc_point i_reg" style="width:170px" id="userConfirm"><span>확인</span></a>
					<a class="btn bgc_point i_reg od" style="width:170px" id="userDelete"><span>탈퇴하기</span></a>
				</div>
			</form>
		</div>
	</div>
</body>
</html>


