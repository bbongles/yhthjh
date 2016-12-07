<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
		<title>Bootstrap E-commerce Templates</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<!--[if ie]><meta content='IE=8' http-equiv='X-UA-Compatible'/><![endif]-->
		<!-- bootstrap -->
			<!-- <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->
		<link href="<c:url value='/resources/bootstrap/css/bootstrap.min.css' />" rel="stylesheet" />     <!--  선생님 수정  --> 
		<link href="<c:url value='/resources/bootstrap/css/bootstrap-responsive.min.css' />" rel="stylesheet">
		
		<link href="<c:url value='/resources/themes/css/bootstrappage.css' />" rel="stylesheet"/>
		
		<!-- global styles -->
		<link href="<c:url value='/resources/themes/css/flexslider.css' />" rel="stylesheet"/>
		<link href="<c:url value='/resources/themes/css/main.css' />" rel="stylesheet"/>

		<!-- scripts -->
		<script src=<c:url value='/resources/themes/js/jquery-1.7.2.min.js'/> ></script>
		<script src=<c:url value='/resources/bootstrap/js/bootstrap.min.js'/> ></script>				
		<script src=<c:url value='/resources/themes/js/superfish.js'/> ></script>	
		<script src=<c:url value='/resources/themes/js/jquery.scrolltotop.js'/> ></script>
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
						<input type="text" class="input-block-level search-query" Placeholder="eg. T-sirt">
					</form>
				</div>
				<div class="span8">
					<div class="account pull-right">
						<ul class="user-menu">				
							<li><a href="#">My Account</a></li>
							<li><a href="cart">Your Cart</a></li>
							<li><a href="checkout">Checkout</a></li>		
						
						<c:if test="${empty login_id}">
						<li><a href="register">Login</a></li>	
						</c:if>
								<c:if test="${not empty login_id }">
								<!-- 세션에 로그인 정보가 있는 경우 -->
								<c:url value="/seller/logout" var="logout" />
								<li><a href="${logout }">로그아웃</a></li>		
								</c:if>			
	
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="wrapper" class="container">
			<section class="navbar main-menu">
				<div class="navbar-inner main-menu">				
					<a href="index" class="logo pull-left"><img src=<c:url value='/resources/themes/images/logo.png' /> class="site_logo" alt=""></a>
					<nav id="menu" class="pull-right">
						<ul>
							<li><a href="./products.html">Woman</a>					
								<ul>
									<li><a href="./products.html">Lacinia nibh</a></li>									
									<li><a href="./products.html">Eget molestie</a></li>
									<li><a href="./products.html">Varius purus</a></li>									
								</ul>
							</li>															
							<li><a href="./products.html">Man</a></li>			
							<li><a href="./products.html">Sport</a>
								<ul>									
									<li><a href="./products.html">Gifts and Tech</a></li>
									<li><a href="./products.html">Ties and Hats</a></li>
									<li><a href="./products.html">Cold Weather</a></li>
								</ul>
							</li>							
							<li><a href="./products.html">Hangbag</a></li>
							<li><a href="./products.html">Best Seller</a></li>
							<li><a href="./products.html">Top Seller</a></li>
						</ul>
					</nav>
				</div>
			</section>
			<section  class="homepage-slider" id="home-slider">
				<div class="flexslider">
					<ul class="slides">
						<li>
							<!-- <img src=<c:url value='/resources/themes/images/carousel/banner-1.jpg'/> alt="" /> -->
							<img src="http://image.thefingers.co.kr/main/201612/999/999_18853.jpg" alt="" /><!-- 메인 광고 -->
						</li>
						<li>
							<!-- <img src=<c:url value='/resources/themes/images/carousel/banner-2.jpg'/> alt="" /> -->
							<img src="http://image.thefingers.co.kr/main/201612/999/999_18856.jpg" alt="" />
							<!-- <div class="intro">
								<h1>Mid season sale</h1>
								<p><span>Up to 50% Off</span></p>
								<p><span>On selected items online and in stores</span></p>
							</div> -->
						</li>
						<li>
							<!-- <img src=<c:url value='/resources/themes/images/carousel/banner-2.jpg'/> alt="" /> -->
							<img src="http://image.thefingers.co.kr/main/201612/999/999_18852.jpg" alt="" />
							<!-- <div class="intro">
								<h1>Mid season sale</h1>
								<p><span>Up to 50% Off</span></p>
								<p><span>On selected items online and in stores</span></p>
							</div> -->
						</li>
					</ul>
				</div>			
			</section>
			<section class="header_text">
				We stand for top quality templates. Our genuine developers always optimized bootstrap commercial templates. 
				<br/>Don't miss to use our cheap abd best bootstrap templates.
			</section>
			<section class="main-content">
				<div class="row">
					<div class="span12">													
						<div class="row">
							<div class="span12">
								<h4 class="title">
									<span class="pull-left"><span class="text"><span class="line">Feature <strong>Products</strong></span></span></span>
									<span class="pull-right">
										<a class="left button" href="#myCarousel" data-slide="prev"></a><a class="right button" href="#myCarousel" data-slide="next"></a>
									</span>
								</h4>
								
								
								<!-- /////////////////////////////////////////////////////////////////////////////////////// -->
								
								<!-- 1번째 리스트 라인 -->
								<div id="myCarousel" class="myCarousel carousel slide">
									<div class="carousel-inner">
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->	
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
		
								
				 <!-- ** 마지막 페이지 다음에 오는 페이지는 다시 첫번째 페이지 ** -->			
					 
				<!-- 첫번째 페이지 -->
				<div class="active item">		
					<ul class="thumbnails">	
						<c:forEach begin="0" end="0" var="page">
						<c:forEach begin="0" end="3" varStatus="status" items="${productList }"><!-- 4 개씩 출력 -->
								<li class="span3">
								<div class="product-box">
									<span class="sale_tag"><%--  #index : ${4 * page + status.index} --%> </span>
										<p><a href="pDetail?p_no=${productList[4 * page + status.index].p_no }"><img src="${productList[4 * page + status.index].p_img }" /></a></p>
										<a href="pDetail?p_no=${productList[4 * page + status.index].p_no }" class="title">${productList[4 * page + status.index].p_name }</a><br>
										<a href="pDetail?p_no=${productList[4 * page + status.index].p_no }" class="category">${productList[4 * page + status.index].p_cate1}</a><!-- 카테고리 -->
										<%-- <p class="price">₩ ${productList[4 * page + status.index].p_price }</p>	  --%>
										<p class="price"><fmt:formatNumber value="${productList[4 * page + status.index].p_price}" groupingUsed="true"/> 원</p>	
									</div>
								</li>
						</c:forEach>
						</c:forEach> 
					</ul>
				</div>
	
				<c:if test="${numOfPage >= 2}">
				<!-- 두번째 페이지 이상 ~ -->
				<%-- <c:forEach begin="1" end="${numOfPage-1 }" var="page"> --%>
					<c:forEach begin="1" end="${numOfPage-2 }" var="page">
					<div class="item">		
						<ul class="thumbnails">	
							<%-- <c:forEach begin="0" end="4" var="i"> --%>
								<%-- ${productList.list[4 * page + i] } --%>
							<c:forEach begin="0" end="3" varStatus="status" items="${productList }"><!-- 4 개씩 출력 -->
								<li class="span3">
								<div class="product-box">
									<span class="sale_tag"><%--  #index : ${4 * page + status.index} --%> </span>
										<p><a href="pDetail?p_no=${productList[4 * page + status.index].p_no }"><img src="${productList[4 * page + status.index].p_img }" /></a></p>
										<a href="pDetail?p_no=${productList[4 * page + status.index].p_no }" class="title">${productList[4 * page + status.index].p_name }</a><br>
										<a href="pDetail?p_no=${productList[4 * page + status.index].p_no }" class="category">${productList[4 * page + status.index].p_cate1}</a><!-- 카테고리 -->
										<p class="price"><fmt:formatNumber value="${productList[4 * page + status.index].p_price}" groupingUsed="true"/> 원</p> 
										
									</div>
								</li>
							</c:forEach>
							
						</ul>
					</div>
				</c:forEach>
				

				<!-- 마지막 페이지 -->
				<c:forEach begin="${numOfPage-1}" end="${numOfPage-1}" var="page">
					<div class="item">		
						<ul class="thumbnails">	
							<%-- <c:forEach begin="0" end="4" var="i"> --%>
								<%-- ${productList.list[4 * page + i] } --%>
							<c:forEach begin="0" end="${remainder-1}" varStatus="status" items="${productList }"><!-- 4 개씩 출력 -->
								<li class="span3">
								<div class="product-box">
									<span class="sale_tag"><%--  #index : ${4 * page + status.index} --%> </span>
										<p><a href="pDetail?p_no=${productList[4 * page + status.index].p_no }"><img src="${productList[4 * page + status.index].p_img }" /></a></p>
										<a href="pDetail?p_no=${productList[4 * page + status.index].p_no }" class="title">${productList[4 * page + status.index].p_name }</a><br>
										<a href="pDetail?p_no=${productList[4 * page + status.index].p_no }" class="category">${productList[4 * page + status.index].p_cate1}</a><!-- 카테고리 -->
										<p class="price"><fmt:formatNumber value="${productList[4 * page + status.index].p_price}" groupingUsed="true"/> 원</p> 
										
									</div>
								</li>
							</c:forEach>
							
						</ul>
					</div>
				</c:forEach> 
				
				</c:if>
				
		
										
	<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->		
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->


										

										
									</div>							
								</div>
							</div>						
						</div>
						<br/>
						<div class="row">
							<div class="span12">
								<h4 class="title">
									<span class="pull-left"><span class="text"><span class="line">Latest <strong>Products</strong></span></span></span>
									<span class="pull-right">
										<a class="left button" href="#myCarousel-2" data-slide="prev"></a><a class="right button" href="#myCarousel-2" data-slide="next"></a>
									</span>
								</h4>
								
								
								<!-- /////////////////////////////////////////////////////////////////////////////////////// -->
								
								<!-- 2번째 리스트 라인 -->
								<div id="myCarousel-2" class="myCarousel carousel slide">
									<div class="carousel-inner">
									
										<!-- 1페이지 --><!--  TODO : 나중에 할인률 적용되는 상품들을 로직으로 불러오는 것으로 대체 -->
										<div class="active item">
											<ul class="thumbnails">		
																					
												<li class="span3">
													<div class="product-box">
														<span class="sale_tag"></span>
														<p><a href="product_detail.html"><img src="http://image.thefingers.co.kr/diyitem/webimage/list120/00/C000008255.jpg"/></a></p>
														<a href="product_detail.html" class="title">드라이플라워박스</a><br/>
														<a href="products.html" class="category">SANSANGGOT</a>
														<p class="price">34,900 원</p>
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="product_detail.html"><img src="http://image.thefingers.co.kr/diyitem/webimage/list120/00/C000008243.jpg"/></a></p>
														<a href="product_detail.html" class="title">크리스마스 양말</a><br/>
														<a href="products.html" class="category">Mellow</a>
														<p class="price">18,000 원</p>
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="product_detail.html"><img src="http://image.thefingers.co.kr/diyitem/webimage/list120/00/C000008063.jpg"/></a></p>
														<a href="product_detail.html" class="title">해피홀리데이카드</a><br/>
														<a href="products.html" class="category">BASRAK</a>
														<p class="price">9,000 원</p>
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="product_detail.html"><img src="http://image.thefingers.co.kr/diyitem/webimage/list120/00/C000008040.jpg"/></a></p>
														<a href="product_detail.html" class="title">홀리데이 밍크 드롭 귀걸이</a><br/>
														<a href="products.html" class="category">Sara and Rosa</a>
														<p class="price">15,900 원</p>
													</div>
												</li>
												
											</ul>
										</div>
										
										<!-- 2페이지 -->
										<div class="item">
											<ul class="thumbnails">
												<li class="span3">
													<div class="product-box">
														<span class="sale_tag"></span>
														<p><a href="product_detail.html"><img src="http://image.thefingers.co.kr/diyitem/webimage/list120/00/C000008255.jpg"/></a></p>
														<a href="product_detail.html" class="title">크리스마스 드라이플라워박스</a><br/>
														<a href="products.html" class="category">SANSANGGOT</a>
														<p class="price">₩ 34900</p>
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="product_detail.html"><img src="http://image.thefingers.co.kr/diyitem/webimage/list120/00/C000008243.jpg"/></a></p>
														<a href="product_detail.html" class="title">크리스마스 양말</a><br/>
														<a href="products.html" class="category">Mellow</a>
														<p class="price">₩ 18,000</p>
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="product_detail.html"><img src="http://image.thefingers.co.kr/diyitem/webimage/list120/00/C000008063.jpg"/></a></p>
														<a href="product_detail.html" class="title">해피홀리데이카드</a><br/>
														<a href="products.html" class="category">BASRAK</a>
														<p class="price">₩ 9,000</p>
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="product_detail.html"><img src="http://image.thefingers.co.kr/diyitem/webimage/list120/00/C000008040.jpg"/></a></p>
														<a href="product_detail.html" class="title">홀리데이 밍크 드롭 귀걸이 (2colors)</a><br/>
														<a href="products.html" class="category">Sara and Rosa</a>
														<p class="price">₩ 15,900</p>
													</div>
												</li>																																
											</ul>
										</div>
									</div>							
								</div>
							</div>						
						</div>
						<div class="row feature_box">						
							<div class="span4">
								<div class="service">
									<div class="responsive">	
										<img src=<c:url value='/resources/themes/images/feature_img_2.png'/> alt="" />
										<h4>MODERN <strong>DESIGN</strong></h4>
										<p>Lorem Ipsum is simply dummy text of the printing and printing industry unknown printer.</p>									
									</div>
								</div>
							</div>
							<div class="span4">	
								<div class="service">
									<div class="customize">			
										<img src=<c:url value='/resources/themes/images/feature_img_1.png'/> alt="" />
										<h4>FREE <strong>SHIPPING</strong></h4>
										<p>Lorem Ipsum is simply dummy text of the printing and printing industry unknown printer.</p>
									</div>
								</div>
							</div>
							<div class="span4">
								<div class="service">
									<div class="support">	
										<img src=<c:url value='/resources/themes/images/feature_img_3.png'/> alt="" />
										<h4>24/7 LIVE <strong>SUPPORT</strong></h4>
										<p>Lorem Ipsum is simply dummy text of the printing and printing industry unknown printer.</p>
									</div>
								</div>
							</div>	
						</div>		
					</div>				
				</div>
			</section>
			<section class="our_client">
				<h4 class="title"><span class="text">Manufactures</span></h4>
				<div class="row">					
					<div class="span2">
						<a href="#"><img alt="" src=<c:url value='/resources/themes/images/clients/14.png'/>></a>
					</div>
					<div class="span2">
						<a href="#"><img alt="" src=<c:url value='/resources/themes/images/clients/35.png'/>></a>
					</div>
					<div class="span2">
						<a href="#"><img alt="" src=<c:url value='/resources/themes/images/clients/1.png'/>></a>
					</div>
					<div class="span2">
						<a href="#"><img alt="" src=<c:url value='/resources/themes/images/clients/2.png'/>></a>
					</div>
					<div class="span2">
						<a href="#"><img alt="" src=<c:url value='/resources/themes/images/clients/3.png'/>></a>
					</div>
					<div class="span2">
						<a href="#"><img alt="" src=<c:url value='/resources/themes/images/clients/4.png'/>></a>
					</div>
				</div>
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
						<!-- ------------------------------------------------------  -->	
							<li><a href="./register.html">Login.</a></li>							
						<!-- ------------------------------------------------------  -->
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
						<p class="logo"><img src=<c:url value='/resources/themes/images/logo.png'/> class="site_logo" alt=""></p>
						<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. the  Lorem Ipsum has been the industry's standard dummy text ever since the you.</p>
						<br/>
						<span class="social_icons">
							<a class="facebook" href="#">Facebook</a>
							<a class="twitter" href="#">Twitter</a>
							<a class="skype" href="#">Skype</a>
							<a class="vimeo" href="#">Vimeo</a>
						</span>
					</div>					
				</div>	
			</section>
			<section id="copyright">
				<span>Copyright 2013 bootstrappage template  All right reserved.</span>
			</section>
		</div>
		<script src=<c:url value='/resources/themes/js/common.js'/>></script>
		<script src=<c:url value='/resources/themes/js/jquery.flexslider-min.js'/>></script>
		<script type="text/javascript">
			$(function() {
				$(document).ready(function() {
					$('.flexslider').flexslider({
						animation: "fade",
						slideshowSpeed: 4000,
						animationSpeed: 600,
						controlNav: false,
						directionNav: true,
						controlsContainer: ".flex-container" // the container that holds the flexslider
					});
				});
			});
		</script>
    </body>
</html>