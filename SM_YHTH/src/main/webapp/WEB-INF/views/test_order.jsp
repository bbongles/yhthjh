<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Cache-Control" content="no-store" />
<title>Insert title here</title>
</head>
<style>
table {
	border-collapse: collapse;
}

tr td {
	border: 1px solid black;
	text-align: center;
}


</style>
<body>
<h1>주문 리스트</h1>
	<form action="/shop/order/readyForBill" method="post" name="frm">
<table>
		<tr>
			<th>제품번호</th>
			<th>그림</th>
			<th>제품</th>
			<th>옵션</th>
			<th>가격</th>
		</tr>
		<c:forEach var="vo" items="${ListForOrder}">
								<tr>
								<td><span></span>${vo.p_no}</td>
<!-- 제품 이미지 --><td><img src="${vo.p_img }" style="width: 50px" /></td> 
								<td><span>제품명 : </span>${vo.p_name }<span>(${vo.buy_cnt }개)</span></td>
								<td><span>옵션 : </span>${vo.o_cont }</td>
								<td><span>가격 : </span>${vo.p_price * vo.buy_cnt }</td>
								
			</tr>
			<span><input type="hidden" value="${vo.c_no }" name="c_no"></span>
		</c:forEach>
	</table>
	<hr>
	<div>
	<dl>
	<dt><strong>주문정보</strong></dt>
	<dd>
	
		<p>
			<span>주문 갯수 : </span><strong>${totalCountForOrder}</strong><span>개 / </span>
			<span>마일리지 적립 : </span><strong>${miledTobeAdded}</strong><span>Point / </span>
			<span>총 배송비 : </span><strong>${Shipping}</strong><span>원 / </span>
			<span>제품 총 금액 : </span><strong>${totalProductPriceForOrder}</strong><span>원</span>
		</p>
		<hr>
		<p>
			<span>총 합계 금액 : 
				<strong>${FinalPriceForOrder }</strong>원
			</span>
		</p>
	
	</dd>
	</dl>
	<hr>
	</div>
	<h2>주문고객 정보</h2>
	주문자 명 : <input type="text"  value ="${buyerNAME}" name="b_name">
	핸드폰 번호 : <input type="number" value="${buyerHP}" name="b_phone">
	이메일 : <input type="email" value="${buyerEmail }" name="b_email">
	
	<hr>
	<h2>배송지 정보</h2>
	<div>
	<input type="radio" checked="checked" name="juso" id="showExistingAddr">기존 정보 불러오기
	<input type="radio" name="juso" id="showNewAddr">새 배송지 입력
	</div>
	<!--  -->
		<div>
		우편번호 : <input type="number" id="sample6_postcode" placeholder="우편번호" name="delivery_zip" value="${registedZip }">
		<input type="button" value="우편번호 찾기" onclick="sample6_execDaumPostcode()" ><br> 
		주소 1 : <input type="text" id="sample6_address" placeholder="주소" name="delivery_addr1" value="${registedAddr1 }"><br>
		주소 2 : <input type="text" id="sample6_address2" placeholder="상세주소"  name="delivery_addr2" value="${registedAddr2 }"><br>
		</div>		
		<hr>
		<h2>결제방법</h2>
		<input type="radio" checked="checked">무통장 입금 / 계좌 이체<br>
		<hr>	
	<!-- TODO: 중복 submit 방지용 -->
	
	<!-- 주문자 아이디 -->
	<input type="hidden" value="${b_id }" name="b_id">
	<input type="submit" id="submitBuy"  value="결제하기">
	
	</form>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>	
	<script>
	// 중복 submit 방지
	var delay = 1000;
	var submitted = false;
	
	// 기존주소 또는 새 배송 주소 입력 
	$("#showNewAddr").click(function(){
		$("#sample6_postcode").val("");
		$("#sample6_address").val("");
		 $("#sample6_address2").val("");
	});
	
	$("#showExistingAddr").click(function(){
		 $("#sample6_postcode").val("${registedZip }");
		 $("#sample6_address").val("${registedAddr1 }");
		 $("#sample6_address2").val("${registedAddr2 }");
	});
	
	// 새 배송 주소 우편번호 찾기
	////////////////////////////////////////////////////////////////////////////////////////////////////////
		function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample6_address').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('sample6_address2').focus();
					}
				}).open();
		}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	$('#submitBuy').click(function() {
		window.open("../order/test_bill", 'window', 'width=500, height=500, resizable=no');


	});
	
</script>
	
</body>
</html>