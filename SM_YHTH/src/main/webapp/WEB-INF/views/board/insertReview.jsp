<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert Rev</title>
<style>
.star_rating {font-size:0; letter-spacing:10px;}
.star_rating label {
    font-size:22px;
    letter-spacing:0;
    display:inline-block;
    margin-left:5px;
    color:#ccc;

}
/* .star_rating a {
    font-size:22px;
    letter-spacing:0;
    display:inline-block;
    margin-left:5px;
    color:#ccc;
    text-decoration:none;
} */
.star_rating label:first-child {margin-left:0;}
.star_rating label.on {color:rgb(238, 11, 51);}

#qna_type0, #qna_type1, #qna_type3, #qna_type2, #qna_type4 {
	display: none;
}

</style>
</head>
<body>

	<form action="insertReview" id="frm" method="POST">
		<table>
			<tr>
				<th scope="row">구매 상품</th>
				<td>
				<label>상품대표이미지 &emsp; &emsp; &emsp;</label>
				<label>구매한상품명과 옵션출력</label>
				</td>
			</tr>
			
			<tr>
				<th scope="row">상품 평가 &emsp;</th>

				<td class="star_rating" >
				
				<label for="qna_type0" > <input type="radio"
						name="rev_score" id="qna_type0" value="1" />★
				</label>

				<label for="qna_type1" > <input type="radio"
						name="rev_score" id="qna_type1" value="2" />★
				</label>

				<label for="qna_type2" > <input type="radio"
						name="rev_score" id="qna_type2" value="3" />★
				</label>

				<label for="qna_type3"> <input type="radio"
						name="rev_score" id="qna_type3" value="4" />★
				</label>

				<label for="qna_type4"> <input type="radio"
						name="rev_score" id="qna_type4" value="5" />★
				</label> 
				
				</td>
			</tr>

			<tr>
				<th scope="row">후기 내용 &emsp;</th>
				<td><textarea rows="5" cols="60" id = "rev_cont" name="rev_cont" required></textarea></td>
			</tr>

		</table>
		
<!-- 		<input type="hidden" name="qna_no" value="0" /> -->
		<input type="hidden" name="b_id" value="buyer1" />
		<input type="hidden" name="p_no" value="0" />
<!-- 		<input type="hidden" name="qna_reply" value = "0" /> -->
		
			<input type="submit" id="btn_submit" value="등록">
			<button type="button" id="btn_close">닫기</button>

	</form>
	
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>
	$(document).ready(function() {

		$( ".star_rating label" ).click(function() {
		     $(this).parent().children("label").removeClass("on");
		     $(this).addClass("on").prevAll("label").addClass("on");
		     $(this).children('input').checked();

		     //alert($("a[class^=on]").length);
		     return false;
		});
		
		
 		$('#btn_submit').click(function() {;
 			submit();
 		})
		 
		$('#btn_close').click(function() {
			window.close();
		})
		
	})
	
	</script>
</body>
</html>