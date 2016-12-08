/**
 * 
 */

$(document).ready(function() {

		$('#btnReviewInsert').click(function() {
			//location = "insertReview";
			var p_no = $('#pno').val();
			var b_id = $('#bno').val();
			window.open("../seller/insertReview?p_no="+p_no+"&b_id="+b_id,"newWindow","width=800, height=300, left=150, top=150");
		});
		
		$('.insertrevReply').click(function() {
			var x = $(this).parent().attr('modData');
			
			var url = 'insertrevReply';
			var rev_r_cont = $('#rev_r_cont'+x).val();
		    var s_id = $('#s_id'+x).val();
		    var p_no = $('#p_no'+x).val();
		    var rev_no = $('#rev_no'+x).val();
		    
			  $.ajax({
		          type:'post',
		          url : url,
		          headers:{
		             'Content-Type': 'application/json',
		             'X-HTTP-Method-Override': 'POST'
		          },
		           data: JSON.stringify({
		        	   rev_r_cont: rev_r_cont,
		        	   s_id: s_id,
		        	   p_no: p_no,
		        	   rev_no: rev_no
		        	   
		            }), 
		           success: function(result) {
		        	   if(result == 1) {
		        		  location.reload();
		        		  alert('답변 등록 성공!');
		        	   } else{
		        		  location.reload();
		        		  alert('답변 등록 실패.');
		        	   }
		           }
		       });s
			
		});
		
		$('.revReply').click(function () {
			var x = $(this).attr('modData');
			$('#revmodify'+x).toggle();
				
		});
		
		
		$('.updateRevReply').click(function () {
			/* $('#replyCont').attr("readonly",false); */
			var x = $(this).parent().attr('modData');
			alert("답변 내용 수정 가능! 완료 버튼 활성화")
			$('#rev_r_cont'+x).attr("readonly", false);
			$('#rev_r_cont'+x).attr("required", true);
			$('#updateRevReply1'+x).show();
			$(this).hide();
		});
		
		$('.updateRevReply1').click(function() {
			var x = $(this).parent().attr('modData');
			
			var url = 'updaterevReply';
			var rev_r_cont = $('#rev_r_cont'+x).val();
		    var rev_r_no = $('#rev_r_no'+x).val();
		    var s_id = $('#s_id'+x).val();
		    var p_no = $('#p_no'+x).val();
		    var rev_no = $('#rev_no'+x).val();
		    
			  $.ajax({
		          type:'post',
		          url : url,
		          headers:{
		             'Content-Type': 'application/json',
		             'X-HTTP-Method-Override': 'POST'
		          },
		           data: JSON.stringify({
		        	   rev_r_cont: rev_r_cont,
		        	   rev_r_no: rev_r_no,
		        	   s_id: s_id,
		        	   p_no: p_no,
		        	   rev_no: rev_no
		        	   
		            }), 
		           success: function(result) {
		        	   if(result == 1) {
		        		  location.reload();
		        		  alert('답변 수정 성공!');
		        	   } else{
		        		  location.reload();
		        		  alert('답변 수정 실패.');
		        	   }
		           }
		       });
		})
		
		$('.deleteRevReply').click(function() {
			var x = $(this).parent().attr('modData');
			
			var url = 'deleterevReply';
			var rev_r_cont = $('#rev_r_cont'+x).val();
		    var rev_r_no = $('#rev_r_no'+x).val();
		    var s_id = $('#s_id'+x).val();
		    var p_no = $('#p_no'+x).val();
		    var rev_no = $('#rev_no'+x).val();
		    
			  $.ajax({
		          type:'post',
		          url : url,
		          headers:{
		             'Content-Type': 'application/json',
		             'X-HTTP-Method-Override': 'POST'
		          },
		           data: JSON.stringify({
		        	   rev_r_cont: rev_r_cont,
		        	   rev_r_no: rev_r_no,
		        	   s_id: s_id,
		        	   p_no: p_no,
		        	   rev_no: rev_no
		        	   
		            }), 
		           success: function(result) {
		        	   if(result == 1) {
		        		  location.reload();
		        		  alert('답변 삭제 성공!');
		        	   } else{
		        		  location.reload();
		        		  alert('답변 삭제 실패.');
		        	   }
		           }
		       });
		});
	
	var frm = $('#pageForm');

	// 클래스 pageLinks 안의 li 태그 안의 a 태그를 찾아서 click 이벤트를 커스터마이징
	$('.pageLinks li a').click(function() {
		event.preventDefault(); // 기본 이벤트 처리 방식을 방지(막음)
		// pageForm 안에 있는 name="page"인 요소를 찾아서
		// 이동할 페이지 번호를 세팅
		var targetPage = $(this).attr('href');
		console.log('targetPage=' + targetPage);
		frm.find('[name="page"]').val(targetPage);
		// 페이징 화면으로 보내기 위한 action 정보
		frm.attr('action', 'review');
		// 페이징 화면을 처리하는 Controller의 method(요청 처리 방식)
		frm.attr('method', 'get');
		// 폼 양식을 서버로 전송
		frm.submit();
	});		
})