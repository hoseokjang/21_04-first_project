<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ssg.dao.ProductDao" %>
<%
	ProductDao pdao = new ProductDao();
	pdao.prod_readnum(request, response);
%>