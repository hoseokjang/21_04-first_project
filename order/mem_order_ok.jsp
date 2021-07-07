<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ssg.dao.OrderDao" %>
<%
    request.setCharacterEncoding("utf-8");
	String prod_id = request.getParameter("prod_id");
  	int n = Integer.parseInt(request.getParameter("order_quantity"));
  	pageContext.setAttribute("prod_id", prod_id);
    pageContext.setAttribute("n", n);
	OrderDao odao = new OrderDao();
	String order_no = odao.order_ok(request, session);
	
	response.sendRedirect("mem_order_confirm.jsp?prod_id="+prod_id+"&n="+n+"&order_no="+order_no);
%>