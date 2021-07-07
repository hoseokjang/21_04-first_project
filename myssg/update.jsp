<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
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
<c:import url="../ssgtop.jsp"/>
<link rel="stylesheet" href="../main.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>

 <style>
 .member_form{
 	line-height:45px;
 }

 
 </style>
 <script>
 	function check(my){
 			
 		var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
 		// 이메일이 적합한지 검사할 정규식
 		
 		if(my.address.value=="")
 			{
 			alert("주소를 입력해주세요")
 			return false;
 			}
 		if(my.phone.value=="")
			{
			alert("휴대폰 번호를 입력해주세요")
			return false;
			}
 		if(my.phone.value.length<11)
		{
			alert("휴대폰 번호를 정확하게 입력해주세요")
			return false;
		}
 		if(isNaN(my.phone.value))
 			{
 			alert("휴대폰 번호는 숫자만 입력해주세요")
 			my.phone.value="";	
 			return false;
 			}
 		if(my.email.value=="")
 			{
 			alert("이메일 주소를 입력해주세요")
 			return false;
 			}
 		if (re.test(my.email.value) === false) 
 		{
            alert("잘못된 이메일 형식입니다.");
            my.email.value="";
            my.email.focus();
            return false;
        }

 	}
 	
 	function openPopupSearchZipcd(){
  	   window.open("../login/find_adrr.jsp", "전자금융거래 이용약관", "width=600, height=500, left=100");
 	}
 </script>
<div id="third"> <!-- 항상 top에 오는 부분 -->
<!-- 모든 문서의 내용 시작 -->
<form method="post" action="update_ok.jsp" onsubmit="return check(this)">
  <table width="800" align="center" class="member_form">
  <caption> 
  <h2 align="left"> 신세계포인트 통합회원</h2> <br>
  <h3 align="left"> 회원정보변경</h3> 
  <hr style="border:solid 1px black"> 
  </caption>
  <tr>
   <td> 회원아이디 </td> 
   <td> <%=rs.getString("userid")%></td>
  </tr>
  <tr>
   <td> 이름 </td>
   <td> <%=rs.getString("name") %> </td>
  </tr>
  <tr>
   <td> 주소 </td>
   <td> <input type="text" name="address" value="<%=rs.getString("address")%>">
   <input type="button" onclick="openPopupSearchZipcd()" value="주소변경">
    </td>
  </tr>
  <tr>
   <td> 휴대폰 번호 </td>
   <td> <input type="text" name="phone" value="<%=rs.getString("phone") %>" maxlength="11"> </td>
  </tr>
  <tr>
   <td> 이메일 주소 </td>
   <td> <input type="text" name="email" value="<%=rs.getString("email")%>"> </td>
  </tr>
  <tr align="center">
   <td colspan="4"><br> <input type="submit" class="submit_form" value="변경하기"> </td>
  </tr>
  </table>
 </form>
 
<!-- 모든 문서의 내용 끝 -->
</div>
<c:import url="../ssgbottom.jsp"/>