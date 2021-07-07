<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ssg.dao.OrderDao" %>
<%
	request.setCharacterEncoding("utf-8");
	OrderDao odao = new OrderDao();
	String order_no = odao.order_cart_ok(request, session);
	response.sendRedirect("mem_order_confirm.jsp?order_no="+order_no);
%>