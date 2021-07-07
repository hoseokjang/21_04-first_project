<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ssg.dao.MemberDao" %>    
<%
	MemberDao mdao=new MemberDao();
	mdao.member_ok(request,response);
	
	out.println("<script>alert('회원가입이 되었습니다. 환영합니다!!'); location.href='login.jsp';</script>");
%>