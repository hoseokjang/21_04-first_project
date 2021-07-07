<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="ssg.dao.RecentView" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../ssgmain.css">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	function sinsun_over()
	{
		document.getElementById("sinsun_tab").style.display="";
	}
	function sinsun_out()
	{
		document.getElementById("sinsun_tab").style.display="none";
	}
	 $(function()
		 {
			setInterval(function()
			{
	          $("#sil_ul").animate(
			  {
	              marginTop:"-40px" 
			  },1000,function()
			  {
				 $("#sil_ul").css("marginTop","0px");
				 $(".sil_li").eq(0).insertAfter($(".sil_li").eq(7));
		 	  }); 
			},2000);
		 }); 
	 $(function()
		{
			$(window).scroll(function()
			{
				var top=$(window).scrollTop();
				$("#sideview").css("top",top);
			});
			$("#sideviewtop").click(function()
			{
				$(window).scrollTop(0);
			});
		});
	 function aa_over(my)
	 {
		 my.style.color="#ff5b59";
	 }
	 function aa_out(my)
	 {
		 my.style.color="black";
	 }
	 function myssgalert()
	 {
		 alert("회원전용 메뉴입니다.");
	 }
</script>
</head>
<body>
	<div id="first">	
		<div id="logo" onclick="location='../main/ssgindex.jsp'"><img src="../imgdata/logo.jpg" width="120"></div>
		<form method="post" action="../main/search_dlist.jsp?chk=0">
		<div id="searchbox">
		<input type="text" id="searchbar" name="searchbar" placeholder="검색어를 입력하세요">
		<button type="submit" id="searchbutton"><img src="../imgdata/search.png" width="20" height="20"></button>
		</div>
		</form>
		<div id="silsigan">
			<ul id="sil_ul">
				<li onclick="location=''" class="sil_li">1.사과</li>
				<li onclick="location=''" class="sil_li">2.딸기</li>
				<li onclick="location=''" class="sil_li">3.배</li>
				<li onclick="location=''" class="sil_li">4.라면</li>
				<li onclick="location=''" class="sil_li">5.아이스크림</li>
				<li onclick="location=''" class="sil_li">6.초콜릿</li>
				<li onclick="location=''" class="sil_li">7.과자</li>
				<li onclick="location=''" class="sil_li">8.빵</li>
			</ul>
		</div>
		<div id="util_box">
			<ul id="util_menu">
		  	<c:if test="${userid==null}"><!-- 비회원주문이나 정보없는 상태 로그인으로 -->
		  	<li onclick="location='../login/login.jsp'"><img src="../imgdata/basket.png" width="60"></li>
		  	<li onclick="location='../login/login.jsp'"><img src="../imgdata/delibery.png" width="60"></li>
		  	<li onclick="location='../login/login.jsp'"><img src="../imgdata/myorder.png" width="60"></li>
		  	</c:if>
		  	<c:if test="${userid!=null and state==0}"><!-- 로그인상태 각메뉴로로 이동 -->
		  	<li onclick="location='../cart/cartlist.jsp'"><img src="../imgdata/basket.png" width="60"></li>
		  	<li onclick="location='../order/mem_order_confirm_all.jsp'"><img src="../imgdata/delibery.png" width="60"></li>
		  	<li onclick="location='../myssg/myssg.jsp'"><img src="../imgdata/myorder.png" width="60"></li>
		  	</c:if>
		  	<c:if test="${userid!=null and state==1}"><!-- 비회원로그인상태 각메뉴로로 이동 -->
		  	<li onclick="location='../cart/cartlist.jsp'"><img src="../imgdata/basket.png" width="60"></li>
		  	<%@page import="ssg.dao.NonMemberDao" %>
			<%
				NonMemberDao ndao=new NonMemberDao();
				int chk=ndao.nonmember_login_ok(request,session);
				
				if(chk == 0)
			    {
			%>
			<li onclick="location='../order/non_mem_order_confirm.jsp'"><img src="../imgdata/delibery.png" width="60"></li>
			<%
			    }
			    else if(chk==1)
			    {
			%>
			<li onclick="location='../login/non_mem_login.jsp'"><img src="../imgdata/delibery.png" width="60"></li>
			<%
			    }
			    else{
			%>
			<li onclick="location='../main/ssgindex.jsp'"><img src="../imgdata/delibery.png" width="60"></li>
				
			<%
			    }
			%>
		  	<li onclick="myssgalert()"><img src="../imgdata/myorder.png" width="60"></li>
		  	</c:if>
			</ul>
		</div>	
		<div id="user_box">
	  		<c:if test="${userid==null}"><!-- 정보없는상태 -->
	  		<ul id="user_menu">
		  	<li onclick="location='../login/login.jsp'" style="border-right:1px dotted;">로그인 &nbsp;</li>
		  	<li onclick="location='../login/member.jsp'" style="border-right:1px dotted;">회원가입 &nbsp;</li>
		  	<li onclick="location='../faq.jsp'">고객센터</li>	
			</ul>
			</c:if>
			<c:if test="${state==1}"><!-- 비회원주문상태-->
	  		<ul id="user_menu">
		  	<li style="border-right:1px dotted;">${name}님(비회원) &nbsp;</li>
		  	<li onclick="location='../login/member.jsp'" style="border-right:1px dotted;">회원가입 &nbsp;</li>
		  	<li onclick="location='../login/logout.jsp'" style="border-right:1px dotted;">로그아웃 &nbsp;</li>
		  	<li onclick="location='../faq.jsp'">고객센터</li>
		  	</c:if>
			<c:if test="${userid!=null and userid!='admin' and state==0}"><!-- 회원로그인상태-->
	  		<ul id="user_menu">
		  	<li style="border-right:1px dotted;">${name}님 환영합니다 &nbsp;</li>
		  	<li onclick="location='../login/logout.jsp'" style="border-right:1px dotted;">로그아웃 &nbsp;</li>
		  	<li onclick="location='../faq.jsp'">고객센터</li>	
			</ul>
			</c:if>
			<c:if test="${userid=='admin'}"><!-- 관리자모드-->
	  		<ul id="user_menu">
		  	<li>관리자모드입니다</li>
		  	<li onclick="location='../login/logout.jsp'" style="border-right:1px dotted;">로그아웃 &nbsp;</li>
		  	<li onclick="location='../faq.jsp'">고객센터</li>
		  	</ul>
		  	</c:if>
		</div>
	</div>
	<div id="second_line">
		<div id="second">
			<div id="main_li"><img src="../imgdata/main_li.png" height="20"></div>
			<div id="tab_list">
				<ul class="tab_list_sub">
					<li class="tab_button" onmouseover="sinsun_over()" onmouseout="sinsun_out()">신선식품 &nbsp;&nbsp;
						<div id="sinsun_tab" style="display:none;">
								<div class="sinsun_a">
									<a class="sinsun_t" onmouseover="aa_over(this)" onmouseout="aa_out(this)" href="../product/prod_list.jsp?prod_category=fruit">과일</a><p>
									<a onmouseover="aa_over(this)" onmouseout="aa_out(this)" href="../product/prod_dlist.jsp?prod_dcategory=melon">수박/멜론/참외/토마토</a><br>
									<a onmouseover="aa_over(this)" onmouseout="aa_out(this)" href="../product/prod_dlist.jsp?prod_dcategory=grape">포도/자두/복숭아</a><br>
									<a onmouseover="aa_over(this)" onmouseout="aa_out(this)" href="../product/prod_dlist.jsp?prod_dcategory=banana">바나나/파인애플</a><br>
									<a onmouseover="aa_over(this)" onmouseout="aa_out(this)" href="../product/prod_dlist.jsp?prod_dcategory=orange">오렌지/자몽/레몬</a><br>
									<a onmouseover="aa_over(this)" onmouseout="aa_out(this)" href="../product/prod_dlist.jsp?prod_dcategory=apple">사과/배</a><br>
									<a onmouseover="aa_over(this)" onmouseout="aa_out(this)" href="../product/prod_dlist.jsp?prod_dcategory=strawberry">딸기/키위/블루베리</a><br>
									<a onmouseover="aa_over(this)" onmouseout="aa_out(this)" href="../product/prod_dlist.jsp?prod_dcategory=gam">감/곶감</a><br>
								</div>
								<div class="sinsun_a">
									<a class="sinsun_t" onmouseover="aa_over(this)" onmouseout="aa_out(this)" href="../product/prod_list.jsp?prod_category=vegetable">채소</a><p>
									<a onmouseover="aa_over(this)" onmouseout="aa_out(this)" href="../product/prod_dlist.jsp?prod_dcategory=tofu">두부/콩나물/숙주나물</a><br>
									<a onmouseover="aa_over(this)" onmouseout="aa_out(this)" href="../product/prod_dlist.jsp?prod_dcategory=potato">고구마/감자</a><br>
									<a onmouseover="aa_over(this)" onmouseout="aa_out(this)" href="../product/prod_dlist.jsp?prod_dcategory=onion">양파/마늘/파/생강</a><br>
									<a onmouseover="aa_over(this)" onmouseout="aa_out(this)" href="../product/prod_dlist.jsp?prod_dcategory=corn">오이/가지/호박/옥수수</a><br>
									<a onmouseover="aa_over(this)" onmouseout="aa_out(this)" href="../product/prod_dlist.jsp?prod_dcategory=ssam">상추/깻잎/쌈채소</a><br>
									<a onmouseover="aa_over(this)" onmouseout="aa_out(this)" href="../product/prod_dlist.jsp?prod_dcategory=green">시금치/부추/나물</a><br>
									<a onmouseover="aa_over(this)" onmouseout="aa_out(this)" href="../product/prod_dlist.jsp?prod_dcategory=chili">고추/피망/파프리카</a><br>
								</div>
								<div class="sinsun_a">
									<a class="sinsun_t" onmouseover="aa_over(this)" onmouseout="aa_out(this)" href="../product/prod_list.jsp?prod_category=fish">수산물</a><p>
									<a onmouseover="aa_over(this)" onmouseout="aa_out(this)" href="../product/prod_dlist.jsp?prod_dcategory=fish">생선</a><br>
									<a onmouseover="aa_over(this)" onmouseout="aa_out(this)" href="../product/prod_dlist.jsp?prod_dcategory=driedfish">건오징어/건어물</a><br>
									<a onmouseover="aa_over(this)" onmouseout="aa_out(this)" href="../product/prod_dlist.jsp?prod_dcategory=gul">전복/굴/멍게/조개류</a><br>
									<a onmouseover="aa_over(this)" onmouseout="aa_out(this)" href="../product/prod_dlist.jsp?prod_dcategory=octopus">오징어/낙지/주꾸미/문어</a><br>
								</div>
								<div class="sinsun_a">
									<a class="sinsun_t" onmouseover="aa_over(this)" onmouseout="aa_out(this)" href="../product/prod_list.jsp?prod_category=pork">정육/계란</a><p>
									<a onmouseover="aa_over(this)" onmouseout="aa_out(this)" href="../product/prod_dlist.jsp?prod_dcategory=egg">계란/알류</a><br>
									<a onmouseover="aa_over(this)" onmouseout="aa_out(this)" href="../product/prod_dlist.jsp?prod_dcategory=chicken">닭/오리고기</a><br>
									<a onmouseover="aa_over(this)" onmouseout="aa_out(this)" href="../product/prod_dlist.jsp?prod_dcategory=ppork">돼지고기</a><br>
									<a onmouseover="aa_over(this)" onmouseout="aa_out(this)" href="../product/prod_dlist.jsp?prod_dcategory=beef">소고기</a><br>
								</div>
						</div>
					</li>
					<li class="tab_button" onmouseover="gagong_over()" onmouseout="gagong_out()">가공식품 &nbsp;&nbsp;
						<div id="gagong_tab" style="display:none;">
							<ul>
							</ul>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div id="sideview_box">
 		<div id="sideview">
			<div id="side_title">최근 본 상품</div>
			<%
				RecentView rview=new RecentView();
				
				String key="recentview";
			
				ArrayList<String> rvlist=rview.getValueList(key, request);
				
				String view1=null;

				if(rvlist != null)
				{
					for(int i=0;i<rvlist.size() && i<4;i++)
					{
						view1=rvlist.get(i);
					
						
			%>
						<div id="sideproduct" onclick="location='../product/prod_content.jsp?prod_id=<%=view1%>'"><img src="../product/상품사진/<%=view1%>_i1_290.jpg" width="80"></div>
			<%
					}
				}
				else
				{
			%>
					<span id="sidenone">최근 본<br>상품이<br>없습니다</span>
			<%
				}
			%>
			<div><input type="button" id="sideviewtop" value="TOP"></div>
		</div>
	</div>
	
	
	
	
	
	
	
	