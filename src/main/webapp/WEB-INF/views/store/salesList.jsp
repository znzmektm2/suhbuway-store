<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
//셀렉트 박스 클릭시 이벤트발생
 function changeSelect(fis) {
		var min; // 셀렉트박스 선택결과 값 가져오기
		var params={
				min:$(fis).val(),
				"${_csrf.parameterName}":"${_csrf.token}",
				storeId:"${store.storeId}"
		}
		$.ajax({
		      url:"${pageContext.request.contextPath}/selectSales",
		      type:"post",
		      dataType: "json",
		      data:params,
		      success:function(result){
		         $(".orderPrice").empty();
		         $(".orderPrice").append(result);
		      },
		      error: function(err){
		         console.log("오류발생 : " + err);
		      }
		   });
 }
</script>
</head>
<body>

<div class="board_list_wrapper step1">
	<select id="month" name="month" onchange="changeSelect(this)" style="float: right;">
    	<option value="">월 매출</option>
    	<option value="2019/01">2019/01</option>
    	<option value="2019/02">2019/02</option>
    	<option value="2019/03">2019/03</option>
    	<option value="2019/04">2019/04</option>
    	<option value="2019/05">2019/05</option>
    	<option value="2019/06">2019/06</option>
    	<option value="2019/07">2019/07</option>
    	<option value="2019/08">2019/08</option>
    	<option value="2019/09">2019/09</option>
    	<option value="2019/10">2019/10</option>
    	<option value="2019/11">2019/11</option>
    	<option value="2019/12">2019/12</option>
	</select>
	<table>
		<thead>
			<tr>
				<th scope="col" style="width: 155px;">매장 이름</th>
				<th scope="col">매장 주소</th>
				<th scope="col">점주</th>
				<th scope="col">매출</th>
			</tr>
		</thead>
		<tbody class="item_list">
			<tr class="on">
				<td><span>${store.storeName}</span></td>
				<td><span>${store.storeAddress}</span></td>
				<td><span>${store.storeOwner}</span></td>
				<td><span class="orderPrice"></span></td>
			</tr>
		</tbody>
	</table>
</div>

</body>
</html>