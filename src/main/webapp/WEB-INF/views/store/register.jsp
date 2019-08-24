<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>user register</title>

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function(){ 
		
		// # 아이디 길이 검사
		var idState = false;
		$("#storeId").keyup(function(){
			var storeId=$(this).val().trim();
			if( storeId.length<4 || storeId.length>10 ){ // 4글자 미만이거나 10글자 이상이면
				$("#idcheckspan").html("4글자 이상 10글자 이하로 입력해주세요.").css("color","red");
				return;
			} else {
				$("#idcheckspan").html("");
				idState = true;
			}//else
		});//keyup
		
		// # 연락처 길이 검사
		var phoneState = false;
		$("#storePhone").keyup(function(){
			var storePhone=$(this).val().trim();
			if( storePhone.length>11 ){ // 11글자 이상이면
				alert("연락처는 11글자 이하로 입력해주세요.");
				$("#storePhone").val("");
				return;
			} 
		});//keyup
		
		// # 아이디 일치 검사
		$("#idCheck").click(function(){
			if( idState== false ) {
				alert("아이디 길이가 맞지 않습니다.");
				return;
			}
			var storeId = $("#storeId").val().trim();
						
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/idcheckAjax",		
				dataType: "text",
				data:"${_csrf.parameterName}=${_csrf.token}&storeId="+storeId,	
				success:function(data){		
					if(data=="fail"){
					$("#idcheckspan").html("  "+ storeId +"는 사용 불가능합니다.").css("color","red");
					}else{						
						$("#idcheckspan").html("  "+ storeId +"는 사용 가능합니다.").css("color","blue");		
					}					
				} ,
				error: function( error ) {
					console.log( "아이디체크 검색오류" );
				} 
			});//ajax
		})//click
		
		// # 비빌번호 일치 검사
		$("#checkedPassword").keyup(function(){
			var str = "";
			if( $(this).val()==$("#storePassword").val() ){
				$("#pwdCheck").css("color", "blue")
				str += "비밀번호가 일치합니다.";			
			}else{
				$("#pwdCheck").css("color", "red")
				str += "비밀번호가 일치하지않습니다.";
			}
			$("#pwdCheck").text(str);
		})	
				
		// # 등록하기(회원가입)
 		$("a.btn.bgc_point.i_reg").click(function(){
 			//checkValid();
 			if( checkValid()==true ) {
				$("#registerForm").submit();//전송
			} 
		})//click
		
		// # 취소
		$("a.btn.bgc_white").click(function(){
			$("#idcheckspan").html("");
			$("#pwdCheck").text("");
			$( "#registerForm" ).each( function () {
	            this.reset();
	        });
		})//click
	})
	// 유효성 체크
	function checkValid() {
   		var f = window.document.registerForm;
   		console.log(f.storeId.value)
		if ( f.storeId.value == "") {
 		    alert( "아이디를 입력해 주세요." );
			f.storeId.focus();
			return false;
  	 		}
		if ( f.storePassword.value == "" ) {
			alert( "비밀번호를 입력해 주세요." );
			f.storePassword.focus();
			return false;
		}
		if ( f.checkedPassword.value == "" ) {
			alert( "비밀번호 확인을 입력해 주세요." );
			f.checkedPassword.focus();
			return false;
		}
		if ( f.storeName.value == "" ) {
			alert( "매장이름을 입력해 주세요." );
			f.storeName.focus();
			return false;
		}
		if ( f.storeAddress.value == "" ) {
        	alert( "매장주소를 입력해 주세요." );
        	f.storeAddress.focus();
        	return false;
    	}
		if ( f.storePhone.value == "" ) {
        	alert( "매장번호를 입력해 주세요" );
        	f.storePhone.focus();
        	return false;
    	}
		if ( f.storeOwner.value == "" ) {
        	alert( "점주를 입력해 주세요" );
        	f.storeOwner.focus();
        	return false;
    	}
    	return true;
	}
</script>
</head>
<body>
<div class="contentWrap">
	<div class="bg_type01" id="container">
		<!-- sub content s -->
		<div id="content">
			<div class="inquiry_wrapper">
				<h2 class="subTitle">매장 회원가입</h2>
				<div class="content">
				
					<!-- enctype="multipart/form-data"   -->
					<form id="registerForm" method="post" name="registerForm"  
							 action="${pageContext.request.contextPath}/storeRegister?${_csrf.parameterName}=${_csrf.token}">
						<!-- 스프링 security 4에선 POST 전송시무조건 csrt 를 보내야 한다. (GET은 안보내도 됨)-->
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
						
						<h3 class="h_title">정보입력</h3>
	
						<!-- board list s -->
						<div class="board_write_wrapper">
							<p class="rt_note">필수입력사항<span class="ess"></span></p>
							<table>
								<caption>매장 회원가입 테이블</caption>
								<colgroup>
									<col width="130px">
									<col width="*">
								</colgroup>
								<tbody>
									<tr>
										<th scope="col">아이디<span class="ess"></span></th>
										<td>
											<span class="form_text" style="width:100%">
												<input maxlength="20" name="storeId" id="storeId" placeholder="아이디를 입력해주세요" type="text" >
											</span>
											<input type="button" name="idCheck" id="idCheck" value="중복확인"><span id="idcheckspan"></span>
										</td>
									</tr>
									<tr>
										<th scope="col">비밀번호<span class="ess"></span></th>
										<td>
											<span class="form_text" style="width:100%">
												<input maxlength="16" name="storePassword" id="storePassword" placeholder="비밀번호를 입력해주세요" type="password"  >
											</span>
										</td>
									</tr>
									<tr>
										<th scope="col">비밀번호 확인<span class="ess"></span></th>
										<td>
											<span class="form_text" style="width:100%">
												<input maxlength="16" name="checkedPassword" id="checkedPassword" placeholder="비밀번호를 확인해주세요"  type="password" >
											</span>
											<span style="font-size:13px;" id="pwdCheck"></span>
										</td>
									</tr>
									<tr>
										<th scope="col">매장이름<span class="ess"></span></th>
										<td>
											<span class="form_text" style="width:100%">
												<input maxlength="10" name="storeName" id="storeName" placeholder="매장이름을 입력해주세요" type="text" >
											</span>
										</td>
									</tr>
									<tr>
										<th scope="col">매장주소<span class="ess"></span></th>
										<td>
											<span class="form_text" style="width:100%">
												<input maxlength="10" name="storeAddress" id="storeAddress" placeholder="매장주소를 입력해주세요" type="text" >
											</span>
										</td>
									</tr>
									<tr>
										<th scope="col">매장번호<span class="ess"></span></th>
										<td>
											<span class="form_text" style="width:100%">
												<input maxlength="15" name="storePhone" id="storePhone" placeholder="매장번호를 입력해주세요" type="text" >
											</span>
										</td>
									</tr>
									<tr>
										<th scope="col">점주<span class="ess"></span></th>
										<td>
											<span class="form_text" style="width:100%">
												<input maxlength="15" name="storeOwner" id="storeOwner" placeholder="점주를 입력해주세요" type="text" >
											</span>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="btns_wrapper">
							<a class="btn bgc_white" href="#"  style="width:126px;"><span>취소</span></a>
							<a class="btn bgc_point i_reg" href="#" style="width:170px;"><span>등록하기</span></a>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!--// sub content e -->
	</div>
</div>
</body>
</html>


