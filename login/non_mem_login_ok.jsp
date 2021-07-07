<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ssg.dao.NonMemberDao" %>
<%
	NonMemberDao ndao=new NonMemberDao();
	int chk=ndao.nonmember_login_ok(request,session);
	
	if(chk==0)
    {
    	response.sendRedirect("../order/non_mem_order_confirm.jsp");
    }
    else if(chk==1)
    {
    	out.println("<script>alert('정보가 일치하지 않습니다.'); location.href='../login/non_mem_login.jsp';</script>");
    }
    else{
    	out.println("<script>alert('주문정보가 없습니다.'); location.href='../main/ssgindex.jsp';</script>");
    }
%>