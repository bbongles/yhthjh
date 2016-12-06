<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Bootstrap E-commerce Templates</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<!--[if ie]><meta content='IE=8' http-equiv='X-UA-Compatible'/><![endif]-->
<!-- bootstrap -->
<link
	href="<c:url value='/resources/bootstrap/css/bootstrap.min.css' />"
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
<script src="<c:url value='/resources/themes/js/jquery.scrolltotop.js' />"></script>

<!-- 회원가입 폼 -->
<%-- 
<link type="text/css"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap-login.css"
	rel="stylesheet" />
	 --%>
<script>
	/* 구매자 비밀번호 확인 */
	function b_checkPass() {
		var pass1 = document.getElementById('b_pass1');
		var pass2 = document.getElementById('b_pass2');
		var message = document.getElementById('b_confirmMessage');
		var goodColor = "#66cc66";
		var badColor = "#ff6666";
		if (pass1.value == pass2.value) {
			message.style.color = goodColor;
			message.innerHTML = "일치합니다"
		} else {
			message.style.color = badColor;
			message.innerHTML = "패스워드가 일치하지 않습니다.!"
		}
	}

	/* 판매자 비밀번호 확인 */
	function s_checkPass() {
		var pass1 = document.getElementById('s_pass1');
		var pass2 = document.getElementById('s_pass2');
		var message = document.getElementById('s_confirmMessage');
		var goodColor = "#66cc66";
		var badColor = "#ff6666";
		if (pass1.value == pass2.value) {
			message.style.color = goodColor;
			message.innerHTML = "일치합니다"
		} else {
			message.style.color = badColor;
			message.innerHTML = "패스워드가 일치하지 않습니다.!"
		}
	}

</script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script> // daum api를 이용한 주소 검색
	// 구매자
	function b_execDaumPostcode() {
		new daum.Postcode({ 
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
						fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
					}
	
					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('b_postcode').value = data.zonecode; //5자리 새우편번호 사용
					document.getElementById('b_address').value = fullAddr;
	
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById('b_address2').focus();
				}
		}).open();
	}
	// 판매자
		function s_execDaumPostcode() {
		new daum.Postcode({ 
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
						fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
					}
	
					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('s_postcode').value = data.zonecode; //5자리 새우편번호 사용
					document.getElementById('s_address').value = fullAddr;
	
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById('s_address2').focus();
				}
		}).open();
	}
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<script>/* ### 아이디 중복 체크 ###  */
	// 아이디 중복체크 Ajax , Controller RequestMapping : /checkid
	$(document).ready(function() {
		$("#b_id").change(function() {
			$.ajax({
				type : 'post',
				url : 'b_checkid',
				data : $("#b_id").val(),
				success : function(result) {
					if (result == 1) {
						$("#b_duplicationCheckResult").html("중복된 아이디입니다.");
						$("#b_duplicationCheckResult").css("color", "red");
						$("#b_id").css("color", "red");
					} else {
						$("#b_duplicationCheckResult").html("사용 가능한 아이디입니다.");
						$("#b_duplicationCheckResult").css("color", "green");
						$("#b_id").css("color", "green");
					}
				}
			});
		});
	});
	
	// 판매자
	$(document).ready(function() {
		$("#s_id").change(function() {
			$.ajax({
				type : 'post',
				url : 's_checkid',
				data : $("#s_id").val(),
				success : function(result) {
					if (result == 1) {
						$("#s_duplicationCheckResult").html("중복된 아이디입니다.");
						$("#s_duplicationCheckResult").css("color", "red");
						$("#s_id").css("color", "red");
					} else {
						$("#s_duplicationCheckResult").html("사용 가능한 아이디입니다.");
						$("#s_duplicationCheckResult").css("color", "green");
						$("#s_id").css("color", "green");
					}
				}
			});
		});
	});
</script>

<script>
	// ##### 이메일 인증을 위한 Query

	// 구매자
	var code; // 코드를 저장할 변수 지정	
	$(document).ready(function() {
		$('#b_showConfirmForm').click(function() {
			var email = $("#b_email2").val();
			var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
			if (regex.test(email) === false) {
				alert("잘못된 이메일 형식입니다.");
				return false;
			} else {
				alert('인증번호가 전송되는 동안 잠시만 기다려 주십시오...'); // TODO: Ajax로 이메일 보내는데 시간 문제가 있음...
				$.ajax({
					type : 'post',
					url : 'checkemail',
					data : $("#b_email2").val(),
					success : function(result) {
						alert('인증번호가 전송되었습니다.');
						// $('#b_duplicationCheckResult2').html("전송 완료.");
						// $('#b_duplicationCheckResult2').css('color','green');
						$('#b_email2').css('color','green');
						code = result;
					}
				});
			}
		});
	});
	// 판매자
	var code; // 코드를 저장할 변수 지정	
	$(document).ready(function() {
		$('#s_showConfirmForm').click(function() {
			var email = $("#s_email2").val();
			var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
			if (regex.test(email) === false) {
				alert("잘못된 이메일 형식입니다.");
				return false;
			} else {
				alert('인증번호가 전송되는 동안 잠시만 기다려 주십시오...'); // TODO: Ajax로 이메일 보내는데 시간 문제가 있음...
				$.ajax({
					type : 'post',
					url : 'checkemail',
					data : $("#s_email2").val(),
					success : function(result) {
						alert('인증번호가 전송되었습니다.');
						// $('#b_duplicationCheckResult2').html("전송 완료.");
						// $('#b_duplicationCheckResult2').css('color','green');
						$('#s_email2').css('color','green');
						code = result;
					}
				});
			}
		});
	});

	
	var autcheck1 = false;
	var autcheck2 = false;
	
	// 인증번호 입력 확인시. code변수에 저장된 인증번호와 user가 쓴 인증번호 비교.
	// 구매자
	$(document).ready(function() {
		$('#b_email_confirm_btn').click(function() {
			if ($('#b_email_input').val() == code) {
				alert('인증되었습니다');
				autcheck1 = true;
			} else {
				alert('다시 입력하여 주십시오..');
			}
		});
	});
	// 판매자
	$(document).ready(function() {
		$('#s_email_confirm_btn').click(function() {
			if ($('#s_email_input').val() == code) {
				alert('인증되었습니다');
				 autcheck2 = true;
			} else {
				alert('다시 입력하여 주십시오..');
			}
		});
	});
	
	
	
	/* 인증번호를 제대로 입력하지 않고 가입버튼 누를시.. */
	$(document).ready(function() {
		$('#fileForm1').submit(function() {
			if (autcheck1 != true) {
				alert('이메일 인증을 다시 확인해 주십시오...')
				return false;
			} else {
				return true;
			}
		});
	});
	
	$(document).ready(function() {
		$('#fileForm2').submit(function() {
			if (autcheck2 != true) {
				alert('이메일 인증을 다시 확인해 주십시오...')
				return false;
			} else {
				return true;
			}
		});
	});
	
	
</script>


<style>/* 라디오 버튼 가로 배열 설정 */

/* .some-class {
  float: left;
  clear: none;
}
 */

.radio-inline {
  float: left;
  clear: none;
  display: block;
  padding: 2px 1em 0 0;
}

.birth-lbl {
	clear: both;
} 

 label {
 	clear: left;
 }

input[type=radio],
input.radio {
  float: left;
  clear: none;
  margin: 2px 0 0 2px;
}



</style>
<!-- 7777777777777777777777 -->



<!--  TEST -->
<style>


</style>

</head><!-- -------------------------------------------------------------- -->


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
						<li><a href="register.html">Login</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div id="wrapper" class="container">
		<section class="navbar main-menu">
			<div class="navbar-inner main-menu">
				<a href="index.html" class="logo pull-left">
				<img src="<c:url value='/resources/themes/images/logo.png' />"
					class="site_logo" alt=""></a>
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
				src="<c:url value='/resources/themes/images/pageBanner.png' />"
				alt="New products">
			<h4>
				<span>Check Out</span>
			</h4>
		</section>
		<section class="main-content">
			<div class="row">
				<div class="span12">
					<div class="accordion" id="accordion2">
					<!-- // TODO -->
						<!-- 구매자 회원가입 -->
						<div class="accordion-group">
							<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse"
									data-parent="#accordion2" href="#collapseOne">Sign up for Buyer</a>
							</div>
							<div id="collapseOne" class="accordion-body in collapse">
								<div class="accordion-inner">
									<div class="row-fluid">
									<h4 class="title"><span class="text"><strong>Register</strong> Form</span></h4>
									<form action="b_register_result" method="post" id="fileForm1" role="form"><!-- ** submit-->
										<!-- ######################################## -->
										<!-- 왼쪽 -->
										<div class="span6">
											
											
											<!-- <h4>Your Personal Details</h4> -->
											<!-- <h4>구매자 회원가입</h4> -->
											<!-- -------------------------------------------------------------- -->
											<!-- 
												<div class="control-group">
													<label class="control-label">이름</label>
													<div class="controls">
														<input type="text" placeholder="" class="input-xlarge">
													</div>
												</div>
												 -->
												 <!-- Latest compiled and minified CSS -->
										 
											<div class="control-group">
												<label>이름</label> 
												<div class="controls">
													<input class="input-xlarge" type="text" name="b_name" id="txt"
														required placeholder="홍길동" />
												</div>
											</div><!-- ### 완료 ###-->
											 
											<!-- -------------------------------------------------------------- -->
											<!-- 
												<div class="control-group">
													<label class="control-label">아이디</label>
													<div class="controls">
														<input type="text" placeholder="" class="input-xlarge">
													</div>
												</div>		
												 -->
											<div class="control-group">
												<label for="b_id">아이디 &nbsp;&nbsp; 
													<span id="b_duplicationCheckResult"></span> 
												</label> 
												<div class="controls">
													<input class="input-xlarge" type="text" name="b_id"
														id="b_id" placeholder="아이디" required />
												</div>
											</div><!-- ### 완료 ###-->
											<!-- -------------------------------------------------------------- -->
											<!-- 
											<div class="control-group">
												<label class="control-label">비밀번호</label>
												<div class="controls">
													<input type="text" placeholder="" class="input-xlarge">
												</div>
											</div>
											 -->
											 <div class="control-group">
											 	<label for="b_pw">비밀번호 </label> 
											 	<div class="controls">
												 	<input required name="b_pw" type="password" class="input-xlarge"
														minlength="4" maxlength="16" id="b_pass1" placeholder="비밀번호" />
												</div>
											 </div><!-- ### 완료 ###-->
											 
											<!-- -------------------------------------------------------------- -->
											<!-- 
											<div class="control-group">
												<label class="control-label">비밀번호 확인</label>
												<div class="controls">
													<input type="text" placeholder="" class="input-xlarge">
												</div>
											</div>
											 -->
											 <div class="control-group">
												<label for="b_pw_check">비밀번호 확인 &nbsp;&nbsp;
													<span id="b_confirmMessage"></span> 
												</label> 
												<div class="controls">
													<input required name="b_pw_check"
														type="password" class="input-xlarge" minlength="4"
														maxlength="16" placeholder="비밀번호 확인(위와 동일하게 입력하세요)" id="b_pass2"
														onkeyup="b_checkPass(); return false;" /> 
												</div> <!-- TODO :  -->
											 </div><!-- ### 완료 ###-->

											
											<!-- -------------------------------------------------------------- -->
											
											<div class="control-group">
												<label class="phone-lbl" for="b_phone"> 전화번호/휴대폰번호 </label>
												<div class="controls">
												 <input required type="number" name="b_phone" id="phone"
													class="input-xlarge" maxlength="28" 
													placeholder="( - )은 빼고 입력하세요. ex) 01012345424" />
												</div>
											</div>
											 
											<!-- -------------------------------------------------------------- -->
											<div class="control-group">
												<label for="b_gender">성별</label> 
												<label class="radio-inline">
													<input type="radio" name="b_gender" value="1" checked>남자
												</label> 
												<label class="radio-inline">
													<input type="radio" name="b_gender" value="2">여자
												</label>
											</div> <!-- ### 완료 ###-->
											 <br>
											
											
											
										</div>










										<!-- ######################################## -->
										<!-- 오른쪽 -->
										<div class="span6">
										<!-- <h4 class="title"><span class="text"></span></h4> -->
											<!-- <h4>Your Address</h4> -->
											<!-- -------------------------------------------------------------- -->
											<!-- 
											<div class="control-group">
												<label class="control-label">Company</label>
												<div class="controls">
													<input type="text" placeholder="" class="input-xlarge">
												</div>
											</div>
											 -->
											<!-- 성별 
											<div class="form-group">
												<label for="b_gender">성별</label> 
												<label class="radio-inline">
													<input type="radio" name="b_gender" value="1" checked>남자
												</label> 
												<label class="radio-inline">
													<input type="radio" name="b_gender" value="2">여자
												</label>
											</div>  -->
											 
											<!--  &&&&&&&&&&& TEST--><!-- 
											<div class="control-group">
												<label for="b_gender">성별</label> 
												  <div>
													<input id="r_male" type="radio" name="b_gender" value="1" checked>
													<label for="r_male" class="radio-inline" style="display: inline">남자</label> 
													 
													<input id="r_female" type="radio" name="b_gender" value="2">
													<label for="r_female" class="radio-inline" style="display: inline">여자</label>

											  	</div>
											</div> -->
											
											<!-- -------------------------------------------------------------- -->
											<!-- 
											<div class="control-group">
												<label class="control-label">Company ID:</label>
												<div class="controls">
													<input type="text" placeholder="" class="input-xlarge">
												</div>
											</div>
											 -->
											<div class="control-group">
												<label class="birth-lbl" for="b_birth">생년월일</label>
												<div class="controls">
													<input class="input-xlarge" required type="date" name="b_birth" placeholder="생년월일 ex)901214">
												</div>
											</div>										 
											<!-- -------------------------------------------------------------- -->
											<!-- 
											<div class="control-group">
												<label class="control-label"><span class="required">*</span>
													Address 1:</label>
												<div class="controls">
													<input type="text" placeholder="" class="input-xlarge">
												</div>
											</div>
											 -->
											 
											 
											 <div class="control-group">
											 	<label for="b_email">이메일 주소 &nbsp;&nbsp; 
											 	<!-- <small id="b_duplicationCheckResult2">
											 	 	유효한 이메일임을 확인하기 위해서 확인메일을 보냅니다.</small> -->
												</label>
												<div class="controls" id="b_email">
													<input type="email" id='b_email2' name="b_email" class="input-xlarge"
														placeholder="이메일주소 입력 ">
														
												    <span class="input-group-btn" id="b_check">
														<!-- <button type="button" name="btn_for_check" id="showConfirmForm">승인번호 얻기</button> -->
														<button type="button" id="b_showConfirmForm">승인번호 얻기</button>
													</span> 
												</div>
											 </div>
											 
											 
											 
											 
											 
											 
											<!--
											 TODO : input text with button design 텍스트와 버튼 합치기
											 http://blog.naver.com/PostView.nhn?blogId=rwans0397&logNo=220696890907
											 -->	
												
											<!-- -------------------------------------------------------------- -->
											<!-- 
											<div class="control-group">
												<label class="control-label">Address 2:</label>
												<div class="controls">
													<input type="text" placeholder="" class="input-xlarge">
												</div>
											</div>
											 -->
											<div class="form-group" id="confirmForm_form-group">
												<label for="b_email_input">승인번호 입력 &nbsp;&nbsp; 
												<!-- <small> 이메일로 보낸 승인번호를 입력해주세요.</small> -->
														<!-- <small style="display:none;" id="check_code">hide</small> -->
														<!-- <small id="check_code">hide</small>  --><!-- ### TEST ### 빠른 인증번호 확인을 위한 코드 -->
												</label>
												<div class="controls" id="b_email_input-group">
													<input required type="text" name="b_email_input" id = "b_email_input"class="input-xlarge"
														placeholder="승인번호 ex)1234 "> <span
														class="input-group-btn" id="b_email_span">
														<button type="button" name="b_email_btn" id="b_email_confirm_btn">확인</button>
													</span>
												</div>
											</div>

											
											
											
											
											
											
											<!-- -------------------------------------------------------------- -->
											<!-- 
											<div class="control-group">
												<label class="control-label"><span class="required">*</span>
													City:</label>
												<div class="controls">
													<input type="text" placeholder="" class="input-xlarge">
												</div>
											</div>
											 -->
											<div class="control-group">
												<label for="b_zip">주소</label>
												<div class="controls">
													<input class="input-xlarge" type="text" name="b_zip"
														id="b_postcode" placeholder="우편번호를 찾으려면 클릭하세요"
														onclick="b_execDaumPostcode()" required> <br>
													<input class="input-xlarge" type="text" name="b_addr1"
														id="b_address" placeholder="지번 / 도로명주소"
														readonly="readonly" required><br> 
													<input class="input-xlarge" type="text" name="b_addr2"
														id="b_address2" placeholder="나머지 상세 주소" required>
												</div>
											</div>
											<!-- -------------------------------------------------------------- -->
											<!-- 
											<div class="control-group">
												<label class="control-label"><span class="required">*</span>
													Post Code:</label>
												<div class="controls">
													<input type="text" placeholder="" class="input-xlarge">
												</div>
											</div>
											 -->
											<!-- <div class="control-group" style="text-align: center">
												<input class="input-xlarge" type="submit" name="submit_reg" value="가입하기">
											</div>  
											 -->
											<div class="actions">
												<input tabindex="9" class="btn btn-inverse large" type="submit" value="Create your account">
											</div>
											<br>
											<!-- -------------------------------------------------------------- -->
											<!-- 
											
											
											<div class="control-group">
												<label class="control-label"><span class="required">*</span>
													Country:</label>
												<div class="controls">
													<select class="input-xlarge">
														<option value="1">Afghanistan</option>
														<option value="2">Albania</option>
														<option value="3">Algeria</option>
														<option value="4">American Samoa</option>
														<option value="5">Andorra</option>
														<option value="6">Angola</option>
													</select>
												</div>
											</div>
											-----------------------------TEST--------------------------------- -->
											

											<!-- -------------------------------------------------------------- -->
										</div>
														
									</form>

									</div>
								</div>
							</div>
						</div><!-- End 구매자 회원가입 -->
						
						
						
						
						
						
						
						
						<div class="accordion-group">
							<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
								Sign up for Seller</a>
							</div>
							<div id="collapseTwo" class="accordion-body collapse">
								<div class="accordion-inner">
									<div class="row-fluid">
									<h4 class="title"><span class="text"><strong>Register</strong> Form</span></h4>
									<form action="s_register_result" method="post" id="fileForm2" role="form">
										<!-- ######################################## -->
										<!-- 왼쪽 -->
										<div class="span6">
											
											<!-- -------------------------------------------------------------- -->
											
												 
											<div class="control-group">
												<label>이름</label> 
												<div class="controls">
													<input class="input-xlarge" type="text" name="s_name" id="txt"
														required placeholder="홍길동" />
												</div>
											</div><!-- ### 완료 ###-->
											 
											<!-- -------------------------------------------------------------- -->
											
											<div class="control-group">
												<label for="s_id">아이디 &nbsp;&nbsp; 
													<span id="s_duplicationCheckResult"></span> 
												</label> 
												<div class="controls">
													<input class="input-xlarge" type="text" name="s_id"
														id="s_id" placeholder="아이디" required />
												</div>
											</div><!-- ### 완료 ###-->
											<!-- -------------------------------------------------------------- -->
											
											 <div class="control-group">
											 	<label for="s_pw">비밀번호 </label> 
											 	<div class="controls">
												 	<input required name="s_pw" type="password" class="input-xlarge"
														minlength="4" maxlength="16" id="s_pass1" placeholder="비밀번호" />
												</div>
											 </div><!-- ### 완료 ###-->
											 
											<!-- -------------------------------------------------------------- -->
											
											 <div class="control-group">
												<label for="s_pw_check">비밀번호 확인 &nbsp;&nbsp;
													<span id="s_confirmMessage"></span> 
												</label> 
												<div class="controls">
													<input required name="s_pw_check"
														type="password" class="input-xlarge" minlength="4"
														maxlength="16" placeholder="비밀번호 확인(위와 동일하게 입력하세요)" id="s_pass2"
														onkeyup="s_checkPass(); return false;" /> 
												</div>
											 </div><!-- ### 완료 ###-->

											 
											<!-- -------------------------------------------------------------- -->
											<div class="form-group">
												<label for="s_gender">성별</label> 
												<label class="radio-inline">
													<input type="radio" name="s_gender" value="1" checked>남자
												</label> 
												<label class="radio-inline">
													<input type="radio" name="s_gender" value="2">여자
												</label>
											</div> <!-- ### 완료 ###-->
											 <br>
											<!-- -------------------------------------------------------------- -->
										</div>










										<!-- ######################################## -->
										<!-- 오른쪽 -->
										<div class="span6">
										
											<!-- -------------------------------------------------------------- -->
											
											<div class="control-group">
												<label class="birth-lbl" for="s_birth">생년월일</label>
												<div class="controls">
													<input class="input-xlarge" required type="date" name="s_birth" placeholder="생년월일 ex)901214">
												</div>
											</div>										 
											<!-- -------------------------------------------------------------- -->
											
											 <div class="control-group">
											 	<label for="s_email">이메일 주소 &nbsp;&nbsp; 
											 	<!-- <small id="duplicationCheckResult2">
											 	 	유효한 이메일임을 확인하기 위해서 확인메일을 보냅니다.</small> -->
												</label>
												<div class="controls" id="s_email">
													<input required type="email" id='s_email2' name="s_email" class="input-xlarge"
														placeholder="이메일주소 입력 ">
												    <span class="input-group-btn" id="s_check">
														<button type="button" id="s_showConfirmForm">승인번호 얻기</button>
													</span>
												</div>
											 </div>
											 
											<!--
											 TODO : input text with button design 텍스트와 버튼 합치기
											 http://blog.naver.com/PostView.nhn?blogId=rwans0397&logNo=220696890907
											 -->	
												
											<!-- -------------------------------------------------------------- -->
											
											<div class="form-group" id="confirmForm_form-group">
												<label for="s_email_input">승인번호 입력 &nbsp;&nbsp; 
												<!-- <small> 이메일로 보낸 승인번호를 입력해주세요.</small> -->
														<!-- <small style="display:none;" id="check_code">hide</small> -->
														<!-- <small id="check_code">hide</small>  --><!-- ### TEST ### 빠른 인증번호 확인을 위한 코드 -->
												</label>
												<div class="controls" id="s_email_input-group">
													<input type="text" name="s_email_input" id = "s_email_input"class="input-xlarge"
														placeholder="승인번호 ex)1234 "> <span
														class="input-group-btn" id="s_email_span">
														<button type="button" name="s_email_btn" id="s_email_confirm_btn">확인</button>
													</span>
												</div>
											</div>

											<!-- -------------------------------------------------------------- -->

											<div class="control-group">
												<label for="s_zip">주소</label>
												<div class="controls">
													<input class="input-xlarge" type="text" name="s_zip"
														id="s_postcode" placeholder="우편번호를 찾으려면 클릭하세요"
														onclick="s_execDaumPostcode()" required> <br>
													<input class="input-xlarge" type="text" name="s_addr1"
														id="s_address" placeholder="지번 / 도로명주소"
														readonly="readonly" required><br> 
													<input class="input-xlarge" type="text" name="s_addr2"
														id="s_address2" placeholder="나머지 상세 주소" required>
												</div>
											</div>
											<!-- -------------------------------------------------------------- -->

											<div class="actions">
												<input tabindex="9" class="btn btn-inverse large" type="submit" value="Create your account">
											</div>
											<br>
											
										</div>
														
									</form>

									</div>
								</div>
							</div>
						</div><!-- End 판매자 회원가입 -->
						
						
						
						
						
						<!-- -------------------------------------------------------------- -->
							<div class="accordion-group">
								<div class="accordion-heading">
									<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseThree">Confirm Order</a>
								</div>
								<div id="collapseThree" class="accordion-body collapse">
									<div class="accordion-inner">
										<div class="row-fluid">
											<div class="control-group">
												<label for="textarea" class="control-label">Comments</label>
												<div class="controls">
													<textarea rows="3" id="textarea" class="span12"></textarea>
												</div>
											</div>									
											<button class="btn btn-inverse pull-right">Confirm order</button>
										</div>
									</div>
								</div>
							</div>	
							
							
							
							
							
					</div><!-- #### -->
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
						<img src="<c:url value='/resources/themes/images/logo.png' />"
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
			<span>December 2016 Web Project All right.</span>
		</section>
	</div>
	<!-- <script src="/shop01/resources/themes/js/common.js"/></script> -->
</body>
</html>