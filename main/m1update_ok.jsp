<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ssg.dao.MainDao" %>
<%
	MainDao mdao=new MainDao();
	mdao.m1update_ok(request, response);
%>