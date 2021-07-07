<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
	#third_cart #cart_title{font-weight:bold;font-size:30px;}
	#third_cart #cart_num_minus{width:25px;text-align:center;}
	#third_cart #cart_num_plus{width:25px;text-align:center;}
	#third_cart #cart_num_text{width:25px;text-align:center;margin-left:-6px;margin-right:-7px;}
	#third_cart #cart_list_table a{text-decoration:none;color:black;}
	#third_cart #cart_list_table a:hover{text-decoration:underline;color:#EDA900;}
	#third_cart #cart_quantity{width:100;height:50;}
	#third_cart #cart_quantity a{font-size:20px;}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){ 
		$("#chkall").click(function(){ // 전체 선택
			if($("#chkall").is(":checked"))
			{	
				$("input[name=chkbox]").prop("checked",true);
			}
			else
			{
				$("input[name=chkbox]").prop("checked",false);
			}
		});
	});
	$(function(){
		$(".chkbox").click(function(){ // 전체 선택에서 하나라도 체크박스 풀면 전체선택 해제
			$("#chkall").prop("checked",false);
		});
	});
	function cart_del(cart_id)
	{
		var cart_id = cart_id;
		var chk = new XMLHttpRequest();
		chk.open("post","cart_delete.jsp?cart_id="+cart_id);
		chk.send();
		chk.onreadystatechange=function()
		{
			if (chk.readyState == 4)
			{
				if (chk.responseText.trim() == "1")
				{
					alert("장바구니에서 삭제되었습니다.");
					location.reload(true);
				}
			}
		}
	}
	function cart_quantity_minus(var1,var2)
	{
		var cart_quantity = var1;
		var cart_id = var2;
		var chk = new XMLHttpRequest();
		if(cart_quantity != 1)
		{
			chk.open("get","cart_quantity_minus.jsp?cart_id="+cart_id);
			chk.send();
			chk.onreadystatechange=function()
			{
				if (chk.readyState == 4)
				{
					if (chk.responseText.trim() == "1")
					{
						location.reload(true);
					}
				}
			}
		}	
	}
	function cart_quantity_plus(var1, var2)
	{
		var cart_quantity = var1;
		var cart_id = var2;
		var chk = new XMLHttpRequest();
		if(cart_quantity != 10)
		{
			chk.open("get","cart_quantity_plus.jsp?cart_id="+cart_id);
			chk.send();
			chk.onreadystatechange=function()
			{
				if (chk.readyState == 4)
				{
					if (chk.responseText.trim() == "1")
					{
						location.reload(true);
					}
				}
			}
		}
	}
	function buy_now(prod_id,state,quantity)
	{
		var prod_id = prod_id;
		var state = state;
		var num = quantity;
		if(state == 0)
			location.href="../order/mem_order.jsp?prod_id="+prod_id+"&order_quantity="+num;
		else
			location.href="../order/non_mem_order2.jsp?prod_id="+prod_id+"&order_quantity="+num;
	}
	function all_buy(state)
	{
		var state = state;
		if(state==0)
			location.href="../order/mem_order_cart.jsp";
		else
			location.href="../order/non_mem_order_cart.jsp";
	}
	function cart_delete_all()
	{
		var chk = new XMLHttpRequest();
		chk.open("post","cart_delete_all.jsp");
		chk.send();
		chk.onreadystatechange=function()
		{
			if (chk.readyState == 4)
			{
				if (chk.responseText.trim() == "1")
				{
					alert("전체 삭제되었습니다.");
					location.reload(true);
				}
			}
		}
	}
</script>
<c:import url="../ssgtop.jsp"/>
<%@ page import="ssg.dao.CartDao" %>
<%@ page import="ssg.dto.CartDto" %>
<%@ page import="java.util.ArrayList" %>
<%
	CartDao cdao = new CartDao();
	ArrayList<CartDto> list = cdao.cart_list(session);
	pageContext.setAttribute("list", list);
	String state = session.getAttribute("state").toString();
	pageContext.setAttribute("state",state);
%>
<div id="third_cart" align="center" style="width:1800px;padding-top:10px;"> <!-- 장바구니 div 시작 -->
<div id="cart_title" align="left" style="width:1000px;padding-top:5px;padding-bottom:5px;">장바구니</div>
	<table width=1000 height=40 border=1 cellspacing=0 align="center">
		<tr align=center>
			<td width=100 valign=middle> 일반배송 </td>
			<td width=100 valign=middle> 새벽배송 </td>
			<td width=100 valign=middle> 퀵배송 </td>
		</tr>
	</table>
	<table width=1000 align="center" id="cart_list_table"> <!-- 장바구니 목록 시작 -->
		<tr>
			<td colspan="5" style="padding-bottom:3px;">
				<input type="checkbox" name="chkall" id="chkall" checked/>     전체선택
			</td>
			<td align="right">
				<a href="javascript:cart_delete_all()">전체 삭제</a>
			</td>
		</tr>
		<c:forEach var="cdto" items="${list }"> <!-- 장바구니 리스트 보여주기 -->
		<input type="hidden" name="cart_id" id="cart_id" value="${cdto.cart_id }">
		<tr>
			<td width="10">
				<input type="checkbox" name="chkbox" class="chkbox" checked/>
			</td>
			<td width="130">
				<a href="../product/prod_content.jsp?prod_id=${cdto.prod_id }"><img src="../상품사진/${cdto.prod_id }_i1_290.jpg" width="130" height="100"></a>
			</td>
			<td style="padding-left:20px;width:400px;">
				<span id="cart_emartmall" style="background:#FFE400;padding:5px;font-weight:bold">이마트몰</span><p>
				<a href="../product/prod_content.jsp?prod_id=${cdto.prod_id }">${cdto.prod_name }</a>
			</td>
			<td>
				<span id="cart_price" style="font-weight:450;font-size:20px;">  <fmt:formatNumber value="${cdto.hap }"/></span>원<p>
				<span id="cart_quantity"><a href="javascript:cart_quantity_minus(${cdto.cart_quantity },${cdto.cart_id })">-</a></span> <span id="cart_quantity_num">${cdto.cart_quantity }</span>개 <span id="cart_quantity"><a href="javascript:cart_quantity_plus(${cdto.cart_quantity },${cdto.cart_id })">+</a></span>
			</td>
			<td>
				<a href="javascript:buy_now('${cdto.prod_id }','${state }',${cdto.cart_quantity })" id="buy_now">바로구매</a>
			</td>
			<td>
				<a href="javascript:cart_del(${cdto.cart_id })">삭제</a>
			</td>
		</tr>
		</c:forEach>
<%
	int hap = cdao.cart_hap(session);
	pageContext.setAttribute("hap", hap);
%>		<!-- 총 합계 금액 -->
		<tr align="center" style="background:#E1E1E1;height:50px;font-size:20px;">
			<td colspan="6">
				<fmt:formatNumber value="${hap }"/>원 + 배송비 0원 = <fmt:formatNumber value="${hap }"/>원  (배송비 무료)
			</td>
		</tr>
		<tr align="center" height=60>
			<td colspan="6" style="font-size:25px;"> <a href="javascript:all_buy('${state }')">전체 구매</a> </td>
		</tr>
		<tr>
			<td colspan="6">
				<img src="cart_1.PNG" width="1000">
			</td>
		</tr>
	</table> <!-- 장바구니 목록 끝 -->
</div> <!-- 장바구니 div 끝 -->
<c:import url="../ssgbottom.jsp"/>