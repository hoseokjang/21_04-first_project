<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
#gong_write 
{width:1280px;height:500px;margin:auto;text-align:center;}
</style>
<c:import url="../ssgtop.jsp"/>
<div id="gong_write">
<h2> 공지사항 작성</h2>
<form method="post" action="gongwrite_ok.jsp">
<table width="600" align="center">
	<tr>
		<td class="gtitle" align="center">제목</td>
		<td><input type="text" name="title" style="width:510px;"></td>
	</tr>
	<tr>
		<td class="gtitle" align="center">내용</td>
		<td><textarea cols="70" rows="10" name="content"></textarea>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="submit" value="저장하기"></td>
	</tr>
</table>
</form>
</div>
<c:import url="../ssgbottom.jsp"/>