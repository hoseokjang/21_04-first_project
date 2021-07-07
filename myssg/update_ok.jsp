<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ssg.dao.MemberDao" %>    
<%
	MemberDao mdao=new MemberDao();
	mdao.update_ok(request,response,session);
	
	//response.sendRedirect("login.jsp");
%>