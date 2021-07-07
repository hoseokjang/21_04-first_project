<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:import url="../ssgtop.jsp"/>
<link rel="stylesheet" href="../main.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>
  #third{
  	width:1100px;
  	height:400px;
  	margin:auto;
  	right:150px;
  	position:relative;
  }
 #third div {
 	line-height:30px;
 }
 img.absolute {
 	position:absolute;
    left:800px; 
 	top: 50px;
 }
 .icon{
 	list-style:none;
 	padding-left:0px;
 	display: table;
    margin-left: auto;
    margin-right: auto;
 }
 .icon li{
 	float:left;
 	list-style:none;
 	margin:8px;
 	margin-bottom:-25px;
 }
 .sns_name{
 	font-size:12px;
 	top:2px;
 	
 }
 </style>
 <script>
 	function check(my){
 		
 		 if(my.userid.value=="")
 		{
 			alert("아이디 또는 비밀번호를 입력해주세요");
 			my.userid.focus();
 			return false;
 		}  
 		if(my.pwd.value=="")
 		{
 			alert("비밀번호를 입력해주세요");
 			return false;
 		}
 		else
 			return true;
 	}
 </script>
<div id="third" align="center">
 <form   method="post" action="login_ok.jsp" onsubmit="return check(this)">
  <div>
   <div> 
	   <h2>
	   	<span>로그인</span>  
	   </h2> 
   </div>
   
   <div>
    <input type="text" class="text_form" name="userid" placeholder=" &ensp;아이디"> <p>
   </div>
   
   <div>
    <input type="password" class="pwd_form" name="pwd" placeholder=" &ensp;비밀번호"> <p>
   </div>
   
   <div>
	     <input type="checkbox" value="아이디저장"><span style="font-size:13px">아이디저장&ensp;&ensp;&ensp;&ensp;</span>
	     <a href="userid_search.jsp"> 아이디찾기 |</a>
	     <a href="pwd_search.jsp"> 비밀번호찾기 |</a>
	     <a href="member.jsp"> 회원가입 </a>
   </div>
   
   <div>
     <input type="submit" class="submit_form" value="로그인">
   </div>
   <ul class="icon">
   	<li>
	   	<a href="javascript.void(0);" onclick="">
	   		<span class="ico_area">
	   			<span ><img src="../img/naver.png" width="51px" height="51px"></span><p>
	   			<span class="sns_name">네이버 로그인</span>
	   		</span>
	   	</a> 
	</li>
	<li>
	   	<a href="javascript.void(0);" onclick="">
	   		<span class="ico_area">
	   			<span class="kakao"><img src="../img/kakaotalk.png" width="51px" height="51px"></span> <p>
	   			<span class="sns_name">카카오 로그인</span>
	   		</span>
	   	</a> 
	</li>
	<li>
	   	<a href="javascript.void(0);" onclick="">
	   		<span class="ico_area">
	   			<span class="facebook"><img src="../img/facebook.png" width="51px" height="51px"></span><p>
	   			<span class="sns_name">페이스북 로그인</span>
	   		</span>
	   	</a> 
	</li>
	<li>
	   	<a href="javascript.void(0);" onclick="">
	   		<span class="ico_area">
	   			<span class="apple"><img src="../img/apple2.png" width="51px" height="51x"></span><p>
	   			<span class="sns_name">애플 로그인</span>
	   		</span>
	   	</a> 
   	</li>
   </ul>
   
  <div>
  	<span><a href="non_mem_order.jsp">비회원 로그인</a></span>
  </div>
 </div>
  
</form>
<div>
	<img src="../img/ssg1.jpg" class="absolute">
</div>

</div>
<c:import url="../ssgbottom.jsp"/>