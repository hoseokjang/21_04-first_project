<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ssg.dao.NonMemOrderDao" %>
<%
	request.setCharacterEncoding("utf-8");
	String prod_id = request.getParameter("prod_id");
  	int n = Integer.parseInt(request.getParameter("order_quantity"));
  	pageContext.setAttribute("prod_id", prod_id);
    pageContext.setAttribute("n", n);
%>
<%
	NonMemOrderDao nmodao = new NonMemOrderDao();
	nmodao.nmem_order_ok(request, session);
	response.sendRedirect("non_mem_order_confirm.jsp?prod_id="+prod_id+"&n="+n);
%>