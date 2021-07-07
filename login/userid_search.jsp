<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:import url="../ssgtop.jsp"/>
<link rel="stylesheet" href="../main.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>
#third {
   width:1100px;
   height:400px;	
/*    background:red;	 */ 
   margin:auto;	 		
}
.tt {
	font-size:30px;
	background:white;
}
.st {
	font-size:20px;
}
 h3 {
 	background:url(../img/line.gif) no-repeat;
 }
 .bt{
 	width:200px;
	height:50px;
	border:1px solid white;
	background:red;
	color:white;
	font-size:20px;
 }

</style>  
</head>
<body>
 <div id="third">
 <c:if test="${imsi == null}">
 <%
 	pageContext.setAttribute("chk", request.getParameter("chk"));
 %>
 <form method="post" action="userid_search_ok.jsp">
  <table width="310" align="center">
  <div style="text-align:center" >
   <h3> <span class="tt">아이디 찾기 </span> </h3>
   <p class="advice">
   <span class="st">"아이디가 생각나지 않으세요?"
   <br>
   "회원정보를 입력 하신 후 확인 버튼을 클릭해주세요."
    </span>
    </p>
  </div>
    <tr>
     <td> <input type="text" class="text_form" name="name" placeholder="이 름"> <p></td>
    </tr>
    <tr>
     <td> <input type="text" class="text_form" name="phone" placeholder="전화번호" maxlength="11"> <p></td>
    </tr>
    <c:if test="${chk == 1 }">
     <tr>
      <td style="color:red"> 이름 혹은 전화번호가 일치하지 않습니다. </td> 
     </tr>
    </c:if>
    <tr>
     <td> <input type="submit" class="submit_form" value="아이디찾기"></td>
    </tr>
  </table>
 </form>
 </c:if>
 <c:if test="${imsi != null }"> <!-- 세션변수가 있다면 -->
 <div style="text-align:center" >
   <h3> <span class="tt">아이디 찾기 완료 </span> </h3>
   <p class="advice">
   <span class="st">"아이디찾기 본인인증에 성공하셨습니다."
   <br>
   "입력하는 정보와 일치하는 아이디 목록입니다. 비밀번호 분실시에는 비밀번호 찾기를 진행해주세요."
    </span>
    </p>
  </div>
 <p align="center" style="font-size:20px">당신의 아이디는 ${imsi} 입니다.</p>
 <br><br><br>
 <div align="center">
 	<input type="button" onclick="location.href='pwd_search.jsp'" class="bt" value="비밀번호찾기">
 	<input type="button" onclick="location.href='login.jsp'" class="bt" value="로그인">
 </div>
</c:if>
<%
	session.invalidate();
%>
 </div>
 
<c:import url="../ssgbottom.jsp"/>