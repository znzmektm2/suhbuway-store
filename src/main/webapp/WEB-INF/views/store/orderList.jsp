<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문List</title>
<style>
.orders .content {
	padding: 100px 0;
}

.tableWrap {
	overflow: hidden;
	margin: -20px;
}

.tableWrap .board_list_wrapper {
	position: relative;
	float: left;
	width: 50%;
	padding: 10px;
	box-sizing: border-box;
}

#DetailMenu {
	border-left: 1px solid #ddd;
}

#DetailMenu th {
	height: 20px;
}

#DetailMenu th {
	width: 20%;
}
</style>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>

</head>
<body>
	<div class="orders">
		<div class="content">
			<h3 class="h_title">${store.storeName }</h3>
			<div class="tableWrap">
				<div class="board_list_wrapper step1">
					<table>
						<thead>
							<tr>
								<th scope="col">주문번호</th>
								<th scope="col">고객명</th>
								<th scope="col">결제금액</th>
								<th scope="col">주문상태</th>
							</tr>
						</thead>
						<tbody class="orderlist">
							<c:choose>
								<c:when test="${list==null}">
									<td colspan="9">주문내역이 존재하지 않습니다.</td>
								</c:when>
								<c:otherwise>

								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>


				<div class="board_list_wrapper step1" id="DetailMenu">
					<table>
						<tbody>
							<tr>
								<th scope="col">주문번호</th>
								<td colspan="3"></td>
							</tr>
							<tr>
								<th scope="col">주문ID</th>
								<td colspan="3"></td>
							</tr>
							<tr>
								<th scope="col">주문메뉴</th>
								<td colspan="3"></td>
							</tr>
							<!-- ========== -->
							<tr>
								<th scope="col">빵길이</th>
								<td colspan="3"></td>
							</tr>
							<tr>
								<th scope="col">빵종류</th>
								<td colspan="3"></td>
							</tr>
							<tr>
								<th scope="col">야채</th>
								<td colspan="3"></td>
							</tr>
							<tr>
								<th scope="col">소스</th>
								<td colspan="3"></td>
							</tr>
							<tr>
								<th scope="col">가격</th>
								<td colspan="3">￦ 7,000</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

</body>
<script>
	$(function() {
		$.ajax({
			url : '${pageContext.request.contextPath}/getOrderList',
			type : 'POST',
			dataType : 'json',
			data : '${_csrf.parameterName}=${_csrf.token}&storeId=${store.storeId}',
			success : function(data) {
				console.log(data)
				$.each(data, function(index, item) {
					var tr = '<tr data-val="'+item.orderId+'"><td>'
						+ item.orderId + '</span></td><td>'
						+ item.userId + '</td><td>' + item.total
						+ "</td><td>" + item.orderState
						+ '</td></tr>'
					$('.orderlist').empty().append(tr);
				})
			},
			error : function(error) {
				console.log('따란...')
			}
		});
	});
</script>
</html>