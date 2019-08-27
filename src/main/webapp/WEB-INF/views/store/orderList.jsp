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

.tab-1{display:inline-block; width:40px;}
.tab-2{display:inline-block; width:100px;}
</style>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>

</head>
<body>
	<div class="orders">
		<div class="content">
			<h3 class="h_title">${store.storeName }</h3>
			<div class="tableWrap">
				<div class="board_list_wrapper step1" style="height: 740px; overflow: auto">
					<table>
						<thead>
							<tr>
								<th scope="col">주문번호</th>
								<th scope="col">고객아이디</th>
								<th scope="col">결제금액</th>
								<th scope="col">주문일자</th>
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

				<div class="board_list_wrapper step1" style="height: 740px;" id="DetailMenu">
					<table>
						<tbody>
							<tr>
								<th scope="col">주문번호</th>
								<td class="itemDisplay showOrderId" colspan="3"></td>
							</tr>
							<tr>
								<th scope="col">고객 아이디</th>
								<td class="itemDisplay showUserId" colspan="3"></td>
							</tr>
							<tr style="height: 460px; overflow: auto">
								<th scope="col">주문메뉴</th>
								<td class="itemDisplay showOrderContent" colspan="3" style="vertical-align:top;text-align:left;"></td>
							</tr>
							<tr>
								<th scope="col">가격</th>
								<td class="itemDisplay showPrice" colspan="3"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

</body>
<script>
var list;
$(function() {
	orderList();
	playAlert = setInterval(function() {
		$.ajax({
			url : '${pageContext.request.contextPath}/getOrderListNumber',
			type : 'POST',
			dataType : 'text',
			data : '${_csrf.parameterName}=${_csrf.token}&storeId=${store.storeId}',
			success : function(data) {
					//console.log(data);
					//var past = sessionStorage.getItem('listSize');
					if(data > sessionStorage.getItem('listSize')){
						///---- 여기 주문이 들어왔을때 할 작업 : 메세지 출력같은거 해주면 되요. ----////
						
						orderList();
					} else {
						console.log('같아 같다고.') // 이거 삭제하세요
					}
			},
			error : function(error) {
				console.log('따란...')
			}
		});
	}, 3000);
	

});

// 리스트 클릭시 주문 내용 출력
function orderClick() {
	$('.showList').on('click',function() {
		$('.itemDisplay').empty();
		var item = list.find(item => item.orderId == $(this).text())
		console.log(item);
		$('.showOrderId').text(item.orderId);
		$('.showUserId').text(item.userId);
		$('.showPrice').text(item.total);
		
		var order = ""
		$.each(item.items, function(index, item){
			order += index + ' : ' + item.mainMenu.category + ' ' + item.mainMenu.name + ' '
			if(item.mainMenu.length != undefined)
				order += item.mainMenu.length
			order += '<br><span class="tab-1"></span>뺄 야채 : ' + item.veggies + '<br>';
			order += '<span class="tab-1"></span>소 스  : ' + item.source + '<br>'; 
			order += '<span class="tab-1"></span>추가사항 : <br>' ;
			$.each(item.subMenu, function(index, item) {
				order += '<span class="tab-2"></span>' + item.name + '<br>';
			})
			order += '<br>'
		})
		
		$('.showOrderContent').html(order);
	})
}

// orderList전체를 받아오는 함수
function orderList() {
	$.ajax({
		url : '${pageContext.request.contextPath}/getOrderList',
		type : 'POST',
		dataType : 'json',
		data : '${_csrf.parameterName}=${_csrf.token}&storeId=${store.storeId}',
		success : function(data) {
			list = data;
			$('.orderlist').empty()
			console.log(list.length)
			sessionStorage.setItem('listSize', list.length);
			$.each(data, function(index, item) {
				var tr = '<tr><td class="showList">' + item.orderId + '</td><td>'
					+ item.userId + '</td><td>' + item.total
					+ "</td><td>" + item.regdate
					+ '</td></tr>'
				$('.orderlist').append(tr);
			})
			orderClick();
		},
		error : function(error) {
			console.log('따란...')
		}
	});
}
</script>
</html>