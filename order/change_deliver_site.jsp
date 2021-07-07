<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="ssg.dao.AddressDao" %>
<%@ page import="ssg.dto.AddressDto" %>
<%@ page import="ssg.dao.MemberDao" %>
<%@ page import="ssg.dto.MemberDto" %>
<%@ page import="java.sql.*" %>
<%
	AddressDao adao = new AddressDao();
	ResultSet rs = adao.a_list(request, session);
	ResultSet rs1 = adao.a_list_one(request, session);
	rs1.next();
	int cnt = adao.a_list_count(request, session);
	pageContext.setAttribute("cnt", cnt);
	MemberDao mdao = new MemberDao();
	MemberDto mdto = mdao.mem_content(request, session);
	pageContext.setAttribute("mdto", mdto);
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>배송지 설정</title>
<style>
 #add_new_site{
 	width:100px; height:20px; background:grey; color:white; font-size:8px;
 	cursor:pointer;
 }
 .adrr_update{
 	width:30px; height:20px; background:white; color:black; font-size:8px;
 	cursor:pointer; border:none; padding-left:1px;
 }
 #change_deliver_site{
 	width:100px; height:30px; background:black; color:white; font-size:12px;
 	border:1px solid black; cursor:pointer;
 }
</style>
<script>
 function openPopup_insert_adrr(){
	 open("insert_adrr.jsp", "도로명주소 찾기", "width=600, height=500, left=100");
 }
 function openPopup_update_adrr(adid){
	 //var adid = document.getElementById("address_id").value;
	 open("update_adrr.jsp?address_id="+adid, "배송지 수정", "width=600, height=500, left=100");
 }
 function change_deliver_site_ok(){
	 	var chk_radio = document.getElementsByName("adrr_select");
	 	var sel_type = null;
	 	for(var j=0; j<chk_radio.length; j++){
	 		if(chk_radio[j].checked == true){
	 			sel_type = chk_radio[j].value;
	 		}
	 	}
		 opener.document.getElementById("name1").innerText = document.getElementsByClassName("address_name")[sel_type].innerText;
		 opener.document.getElementById("name2").value = document.getElementsByClassName("address_name")[sel_type].innerText;
		 opener.document.getElementById("name_layer").innerText = document.getElementsByClassName("address_name")[sel_type].innerText;
		 opener.document.getElementById("address1").innerText = document.getElementsByClassName("address")[sel_type].innerText;
		 opener.document.getElementById("address2").value = document.getElementsByClassName("address")[sel_type].innerText;
		 opener.document.getElementById("address_layer").innerText = document.getElementsByClassName("address")[sel_type].innerText;
		 opener.document.getElementById("phone1").innerText = document.getElementsByClassName("address_phone")[sel_type].innerText;
		 opener.document.getElementById("phone2").value = document.getElementsByClassName("address_phone")[sel_type].innerText;
		 opener.document.getElementById("phone_layer").innerText = document.getElementsByClassName("address_phone")[sel_type].innerText;
 }
</script>
</head>
<body>
<form method="post" action="change_deliver_site_ok.jsp">
 <table width="600" align="center">
 <caption> <h3> 국내 배송지 설정 </h3> <hr width="650" size="2" color="black"> </caption><br>
 </table>
 <p>
 <hr width="600" size="1" color="black">
 <div id="deliver_site_default" style="padding-left:15%;">
   <div style="font-size:18px; color:#FF5B59"> <b>기본배송지</b> </div>
   <div style="font-size:11px; padding-top:8px;">
     <span style="color:#FF5B59"><b>[${mdto.name}]</b></span>
     <span id="basic_name"> <b>${mdto.name}</b></span>
     <span id="basic_adress"> <%=rs1.getString("address") %></span>
   </div>
 </div>
 <hr width="600" size="1" color="grey">
 <p><br>
 <div align="right" style="padding-right:15%; padding-top:10px; margin-bottom:0px;">
   <input type="button" id="add_new_site" value="새 배송지 추가" onclick="openPopup_insert_adrr()">
 </div>
 <p>
 <table width="600" align="center">
   <colgroup>
      <col style="width:6%">
      <col style="width:9%">
      <col style="width:9%">
      <col style="width:50%">
      <col style="width:13%">
      <col style="width:13%">
    </colgroup>
    <thead>
      <tr height="13px" style="background:lightgrey; font-size:9px;">
        <th scope="col">선택</th>
        <th scope="col">주소별칭</th>
        <th scope="col">받는 분</th>
        <th scope="col">배송주소</th>
        <th scope="col">연락처</th>
        <th scope="col">수정</th>
      </tr>
    </thead>
    <tbody>
    	<input type="hidden" name="addr_cnt" id="addr_cnt" value="${cnt}">
      <%
        int i = 0;
      %>
     <% while(rs.next()) {%>
      <tr style="font-size:8px;">
      <input type="hidden" name="address_id" id="address_id<%=rs.getString("address_id") %>" value="<%=rs.getString("address_id") %>">
        <td align="center">
          <input type="radio" name="adrr_select" id="adrr<%=i%>" value="<%=i%>">
        </td>
        <%
    		String adid = rs.getString("address_id");
    		pageContext.setAttribute("adid", adid);
		%>
        <td align="center"> <span class="address_nickname" id="address_nickname<%=rs.getString("address_id")%>"> <%=rs.getString("address_nickname") %> </span> </td>
        <td align="center"><span class="address_name" id="address_name<%=rs.getString("address_id")%>"> <%=rs.getString("address_name") %></span> </td>
        <td><span class="address" id="address<%=rs.getString("address_id")%>"> <%=rs.getString("address") %></span> </td>
        <td align="center"> <span class="address_phone" id="address_phone<%=rs.getString("address_id")%>"><%=rs.getString("address_phone") %></span></td>
        <td align="center">
          <input type="button" class="adrr_update" onclick="openPopup_update_adrr(${adid})" value="수정">
        </td>
      </tr>
      <%
      i++;
      }
      %>
      
    </tbody>
 </table>
 <p><br>
 <hr width="600" color="grey">
 <div style="font-size:8px; padding-left:15%;">
   <div> * 배송 주소를 변경하실 경우는 쇼핑 전에 변경해주세요 </div>
   <div> * [배송지 변경하기] 버튼을 클릭하셔야 변경된 배송지가 적용됩니다. </div>
 </div>
 <br>
 <div align="center">
   <input type="submit" id="change_deliver_site" value="배송지 변경하기" onclick="change_deliver_site_ok()">
 </div>
</form>
</body>
</html>