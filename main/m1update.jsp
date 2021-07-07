<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="ssg.dao.MainDao"%>
<%
	String id=request.getParameter("id");
	String prod_id=request.getParameter("prod_id");
	pageContext.setAttribute("id", id);
	pageContext.setAttribute("prod_id", prod_id);
%>
<style>
#m1update 
{width:1280px;height:500px;margin:auto;text-align:center;}
	
</style>
<c:import url="../ssgtop.jsp"/>
<div id="m1update">
	<form method="post" action="m1update_ok.jsp?id=${id}">
	<div><h2>상품 코드 입력</h2></div>
		<input type="text" name="prod_id" value="${prod_id}"><p>
		<input type="submit" value="수정하기">
	</form>
</div>
<c:import url="../ssgbottom.jsp"/>