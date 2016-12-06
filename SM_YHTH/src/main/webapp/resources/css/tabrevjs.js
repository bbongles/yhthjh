/**
 * 
 */

		
		$('#btnReviewInsert').click(function() {
			//location = "insertReview";
			var p_no = $('#pno').val();
			var b_id = $('#bno').val();
			//alert('p_no'+p_no+'/'+b_id);
			window.open("insertReview?p_no="+p_no+"&b_id="+b_id,"newWindow","width=800, height=300, left=150, top=150");
		});
		
		$('.insertReply').click(function() {
			var x = $(this).parent().attr('modData');
			var frm = $('#revfrmmodify'+x);
			frm.attr('action', 'insertrevReply');
			frm.attr('mehtod', 'post');
			frm.submit();
			
		});
		
		$('.revReply').click(function () {
			var x = $(this).attr('modData');
			$('#revmodify'+x).toggle();
				
		});
		
		
		$('.updateRevReply').click(function () {
			/* $('#replyCont').attr("readonly",false); */
			var x = $(this).parent().attr('modData');
			alert("답변 내용 수정 가능! 완료 버튼 활성화")
			$('#revreplyCont'+x).attr("readonly", false);
			$('.updateRevReply1').show();
			$(this).hide();
		});
		
		$('.updateRevReply1').click(function() {
			var x = $(this).parent().attr('modData');
			var frm = $('#updaterevfrm'+x);
			frm.attr('action', 'updaterevReply');
			frm.attr('mehtod', 'post');
			frm.submit();
		})
		
		$('.deleteRevReply').click(function() {
			var x = $(this).parent().attr('modData');
			var frm = $('#updaterevfrm'+x);
			frm.attr('action', 'deleterevReply');
			frm.attr('mehtod', 'post');
			frm.submit();
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

		if ('${insert_review_reply}' == 'success') {
			alert('답변 등록 성공');
		} else if ('${insert_review_reply}' == 'fail') {
			alert('답변 등록  실패!');
		}