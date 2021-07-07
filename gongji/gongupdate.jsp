<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="ssg.dao.GongjiDao" %>
<%@ page import="ssg.dto.GongjiDto" %>
<%
	GongjiDao gdao=new GongjiDao();
	GongjiDto gdto=gdao.gongupdate(request);
	pageContext.setAttribute("gdto", gdto);
%>
<style>
#gong_write 
{width:1280px;height:500px;margin:auto;text-align:center;}
</style>
<script>

</script>
<c:import url="../ssgtop.jsp"/>
<div id="gong_write">
<h2> 공지사항 수정</h2>
<form method="post" action="gongupdate_ok.jsp?id=${gdto.id}">
<table width="600" align="center">
	<tr>
		<td>제목</td>
		<td><input type="text" name="title" value="${gdto.title}" style="width:510px;"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea cols="70" rows="10" name="content">${gdto.content }</textarea>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="submit" value="저장하기"></td>
	</tr>
</table>
</form>
</div>
<c:import url="../ssgbottom.jsp"/>