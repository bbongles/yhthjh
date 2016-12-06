<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 

<link href="//netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="../resources/build/imgur.min.css" rel="stylesheet" media="screen">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="../resources/build/imgur.min.js"></script>

<title>상품 등록</title>

<style>
label {
	display: inline-block;
	width: 100px;
	margin-left: 10px;
}
h1, h3, table {
	margin-left: 10px;
}
.i_set {
	margin-bottom: 5px;
}
#p_img {
	width:478px;
	margin-left: 10px;
}
#i_img {
	width:478px;
}
textarea {
	margin-bottom: 10px;
	width:478px;
}

.col-md {
	max-width: 500px
}
</style>

</head>
<body>

	<h1>새 상품 등록</h1>

	<hr/>

	<form action="pRegister" method="post">

		<h3>기본 정보</h3>

		<!-- hidden type으로 입력될 값들... 판매자 이름은 로그인 정보와 합친 후 수정  -->
		<!-- 판매자 이름 -->
		<input type="hidden" name="s_id" value="seller1" />
		<!-- 관심상품 -->
		<input type="hidden" name="p_favo" value="0" />
		<!-- 판매량 -->
		<input type="hidden" name="p_sale_cnt" value="0" />

		<!-- 카테고리 -->
		<label>카테고리</label> 
		<select name="p_cate1" id="p_cate1">
			<option value="none">--------</option>
			<option value="homedeco">홈/데코</option>
			<option value="candlediffu">캔들/디퓨저</option>
			<option value="artfancy">아트/팬시</option>
			<option value="jewelry">쥬얼리</option>
		</select> <select name="p_cate2" id="p_cate2">
			<option value="none">--------</option>
		</select><br/>

		<!-- 상품명 -->
		<label>상품명</label> <input type="text" name="p_name" required /><br/>

		<!-- 상품가격 -->
		<label>상품가격</label> <input type="number" name="p_price" required /><br/>

		<!-- 상품재고량 -->
		<label>상품재고량</label> <input type="number" name="p_stock" required /><br/>

		<!-- 할인율 -->
		<label>할인율</label> <input type="number" name="p_dis_rate" value="0" /><br/>

		<!-- 옵션 -->
		<label>옵션</label>
		<button id="addOption" type="button">추가</button>
		<button id="delOption" type="button">삭제</button>

		<table id="optionTable">
			<tr>
				<td><input type="text" name="o_title" placeholder="옵션제목" /></td>
				<td><input type="text" name="o_cont" placeholder="옵션내용" /></td>
				<td><input type="number" name="o_stock" placeholder="옵션재고" value="0" /></td>
			</tr>
			<tbody></tbody>
		</table>

		<hr/>

		<h3>이미지 정보</h3>
		
		<!-- 이미지 -->
		<label>이미지</label>
		<button id="addImage" type="button">추가</button>
		<button id="delImage" type="button">삭제</button>
		
		<div class="col-md">
			<div class="dropzone"></div>
		</div>
		
		<br/>
		
		<label>대표 이미지</label><br/>
		<input type="text" class="i_set" id="p_img" name="p_img" placeholder="상품의 대표 이미지 URL을 넣어주세요..."/><br/>
		
		<label>상세 이미지</label><br/>
		<table id="imageTable">
			<tr>
				<td>
					<input type="text" class="i_set" id="i_img" name="i_img" placeholder="각 이미지의 URL을 넣어주세요..."/><br/>
					<textarea rows="5" cols="65" class="i_set" name="i_cont" placeholder="이미지에 대한 설명을 넣어주세요..."> </textarea>
				</td>
			</tr>
			<tbody></tbody>
		</table>

		<hr/>

		<input type="submit" value="등록" style="margin-left: 10px; margin-bottom: 20px;" /> 
		<input type="reset" value="취소" />

	</form>

	<script>
		$(function() {
			$("select[name=p_cate1]").change(function() {
				var temp = $("select[name=p_cate2]");
				var p_cate1 = $(this).val();
				temp.children().remove();
				temp.append('<option value="none">--------</option>');

				if (p_cate1 == 'homedeco') {
					temp.append('<option value="furni">가구</option>');
					temp.append('<option value="cera">도자기</option>');
					temp.append('<option value="lamp">조명</option>');
				}

				if (p_cate1 == 'candlediffu') {
					temp.append('<option value="candle">캔들</option>');
					temp.append('<option value="diffu">디퓨저</option>');
					temp.append('<option value="aroma">아로마오일</option>');
				}

				if (p_cate1 == 'artfancy') {
					temp.append('<option value="pic">사진</option>');
					temp.append('<option value="fancy">문구</option>');
					temp.append('<option value="paper">페이퍼</option>');
				}

				if (p_cate1 == 'jewelry') {
					temp.append('<option value="ear">귀걸이</option>');
					temp.append('<option value="neck">목걸이</option>');
					temp.append('<option value="ring">반지</option>');
				}

			});
		});

		// 옵션 양식 추가 및 삭제
		$(function() {
			$('#addOption').click(function() {
				$('#optionTable > tbody:last').append('<tr><td><input type="text" name="o_title" placeholder="옵션제목" /></td>'
									+ '<td><input type="text" name="o_cont" placeholder="옵션내용" /></td>'
									+ '<td><input type="number" name="o_stock" placeholder="옵션재고" value="0" /></td></tr>');
			});

			$('#delOption').click(function() {
				$('#optionTable > tbody:last > tr:last').remove();
			});

		});
		
		// 이미지 양식 추가 및 삭제
		$(function() {
			$('#addImage').click(function() {
				$('#imageTable > tbody:last').append('<tr><td><input type="text" class="i_set" id="i_img" name="i_img" placeholder="각 이미지의 URL을 넣어주세요..."/><br/>' 
									+ '<textarea rows="5" cols="65" class="i_set" name="i_cont" placeholder="이미지에 대한 설명을 넣어주세요..."> </textarea></td></tr>');
			});
			
			$('#delImage').click(function() {
				$('#imageTable > tbody:last > tr:last').remove();
			});
		});
		
		// 이미지 관련 처리
		var feedback = function(res) {
			if (res.success === true) {
				document.querySelector('.status').classList.add('bg-success');
				document.querySelector('.status').innerHTML = res.data.link;
			}
		};

		new Imgur({
			clientid : '7ff152b0e154c31', /* http://imgur.com/ 에서 아이디를 만들어 발급했음  */
			callback : feedback
		// TODO: 사진을 업로드하면 사진은 imgur서버상에 존재... 그러나 웹 사이트 계정에선 확인 불가...
		});

	</script>

</body>
</html>