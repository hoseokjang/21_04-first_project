<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>우편번호 찾기</title>

</head>
<body>
<form method="post" action="">
 <table width="480" align="center">
 <caption> <h3> 우편번호 찾기 </h3> <hr width="500" size="2" color="black"> </caption><br>
  <tr align="center">
   <td width="450">
    <input type="text" placeholder="도로명 또는 지번 주소를 입력해주세요." size=100 style="border:none; width:300px; font-size:15px;">
   </td>
   <td width="130">
    <a> <img src="search.PNG" style="width:20px;"> </a>
   </td>
  </tr>
  <tr>
   <td colspan="2">
    <hr width="416" size="2" color="black">
   </td>
  </tr>
 </table>
</form>
<br><br><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>TIP_이렇게 검색하세요!</b>
<p>
<table width="470" height="150" align="center" border="1px solid black" style="border-collapse:collapse;">
 <tr>
   <td width="180" style="background-color:#D3D3D3"> <b>도로명</b> </td>
   <td align="center"> 구로중앙로34길 </td>
 </tr>
 <tr>
   <td style="background-color:#D3D3D3"> <b>도로명+건물번호</b> </td>
   <td align="center"> 대학로 129 </td>
 </tr>
 <tr>
   <td style="background-color:#D3D3D3"> <b>지역명(동/리)+번지</b> </td>
   <td align="center"> 구로동2가 123-45 </td>
 </tr>
 <tr>
   <td style="background-color:#D3D3D3"> <b>법정동/행정동</b> </td>
   <td align="center"> 성수동1가 </td>
 </tr>
</table>
</body>
</html>