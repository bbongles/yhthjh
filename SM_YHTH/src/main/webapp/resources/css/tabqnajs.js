/**
 * 
 */

$(document).ready(function() {
	
			$('#btnInsert').click(function() {
				//location = "insertQnA";
				//var url = "?p_no=" + ${productVO.p_no};
				var p_no = $('#detail_p_no').val();
				var b_id = $('#b_id').val();
				window.open("insertQnA?p_no="+p_no+"&b_id="+b_id,"newWindow","width=800, height=300, left=150, top=150");
				
			});
			
/*			$('#btnReviewInsert').click(function() {
				//location = "insertReview";
				var p_no = $('#detail_p_no').val();
				var b_id = $('#b_id').val();
				
				window.open("insertReview?p_no="+128+"&b_id="+aaaa,"newWindow","width=800, height=300, left=150, top=150");
			});
	*/
			
			$('#insertReply').click(function() {
				var x = $(this).parent().attr('modData');
				var frm = $('#frm'+x);
 				frm.attr('action', 'insertReply');
				frm.attr('mehtod', 'post');
				frm.submit();
				
			});
			
			$('.updateReply').click(function () {
				/* $('#replyCont').attr("readonly",false); */
				var x = $(this).parent().attr('modData');
				alert("답변 내용 수정 가능! 완료 버튼 활성화")
				$('#replyCont'+x).attr("readonly", false);
				$('#replyCont'+x).attr("required", true);
				$('.updateReply1').show();
				$(this).hide();
			});
			
			$('.updateReply1').click(function() {
				var x = $(this).parent().attr('modData');
				var frm = $('#updatefrm'+x);
				frm.attr('action', 'updateReply');
				frm.attr('mehtod', 'post');
				frm.submit();

			})
			
			$('.qnaDetail').click(function () {
				var x = $(this).attr('modData');
				
				$('.modify'+x).toggle();
					
			});
			
			$('.deleteReply').click(function() {
				var x = $(this).parent().attr('modData');
				var frm = $('#updatefrm'+x);
				frm.attr('action', 'deleteReply');
				frm.attr('mehtod', 'post');
				frm.submit();
				
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