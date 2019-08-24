<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<!-- kakao 로그인 -->
<c:choose>
	<c:when test="${sessionScope.userId==null && requestScope.userId==null}">
		<div class="info">
			<div class="title">
				<p>로그인하고 접근해주세요</p>
			</div>
		</div>
	</c:when>
	<c:when test="${sessionScope.userId!=null}">
		<div class="point">
				<div class="content">
					<h3 class="h_title">포인트</h3>

					<div class="board_write_wrapper">
						<table>
							<caption>회원정보</caption>
							<colgroup>
								<col width="130px">
								<col width="*">
							</colgroup>
							<tbody>
								<tr>
									<th scope="col">아이디</th>
									<td><input type="hidden" name="userId" id="userId"
										value="${requestScope.user.userId}">
										${requestScope.user.userId}</td>
								</tr>
								<tr>
									<th scope="col">포인트</th>
									<td><input type="hidden" name="mileage" id="mileage"
										value="${requestScope.user.mileage}">
										${requestScope.user.mileage}</td>
								</tr>
								<tr>
									<th scope="col">등급</th>
									<td><input type="hidden" name="rating" id="rating"
										value="${requestScope.user.rating}">
										${requestScope.user.rating}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
	</c:when>
	<c:when test="${requestScope.userId!=null}">
		<div class="point">
				<div class="content">
					<h3 class="h_title">포인트</h3>

					<div class="board_write_wrapper">
						<table>
							<caption>회원정보</caption>
							<colgroup>
								<col width="130px">
								<col width="*">
							</colgroup>
							<tbody>
								<tr>
									<th scope="col">아이디</th>
									<td><input type="hidden" name="userId" id="userId"
										value="${requestScope.userId}">
										${requestScope.userId}</td>
								</tr>
								<tr>
									<th scope="col">포인트</th>
									<td><input type="hidden" name="mileage" id="mileage"
										value="${requestScope.mileage}">
										${requestScope.mileage}</td>
								</tr>
								<tr>
									<th scope="col">등급</th>
									<td><input type="hidden" name="rating" id="rating"
										value="${requestScope.rating}">
										${requestScope.rating}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
	</c:when>
	<c:otherwise>
		그 외에 루트?
	</c:otherwise>
</c:choose>
</body>
</html>


