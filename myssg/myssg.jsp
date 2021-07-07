<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<c:import url="../ssgtop.jsp"/>
<link rel="stylesheet" href="../main.css">
<%@page import="java.sql.*" %>

 <style>
	.myssg a{
		font-size:30px;
	}
 </style>
<div id="third"> <!-- 항상 top에 오는 부분 -->
<!-- 모든 문서의 내용 시작 -->
 <form method="post">
  <table width="800" align="center" class="myssg">
  <caption> 
  <h1 align="left">MYSSG</a></h1> <br>
  <h2 align="left"> 회원정보  </h2> 
  <hr style="border:solid 1px black"> 
  
  </caption>
  <tr>
   <td> 
   		<a href="ssgpoint.jsp">나의 포인트 ></a><hr>
   </td> 
  </tr>
  <tr>
  	<td>
  		<a href="update.jsp">회원정보 변경 ></a><hr>
  	</td>
  </tr>
  <tr>
  	<td>
  		<a href="../gongji/gonglist.jsp">공지사항 ></a><hr>
  	</td>
  </tr>
  <tr>
  	<td>
  		<a href="../faq.jsp">고객센터 ></a><hr>
  	</td>
  </tr>
  <tr>
  	<td>
  		<a href="delete.jsp">회원탈퇴 ></a><hr>
  	</td>
  </tr>
  </table>
 </form>

<!-- 모든 문서의 내용 끝 -->
</div>
<c:import url="../ssgbottom.jsp"/>