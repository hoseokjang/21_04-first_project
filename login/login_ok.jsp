<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ssg.dao.MemberDao" %>  
<% 
    MemberDao mdao=new MemberDao();
    int chk=mdao.login_ok(request,session);
    
    if(chk==0)
    {
    	response.sendRedirect("../main/ssgindex.jsp");
    }
    else
    {
    	out.println("<script>alert('회원정보가 일치하지 않습니다.'); location.href='../login/login.jsp';</script>");
    }
%>