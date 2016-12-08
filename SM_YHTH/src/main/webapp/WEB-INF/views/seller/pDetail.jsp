<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<c:url value='/resources/css/tabqr.css' />" rel="stylesheet">
<title>상품 상세페이지</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<script>
$(document).ready(function(){
	if ("${optionList }"!="[]"){
		 $('#optionNullCheck').show();	
    	}
    })
</script>

	<style>
	.preview {
		width: 300px;
		height: 230px;
	}
	.thumb {
		width: 90.7px;
		height: 81px;
		margin-right: 3px;
	}
	.normal {
		border:3px solid gray;
	}
	.selected {
		border:3px solid gray;
	}
	.detailInfo {
		width: 400px;
		height: 330px;
		float: left;
		
	}
	#coveringBox {
		width: 1360px;
		margin: 0 auto;
		display: inline-block;
	}
	.locationSet {
		display: inline-block;
		margin-left: 300px;
	}
	.sellerLogo {
		float: left;
		width: 150px;
		height: 150px;
	}
	#logoImg {
		width: 150px;
		height: 150px;
	}
	#imageDetailInfo {
		width: 1260px;
		margin: 0 auto;
	}
	.detailImg {
		width: 800px;
		height: 600px
	}
	.detailCont {
		text-align: center;
		margin: 0 auto;
		border: none;
		overflow: hidden;
		wrap: soft;
		resize: none;
	}
	#contentList {
		width: 1260px;
		margin: 0 auto;
		display: inline-block;
	}
	#detailMenu {
		width: 1260px;
		margin: 0 auto;
	}
	.modify {
	display: none;
}
.qnaDetail {
	border: none;
	
}
.pageLinks li {
	display: inline;
}

.star_rating {font-size:0; letter-spacing:0px;}
.star_rating a {
    font-size:22px;
    letter-spacing:0;
    display:inline-block;
    margin-left:5px;
    color:#ccc;
}

.star_rating a:first-child {margin-left:0;}
.star_rating a.on {color:rgb(238, 11, 51);}

.star_rating {font-size:0; letter-spacing:0px;}
.star_rating a {
    font-size:22px;
    letter-spacing:0;
    display:inline-block;
    margin-left:5px;
    color:#ccc;
}

.star_rating a:first-child {margin-left:0;}
.star_rating a.on {color:rgb(238, 11, 51);}
	</style>

</head>
<body>

	<h1>상품 상세페이지</h1>
	
	<br/>
	
	<form id="frm" action="/shop/cart/insertCart" method="get">
	<input type="hidden" value="${b_login_id}" name="b_id" id="b_id"> <!-- 회원가입/로그인 통합 후 세션으로 구매자 아이디 받아오기!! -->
	<input type="hidden" name="p_no" id="detail_p_no" value="${productVO.p_no }" /> 
	<div id="coveringBox">
		<div class="locationSet">
			<div class="detailInfo">
				<img id="big"  class="preview normal" src="${productVO.p_img }" alt="preview" onclick="showPopup"><br/>
				<input type="hidden" name="p_img" value="${productVO.p_img }" />
				<c:forEach var="imageList" items="${imageList }" end="2">
				<img id="small" class="thumb normal" src="${imageList.i_img }" onmouseover="preview(this)">
				</c:forEach>
			</div>
	
			<div class="detailInfo">   
    			<input type="hidden" name="s_id" value="${productVO.s_id }" />
    			<input type="text" name="s_id" value="${productVO.s_id }" />
    			
    			<input type="hidden" id="queryForPList" value="${productVO.s_id }"/>
    			<input type="hidden" name="s_id" value="${productVO.s_id }" />
    			
    			<span>상품명 : </span>
    			${productVO.p_name }<br/><br/>
    			<input type="hidden" name="p_name" value="${productVO.p_name }" />
    			<span>상품가 : </span>
    			${productVO.p_price } 원<br/><br/>
    			<input type="hidden" name="p_price" value="${productVO.p_price }" />
    			<span>구매량 : </span>
    			<input type="number" name="buy_cnt" value="1" /> 개<br/><br/>
    			<div id="optionNullCheck" style="display: none;">
    			<span>옵션 : </span>
    	
    			<!-- 해당 상품의 옵션 정보를 뿌려줘야 함 -->
    			<select>
    				<option value="none">--------</option>
    				<c:forEach var="optionList" items="${optionList}" end="0">
    				<option>${optionList.o_title }</option>
    				</c:forEach>
    			</select>
    			<select name="o_cont">
    				<option value="none">--------</option>
    				<c:forEach var="optionList" items="${optionList }">
    				<option>${optionList.o_cont }</option>
    				
    				</c:forEach>
    			</select>
    			</div>
    			<br/><br/>
    			<input type="submit" value="장바구니 담기">
    			<input type="button" value="바로 구매" id="directOrder">
    		</div>
    		<div class="sellerLogo">
    			<img id="logoImg" src="${sVo.s_logo }" />
    		</div>
    	</div>    
    </div><br/>
 
    <div id="imageDetailInfo">
    	<br/><hr/>
    	
    	<h3>이미지 정보</h3>
    	<c:forEach var="imageList" items="${imageList }">
    		<div style="text-align: center;" id="contentList">
    			<img src="${imageList.i_img }" class="detailImg" /><br/><br/>
    			<textarea cols="65" rows="5" class="detailCont" readonly>${imageList.i_cont }</textarea><br/><br/><br/>
    		</div>
    	</c:forEach>
    </div><br/>
    <hr/><br/>

	</form>
	
	<div id="container">
    <ul class="tabs">
        <li class="active" rel="tab1">Q&A</li>
        <li rel="tab2">상품후기</li>
        <li rel="tab3">제품정보</li>
    </ul>
    <div class="tab_container">
        <div id="tab1" class="tab_content">
			<table>
				<tr>
					<th>문의유형&emsp;</th>
					<th>답변여부&emsp;</th>
					<th>문의/답변&emsp;</th>
					<th>작성자&emsp;</th>
					<th>작성일&emsp;</th>
				</tr>
	
				<c:forEach var="list" items="${listQnA }" varStatus="state">
					<tr>
						<c:if test="${list.qna_type eq 0 }">
							<td>상품</td>
						</c:if>
						<c:if test="${list.qna_type eq 1 }">
							<td>배송</td>
						</c:if>
						<c:if test="${list.qna_type eq 2 }">
							<td>반품/취소</td>
						</c:if>
						<c:if test="${list.qna_type eq 3 }">
							<td>교환/변경</td>
						</c:if>
						<c:if test="${list.qna_type eq 4 }">
							<td>기타</td>
						</c:if>
						<c:if test="${list.qna_reply eq 0 }">
							<td>답변 대기&emsp;</td>
						</c:if>
						<c:if test="${list.qna_reply eq 1 }">
							<td>답변 완료&emsp;</td>
						</c:if>
						
						<td class="replies" repData="${state.index }">
						
						&emsp;&emsp;&emsp;<b>구매자 문의</b><br/>
	
						<input type="text" class ="qnaDetail" value= "${list.qna_cont }" modData="${state.index }" 
	 						onMouseover="this.style.color='blue';" onMouseout="this.style.color='black';" 
							style="text-decoration:underline" readonly/>
						
						<br/>
						
						<c:if test="${list.qna_reply eq 0 }">
						
							<div class="modify${state.index }" modData="${state.index }" style="display: none;">
							
							<form id = "frm${state.index }" method="post">
							&emsp;&emsp;&emsp;<b>판매자 답변</b><br/>
								<textarea cols="25" rows="3" name="qna_r_cont" id="replyCont"
									placeholder="답변내용입력" required></textarea>
								
								<input type="hidden" name="s_id" id="s_id" value="sellerId" />
								<input type="hidden" name="p_no" id="p_no" value="${productVO.p_no}" /> 
								<input type="hidden" name="qna_no" id="qna_no" value="${list.qna_no }" />
								</form>						
							<button type="submit" id="insertReply">저장</button>	
							</div>
	
						</c:if>
						
						<c:if test="${list.qna_reply eq 1 }">
						<c:forEach var="listr" items="${listQnAR }" >
						<c:if test="${list.qna_no eq listr.qna_no }">
						
							<div class="modify${state.index }" modData="${state.index }" style="display: none;">
							
							<form id = "updatefrm${state.index }" method="post">
							&emsp;&emsp;&emsp;<b>판매자 답변</b><br/>
							
								<textarea cols="25" rows="3" id = "replyCont${state.index }" name = "qna_r_cont" readonly>${listr.qna_r_cont }</textarea>
								<input type="hidden" name="qna_r_no" id="qna_r_no" value="${listr.qna_r_no }"/>
								<input type="hidden" name="s_id" id="s_id" value="${listr.s_id }" /> 
								<input type="hidden" name="p_no" id="p_no" value="${productVO.p_no}" /> 
								<input type="hidden" name="qna_no" id="qna_no" value="${listr.qna_no }" />
							</form>
							<button type="submit" class="updateReply">수정</button>
							<button type="submit" class="updateReply1" style="display: none;">수정완료</button>
							<button type="submit" class="deleteReply">삭제</button>
							</div>
							</c:if>
							</c:forEach>
						</c:if>
						<br/>
						</td>
	
						<td>${list.b_id }</td>
						<td><fmt:formatDate value="${list.qna_reg }"
								pattern="yyyy년 MM월 dd일" />&emsp;&emsp;</td>
					</tr>
				</c:forEach>
			</table>
				<input type="hidden" name="pno" value="${productVO.p_no}">
				<button id="btnInsert">상품 문의</button>
		
		<!-- 페이지 링크  -->
		<ul class="pageLinks">
				<c:if test="${pageMaker.hasPrev }">
					<li id="page"><a href="${pageMaker.startPageNum - 1 }">&laquo;이전</a></li>
				</c:if>
	
				<c:forEach begin="${pageMaker.startPageNum }"
					end="${pageMaker.endPageNum }" var="num">
					<li id="page"><a href="${num }">${num }</a></li>
				</c:forEach>
	
				<c:if test="${pageMaker.hasNext }">
					<li id="page"><a href="${pageMaker.endPageNum + 1 }">다음&raquo;</a></li>
				</c:if>
	
			</ul>
	
			<%-- 현재 페이지, 페이지 당 보여줄 게시글 개수를 서버로 보내주기 위해서, 
		사용자에게는 보이지 않지만, 서버로 보낼 정보를 양식 데이터로 저장하는 form --%>
			<form id="pageForm">
	
				<input type="hidden" name="page" value="${pageMaker.criteria.page }" />
				<input type="hidden" name="perPage" value="${pageMaker.criteria.perPage }" />
			</form>
	  </div> <!-- #tab1 -->
        
        <div id="tab2" class="tab_content">
        	<table>
			<tr>
				<th>별점&emsp;</th>
				<th>작성자&emsp;</th>
				<th>작성일&emsp;</th>
			</tr>
			
			<c:forEach var="list" items="${listRev }" varStatus="state">
			<tr>		
			<td>
				<p class="star_rating" >
				
					 <c:forEach begin="1" end="${list.rev_score }" var="item">
					 <a class="on" name = "rev_score">★</a>
					 </c:forEach>
					 
					 <c:forEach begin="${list.rev_score }" end="4" var="item2">
					 <a name = "rev_score">★</a>
					 </c:forEach>
					 
				</p>
			</td>
			
				<td>${list.b_id }</td>
				<td><fmt:formatDate value="${list.rev_reg }"
					pattern="yyyy년 MM월 dd일" />&emsp;&emsp;</td>
			</tr>
			
			<tr>
			<td><b>${list.rev_cont }</b></td>
			</tr>
			
			<tr class ="revReply" modData="${state.index }">
			<th style="text-decoration: underline;" onMouseover="this.style.color='blue';" onMouseout="this.style.color='black';">판매자 답글</th>
			</tr>

			<tr>
				<td class="modify" id="revmodify${state.index }" modData="${state.index }">
					
					<c:if test="${list.rev_reply eq 0 }">
						<div modData="${state.index }">
						<form id="revfrmmodify${state.index }" method="post" >
							<input type="text" name="rev_r_cont" placeholder="답글작성" maxlength="100" required/>
							
							<input type="hidden" name="rev_no" value="${list.rev_no}"/>
							<input type="hidden" name="s_id" value="sellerId1"/>
							<input type="hidden" name="p_no" id="p_no" value="${productVO.p_no}" /> 
						</form>
						
						<button type="submit" class="insertReply">저장</button>
						</div>
					</c:if>
					
					<c:if test="${list.rev_reply eq 1 }">
						<c:forEach var="listr" items="${listReply}">
						<c:if test="${list.rev_no eq listr.rev_no }">
						
						<div modData="${state.index }">
						<form id = "updaterevfrm${state.index }" method="post">
							<input type="text" id="revreplyCont${state.index }" name="rev_r_cont" 
							maxlength="100" value="${listr.rev_r_cont }" 
							readonly style="border: none; color:maroon;"/>
							<input type="hidden" name="rev_r_no" id="rev_r_no" value="${listr.rev_r_no }"/>
							<input type="hidden" name="s_id" id="s_id" value="${listr.s_id }" /> 
							<input type="hidden" name="p_no" id="p_no" value="${productVO.p_no}" /> 
							<input type="hidden" name="rev_no" id="rev_no" value="${listr.rev_no }" />
						</form>
						
						<button type="submit" class="updateRevReply">수정</button>
						<button type="submit" class="updateRevReply1" style="display: none;">수정완료</button>
						<button type="submit" class="deleteRevReply">삭제</button>
						</div>
						</c:if>
						</c:forEach>
					</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
			<input type="hidden" id="pno" value="${productVO.p_no }">
			<input type="hidden" id="bno" value="aaaa">
			<button type="button" id="btnReviewInsert">후기 작성</button>
	
        </div> <!-- #tab2 -->
        
        <div id="tab3" class="tab_content">
       		 제품 정보 입니다.
        </div> <!-- #tab3 -->
        
    </div>
    <!-- .tab_container -->
</div>
<!-- #container -->
	
	<br/><br/>
	<div>관련 상품</div>
    <c:forEach var="relativeList" items="${relativeList}">
    	<div style="text-align: center">
    	<img src="${relativeList.p_img}" class="preview">
    	</div> 
    </c:forEach>
	
	<div id="detailMenu">
    	<input type="button" id="delProduct" value="상품삭제" />
    	<input type="button" id="gotoList" value="목록으로" />
    </div>
    <br/>
	
	<script>
    var lastImg = 'small'; //Set initial thumbnail and preview
    document.getElementById('big').src = document.getElementById(lastImg).src;
    document.getElementById(lastImg).className = "thumb selected";

    function preview(img) {
        document.getElementById(lastImg).className = "thumb normal";
        img.className = "thumb selected";
        document.getElementById('big').src = img.src;
        lastImg = img.id
    }
    
    $('#delProduct').click(function() {
    	var result = confirm('정말 삭제하시겠습니까?');
    	if (result == true) {
    		$('#frm').attr('action', 'pDelete');
    		$('#frm').attr('method', 'post');
    		$('#frm').submit();
    	}
    });
    
    $('#gotoList').click(function() {
    	location = 'main';
    });
    
    $('#directOrder').click(function(){
		$('#frm').attr('action', '/shop/cart/insertCertForDirect');
		$('#frm').attr('method', 'post');
		$('#frm').submit();
    });
    
    $('#logoImg').click(function() {
    	var queryForPList = $("#queryForPList").val();
    	location = 'pList?s_id='+queryForPList;
    });
    
	</script>
	
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="<c:url value='/resources/css/tabqnajs.js' />"></script>
	<script src="<c:url value='/resources/css/tabrevjs.js' />"></script>
	
</body>
</html>