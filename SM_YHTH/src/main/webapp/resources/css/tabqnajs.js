/**
 * 
 */

$(document).ready(function() {
	
			$('#btnInsert').click(function() {
				//location = "insertQnA";
				var p_no = $('#detail_p_no').val();
				//var b_id = $('#b_id').val();
				var b_id = 'test';
				window.open("../seller/insertQnA?p_no="+p_no+"&b_id="+b_id,"newWindow","width=800, height=300, left=150, top=150");
				
			});
			
			$('.insertReply').click(function() {
				var x = $(this).parent().attr('modData');

				var url = 'insertReply';
				var qna_r_cont = $('#qna_r_cont'+x).val();
			    var s_id = $('#s_id'+x).val();
			    var p_no = $('#p_no'+x).val();
			    var qna_no = $('#qna_no'+x).val();
			    
				  $.ajax({
			          type:'post',
			          url : url,
			          headers:{
			             'Content-Type': 'application/json',
			             'X-HTTP-Method-Override': 'POST'
			          },
			           data: JSON.stringify({
			        	   qna_r_cont: qna_r_cont,
			        	   s_id: s_id,
			        	   p_no: p_no,
			        	   qna_no: qna_no
			        	   
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
			       });
				
			});
			
			$('.updateReply').click(function () {
				/* $('#replyCont').attr("readonly",false); */
				var x = $(this).parent().attr('modData');
				alert("답변 내용 수정 가능! 완료 버튼 활성화")
				$('#qna_r_cont'+x).attr("readonly", false);
				$('#qna_r_cont'+x).attr("required", true);
				$('#updateReply1'+x).show();
				$(this).hide();
			});
			
			$('.updateReply1').click(function() {
				var x = $(this).parent().attr('modData');

				var url = 'updateReply';
				var qna_r_cont = $('#qna_r_cont'+x).val();
			    var qna_r_no = $('#qna_r_no'+x).val();
			    var s_id = $('#s_id'+x).val();
			    var p_no = $('#p_no'+x).val();
			    var qna_no = $('#qna_no'+x).val();
			    
				  $.ajax({
			          type:'post',
			          url : url,
			          headers:{
			             'Content-Type': 'application/json',
			             'X-HTTP-Method-Override': 'POST'
			          },
			           data: JSON.stringify({
			        	   qna_r_cont: qna_r_cont,
			        	   qna_r_no: qna_r_no,
			        	   s_id: s_id,
			        	   p_no: p_no,
			        	   qna_no: qna_no
			        	   
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
			
			
			$('.qnaDetail').click(function () {
				var x = $(this).attr('modData');
				
				$('.modify'+x).toggle();
					
			});
			
			$('.deleteReply').click(function() {
				var x = $(this).parent().attr('modData');
/*				var frm = $('#updatefrm'+x);
				frm.attr('action', 'deleteReply');
				frm.attr('mehtod', 'post');
				frm.submit();*/
				var url = 'deleteReply';
				var qna_r_cont = $('#qna_r_cont'+x).val();
			    var qna_r_no = $('#qna_r_no'+x).val();
			    var s_id = $('#s_id'+x).val();
			    var p_no = $('#p_no'+x).val();
			    var qna_no = $('#qna_no'+x).val();
			    
				  $.ajax({
			          type:'post',
			          url : url,
			          headers:{
			             'Content-Type': 'application/json',
			             'X-HTTP-Method-Override': 'POST'
			          },
			           data: JSON.stringify({
			        	   qna_r_cont: qna_r_cont,
			        	   qna_r_no: qna_r_no,
			        	   s_id: s_id,
			        	   p_no: p_no,
			        	   qna_no: qna_no
			        	   
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
			
			if ('${insert_reply}' == 'success') {
				alert('답변 등록 성공');
			} else if ('${insert_reply}' == 'fail') {
				alert('답변 등록  실패!');
			}
			
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
			frm.attr('action', 'qna');
			// 페이징 화면을 처리하는 Controller의 method(요청 처리 방식)
			frm.attr('method', 'get');
			// 폼 양식을 서버로 전송
			frm.submit();
		});
		
		$(document).ready(function() {
			$(function () {

			    $(".tab_content").hide();
			    $(".tab_content:first").show();

			    $("ul.tabs li").click(function () {
			        $("ul.tabs li").removeClass("active").css("color", "#333");
			        //$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
			        $(this).addClass("active").css("color", "darkred");
			        $(".tab_content").hide()
			        var activeTab = $(this).attr("rel");
			        $("#" + activeTab).fadeIn()
			    });
			});	
		})