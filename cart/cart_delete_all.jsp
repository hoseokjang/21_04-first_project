<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ssg.dao.CartDao" %>
<%
	CartDao cdao = new CartDao();
	cdao.cart_delete_all(session);
	
	out.print("1");
%>