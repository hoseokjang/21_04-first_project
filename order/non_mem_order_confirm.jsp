<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
response.setContentType("text/html; charset=UTF-8");
request.setCharacterEncoding("UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="ssg.dao.NonMemOrderDao" %>
<%@ page import="ssg.dto.NonMemOrderDto" %>
<%
	NonMemOrderDao nmodao = new NonMemOrderDao();
	ArrayList<NonMemOrderDto> nmolist = nmodao.nmem_order_list(request, session);
	pageContext.setAttribute("nmolist", nmolist);
	NonMemOrderDto nmodto = nmodao.nmem_order_delivery(request, session);
	pageContext.setAttribute("nmodto", nmodto);
%>
<script>
function toIndex(){
	location.href="../main/ssgindex.jsp";
}
</script>
<c:import url="../ssgtop.jsp"/>
<div id="non_mem_order_confirm">
 <div align="center"> <h2> 주문/결제내역 확인 </h2></div>
 <hr size="3" color="black">

<table width="800" align="center">
 
  <tr>
  <td colspan="3"> <h3>주문/결제정보</h3> </td>
  </tr>
  <tr align="center">
   <td width="100"> 상품사진 </td>
   <td> 상품코드/상품명 </td>
   <td width="50"> 수량 </td>
   <td width="100"> 가격 </td>
   <td width="120"> 상태 </td>
  </tr>
  
 
</table>
<hr width="800" size="1" color="#CCCCCC">

<table width="800" align="center">
<c:forEach items="${nmolist}" var="nmolist">
  <tr>
   <td width="100"> <img src="../상품사진/${nmolist.prod_id}_i1_290.jpg" width="100" height="100"> </td>
   <td> [<span id="prod_id">${nmolist.prod_id}</span>] / ${nmolist.prod_name} </td>
   <td width="50" align="center"> ${nmolist.nmem_order_quantity} </td>
   <td width="100" align="center"> <fmt:formatNumber value="${nmolist.nmem_order_price}"/> </td>
   <c:if test="${nmolist.nmem_order_state==1}">
   	<td width="120" align="center"> 결제완료 </td>
   </c:if>
  </tr>
  </c:forEach>
</table>
 <br><br><br>
 <hr width="800" size="1" color="black">
 <table width="800" align="center">
  <tr>
  <td> <h3>배송정보</h3> </td>
  </tr>
  <tr>
   <td>
    <table width="750" align="center" border="2px solid black" style="border-collapse:collapse">
     <tr align="center">
      <td width="150" style="background:#CCCCCC;"> <b>주문자명</b> </td>
      <td> ${nmodto.nmem_order_name} </td>
      <td width="150" style="background:#CCCCCC;"> <b>연락처</b> </td>
      <td width="250"> ${nmodto.nmem_order_phone} </td>
     </tr>
     <tr>
      <td align="center" style="background:#CCCCCC;"> <b>배송지</b> </td>
      <td colspan="3"> ${nmodto.nmem_order_address} </td>
     </tr>
     <tr>
      <td align="center" style="background:#CCCCCC;"> <b>배송방법</b> </td>
      <c:if test="${nmodto.nmem_order_delivery_method == 'normal'}">
      <td colspan="3"> 일반배송 </td>
      </c:if>
      <c:if test="${nmodto.nmem_order_delivery_method == 'dawn'}">
      <td colspan="3"> 새벽배송 </td>
      </c:if>
      <c:if test="${nmodto.nmem_order_delivery_method == 'dv_etc'}">
      <td colspan="3"> 퀵배송 </td>
      </c:if>
     </tr>
     <tr>
      <td align="center" style="background:#CCCCCC;"> <b>수령위치</b> </td>
      <c:if test="${nmodto.nmem_order_location == 'door'}">
      <td colspan="3"> 문 앞 </td>
      </c:if>
      <c:if test="${nmodto.nmem_order_location == 'so'}">
      <td colspan="3"> 경비실 </td>
      </c:if>
      <c:if test="${nmodto.nmem_order_location == 'etc'}">
      <td colspan="3"> ${nmodto.order_jik} </td>
      </c:if>
     </tr>
     <tr>
      <td align="center" style="background:#CCCCCC;"> <b>배송 시 요청사항</b> </td>
      <td colspan="3"> ${nmodto.nmem_order_request} </td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
 <br><br>
 <hr width="800" size="2" color="black">
 <br><br><br>
 <div>
 <table width="800" align="center">
  <tr align="center">
   <td>
    <input type="button" onclick="toIndex()" value="쇼핑 계속하기" style="cursor:pointer; border:none; color:white; width:200px; height:60px; background:#FF5B59; font-size:20px;">
   </td>
  </tr>
 </table>
 </div>
</div>
<c:import url="../ssgbottom.jsp"/>