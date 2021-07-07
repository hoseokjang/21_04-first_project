<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="ssg.dto.ProductDto" %>
<%@ page import="ssg.dao.ProductDao" %>
<%@ page import="ssg.dao.MainDao" %>
<%@ page import="java.util.ArrayList" %>
<%
	MainDao mdao=new MainDao();
	ArrayList<ProductDto> plist=mdao.mainul1();
	ArrayList<ProductDto> plist2=mdao.mainul2();
	ArrayList<ProductDto> plist3_1=mdao.mainul3_1();
	ArrayList<ProductDto> plist3_2=mdao.mainul3_2();
	ArrayList<ProductDto> plist3_3=mdao.mainul3_3();
	ArrayList<ProductDto> plist3_4=mdao.mainul3_4();
	pageContext.setAttribute("plist", plist);
	pageContext.setAttribute("plist2", plist2);
	pageContext.setAttribute("plist3_1", plist3_1);
	pageContext.setAttribute("plist3_2", plist3_2);
	pageContext.setAttribute("plist3_3", plist3_3);
	pageContext.setAttribute("plist3_4", plist3_4);
%>
<style>
#event
{background:#ff943a;margin-top:10px;text-align:center;}
.mainbox
{width:1280px;margin:auto;text-align:center;}
.maintitle
{font-family: NanumBarunGothicBold;font-size: 25px;letter-spacing: -0.5px;height:40px;}
.mainsubtitle
{font-family: NanumBarunGothicBold;font-size: 15px;color:#666666;}

.mainul
{padding-inline-start:0px;}
#mainul1 > li
{width:290px;display:inline-block;list-style-type:None;padding:10px;}
#mainul2 .mainul li
{display:inline-block;list-style-type:None;padding:20px 38px 20px 38px;}
#mainul2bttbox
{position:absolute;}
#mainul3
{border:1px solid #e5e5e5;margin-left:14px;margin-top:10px;margin-right:14px;
padding-inline-start:0px;text-align:left;}
#mainul3 > li
{display:inline-block;list-style-type:None;}
#mainul3_2
{top:-16px;left:4px;background:white;}
#mainul3_3
{top:-16px;left:4px;background:white;}
#mainul3_4
{top:-16px;left:4px;background:white;}
#mainul3_1 .mainul li
{display:inline-block;list-style-type:None;padding:10px;}
#mainul4 > li
{display:inline-block;list-style-type:None;padding:10px;}

.slidebox 
{width:1230px;height:620px;margin:auto;overflow:hidden;position:relative;align-items:center;}
#slideul
{padding-inline-start:0px;font-size:0px;width:3690px;height:600px;margin-left:-1230px;display:inline-flex;}
.slidebox .slidelist .slideitem 
{width:1230px;height:620px;padding:12px 3px 0px 3px;display:inline-flex;}
.slidebox .slidelist .slideitem a 
{padding:0px 10px 0px 6px;}
#slideinputbox
{margin:auto;position:relative;right:-544px;}
.slideinput
{width:30px;height:30px;background:white;border:0.5px solid #e5e5e5;cursor:pointer;}

#deliver
{position:relative}
#deliver_box
{position:absolute;left:437px;top:75%;color:black;text-decoration:none;}
#deliver_ul
{padding-inline-start:0px;}
#deliver_box .deliver_li
{display:inline-block;list-style-type:None;color:#666666;font-size:11px;
background:white;height:20px;width:60px;border-radius:15px 15px 15px 15px;border:solid 1px rgba(34, 34, 34, 0.1);padding-top:5px;
font-weight:550;font-family:NanumBarunGothicBold, sans-serif;letter-spacing:-0.2px;
text-decoration:none;cursor:pointer;}
.mainbox a
{text-decoration:none;}
#mainul1box
{width:1280px;margin:auto;height:450px;}
.mainbox .prodbox
{text-align:left;position:absolute;width:280px;height:130px;padding-left:8px;text-decoration:none;}
.mainbox .prodname
{font-size:13px;font-family:NanumBarunGothicBold, sans-serif;letter-spacing:-0.5px;
text-decoration:none;cursor:pointer;color:#555555;}
.mainbox .prodrate
{font-size:13px;color:#555555;font-family:NanumBarunGothicBold, sans-serif;letter-spacing:-0.2px;}
.mainbox .prodprice
{font-size:22px;font-weight:550;font-family:NanumBarunGothicBold, sans-serif;letter-spacing:-0.2px;
text-decoration:none;color:black;}

#mainul2btt
{background:white;border:1px solid black;width:120px;height:40px;cursor:pointer;font-weight:550;
font-size:13px;color:black;font-family:NanumBarunGothicBold, sans-serif;letter-spacing:-0.2px;}
#mainul3 .ul3button
{width:90px;height:45px;cursor:pointer;padding:0px;background:white;border:0px;
font-size:13px;font-family:"나눔바른고딕", NanumBarunGothic,sans-serif;letter-spacing:-0.4px;}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	//슬라이드배너 문서시작
	var s1=setInterval(function()
			{
				$("#slideul").animate(
  					{
  						marginLeft:"-2460px"
					},1250,function()
  						{
	 						$("#slideul").css("marginLeft","-1230px");
	 						$(".slideitem").eq(0).insertAfter($(".slideitem").eq(2));
	  					}); 
			},2800); 
	//슬라이드배너 멈춤
	function slide_stop()
	{
		clearInterval(s1);
	}
	//슬라이드배너 시작
	function slide_start()
	{
		s1=setInterval(function()
		{
			$("#slideul").animate(
				{
					marginLeft:"-2460px" 
				},1250,function()
					{
						$("#slideul").css("marginLeft","-1230px");
						$(".slideitem").eq(0).insertAfter($(".slideitem").eq(2));
					}); 
		},2800); 
	}
	//슬라이드배너 이전,다음
	$(function()   
   	{
	   $("#slide_prev").click(function()
	   {
		   $("#slideul").animate(
			  {
	              marginLeft:"+0px" 
			  },1250,function()
			  {
				  $("#slideul").css("marginLeft","-1230px");
				  $(".slideitem").eq(2).insertBefore($(".slideitem").eq(0));
		 	  }); 
	   });
	   $("#slide_next").click(function()
	   {
		   $("#slideul").animate(
			  {
	              marginLeft:"-2460px" 
			  },1250,function()
			  {
				 $("#slideul").css("marginLeft","-1230px");
				 $(".slideitem").eq(0).insertAfter($(".slideitem").eq(2));
		 	  }); 
	   });
  	});
	//mainul2 더보기접기
	function mainul2open()
	{
		if(document.getElementById("mainul2_1").style.display=="none")
		{
			document.getElementById("mainul2_1").style.display="inline-block";
			document.getElementById("mainul2btt").innerText="접기";
		}
		else
		{
			document.getElementById("mainul2_1").style.display="none";	
			document.getElementById("mainul2btt").innerText="더 보기";
		}
	}
	//mainul3 신선,가공 변경
	function change3_1()
	{
		document.getElementById("mainul3_2").style.display="none";
		document.getElementById("mainul3_3").style.display="none";
		document.getElementById("mainul3_4").style.display="none";
		document.getElementsByClassName("ul3button")[0].style.background="black";
		document.getElementsByClassName("ul3button")[0].style.color="white";
		document.getElementsByClassName("ul3button")[1].style.background="white";
		document.getElementsByClassName("ul3button")[1].style.color="black";
		document.getElementsByClassName("ul3button")[2].style.background="white";
		document.getElementsByClassName("ul3button")[2].style.color="black";
		document.getElementsByClassName("ul3button")[3].style.background="white";
		document.getElementsByClassName("ul3button")[3].style.color="black";
	}
	function change3_2()
	{
		document.getElementById("mainul3_2").style.display="";
		document.getElementById("mainul3_3").style.display="none";
		document.getElementById("mainul3_4").style.display="none";
		document.getElementsByClassName("ul3button")[0].style.background="white";
		document.getElementsByClassName("ul3button")[0].style.color="black";
		document.getElementsByClassName("ul3button")[1].style.background="black";
		document.getElementsByClassName("ul3button")[1].style.color="white";
		document.getElementsByClassName("ul3button")[2].style.background="white";
		document.getElementsByClassName("ul3button")[2].style.color="black";
		document.getElementsByClassName("ul3button")[3].style.background="white";
		document.getElementsByClassName("ul3button")[3].style.color="black";
	}
	function change3_3()
	{
		document.getElementById("mainul3_2").style.display="none";
		document.getElementById("mainul3_3").style.display="";
		document.getElementById("mainul3_4").style.display="none";
		document.getElementsByClassName("ul3button")[0].style.background="white";
		document.getElementsByClassName("ul3button")[0].style.color="black";
		document.getElementsByClassName("ul3button")[1].style.background="white";
		document.getElementsByClassName("ul3button")[1].style.color="black";
		document.getElementsByClassName("ul3button")[2].style.background="black";
		document.getElementsByClassName("ul3button")[2].style.color="white";
		document.getElementsByClassName("ul3button")[3].style.background="white";
		document.getElementsByClassName("ul3button")[3].style.color="black";
	}
	function change3_4()
	{
		document.getElementById("mainul3_2").style.display="none";
		document.getElementById("mainul3_3").style.display="none";
		document.getElementById("mainul3_4").style.display="";
		document.getElementsByClassName("ul3button")[0].style.background="white";
		document.getElementsByClassName("ul3button")[0].style.color="black";
		document.getElementsByClassName("ul3button")[1].style.background="white";
		document.getElementsByClassName("ul3button")[1].style.color="black";
		document.getElementsByClassName("ul3button")[2].style.background="white";
		document.getElementsByClassName("ul3button")[2].style.color="black";
		document.getElementsByClassName("ul3button")[3].style.background="black";
		document.getElementsByClassName("ul3button")[3].style.color="white";
	}
	function prod_over(my)
	{
		my.style.color="#ff5b59";
	}
	function prod_out(my)
	{
		my.style.color="";
	}
</script>
<c:import url="../ssgtop.jsp"/>
<div id="event">
<a href=""><img src="../imgdata/event.png"></a>
</div>
<div class="mainbox">
	<div class="slidebox">
		<ul id="slideul" class="slidelist">
		<li class="slideitem"><a href=""><img src="../imgdata/berry.jpg" width="600"></a><a href=""><img src="../imgdata/orange.jpg" width="600"></a></li>
		<li class="slideitem"><a href=""><img src="../imgdata/noodle.jpg" width="600"></a><a href=""><img src="../imgdata/dduk.jpg" width="600"></a></li>
		<li class="slideitem"><a href=""><img src="../imgdata/choco.jpg" width="600"></a><a href=""><img src="../imgdata/icecream.jpg" width="600"></a></li>
		</ul>
	</div>
	<div id="slideinputbox">
		<input class="slideinput" type="image" id="slide_prev" src="../imgdata/larrow.jpg">
		<input class="slideinput" type="image" id="slide_next" src="../imgdata/rarrow.jpg">
		<input class="slideinput" type="image" onclick="slide_start()" src="../imgdata/start.jpg">
		<input class="slideinput" type="image" onclick="slide_stop()" src="../imgdata/pause.jpg">
	</div>
<div id="main_subject" class="mainbox" style="padding-top:50px;">
	<div class="maintitle"><h4>맛있는걸 편하게 집에서 받아보세요</h4></div>
		<div class="mainsubtitle">원하는 시간에 편하게 받아보세요</div>
		<div id="deliver">
			<img src="../imgdata/banner.jpg" width="1280" height="200" style="padding-top:15px;">
			<a href="">
			<div id="deliver_box">
				<ul id="deliver_ul">
					<li class="deliver_li">아침식사</li>
					<li class="deliver_li">친환경</li>
					<li class="deliver_li">채소</li>
					<li class="deliver_li">상큼과일</li>
					<li class="deliver_li">간편식사</li>
					<li class="deliver_li">신선식탁</li>
				</ul>
			</div>
			</a>
		</div>
		<div id="mainul1box">
		<ul id="mainul1" class="mainul">
			<c:forEach var="pdto" items="${plist}" begin="0" end="3">
			<li><a href="../product/prod_content.jsp?prod_id=${pdto.prod_id}"><img src="../product/상품사진/${pdto.prod_id}_i1_290.jpg" width="280"><p>
				<div class="prodbox">
					<span class="prodname">${pdto.prod_name}</span><br></a>
					<span class="prodprice"><fmt:formatNumber value="${pdto.prod_price}"></fmt:formatNumber></span>원<br>
					<span class="prodrate">평점 : ${pdto.prod_rate}</span><p>
					<c:if test="${userid=='admin'}">
					<a href="m1update.jsp?id=${pdto.main1ul}&prod_id=${pdto.prod_id}">배너제품수정</a>
					</c:if>
				</div>
			</li>
			</c:forEach>
		</ul>
		</div>
	<div class="maintitle"><h4>주간 베스트 상품 놓치지 마세요</h4></div>
		<div class="mainsubtitle">신선한 제품들을 특별한 가격에 만나보세요</div>
			<div id="mainul2">
				<div id="mainul2box" style="height:500px;">
				<ul class="mainul">
					<c:forEach var="pdto2" items="${plist2}" begin="0" end="2">
					<li><a href="../product/prod_content.jsp?prod_id=${pdto2.prod_id}"><img src="../product/상품사진/${pdto2.prod_id}_i1_290.jpg" width="330"><p>
					<div class="prodbox">
						<span class="prodname">${pdto2.prod_name}</span><br></a>
						<span class="prodprice"><fmt:formatNumber value="${pdto2.prod_price}"></fmt:formatNumber></span>원<br>
						<span class="prodrate">평점 : ${pdto2.prod_rate}</span><p>
					</div>
					</li>
					</c:forEach>
					</div>
				<div id="mainul2_1" style="display:none;">
				<ul class="mainul">
				<div id="mainul2box" style="height:500px;">
					<ul class="mainul">
					<c:forEach var="pdto2" items="${plist2}" begin="3" end="5">
					<li><a href="../product/prod_content.jsp?prod_id=${pdto2.prod_id}"><img src="../product/상품사진/${pdto2.prod_id}_i1_290.jpg" width="330"><p>
					<div class="prodbox">
						<span class="prodname">${pdto2.prod_name}</span><br></a>
						<span class="prodprice"><fmt:formatNumber value="${pdto2.prod_price}"></fmt:formatNumber></span>원<br>
						<span class="prodrate">평점 : ${pdto2.prod_rate}</span><p>
					</div>
					</li>
					</c:forEach>
				</div>
				<div id="mainul2box" style="height:500px;">
					<ul class="mainul">
					<c:forEach var="pdto2" items="${plist2}" begin="6" end="8">
					<li><a href="../product/prod_content.jsp?prod_id=${pdto2.prod_id}"><img src="../product/상품사진/${pdto2.prod_id}_i1_290.jpg" width="330"><p>
					<div class="prodbox">
						<span class="prodname">${pdto2.prod_name}</span><br></a>
						<span class="prodprice"><fmt:formatNumber value="${pdto2.prod_price}"></fmt:formatNumber></span>원<br>
						<span class="prodrate">평점 : ${pdto2.prod_rate}</span><p>
					</div>
					</li>
					</c:forEach>
					</div>
					</ul>
				</div>
				</ul>
			</div>
			<button id="mainul2btt" onclick="mainul2open()" type="button">더 보기</button>
		</div>
	<div class="maintitle" style="margin-top:100px;"><h4>급상승 주문상품</h4></div>
		<div class="mainsubtitle">현재 주문수가 올라가는 제품들은 무엇일까요?</div>
		<ul id="mainul3" class="mainul" style="font-size:0px;">
		<li><button class="ul3button" type="button" onclick="change3_1()" style="background:black;color:white;">과일</button></li>
		<li><button class="ul3button" type="button" onclick="change3_2()">채소</button></li>
		<li><button class="ul3button" type="button" onclick="change3_3()">수산물</button></li>
		<li><button class="ul3button" type="button" onclick="change3_4()">정육/계란</button></li>
		</ul>
		<div id="mainul3_1" style="position:relative;">
			<div id="mainul3box" style="height:400px;">
				<ul class="mainul">
					<c:forEach var="pdto3_1" items="${plist3_1}" begin="0" end="4">
					<li><a href="../product/prod_content.jsp?prod_id=${pdto3_1.prod_id}"><img src="../product/상품사진/${pdto3_1.prod_id}_i1_290.jpg" width="230"><p>
					<div class="prodbox" style="width:230px;">
					<span class="prodname">${pdto3_1.prod_name}</span><br></a>
					<span class="prodprice"><fmt:formatNumber value="${pdto3_1.prod_price}"></fmt:formatNumber></span>원<br>
					<span class="prodrate">평점 : ${pdto3_1.prod_rate}</span><p>
					</div>
					</li>
					</c:forEach>
			</div>
				<ul id="mainul3_2" class="mainul" style="position:absolute;display:none;">
					<div id="mainul3box" style="height:400px;">
						<ul class="mainul">
						<c:forEach var="pdto3_2" items="${plist3_2}" begin="0" end="4">
						<li><a href="../product/prod_content.jsp?prod_id=${pdto3_2.prod_id}"><img src="../product/상품사진/${pdto3_2.prod_id}_i1_290.jpg" width="230"><p>
						<div class="prodbox" style="width:230px;">
							<span class="prodname">${pdto3_2.prod_name}</span><br></a>
							<span class="prodprice"><fmt:formatNumber value="${pdto3_2.prod_price}"></fmt:formatNumber></span>원<br>
							<span class="prodrate">평점 : ${pdto3_2.prod_rate}</span><p>
						</div>
						</li>
						</c:forEach>
					</div>
				</ul>
				<ul id="mainul3_3" class="mainul" style="position:absolute;display:none;">
					<div id="mainul3box" style="height:400px;">
						<ul class="mainul">
						<c:forEach var="pdto3_3" items="${plist3_3}" begin="0" end="4">
						<li><a href="../product/prod_content.jsp?prod_id=${pdto3_3.prod_id}"><img src="../product/상품사진/${pdto3_3.prod_id}_i1_290.jpg" width="230"><p>
						<div class="prodbox" style="width:230px;">
							<span class="prodname">${pdto3_3.prod_name}</span><br></a>
							<span class="prodprice"><fmt:formatNumber value="${pdto3_3.prod_price}"></fmt:formatNumber></span>원<br>
							<span class="prodrate">평점 : ${pdto3_3.prod_rate}</span><p>
						</div>
						</li>
						</c:forEach>
					</div>
				</ul>
				<ul id="mainul3_4" class="mainul" style="position:absolute;display:none;">
					<div id="mainul3box" style="height:400px;">
						<ul class="mainul">
						<c:forEach var="pdto3_4" items="${plist3_4}" begin="0" end="4">
						<li><a href="../product/prod_content.jsp?prod_id=${pdto3_4.prod_id}"><img src="../product/상품사진/${pdto3_4.prod_id}_i1_290.jpg" width="230"><p>
						<div class="prodbox" style="width:230px;">
							<span class="prodname">${pdto3_4.prod_name}</span><br></a>
							<span class="prodprice"><fmt:formatNumber value="${pdto3_4.prod_price}"></fmt:formatNumber></span>원<br>
							<span class="prodrate">평점 : ${pdto3_4.prod_rate}</span><p>
						</div>
						</li>
						</c:forEach>
					</div>
				</ul>
			</ul>
		</div>
	<!-- <div class="maintitle"><h4>F O R Y O U</h4></div>
		<div class="mainsubtitle">당신을 위한 추천 상품입니다</div>
		<ul id="mainul4" class="mainul">
		<c:if test="${userid==null}">
		<li><a href=""><img src="" width="230"><p>로그인 하여 당신에 대해 알려주세요</a></li>
		</c:if>
		<c:if test="${userid!=null and userid!='admin'}">
		<li><a href=""><img src="" width="230"><p>여기에상품정보</a></li>
		<li><a href=""><img src="" width="230"><p>여기에상품정보</a></li>
		<li><a href=""><img src="" width="230"><p>여기에상품정보</a></li>
		<li><a href=""><img src="" width="230"><p>여기에상품정보</a></li>
		<li><a href=""><img src="" width="230"><p>여기에상품정보</a></li>
		</c:if>
		<c:if test="${userid=='admin'}">
		<li><a href=""><img src="" width="230"><p>관</a></li>
		<li><a href=""><img src="" width="230"><p>리</a></li>
		<li><a href=""><img src="" width="230"><p>자</a></li>
		<li><a href=""><img src="" width="230"><p>모</a></li>
		<li><a href=""><img src="" width="230"><p>드</a></li>
		</c:if>
		</ul> -->
</div>
<c:import url="../ssgbottom.jsp"/>














