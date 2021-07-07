<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ssg.dao.CartDao" %>
<%
	CartDao cdao = new CartDao();
	cdao.cart_ok(request, session);
	
	out.print("1");
%>