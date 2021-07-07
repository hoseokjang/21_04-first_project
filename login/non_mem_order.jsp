<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비회원 가입하기</title>
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
 		if(my.zip.value=="")
			{
			alert("주소를 입력해주세요")
			return false;
			}

 	}
</script>
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
</head>
<body>
<form name="ssg" id="nonmem_order" method="post" action="non_mem_order_ok.jsp" onsubmit="return check(this)">
 <table width="500" align="center">
 <caption> <h3> 비회원 가입하기 </h3> <hr width="500" size="2" color="black"> </caption>
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
  <tr height="40" align="center">
    <td rowspan="3"> 배송주소 </td>
    <td>
      <input type="text" name="zip" id="zip" size=19 style="height:30px;">
      <span style="padding-top:2px;">
      <button type="button" class="non_mem_btn_grey" title="새창열림" onclick="juso_search()" style="margin-top:1px; margin-left:1px; height:31px; cursor:pointer;">
    우편번호 찾기 </button> </span>
    </td>
   </tr>
   <tr align="center">
     <td> <input type="text" name="juso" id="juso" size=35 style="height:30px;"> </td>
   </tr>
   <tr align="center">
     <td> <input type="text" name="juso_etc" id="juso_etc" size=35 style="height:30px;"> </td>
   </tr>
  <tr style="padding-left:10px;">
   <td colspan="3" >
    <input type="checkbox" style="margin-left:30px;"> <span style="font-size:12px;">[필수]비회원 개인정보 수집 및 이용 동의 </span>
   </td>
  </tr>
  <tr align="center">
   <td colspan="3">
    <div id="personal">
    <dl>
<dd style="font-size:13px; margin-left:10px; margin-right:10px;">
  <table align="center" style="border:1px solid black; border-collapse:collapse;">
    <caption align="left"><span class="blind"><b>개인정보 이용 목적 및 수집항목</b></span></caption>
    <colgroup>
      <col style="width:50%">
      <col style="width:50%">
    </colgroup>
    <thead>
      <tr style="border:1px solid black; border-collapse:collapse;">
        <th scope="col">이용 목적</th>
        <th scope="col">수집항목</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>주문자 정보 확인, 계약사항 및 주문내역 안내</td>
        <td>성명, 휴대폰번호, 이메일주소</td>
      </tr>
      <tr>
        <td>상품 배송 및 배송지 관리</td>
        <td>수취인 정보(성명, 주소, 휴대폰번호, 전화번호)</td>
      </tr>
      <tr>
        <td>해외직구 상품 통관업무 처리</td>
        <td>개인통관번호</td>
      </tr>
      <tr>
        <td>전통주 구매</td>
        <td>생년월일</td>
      </tr>
      <tr>
        <td>계약사항 및 예약내역 안내</td>
        <td>예약자 정보(성명, 휴대폰번호, 이메일주소)</td>
      </tr>
      <tr>
        <td>항공권 예약 및 상담</td>
        <td>예약자 정보(성명, 휴대폰번호, 이메일주소), 탑승객 정보(이름, 생년월일, 성별)</td>
      </tr>
      <tr>
        <td>국제선 항공권 예약, 출국 가능 여부 확인, 탑승객 정보 등록</td>
        <td>탑승객 여권정보(<span class="underline_large">여권번호</span>, 여권만료일, 국적, 발행국)</td>
      </tr>
      <tr>
        <td>미주 및 중국 지역 여행상품 예약</td>
        <td>탑승객 정보(체류도시, 우편번호, 현지 주소, 현지 연락처)</td>
      </tr>
      <tr>
        <td>국내 호텔 상품 예약</td>
        <td>예약자 정보(성명, 휴대폰번호, 이메일주소)</td>
      </tr>
      <tr>
        <td>해외 호텔 상품 예약</td>
        <td>예약자 정보(성명, 휴대폰번호, 이메일주소), 투숙객 정보(영문명, 성별, 휴대폰번호, 이메일주소, 나이)</td>
      </tr>
      <tr>
        <td>청소연구소 서비스 예약</td>
        <td>예약자 정보(주소, 휴대폰번호, 평수, 반려동물 여부)</td>
      </tr>
      <tr>
        <td>주문 및 예약 상품 결제, 부정거래확인</td>
        <td>계좌정보(은행명, 예금주, 계좌번호), 신용카드정보(카드사명, 카드번호), 포인트카드정보(제휴사명, 카드번호), 휴대폰정보(통신사, 휴대폰번호)</td>
      </tr>
      <tr>
        <td>현금영수증 발행</td>
        <td>휴대폰번호, 신용카드번호, 현금영수증카드번호, 사업자번호</td>
      </tr>
      <tr>
        <td>결제 취소 금액 환불</td>
        <td>계좌 정보(은행명, 예금주명, 계좌번호)</td>
      </tr>
      <tr>
        <td>SSG MONEY 출금</td>
        <td>계좌 정보(은행명, 예금주명, 계좌번호)</td>
      </tr>
    </tbody>
  </table>
</dd>
<br>
<dt align="left" style="font-size:13px; margin-left:10px;"><b>보유기간</b></dt>
<dd class="underline_large" align="left" style="font-size:15px; margin-left:10px; font-style:underline;">법정 의무 보유기간까지</dd>
<br>
<dt align="left" style="font-size:13px; margin-left:10px;"><b>동의를 거부할 권리 안내</b></dt>
<dd class="refusal_agree" align="left" style="font-size:11px; color:coral; margin-left:10px;">SSG.COM 비회원 주문 또는 예약을 위해 필수 개인정보 수집 및 이용에 동의하지 않을수 있으나, 동의를 거부 할 경우 SSG.COM서비스 이용이 불가합니다.</dd>
	</dl>
    </div>
   </td>
  </tr>
 </table>
 <table width="400" height="50" align="center">
  <tr align="center">
   <td id="non_mem_order_quit"> <input type="submit" value="취소" border="1px solid black" onclick="closePopup()"> </td>
   <td id="non_mem_order_go"> <input type="submit" value="가입하기" border="1px solid black"> </td>
  </tr>
 </table>
</form>
<br>
<div align="center">
  <div style="font-size:12px; color:grey"> SSG.COM 회원가입을 하시면 더 많은 혜택을 받으실 수 있습니다.</div>
  <div style="font-size:12px;"> 
  <a href="member.jsp"> 회원가입 ></a> &nbsp&nbsp&nbsp
  <a href="non_mem_login.jsp"> 주문조회하기</a>  
  </div>
</div>
</body>
</html>