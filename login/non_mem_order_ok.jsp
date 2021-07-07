<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ssg.dao.NonMemberDao" %>
<%
	NonMemberDao ndao=new NonMemberDao();
	ndao.nonmember_ok(request,response,session);
	
%>
