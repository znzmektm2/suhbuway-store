<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>	
	<div class="orders">
		<div class="content">
			<h3 class="h_title">주문내역</h3>
			<div class="board_list_wrapper step1">
				<table>
					<thead>
						<tr>
							<th scope="col">주문일시</th>
							<th scope="col">매장명</th>
							<th scope="col">주문메뉴</th>
							<th scope="col">결제금액</th>
							<th scope="col">주문상태</th>
						</tr>
					</thead>
					<tbody>
						<!-- <tr>
							<td colspan="9">주문내역이 존재하지 않습니다.</td>
						</tr> -->
						<tr>
							<td>2019.08.19</td>
							<td>판교</td>
							<td>
								<span class="menuImg">
									<img alt="쉬림프" src="${pageContext.request.contextPath}/resources/images/menu/sandwich/sandwich_pm10.jpg">
								</span>
								<a href="#;" class="menuTit">에그마요 15cm 외</a>
							</td>
							<td>￦  7,000</td>
							<td><span class="state">주문접수</span></td>
						</tr>
						<tr>
							<td>2019.08.19</td>
							<td>판교</td>
							<td>
								<span class="menuImg">
									<img alt="쉬림프" src="${pageContext.request.contextPath}/resources/images/menu/salad/salad_cl01.jpg">
								</span>
								<a href="#;" class="menuTit">쉬림프 외</a>
							</td>
							<td>￦  7,000</td>
							<td><span class="state on">준비완료</span></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>


