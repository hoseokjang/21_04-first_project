<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:import url="../ssgtop.jsp"/>
<link rel="stylesheet" href="../main.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
 <style>
 .member_form{
 	line-height:45px;
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
          document.pkc.zip.value = data.zonecode; // 우편번호
          document.pkc.juso.value = addr;  // 주소
          // 커서를 상세주소 필드로 이동한다.
          document.pkc.juso_etc.focus();
      }
  }).open();
}
</script>
 <script>
 	function check(){
 			
 		var my=document.pkc;
 		var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
 		// 이메일이 적합한지 검사할 정규식
 		if(my.userid.value=="")
 		{
 			alert("아이디를 입력해주세요");
 			my.userid.focus();
 			return false;
 		}
 		
 		for (var i = 0; i < my.userid.value.length; i++) {
            ch = my.userid.value.charAt(i)
            if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')&&!(ch >= 'A' && ch <= 'Z')) {
                alert("아이디는 영문 대소문자, 숫자만 입력가능합니다.")
                my.userid.focus();
                return false;
            }
        }
 		
 		if(my.userid.value.indexOf(" ") >= 0)
 			{
 			alert("아이디에 공백을 사용할 수 없습니다.")
 			my.userid.focus();
 			return false;
 			}
 		
 		if(my.userid.value.length < 4)
 		{
 			alert("아이디는 4자 이상 적으세요");
 			return false;
 		}
 		
 		if(my.pwd.value.length < 8)
 		{
 			alert("비밀번호를 8자 이상 적으세요");
 			return false;
 		}
 		if(my.pwd.value != my.pwd2.value)
 			{
 			alert("비밀번호의 값이 서로 다릅니다");
 			my.pwd.Value="";
 			my.pwd2.Value="";
 			return false;
 			}
 		if(my.name.value=="")
 			{
 			alert("이름을 입력해주세요")
 			return false;
 			}
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
 	function userid_check()
 	{
 		var chk=new XMLHttpRequest();
 		var url="userid_check.jsp?userid="+document.pkc.userid.value;
 		chk.open("get",url);
 		chk.send();
 		
 		chk.onreadystatechange=function()
 		{
 			if(chk.readyState==4)
 			{
 				if(chk.responseText.trim()=="1")
 				{
 					alert("사용 불가능한 아이디");
 					document.pkc.userid.value="";
 				}
 				else
 				{
 					alert("사용 가능한 아이디");
 				}
 			}
 		}
 	}
 	
 	function openPopupSearchZipcd(){
 	   window.open("find_adrr.jsp", "전자금융거래 이용약관", "width=600, height=500, left=100");
 	}
 </script>

 <form name="pkc" method="post" action="member_ok.jsp" onsubmit="return check()">
  <table width="800" align="center" class="member_form">
  <caption> 
  <h2 align="left"> 신세계포인트 통합회원 가입</h2> <br>
  <h3 align="left"> 회원정보  </h3> 
  <hr style="border:solid 1px black"> 
  
  </caption>
  <tr>
   <td> 아이디 </td> 
   <td> <input type="text" name="userid" placeholder="영문,숫자 조합 4~12자리로 입력해주세요." maxlength="12"> 
   		<button type="button" title="새창열림" onclick="userid_check()" style="margin-top:1px; margin-left:1px; height:31px; cursor:pointer;">
    중복확인</button> 
   </td>
  </tr>
  <tr>
   <td> 비밀번호 </td>
   <td> <input type="password" name="pwd" placeholder="영문,숫자 조합 8~20자리로 입력해주세요." maxlength="20"> </td>
  </tr>
  <tr>
   <td> 비밀번호 확인 </td>
   <td> <input type="password" name="pwd2" placeholder="입력하신 비밀번호를 한 번 더 입력해주세요." maxlength="20"> </td>
  </tr>
  <tr>
   <td> 이름 </td>
   <td> <input type="text" name="name"> </td>
  </tr>
  <tr height="40">
    <td rowspan="3"> 배송주소 </td>
    <td>
      <input type="text" name="zip" id="zip" size=19 style="height:30px;">
      <span style="padding-top:2px;">
      <button type="button" class="non_mem_btn_grey" title="새창열림" onclick="juso_search()" style="margin-top:1px; margin-left:1px; height:31px; cursor:pointer;">
    우편번호 찾기 </button> </span>
    </td>
   </tr>
   <tr>
     <td> <input type="text" name="juso"  id="juso" size=35 style="height:30px; margin-top:8px;"> </td>
   </tr>
   <tr>
     <td> <input type="text" name="juso_etc" id="juso_etc" size=35 style="height:30px; margin-top:10px; margin-bottom:5px;"> </td>
   </tr>
  <tr>
   <td> 휴대폰 번호 </td>
   <td> <input type="text" name="phone" placeholder="' - '없이 번호로만 입력해주세요." maxlength="11"> </td>
  </tr>
  <tr>
   <td> 이메일 주소 </td>
   <td> <input type="text" name="email" placeholder="자주 사용하시는 이메일 주소를 입력해주세요."> </td>
  </tr>
  <tr align="center">
   <td colspan="4"><br> <input type="submit" value="회원가입"> </td>
  </tr>
  </table>
 </form>
<c:import url="../ssgbottom.jsp"/>