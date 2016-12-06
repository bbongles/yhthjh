<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div>
		<c:if test="${empty login_id}">
			<!-- 세션에 로그인 정보가 없는 경우 -->
			<form action="login" method="post">
				<input type="text" name="b_id" placeholder="아이디" required="required"><br>
				<input type="password" name="b_pw" placeholder="비밀번호"
					required="required"><br> <input type="submit"
					value="로그인">
			</form>
		</c:if>

		<c:if test="${not empty login_id }">
			<!-- 세션에 로그인 정보가 있는 경우 -->
			${login_id }님, 환영합니다... *^^*
			<button id="btnLogout">로그아웃</button>
		</c:if>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

	<script>
		$(document).ready(function() {
			$('#btnLogout').click(function() {
				location = '/shop01/login/logout';
			})
		})
	</script>



</body>
</html>