<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*" %>
<%@ page import="ssg.dao.OrderDao" %>
<%@ page import="ssg.dto.OrderDto" %>
<%
OrderDao odao = new OrderDao();
ArrayList<OrderDto> olist = odao.order_list_all(request, session);
pageContext.setAttribute("olist", olist);
%>
<style>
 a{
   color:black; text-decoration:none; cursor: pointer;
  }
</style>
<c:import url="../ssgtop.jsp"/>
<div id="mem_order_confirm_all">
 <div align="center"> <h2> 나의 주문내역 조회 </h2></div>
 <hr size="3" color="black">
<table width="800" align="center">
  <tr>
  <td colspan="3"> <h3>주문내역</h3> </td>
  </tr>
  <tr align="center">
   <td width="100"> 주문날짜 </td>
   <td width="120"> 주문번호 </td>
   <td width=> 상품 </td>
   <td width="80">  </td>
  </tr>
</table>
<hr width="800" size="1" color="#CCCCCC">

<table width="800" align="center">
 <c:forEach items="${olist}" var="olist">
  <tr>
   <td width="100"> ${olist.writeday} </td>
   <td width="120"> ${olist.order_no} </td>
   <td  align="center"> ${olist.prod_name} </td>
   <td width="80" align="center"> <a href="mem_order_confirm.jsp?order_no=${olist.order_no}">상세정보</a> </td>
  </tr>
  </c:forEach>
</table>

</div>
<c:import url="../ssgbottom.jsp"/>