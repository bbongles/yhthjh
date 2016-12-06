<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert QnA</title>
</head>
<body>

	<form action="insertQnA" id="qnafrm" name="frmNm" method="POST" onsubmit="submit()">
		<table>
			<tr>
				<th scope="row">문의 유형 &emsp;</th>

				<td><label for="qna_type0"> <input type="radio"
						name="qna_type" id="qna_type0" value="0" checked/> 상품
				</label>

				<label for="qna_type1"> <input type="radio"
						name="qna_type" id="qna_type1" value="1" /> 배송
				</label>

				<label for="qna_type2"> <input type="radio"
						name="qna_type" id="qna_type2" value="2" /> 반품/취소
				</label>

				<label for="qna_type3"> <input type="radio"
						name="qna_type" id="qna_type3" value="3" /> 교환/변경
				</label>

				<label for="qna_type4"> <input type="radio"
						name="qna_type" id="qna_type4" value="4" /> 기타
				</label>
				
				</td>
			</tr>

			<tr>
				<th scope="row">문의 내용 &emsp;</th>
				<td><textarea rows="10" cols="80" id = "qna_cont" name="qna_cont" required></textarea></td>
			</tr>

			<tr>
				<th scope="row">답변수신 메일 &emsp;</th>
				<td><input type="text" id="qnaImail" name="b_email"
					placeholder="이메일주소 입력" />b_id를 이용해 email주소를 select받아와 자동입력기능..구현해야함</td>
			</tr>

		</table>
		
		<input type="hidden" name="b_id" value="buyer1" />
		<input type="hidden" name="p_no" value="0" />
		
		<input type="submit" id="submitQnA" value="등록" >
		<iframe id="ifrm" name = "ifrm" style="display: none;"></iframe>

	</form>
	
	<button type="button" id = "btn_submit" >닫기</button>
	
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>

		$(document).ready(function() {
			
			$('#submitQnA').click(function() {

/* 				 document.forms['frmNm'].submit(true);
				 window.opener.location.reload();
				 self.close(); */
				// $('#qnafrm').submit();
				/*  send();
				 if(send() == true) {
					 window.open('','_self').close();
				 } */
				jQuery('#qnafrm').submit();
				 window.close();
			})
			
			function send(){
				jQuery('#qnafrm').submit();
				return true;
			}
			
			$('#btn_submit').click(function() {
				/*window.close(); */
				 document.forms['frmNm'].submit();
				 window.opener.location.reload();
				 window.open('','_self').close();
			})
		});
	</script>
</body>
</html>