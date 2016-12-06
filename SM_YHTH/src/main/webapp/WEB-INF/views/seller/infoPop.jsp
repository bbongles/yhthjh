<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<title>판매자 정보 등록</title>

<style>
#s_info {
	width: 380px;
	height: 25px;
	margin: 15px;
}
#infoSubmit {
	margin-left: 15px;
}
</style>
</head>
<body>
	
	<h1>판매자 정보 등록</h1>
	
	<form method="post">
		
		<span>개인 쇼핑몰 또는 SNS 주소를 넣어주세요!!</span><br/>
		
		<input type="text" id="s_info" name="s_info" placeholder="http:// 를 포함해 넣어주세요..." />
		
		<input type="submit" id="infoSubmit" value="등 록" />
		
	</form>

	<script>
	$('#infoSubmit').click(function() {
		window.close();
		window.opener.location.reload();
	});
	</script>
	
</body>
</html>