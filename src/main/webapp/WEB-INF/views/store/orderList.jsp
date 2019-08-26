<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문List</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function(){ 
	
	});
</script>
</head>
<body>
<h1>주문리스트</h1>
<div class="contentWrap">
	<div class="bg_type01" id="container">
		<!-- sub content s -->
		<div id="content">
			<div class="inquiry_wrapper">
				<h2 class="subTitle">매장 주문리스트</h2>
				<div class="content">
					<h3 class="h_title">정보입력</h3>
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
									<th>주문번호</th>
									<th>총 가격</th>
									<th>주문 상황</th>
								</tr>
							
							
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
				</div>
			<!--  -->
			</div>
		</div>
		<!--// sub content e -->
	</div>
</div>
</body>
</html>