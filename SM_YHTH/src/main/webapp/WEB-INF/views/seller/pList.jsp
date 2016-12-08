<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리스트</title>
<style>
ul {
	list-style-type: none;
}
li {
	display: inline-block;
	text-align: center;
}
#totalBox {
	width: 1260px;
	margin: 0 auto;
}
#sellerInfoBox {
	width: 100%;
	display: inline-block;
}
#infoCover {
	width: 1460px;
	margin: 0 auto;
}
#sellerLogo {
	width: 200px;
	height: 200px;
	float: left;
	margin: 20px;
	margin-top: 70px;
	border: 1px solid gray;
}
#logoImg {
	width: 200px;
	height: 200px;
}
#sellerInfo {
	width: 400px;
	height: 300px;
	float: left;
	margin: 20px;
	border: 1px solid gray;
}
#topFiveList {
	width: 700px;
	height: 300px;
	float: left;
	margin: 20px;
	border: 1px solid gray;
}
.itemBox {
	width: 250px;
	height: 300px;
	margin: 20px;
}
img {
	width: 250px;
	height: 250px;
}
#infoBox {
	margin: 30px;
}

</style>
</head>
<body>

	<h1>판매자가 보는 판매자 홈</h1>
	
		판매자홈 주인 아이디 : 
	<input type="text" id="ownSeller" value="${sellerInfo.s_id}"><br> <!-- TODO hidden으로 고치기(삭제 ㄴㄴㄴ) -->
	로그인한 판매자 아이디 : 
	<input type="text" id="loginedSeller" value="${s_login_id}"><!-- TODO hidden으로 고치기(삭제 ㄴㄴㄴ) -->
	
	<nav>
		<ul>
		<c:if test="${s_login_id eq sellerInfo.s_id}">
			<li><a href="pRegister">상품 등록</a></li>
			</c:if>
		</ul>
	</nav>
	
	<hr/>
	
	<div id="sellerInfoBox">
		<div id="infoCover">
			<div id="sellerLogo">
				<img id="logoImg" src="${sellerInfo.s_logo }" />
			</div>
			<div id="sellerInfo">
				<div id="infoBox">
				<p>판매자 - ${sellerInfo.s_name }</p>
				<p>이메일 - ${sellerInfo.s_email }</p>
				주소
				<p>${sellerInfo.s_zip }</p>
				<p>${sellerInfo.s_addr1 } ${sellerInfo.s_addr2 }</p>
				개인 쇼핑몰 / SNS
				<p>${sellerInfo.s_info }</p>
				</div>
			</div>
			<div id="topFiveList">
				top5 보여줌
			</div>
		</div>
	</div>
	
	<hr/>
	
	<div id="totalBox">
		<ul>
		
			<c:forEach var="pVo" items="${productList }">
			<li>
				<a href="pDetail?p_no=${pVo.p_no }">
					<div class="itemBox">
						<img src="${pVo.p_img }" /><br/><br/>
						<a>${pVo.p_name }</a><br>
						<a>${pVo.p_price } 원</a>
					</div>
				</a>
			</li>
			</c:forEach>
			
		</ul>
	</div>

	
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
$(document).ready(function(){
	// 로그인한 사용자와 판매자홈 주인의 아이디가 같을때만 실행
	var own = $('#ownSeller').val();
	var visiter = $('#loginedSeller').val();
if (own==visiter){
	$('#sellerLogo').click(function() {
		window.open("../seller/logoPop", 'window', 'width=400, height=380, resizable=no');
	});
	$('#sellerInfo').click(function() {
		window.open("../seller/infoPop", 'window', 'width=400, height=200, resizable=no');
	});
} else {
	return false;
}
});

</script>
</html>