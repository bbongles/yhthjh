<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<!--[if ie]><meta content='IE=8' http-equiv='X-UA-Compatible'/><![endif]-->
<!-- bootstrap -->
<link href="<c:url value='/resources/bootstrap/css/bootstrap.min.css'/>"
	rel="stylesheet">
<link
	href="<c:url value='/resources/bootstrap/css/bootstrap-responsive.min.css' />"
	rel="stylesheet">
<link href="<c:url value='/resources/themes/css/bootstrappage.css' />"
	rel="stylesheet" />

<!-- global styles -->
<link href="<c:url value='/resources/themes/css/flexslider.css' />"
	rel="stylesheet" />
<link href="<c:url value='/resources/themes/css/main.css' />"
	rel="stylesheet" />

<!-- scripts -->
<script src="<c:url value='/resources/themes/js/jquery-1.7.2.min.js' />"></script>
<script src="<c:url value='/resources/bootstrap/js/bootstrap.min.js' />"></script>
<script src="<c:url value='/resources/themes/js/superfish.js' />"></script>
<script
	src="<c:url value='/resources/themes/js/jquery.scrolltotop.js' />"></script>

<style>
	.main-content {
		max-width: 300px;
		max-height: 300px;
		resizable: no;
	}
</style>	
	
<title>로그인 팝업</title>
</head>
<body>

	<h1>로그인 팝업</h1>

	<section class="main-content">
			<div class="row">
				<div class="span5">
					<h4 class="title">
						<span class="text"><strong>Login</strong> Form</span>
					</h4>
					<!-- ---------------------- -->
					<ul id="myTab" class="nav nav-tabs">
						<li class="active"><a href="#buyerLogin" data-toggle="tab">구매자
								로그인</a></li>
						<li class=""><a href="#sellerLogin" data-toggle="tab">판매자
								로그인</a></li>
					</ul>
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade active in" id="buyerLogin">
							<form action="buyer/login" method="post">
								<input type="hidden" name="next" value="/">
								<fieldset>
									<div class="control-group">
										<label class="control-label">아이디</label>
										<div class="controls">
											<input type="text" placeholder="아이디 입력" id="username"
												class="input-xlarge" name="b_id">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">비밀번호</label>
										<div class="controls">
											<input type="password" name="b_pw" placeholder="비밀번호 입력"
												id="password" class="input-xlarge">
										</div>
									</div>
									<div class="control-group">
										<input tabindex="3" class="btn btn-inverse large"
											type="submit" value="구매자 로그인">
										<hr>
										<p class="reset">
											구매자 <a tabindex="4" href="#"
												title="Recover your username or password">아이디/비밀번호 찾기</a>
										</p>
									</div>
								</fieldset>
							</form>

						</div>
						<div class="tab-pane fade" id="sellerLogin">
							<form action="seller/login" method="post" id="loginBuyerOrSeller">
								<input type="hidden" name="next" value="/">
								<fieldset>
									<div class="control-group">
										<label class="control-label">아이디</label>
										<div class="controls">
											<input type="text" placeholder="아이디 입력" id="username"
												class="input-xlarge" name="s_id">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">비밀번호</label>
										<div class="controls">
											<input type="password" name="s_pw" placeholder="비밀번호 입력"
												id="password" class="input-xlarge">
										</div>
									</div>
									<div class="control-group">
										<input tabindex="3" class="btn btn-inverse large"
											type="submit" value="판매자 로그인">
										<hr>
										<p class="reset">
											판매자 <a tabindex="4" href="#"
												title="Recover your username or password">아이디/비밀번호 찾기</a>
										</p>
									</div>
								</fieldset>
							</form>
						</div>
					</div>

				</div> <!-- end span5 -->
			<div class="span7">
<h4 class="title"><span class="text"><strong>Register</strong> Select</span></h4>
<a href="buyer/register"><img alt="구매자 회원가입" src="http://order.garak24.com/data/skin/default/images/buttons/banner_join_buyer.gif" style="width: 150px"></a>
<a href="seller/register"><img alt="판매자 회원가입" src="http://order.garak24.com/data/skin/default/images/buttons/banner_join_seller.gif" style="width: 150px"></a>


</div>
	</div>
			</div><!-- end row -->
			
	
	</section>

</body>
</html>