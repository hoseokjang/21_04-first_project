<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비회원 주문조회</title>
<style>
 #personal{
  border:1px solid black; width:410px; height:180px; overflow:auto;
 }
 #non_mem_order_quit input[type=submit]{
  width:200px; height:60px; background:white; font-size:15px;
  border-collapse:collapse; cursor:pointer;
 }
 #non_mem_order_go input[type=submit]{
  width:200px; height:60px; background:black; font-size:15px;
  color:white; border-collapse:collapse; cursor:pointer;
 }
 a{
   color:black; cursor: pointer;
  } 
</style>
<script>
function openPopupSearchZipcd(){
	window.open("find_adrr.jsp", "전자금융거래 이용약관", "width=600, height=500, left=100");
}
function closePopup(){
	self.close();
	window.close();
}
function check(my){
		
 		var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
 		// 이메일이 적합한지 검사할 정규식

 		if(my.name.value=="")
 			{
 			alert("이름을 입력해주세요")
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
 		

 	}
</script>
</head>
<body>
<form id="nonmem_order" method="post" action="non_mem_login_ok.jsp" onsubmit="return check(this)">
 <table width="500" align="center">
 <caption> <h3> 비회원 주문조회 </h3> <hr width="500" size="2" color="black"> </caption>
  <tr align="center">
   <td width="130"> 이름 </td>
   <td colspan="2" width="370">
    <input type="text" name="name" placeholder="  주문자명" size=35 style="height:30px;">
   </td>
  </tr>
  <tr align="center">
   <td> 휴대폰 </td>
   <td colspan="2">
    <input type="text" name="phone" placeholder="  '-' 없이 입력" size=35 style="height:30px;" maxlength="11">
   </td>
  </tr>
  <tr align="center">
   <td> 이메일 </td>
   <td colspan="2">
    <input type="text" name="email" placeholder="  이메일 주소" size=35 style="height:30px;">
   </td>
  </tr>



 </table>
 <table width="400" height="50" align="center">
  <tr align="center">
   <td id="non_mem_order_quit"> <input type="submit" value="취소" border="1px solid black" onclick="closePopup()"> </td>
   <td id="non_mem_order_go"> <input type="submit" value="비회원 주문조회" border="1px solid black"> </td>
  </tr>
 </table>
</form>
<br>
<div align="center">
  <div style="font-size:12px; color:grey"> SSG.COM 회원가입을 하시면 더 많은 혜택을 받으실 수 있습니다.</div>
  <div style="font-size:12px;"> 
  <a href="member.jsp"> 회원가입 ></a> &nbsp;&nbsp;&nbsp;
  </div>
</div>
</body>
</html>