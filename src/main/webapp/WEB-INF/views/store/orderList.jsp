<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문List</title>
<style>
.orders .content{padding:100px 0;}
.tableWrap {overflow:hidden;margin:-20px;}
.tableWrap .board_list_wrapper{position:relative;float:left;width:50%;padding:10px;box-sizing:border-box;}
#DetailMenu{border-left:1px solid #ddd; }
#DetailMenu th{height: 20px;}
#DetailMenu th{width: 20%;}
</style>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function(){ 
		// 세부 주문내역 hide show
		
		
		// 전체 주문내역 ajax append
		
		// 세부 주문내역 ajax append
	
	});
</script>
</head>
<body>
	<div class="orders"> 
		<div class="content" >
			<h3 class="h_title"> 판교점</h3>
			<div class="tableWrap">
				<div class="board_list_wrapper step1">
					<table>
						<thead>
							<tr>
								<th scope="col">주문번호</th>
								<th scope="col">주문메뉴</th>
								<th scope="col">결제금액</th>
								<th scope="col">주문상태</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${list==null}">
								<td colspan="9">주문내역이 존재하지 않습니다.</td>
							</c:when>
							<c:when test="${list!=null}">
								<th scope="col">주문번호</th>
								<th scope="col">
									<span class="menuImg">
										<img alt="쉬림프" src="${pageContext.request.contextPath}/resources/images/menu/sandwich/sandwich_pm10.jpg"><br>
											에그마요 15cm 외
										</span>
									</th>
								<th scope="col">￦  7,000</th>
								<th scope="col">주문접수</th>
							</c:when>
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
								<td colspan="3">￦  7,000</td>
							</tr>
						
						
						</tbody>
					</table>
				</div>
			</div>
			
		</div>
	</div>
</body>
</html>