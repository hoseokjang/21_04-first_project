<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>국내 배송지 추가</title>
<style>
 #insert_adress_finish{
 	width:170px; height:40px; background:black; color:white; border:1px solid black;
 	font-size:16px; cursor:pointer;
 }
 #insert_adress_quit{
 	width:170px; height:40px; border:1px solid grey; font-size:16px; cursor:pointer;
 }
</style>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function juso_search()  // 우편번호 버튼 클릭시 호출 함수명
{
  new daum.Postcode({
      oncomplete: function(data) {
          if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
              addr = data.roadAddress;
          } else { // 사용자가 지번 주소를 선택했을 경우(J)
              addr = data.jibunAddress;
          }

          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.ssg.zip.value = data.zonecode; // 우편번호
          document.ssg.juso.value = addr;  // 주소
          // 커서를 상세주소 필드로 이동한다.
          document.ssg.juso_etc.focus();
      }
  }).open();
}
</script>
<script>
function openPopupSearchZipcd(){
	window.open("find_adrr.jsp", "도로명 주소 찾기", "width=600, height=500, left=100");
}
function insert_address_ok(){
	window.close();
	opener.reload();
}
function closePopup(){
	self.close();
	window.close();
}
</script>
</head>
<body>
<form method="post" name="ssg" action="insert_adrr_ok.jsp">
 <table width="600" align="center">
 <caption> <h3> 국내 배송지 추가 </h3> <hr width="650" size="2" color="black"> </caption><br>
 </table>
 <table width="600" align="center">
   <tr height="40">
    <td width="150"> 주소별칭 </td>
    <td>
      <input type="text" name="nickname">
    </td>
   </tr>
   <tr height="40">
    <td> 받는 분 </td>
    <td>
      <input type="text" name="name"> 10자 이내
    </td>
   </tr>
   <tr height="40">
    <td> 휴대폰 </td>
    <td>
      <input type="text" name="phone"> 숫자만 입력해주세요
    </td>
   </tr>
   <tr height="40">
    <td> 전화번호(선택) </td>
    <td>
      <input type="text" name="tel"> 숫자만 입력해주세요
    </td>
   </tr>
   <tr height="40">
    <td rowspan="3"> 배송주소 </td>
    <td>
      <input type="text" name="zip" id="zip" style="width:120px; height:20px;">
      <span style="padding-top:2px;">
      <button type="button" class="non_mem_btn_grey" title="새창열림" onclick="juso_search()" style="margin-top:1px; height:31px; cursor:pointer;">
    우편번호 찾기 </button> </span>
    </td>
   </tr>
   <tr>
     <td> <input type="text" name="juso" id="juso" style="width:225px; height:20px;"> </td>
   </tr>
   <tr>
     <td> <input type="text" name="juso_etc" id="juso_etc" style="width:225px; height:20px;"> </td>
   </tr>
   <tr height="40">
    <td colspan="2" style="font-size:8px;">
      <div>
        <div> * 배송 주소를 변경하실 경우는 쇼핑 전에 변경해주세요.</div>
      </div>
    </td>
   </tr>
   <tr align="center">
     <td colspan="2">
       <input type="submit" id="insert_adress_finish" value="확인">
       <input type="button" id="insert_adress_quit" value="취소" onclick="closePopup()">
     </td>
   </tr>
 </table>
</form>
</body>
</html>