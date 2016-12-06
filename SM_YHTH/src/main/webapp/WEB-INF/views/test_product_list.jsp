<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.preview {
width: 100px;
height: 100px;
}

</style>

</head>
<body>

<table>
			<tr>
				<th>이미지</th>
				<th>상품번호</th>
				<th>상품이름</th>
				<th>상품가격</th>
				<th>작성시간</th>
			</tr>
			<c:forEach var="vo" items="${productList }">
				
				<tr>
					<td><img id="0" class="preview normal" src="http://i.imgur.com/wB73OvB.jpg" alt="preview"/></td>
					<td>${vo.p_no }</td>
					<td><a href="detail?p_no=${vo.p_no }">${vo.p_name }</a></td>
					<td>${vo.p_price }</td>
					<td>
						<fmt:formatDate value="${vo.p_reg }" 
							pattern="yyyy-MM-dd HH:mm:ss"/>
					</td>
				</tr>
			</c:forEach>
		</table>

</body>
</html>