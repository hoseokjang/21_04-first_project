<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<link rel="stylesheet" href="../main.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<%@page import="java.sql.*" %>
<%
	//DB연결
	Class.forName("com.mysql.jdbc.Driver");
	String db="jdbc:mysql://192.168.0.137/ssg";
	Connection conn=DriverManager.getConnection(db,"admin","1234");
	//String db="jdbc:mysql://localhost:3306/ssg";
	//Connection conn=DriverManager.getConnection(db,"root","1234");
	//id 읽어오기
	String userid=session.getAttribute("userid").toString();
	//쿼리 생성
	String sql="select * from member where userid='"+userid+"'";	
	//심부름꾼 생성
	Statement stmt=conn.createStatement();
	
	//쿼리생성
	ResultSet rs=stmt.executeQuery(sql);
	rs.next();
	
	String sql2="select * from order_pay where userid='"+userid+"' group by order_no order by order_id desc";
	Statement stmt2 = conn.createStatement();
	ResultSet rs2 = stmt2.executeQuery(sql2);
%>
<%@ page import="ssg.dao.MemberDao" %>
<%@ page import="ssg.dto.MemberDto" %>
<%
	MemberDao mdao = new MemberDao();
	MemberDto mdto = mdao.mem_content(request, session);
	pageContext.setAttribute("mdto", mdto);
%>
<style>
#third {
   width:1100px;
   height:400px;	
/*    background:red;	 */ 
   margin:auto;	 		
}

</style>  
<c:import url="../ssgtop.jsp"/>
<div id="third"> <!-- 항상 top에 오는 부분 -->
<!-- 모든 문서의 내용 시작 -->
<form>
  <table width="800" align="center">
  <caption> 
	  <h1 align="left">나의 포인트</a></h1>
	  <hr style="border:solid 1px black"> 
  </caption>
  <tr>
	  <td align="center" style="font-size:30px;">현재 사용가능한 포인트 : <p><%=rs.getString("point")%> pt</p>
	  </td>
  </tr>
  </table>
  <table width="800" align="center">
  	<tr>
 	 <td colspan="3"> <h4>포인트 사용내역</h4> </td>
 	</tr>
 	<tr align="center">
 	 <td width="150"> 날짜 </td>
 	 <td > 내역 </td>
 	 <td width="500"> 비고 </td>
 	</tr>
 	<%while(rs2.next()){ 
 		if(rs2.getInt("point") !=0){%>
 			<tr align="center">
 	 			<td> <%=rs2.getString("order_writeday") %></td>
 	 			<td> -<%=rs2.getInt("point") %>pt</td>
 	 			<td> 상품 주문(주문코드 : <%=rs2.getString("order_no") %>)</td>
 			</tr>
 	<%}} %>
 	<tr align="center">
 	 <td> ${mdto.writeday} </td>
 	 <td> +5000pt</td>
 	 <td> 회원가입 이벤트</td>
 	</tr>
  </table>
</form>
 
<!-- 모든 문서의 내용 끝 -->
</div>
<c:import url="../ssgbottom.jsp"/>

  
  




