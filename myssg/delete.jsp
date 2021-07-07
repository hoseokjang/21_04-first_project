<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.*" %>
<%@page import="ssg.dao.MemberDao" %>
<%
if(session.getAttribute("userid")==null){
	response.sendRedirect("../login/login.jsp");
}
else
{
	//DB연결
	Class.forName("com.mysql.jdbc.Driver");
	String db="jdbc:mysql://192.168.0.137/ssg";
	Connection conn=DriverManager.getConnection(db,"admin","1234");
	//String db="jdbc:mysql://localhost:3306/ssg";
	//Connection conn=DriverManager.getConnection(db,"root","1234");
	
	String userid=session.getAttribute("userid").toString();
	String sql="select member.*,mem_address.* from member,mem_address"
			+" where member.userid='"+userid+"' and mem_address.userid='"+userid+"'";
	Statement stmt=conn.createStatement();
	
	ResultSet rs=stmt.executeQuery(sql);
	rs.next();

%>   
<link rel="stylesheet" href="../main.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
 <script>
 function check(my){
		
		if(my.pwd.value=="")
		{
			alert("비밀번호를 입력해주세요");
			return false;
		}
		else
			return true;
		
	}
 </script>
<style>
#third {
   width:1100px;
   height:400px;	
/*    background:red;	 */ 
   margin:auto;	 		
}
td{
	font-size:20px;
}
.st{
	font-size:20px;
}
</style>  
<c:import url="../ssgtop.jsp"/>
<div id="third"> <!-- 항상 top에 오는 부분 -->
<!-- 모든 문서의 내용 시작 -->
<form method="post" action="delete_ok.jsp" onsubmit="return check(this)">
<table width="400" align="center">
  <div style="text-align:center" >
   <h1> <span class="tt">회원탈퇴 </span> </h1>
   <p class="advice">
   <span class="st" >회원님의 정보를 입력해주세요.
   <br>
   "회원정보를 입력 하신 후 확인 버튼을 클릭해주세요."
    </span>
    </p>
  </div>
    <tr>
     <td> 아이디</td>
     <td> <%=rs.getString("userid") %></td>
    </tr>
    <tr>
     <td> 비밀번호 </td>
     <td> <input type="password"  name="pwd"  placeholder="비밀번호"></td>
    </tr>
    
 </table>
 <br><br>
  	<div align="center">
      <input type="submit" class="submit_form" value="회원탈퇴">
    </div>
</form>

<!-- 모든 문서의 내용 끝 -->
</div>
<%
}
%>
<c:import url="../ssgbottom.jsp"/>

  
  




