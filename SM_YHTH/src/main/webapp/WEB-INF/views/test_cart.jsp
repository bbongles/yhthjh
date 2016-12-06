<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
table {
   border-collapse: collapse;
}

tr td {
   border: 1px solid gray;
   text-align: center;
}


</style>

</head>
<body>


<!-- 테이블 안에 있는 요소들의 라인은 절대 바뀌면 안됨..  -->
   <table>
      <tr>
         <th><input type="checkbox" id="checkall" onclick="allChk(this);"
            checked="checked"></th>
         <th>상품이미지</th>
         <!-- <th>상품번호</th> -->
         <th>상품이름</th>
         <th>옵션</th>
         <th>상품가격</th>
         <th>구매수량</th>
         <th>주문금액</th>
         <th>주문하기</th>
      </tr>
      
      <c:forEach var="vo" items="${cartList}">

         <tr>
            <td><input type="checkbox" value="${vo.c_no}" name="RowCheck"
               class="checkbox" checked="checked"></td>
            <td><img src="${vo.p_img}" style="width: 50px" /></td>
            <td>${vo.p_name }</td>
            <!-- 이름 -->
            <td>${vo.o_cont }</td>
            <!-- 옵션내용 -->
            <td>${vo.p_price }</td>
            <!--  가격 -->
            <td>
                  <!-- 수량 -->
                  <input style="width: 20px;" value="${vo.buy_cnt }"  class="buy_cnt" type="number">
                  <%-- <input type="hidden" value="${vo.c_no}" name="c_no"> <span> --%>
                  <input type="button" value="수정" class="changeCnt"><!-- </span> -->
            <!-- 아이템당 가격 -->
            <td class="pricePerCount">${vo.p_price * vo.buy_cnt }</td>
         	<td>
         	<form action="/shop01/order/OneCartTossOrder" method="post">
         	<input type="hidden" name="c_no" value="${vo.c_no}">
         	<input type="submit" value="주문하기">
         	</form>
         	</td>
         </tr>
         <!--http://idevsigner.tistory.com/6  -->
      </c:forEach>
      
   </table>

	<div>
		총 구매 가격 :
		<!-- 총 가격 -->
		<input id="price" value="0" readonly="readonly" type="number" step="100" style="width: 269px">
	</div>
	<input type="button" value="장바구니에서 삭제" class="deleteall">
<form action="/shop01/order/cartTossOrder" method="post" id="toOrder">	
	<!-- 주문하기  -->
	<input type="hidden" value="" id="hiddenCartNums" name="c_no">
	<input type="button" value="전체 주문하기" id="CartToController" />

</form>

   <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
   
   <script>
   // 주문버튼 이벤트 처리
   $("#CartToController").click(function(){
      var chkObj = document.getElementsByName("RowCheck");
      var rowCnt = chkObj.length;
      var totalval = 0;
      var data = [];
      for (var i = 0; i < rowCnt; i++) {
         if (chkObj[i].checked == true) {
            /* console.log("체크된 카트 번호 : " + chkObj[i].value); */
            data[data.length] = chkObj[i].value;
         } // end if
      }   // end for
      console.log("배열객체화된 카트 번호 : "+data);
      $("#hiddenCartNums").val(data);
      $("#toOrder").submit();
   }); // end CartToController function
   
      var finalCartPrice = 0;
      price();
      function price() {
         finalCartPrice = 0;
         var chkObj = document.getElementsByName("RowCheck");

         var rowCnt = chkObj.length - 1;
         for (var i = 0; i <= rowCnt; i++) {
            var text1 = chkObj[i].parentNode.parentNode.children[6].innerText * 1;// String 에서 숫자로 변환
            finalCartPrice += text1;
         }
         $("#price").val(finalCartPrice);
      }
      
      var inputs = $('input[type="checkbox"]')
      inputs.change(function(){
         finalCartPrice = 0;
         var chkObj = document.getElementsByName("RowCheck");
         var rowCnt = chkObj.length-1;
         for (var i = 0; i <= rowCnt; i++) {
            if (chkObj[i].checked == true) {
               var text1 = chkObj[i].parentNode.parentNode.children[6].innerText * 1;// 체크된 체크박스에서 가격 찾아냄
               console.log(chkObj[i].parentNode.parentNode.children[6].innerText * 1)
               finalCartPrice += text1;
               console.log('finalCartPrice = ' + finalCartPrice);
            } else {
                $("#checkall").prop('checked', false);
            }
         } // end for
         $("#price").val(finalCartPrice);
      });
         
            
      function updateTotalPrice() {
         console.log('======================');
               finalCartPrice = 0;
               var chkObj = document.getElementsByName("RowCheck");
               var rowCnt = chkObj.length-1;
               for (var i = 0; i <= rowCnt; i++) {
                  if (chkObj[i].checked == true) {
                     var text1 = chkObj[i].parentNode.parentNode.children[6].innerText * 1;// 체크된 체크박스에서 가격 찾아냄
                     console.log(chkObj[i].parentNode.parentNode.children[6].innerText * 1)
                     finalCartPrice += text1;
                     console.log('finalCartPrice = ' + finalCartPrice);
                  } // end if
               } // end for
               $("#price").val(finalCartPrice);
               
            } // end updateTotalPriceFunction

      /////////////////////////////////////////////////////////
      // 체크박스 올체크
      function allChk(obj) {
         var chkObj = document.getElementsByName("RowCheck");
         var rowCnt = chkObj.length - 1;
         var check = obj.checked;
         if (check) {
            for (var i = 0; i <= rowCnt; i++) {
               if (chkObj[i].type == "checkbox")
                  chkObj[i].checked = true;
            }
         } else {
            for (var i = 0; i <= rowCnt; i++) {
               if (chkObj[i].type == "checkbox") {
                  chkObj[i].checked = false;
                  $("#price").val(0)
               }
            }
         }
      }

      // 장바구니 삭제 이벤트
      $('.deleteall')
            .on(
                  "click",
                  function(event) {
                     var tb = $(this).attr('title');
                     var sel = false;
                     var ch = $('input[name="RowCheck"]:checked');
                     var c = confirm('정말로 삭제하시겠어요?');
                     if (c) {
                        ch.each(function() {
                                 var $this = $(this);
                                 if ($this.is(':checked')) {
                                    sel = true; //set to true if there is/are selected row
                                    $this.parents('tr').fadeOut(function() {
                                                   $.ajax({
                                                            type : 'post',
                                                            url : 'deleteCart',
                                                            headers : {
                                                               'Accept' : 'application/json',
                                                               'Content-Type' : 'application/json'
                                                            },
                                                            data : $(
                                                                  'input[name="RowCheck"]:checked').val(),
                                                            success : function(result) {
                                                               if (result == 1) {
                                                                  $("#price").val(0)
                                                               } else {

                                                               }
                                                            }
                                                         });
                                                  $this
                                                         .remove(); //remove row when animation is finished
                                                });
                                 }
                              });
                        if (!sel)
                           alert('체크박스를 선택하세요');
                     }
                     return false;
                  });

      // 수량수정 이벤트
         $('.changeCnt').on("click",function() {
            var cnts = document.getElementsByName("buy_cnt");
               // 몇번째 값인지 찾기
               // c_no 값 찾기 ( 라인 위치 달라지면 에러남 )
               var c_no = this.parentNode.parentNode.childNodes[1].childNodes[0].value;
               /* console.log(c_no);  */
               // buy_cnt 값 찾기 ( 라인 위치 달라지면 에러남 )
               var buy_cnt = this.parentNode.parentNode.childNodes[17].childNodes[3].value;
                  /* console.log(buy_cnt); */ 
                  // td 값 : childNodes[0];
               var pricePerCnt = this.parentNode.parentNode.childNodes[18];
                  /* console.log(pricePerCnt); */
               $.ajax({
                 type: "get",
                 url: "updateCartBuyCnt",
                 headers : {
                  'Accept' : 'application/json',
                  'Content-Type' : 'application/json'
               },
               dataType: "json",
                 data: {c_no: c_no, buy_cnt: buy_cnt},
                 success: function(data){
                    if (data >= 0){
                       pricePerCnt.innerHTML = data;
                       updateTotalPrice();
                    }
                 },
             });  
      });
      
      $('.checkbox').click(function() {
         updateTotalPrice();
      });
      
      

   </script>


</body>
</html>