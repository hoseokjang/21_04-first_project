<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ssg.dao.MemberDao"%>
<%
	MemberDao mdao=new MemberDao();
	int chk=mdao.delete_ok(request,response,session);
	if(chk==0){
	out.println("<script>alert('회원탈퇴하였습니다.'); location.href='../main/ssgindex.jsp';</script>");
	}
	else
		out.println("<script>alert('비밀번호가 일치하지 않습니다.'); location.href='../myssg/delete.jsp';</script>");
%>
