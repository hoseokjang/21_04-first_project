<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="ssg.dao.NonMemberDao" %>
<%@ page import="ssg.dto.NonMemberDto" %>
<%@ page import="ssg.dao.CartDao" %>
<%@ page import="ssg.dto.CartDto" %>
<%@ page import="ssg.dao.NonMemOrderDao" %>
<%@ page import="ssg.dto.NonMemOrderDto" %>
<%
	NonMemberDao nmdao = new NonMemberDao();
	NonMemberDto nmdto = nmdao.nmem_content(request, session);
	pageContext.setAttribute("nmdto", nmdto);
	CartDao cdao = new CartDao();
	ArrayList<CartDto> list = cdao.cart_list(session);
	pageContext.setAttribute("list", list);
	NonMemOrderDao nmodao = new NonMemOrderDao();
	ResultSet rs1 = nmodao.cart_quantity(session);
	ResultSet rs2 = nmodao.cart_total_price(session);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<title>주문하기</title>
<style>
#non_mem_order a{
   color:black; text-decoration:none; cursor: pointer;
  }
#ScrollMenu {
  position:absolute; left:1365px; top:0px; width:300;
  height:500px; z-index:1;
  }
.pay_method li{
   list-style:none; display:inline-block; border:2px solid black; width:97px; height:100px;
   text-align:center; position:relative; margin-left:1px; border-radius:12px;
}
.pay_method li input[type=radio]{
   display:none; 
}
.pay_method li input[type=radio] + label{
   display:inline-block; cursor:pointer; position:relative; font-size:17px;
   padding-top:22px; width:99px; height:80px; valign:middle; align:center; margin-right:1px;
   margin-left:0px; padding-left:0px;
}
.pay_method li input[type=radio]:checked + label{
   background:black; color:white; border-radius:12px; border:1px solid black; align:center;
}
.delivery_method li{
	list-style:none; display:inline-block; border:2px solid black; width:150px; height:50px;
    text-align:center; position:relative; margin-top:0px;
}
.delivery_method li input[type=radio]{
   display:none; 
}
.delivery_method li input[type=radio] + label{
   display:inline-block; cursor:pointer; position:relative; font-size:17px;
   width:150px; height:50px; align:center;
   margin-left:0px; padding-left:0px; padding-top:0px; margin-top:0px;
}
.delivery_method li input[type=radio]:checked + label{
   background:black; color:white; border:1px solid black; padding-top:0px; margin-top:0px;
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
function openTermPopup(){
	window.open("termpopup.html", "전자금융거래 이용약관", "width=600, height=500, left=100");
}
function openPopup_update_adrr(){
	 open("update_adrr.jsp", "배송지 수정", "width=600, height=500, left=100");
}
function openPopup_pay(){
	if(document.getElementById("credit").checked){
		window.open("pay_credit_cart.jsp", "신용카드 결제", "width=400, height=500, left=100");
	}
}
function click_pay1(){
	document.getElementById("pay1").click();
}
function delivery_methd(n){
	if(n==1){
		document.getElementById("dv_methd").innerText = "일반배송";
	} else if(n==2){
		document.getElementById("dv_methd").innerText = "새벽배송";
	} else{
		document.getElementById("dv_methd").innerText = "퀵배송";
	}
}
</script>
<script type="text/javascript" src="detailCheck.js"></script>
<script type="text/javascript" src="paycolor.js"></script>
<script type="text/javascript" src="doorchk.js"></script>
<script type="text/javascript" src="detailclick.js"></script>
<script type="text/javascript" src="initMoving.js"></script>
<script type="text/javascript" src="non_mem_select_pay_option.js"></script>
<script type="text/javascript" src="non_mem_validity_check.js"></script>
<script type="text/javascript" src="delivery_method.js"></script>
</head>
<c:import url="../ssgtop.jsp"/>
<div id="non_mem_order">
<body>
<div id="non_mem_order">
<form id="head" name="form" method="post" onsubmit="return openPopup_pay()">
 <table width="800" align="center">
  <caption><h2> 결제하기 </h2><hr size="3" color="black"></caption>
  <tr>
  <td> <h3>받는 분 정보</h3> </td>
  </tr>
  <tr>
    <td> <b>배송지 정보</b> </td>
    <td> </td>
  </tr>
  <tr>
    <td> 수령위치 </td>
    <td>
     <ul class="acpt_lst">
       <li type="none">
        <input type="radio" onclick="door_chk(0)" name="accept" disabled value="direct" id="direct"/>
        <label for="direct"> 직접 수령하겠습니다 </label> <h5>* 코로나 19관련 고객안전을 위해 직접수령이 불가합니다.</h5> <p>
       </li>
       <li type="none">
       <input type="radio" onclick="door_chk(1)" name="accept" id="door" value="door" checked/>
       <label for="door"> 문 앞에 놓아주세요 </label> <p>
      </li>
      <li type="none">
       <input type="radio" onclick="door_chk(2)" name="accept" id="so" value="so"/>
       <label for="so"> 경비실에 맡겨주세요 </label> <p>
      </li>
      <li type="none">
       <input type="radio" onclick="door_chk(3)" name="accept" id="etc" value="etc"/>
       <label for="etc"> 직접 입력 </label>
       <input style="display:none" type="text" name="jik" id="jik" onclick="click_jik(this)" onkeydown="input_jik()">
      </li>
    </ul>
    </td>
  </tr>
  <tr id="doorchk">
    <td> 공동현관 출입방법 </td>
    <td>
    <span id="publicdoor">
    <input type="text" id="public_door" name="public_door" onclick="click_public_door(this)" onkeydown="input_public_door()" placeholder="(동호수) - (현관비밀번호)" disabled/>
    </span>
    <span>
    <input type="checkbox" onclick="public_doorchk(this)" name="public_door_chk" id="public_door_chk"> 공동현관이 있습니다
    </span>
    </td>
  </tr>
  <tr>
    <td> 배송 시 요청사항 </td>
    <td>
    <textarea rows="5" cols="40" name="order_request"></textarea>
    </td>
  </tr>
  <tr>
    <td> 주문자명  / 전화번호  </td>
    <td>
    <span id="name1"> ${nmdto.name} </span> / <span id="phone1"> ${nmdto.phone}</span>
    <input type="hidden" id="name2" name="order_name" value="${nmdto.name}">
    <input type="hidden" id="phone2" name="order_phone" value="${nmdto.phone}">
    <a onclick="openPopup_change_deliver_site()"><span style="color:#FF5B59; font-size:12px;"> <b>주문자 정보변경 > </b> </span></a>
    </td>
  </tr>
  <tr>
    <td> 배송지 </td>
    <td> <span id="address1"> ${nmdto.address } </span></td>
    <input type="hidden" id="address2" name="order_address" value="${nmdto.address }">
  </tr>
 </table>
 <hr width="800" size="3" color="black">
 <table width="800" align="center">
  <tr>
  <td> <h3>배송방법</h3> </td>
  </tr>
  <tr align="center">
   <td>
    <ul class="delivery_method">
        <li id="delivery_normal">
        <input type="radio" onclick="delivery_methd(1)" name="delivery_method" id="normal" value="normal" checked/>
        <label for="normal"> <br>일반배송 </label>
        </li>
        <li id="delivery_dawn">
        <input type="radio" onclick="delivery_methd(2)" name="delivery_method" id="dawn" value="dawn">
        <label for="dawn"> <br/>새벽배송 </label>
        </li>
        <li id="delivery_etc">
        <input type="radio" onclick="delivery_methd(3)" name="delivery_method" id="dv_etc" value="dv_etc">
        <label for="dv_etc"> <br/>퀵배송 </label>
        </li>
    </ul>
   </td>
  </tr>
  <br><br>
 </table>
 <hr width="800" size="3" color="black">
 <table width="800" align="center">
  <tr>
  <td> <h3>주문상품 : <%=rs1.getInt("cnt")%>개</h3> </td>
  <input type="hidden" name="cart_quantity" value="<%=rs1.getInt("cnt")%>">
  </tr>
  <tr>
   <td>
    <table width="780" align="center">
      <tr>
       <td>
        <table width="690" align="center">
         <c:forEach items="${list}" var="list">
         <tr>
          <td rowspan="2" align="left" width="100"> <img src="../상품사진/${list.prod_id}_i1_290.jpg" width="100" height="100"> </td>
          <input type="hidden" name="prod_id" value="${list.prod_id}">
          <td style="font-size:12px;"> 상품코드 : [<span id="prod_id">${list.prod_id}</span>] </td>
          <td rowspan="2" align="center" width="50"> <span id="order_quantity">${list.cart_quantity}</span>개 </td>
          <td rowspan="2" align="center" width="100"> <span id="prod_final_price"> <fmt:formatNumber value="${list.hap}"/></span>원</td>
         </tr>
         <tr>
          <td> ${list.prod_name} </td>
          <input type="hidden" name="prod_name" value="${list.prod_name}">
          <input type="hidden" name="order_quantity" value="${list.cart_quantity}">
          <input type="hidden" name="order_price" value="${list.hap}">
         </tr>
         </c:forEach>
        </table>
        <hr color="grey" size=1 style="opacity:0.3;">
       </td>
      </tr>
      <tr>
       <td align="right"> 주문금액 : <span id="prod_total_price"> <fmt:formatNumber value='<%=rs2.getInt("total") %>'/></span>원 </td>
      </tr>
    </table>
   </td>
  </tr>
  <br><br>
 </table>
 <hr width="800" size="3" color="black">
 <table width="800" align="center">
  <tr>
  <td> <h3>할인정보</h3> </td>
  </tr>
  <tr>
  <td> 주문금액 </td>
  <td> <fmt:formatNumber value='<%=rs2.getInt("total") %>'/>원(상품가 <fmt:formatNumber value='<%=rs2.getInt("total") %>'/>원 + 배송비 0원) </td>
  </tr>
  <tr> <td colspan="2"> <hr width="800" size="1" color="grey"> </td> </tr>
  <tr>
  <td> 쿠폰할인 </td>
  <td> 0원  </td>
  </tr>
  <tr> <td colspan="2"> <hr width="800" size="1" color="grey"> </td> </tr>
  <tr>
  <td> 할인금액 </td>
  <td> 0원 </td>
  </tr>
  <br><br>
 </table>
 <hr width="800" size="3" color="black">
 <table width="800" align="center">
  <tr>
  <td> <h3>포인트 사용</h3> </td>
  </tr>
  <tr>
   <td> 비회원일 경우 적립금 등 일부 서비스이용에 제약이 있습니다. 회원으로 가입하시면 보다 많은서비스를 이용하실 수 있습니다. </td>
  </tr>
  <br><br>
 </table>
 <hr width="800" size="3" color="black">
 <table width="800" align="center">
  <tr>
  <td> <h3>결제수단</h3> </td>
  </tr>
  <tr>
   <td>
    <table width="750" align="center">
     <tr border="1px solid black">
      <td colspan="2">
       <ul class="pay_method">
        <li id="cpay">
        <input type="radio" onclick="non_mem_select_pay_method(1)" name="pay_method" value="credit" id="credit" checked/>
        <label for="credit"> <br>신용카드 </label>
        </li>
        <li id="acnt_t">
        <input type="radio" onclick="non_mem_select_pay_method(2)" name="pay_method" value="acnt_tlsl" id="acnt_tlsl">
        <label for="acnt_tlsl"> 실시간<br/>계좌이체  </label>
        </li>
       </ul>
      </td>
     </tr>
     <tr id="card_option1">
      <td width=150px; style="font-size:12px;"> <b>카드종류</b> </td>
      <td>
       <select id="select_card" style="width:400px; height:30px;">
       	<option value="X"> 카드를 선택해주세요 </option>
       	<option value="kb"> 국민카드 </option>
       	<option value="sh"> 신한카드 </option>
       	<option value="nh"> 농협카드 </option>
       </select>
      </td>
     </tr>
     <tr id="card_option2">
      <td style="font-size:12px;"> <b>할부선택</b> </td>
      <td>
       <select style="width:200px; height:30px;">
        <option value="hal_il"> 일시불 </option>
       	<option value="hal_two"> 2개월 </option>
       	<option value="hal_three"> 3개월 </option>
       	<option value="hal_six"> 6개월 </option>
       </select>
      </td>
     </tr>
     <tr id="account_iche" style="display:none; font-size:11px;">
      <td colspan="2">
       <div> * 뱅크페이 앱 설치/가입 후 이용하실 수 있습니다.</div>
       <div> * 결제와 동시에 즉시 이체되며, 전체 주문취소 시에는 당일 입금, 부분취소시에는 익일입금됩니다.</div>
       <div> * 현금으로 결제한 모든 금액은 우리은행과 채무지급보증계약을 체결하여 고객님의 안전거래를 보장하고 있습니다.</div>
      </td>
     </tr>
    </table>
   </td>
  </tr>
  <br><br>
 </table>
 <hr width="800" size="3" color="black">
 <table width="800" align="center" id="table_btm">
  <tr>
  <td align="center" style="height:60px; border:2px solid grey">
  주문금액 <span><fmt:formatNumber value='<%=rs2.getInt("total") %>'/></span>원 &nbsp;-&nbsp;
  상품 및 쿠폰 할인 0원
  &nbsp;-&nbsp;
  포인트사용 <span id="final_use_point">0</span>원
  &nbsp;=&nbsp;
  <b><span id="pred_pay1" style="color:#FF5B59; font-size:15px">결제예정금액  <fmt:formatNumber value='<%=rs2.getInt("total") %>'/>원</span></b></td>
  <br>
  </tr>
  <tr>
   <td>
    <div style="font-size:12px; display:inline-block"> <input type="checkbox" id="agree" onclick="detailchkAll()"> 주문 상품정보 및 서비스 이용약관에 모두 동의하십니까? </div>
    <span id="detail1" onclick="detailclick1(this)" style="font-size:12px; cursor:pointer;"> <a style="color:grey"> <b> 상세보기 ＞ </b> </a> </span>
    <span id="detail2" onclick="detailclick2(this)" style="display:none; font-size:12px"> <a style="color:grey"> <b> ＜ 상세닫기 </b> </a> </span> <p>
    <div id="categories" style="display:none;">
     <span style="font-size:12px;"> └ <input type="checkbox" id="agree1" onclick="detailcheck()"> 주문할 상품정보(상품명, 상품가격, 배송정보)에 동의하십니까? (전자상거래법 제8조 2항)</span> <p>
     <span style="font-size:12px;"> └ <input type="checkbox" id="agree2" onclick="detailcheck()"> 전자금융거래 이용약관 동의 &nbsp; <b> <a style="color:grey" onclick="openTermPopup()"> 약관보기 ＞ </a> </b></span>
    </div>
   </td>
  </tr>
  <tr>
   <td align="center">
     <div>
     <input type="submit" id="pay1" onclick="return payinfo_chk()" onmouseover="paycolor1()" onmouseout="paycolor2()" style="cursor:pointer; border:none; color:white; width:800px; height:60px; background:#FF5B59; font-size:20px;" value="<fmt:formatNumber value='<%=rs2.getInt("total") %>'/>원 주문하기">
     <input type="hidden" name="final_price" id="final_price" value="<%=rs2.getInt("total") %>">
   	 </div>
   </td>
  </tr>
 </table>
</form>
<div id="ScrollMenu"> <!-- 레이어 시작 --> 
 <div style="width:320px; border:1px solid #D3D3D3; border-collapse:collapse;">
 <table width="280px" align="center">
  <tr>
    <td align="left" width="170px"> 배송지 : <span id="name_layer"> ${nmdto.name} </span> </td>
    <td align="right" style="color:grey"> <a onclick="openPopup_change_deliver_site()">변경></a> </td>
  </tr>
  <tr>
    <td colspan="2">
    <span id="address_layer" style="font-size:12px"> ${nmdto.address }  </span>
    </td>
  </tr>
  <tr>
    <td align="left"> 배송방법 </td>
    <td align="right"> <div id="dv_methd"> 일반배송 </div></td>
  </tr>
  <tr>
    <td align="left"> 주문금액 </td>
    <td align="right"> <span><fmt:formatNumber value='<%=rs2.getInt("total") %>'/></span>원 </td>
  </tr>
  <tr>
    <td align="left"> 상품 및 쿠폰 할인 </td>
    <td align="right"> - 0 원 </td>
  </tr>
  <tr>
    <td align="left"> 포인트 사용 </td>
    <td align="right"> - <span id="final_use_point_layer"> 0 </span>원 </td>
  </tr>
  <tr>
    <td colspan="2" align="center">
    <table width="250" height="10" align="center">
    </table>
    <hr> </td>
  </tr>
  <tr style="color:#FF5B59">
    <td align="left"> <b>결제예정금액</b> </td>
    <td align="right" width="200px"> <b><span id="pred_pay2"><fmt:formatNumber value='<%=rs2.getInt("total") %>'/></span> 원</b> </td>
  </tr>
  <tr>
    <td colspan="2">
    <div id="pay_method_layer"> 신용카드 </div>
    </td>
  </tr>
  <tr>
    <td colspan="2">
     <span style="font-size:12px"> <input type="checkbox" id="agree_layer" onclick="detailcheck_layer()"> 주문할 상품정보에 동의하십니까?(전자상거래법 제8조 2항) </span>
    </td>
  </tr>
  <tr>
    <td colspan="2" align="center">
     <input type="button" id="pay2" onmouseover="paycolor_layer1()" onmouseout="paycolor_layer2()" onclick="click_pay1()" style="cursor:pointer; border:none; color:white; width:300px; height:60px; background:#FF5B59; font-size:20px;" value="<fmt:formatNumber value='<%=rs2.getInt("total") %>'/>원 주문하기">
   </td>
  </tr>
 </table>
 </div>
 <p>
 <div align="right"> <a href="#head" title="상단으로">위로</a> </div>
</div>
<script type="text/javascript">initMoving(document.getElementById("ScrollMenu"), 100, 250, -50);</script> <!-- 레이어 종료 -->
</div>
</div>
<c:import url="../ssgbottom.jsp"/>