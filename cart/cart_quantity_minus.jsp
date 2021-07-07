<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ssg.dao.CartDao" %>
<%
	CartDao cdao = new CartDao();
	cdao.cart_quantity_minus(request);
	
	out.print("1");
%>