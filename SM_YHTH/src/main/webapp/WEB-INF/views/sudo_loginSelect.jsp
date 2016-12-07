<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bootstrap E-commerce Templates</title>
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

<!-- Latest compiled and minified CSS -->


<!--[if lt IE 9]>			
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
			<script src="js/respond.min.js"></script>
		<![endif]-->
</head>
<body>
	<div id="top-bar" class="container">
		<div class="row">
			<div class="span4">
				<form method="POST" class="search_form">
					<input type="text" class="input-block-level search-query"
						Placeholder="eg. T-sirt">
				</form>
			</div>
			<div class="span8">
				<div class="account pull-right">
					<ul class="user-menu">
						<li><a href="#">My Account</a></li>
						<li><a href="cart.html">Your Cart</a></li>
						<li><a href="checkout.html">Checkout</a></li>
						<li><a href="register">Login</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div id="wrapper" class="container">
		<section class="navbar main-menu">
			<div class="navbar-inner main-menu">
				<a href="index" class="logo pull-left"><img
					src="<c:url value='/resources/themes/images//logo.png" class="site_logo'/>"
					alt=""></a>
				<nav id="menu" class="pull-right">
					<ul>
						<li><a href="./products.html">Woman</a>
							<ul>
								<li><a href="./products.html">Lacinia nibh</a></li>
								<li><a href="./products.html">Eget molestie</a></li>
								<li><a href="./products.html">Varius purus</a></li>
							</ul></li>
						<li><a href="./products.html">Man</a></li>
						<li><a href="./products.html">Sport</a>
							<ul>
								<li><a href="./products.html">Gifts and Tech</a></li>
								<li><a href="./products.html">Ties and Hats</a></li>
								<li><a href="./products.html">Cold Weather</a></li>
							</ul></li>
						<li><a href="./products.html">Hangbag</a></li>
						<li><a href="./products.html">Best Seller</a></li>
						<li><a href="./products.html">Top Seller</a></li>
					</ul>
				</nav>
			</div>
		</section>
		<section class="header_text sub">
			<img class="pageBanner"
				src="<c:url value='/resources/themes/images/pageBanner.png'/>"
				alt="New products">
			<h4>
				<span>Login or Regsiter</span>
			</h4>
		</section>
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
<a href="buyer/main"><img alt="구매자 회원가입" src="http://order.garak24.com/data/skin/default/images/buttons/banner_join_buyer.gif" style="width: 150px"></a>
<a href=""><img alt="판매자 회원가입" src="http://order.garak24.com/data/skin/default/images/buttons/banner_join_seller.gif" style="width: 150px"></a>


</div>
	</div>
			</div><!-- end row -->
			
	
	</section>
	<section id="footer-bar">
		<div class="row">
			<div class="span3">
				<h4>Navigation</h4>
				<ul class="nav">
					<li><a href="./index.html">Homepage</a></li>
					<li><a href="./about.html">About Us</a></li>
					<li><a href="./contact.html">Contac Us</a></li>
					<li><a href="./cart.html">Your Cart</a></li>
					<li><a href="./register.html">Login</a></li>
				</ul>
			</div>
			<div class="span4">
				<h4>My Account</h4>
				<ul class="nav">
					<li><a href="#">My Account</a></li>
					<li><a href="#">Order History</a></li>
					<li><a href="#">Wish List</a></li>
					<li><a href="#">Newsletter</a></li>
				</ul>
			</div>
			<div class="span5">
				<p class="logo">
					<img src="<c:url value='resources/themes/images/logo.png' />"
						class="site_logo" alt="">
				</p>
				<p>Lorem Ipsum is simply dummy text of the printing and
					typesetting industry. the Lorem Ipsum has been the industry's
					standard dummy text ever since the you.</p>
				<br /> <span class="social_icons"> <a class="facebook"
					href="#">Facebook</a> <a class="twitter" href="#">Twitter</a> <a
					class="skype" href="#">Skype</a> <a class="vimeo" href="#">Vimeo</a>
				</span>
			</div>
		</div>
	</section>
	<section id="copyright">
		<span>Copyright 2013 bootstrappage template All right reserved.</span>
	</section>
	</div>
	<script src="<c:url value='/resources/themes/js/common.js' />"></script>
	<script>
		$(document).ready(function() {
			$('#checkout').click(function(e) {
				document.location.href = "checkout.html";
			})
		});
	</script>
</body>
</html>