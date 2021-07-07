<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
	#third_prod_list
	{margin:auto;width:1280px;}
	#third_prod_list a
	{
		text-decoration:none;color:black;
	}
	#third_prod_list #prod_orderby a
	{
		padding-left:10px;
	}
	#category
	{
		padding-top:20px;padding-bottom:20px;
		margin:20px 0px 20px 0px;
		border-bottom:2px solid black;
	}
	#category_prod_number
	{
		opacity:0.8;
	}
	#category_prod_number #prod_number
	{
		color:red;
	}
	#category_left
	{
		display:inline-flex;width:190px;top:0;
		padding-top:20px;padding-bottom:20px;padding-left:3px;
		border-bottom:1px solid grey;
		flex-direction: column;
	}
	#prod_list
	{
		display:inline-flex;width:930px;position:relative;right:60px;
		flex-direction: column;
	}
	#prod_img{padding-bottom:10px;}
	#list li{display:inline-block;float:left;list-style:none;padding:40px;}
	#img{width:200px;height:250px;}
	#info{text-align:left;}
	#prod_dpage a{padding-left:4px;padding-right:4px;}
	#prod_orderby{margin-left:100px;}
</style>
<%@ page import="java.sql.*" %>
<%@ page import="ssg.dao.ProductDao" %>
<%@ page import="ssg.dto.ProductDto" %>
<%@ page import="java.util.ArrayList" %>
<%
	int ppage;
	if (request.getParameter("ppage")==null)
		ppage = 1;	
	else
		ppage = Integer.parseInt(request.getParameter("ppage"));	
	int index = (ppage-1) * 10;


	ProductDao pdao = new ProductDao();
	ArrayList<ProductDto> plist = pdao.prod_dlist(request, index);
	ResultSet rs = pdao.prod_dcate_num(request);
	ResultSet rs2 = pdao.prod_category_get(request);
	ResultSet rs3 = pdao.prod_dcategory_get(request);
	String prod_dcategory = request.getParameter("prod_dcategory");
	pageContext.setAttribute("plist", plist);
	
	int pstart=ppage/10;
	if (ppage%10==0)
		pstart--;
	pstart = Integer.parseInt(pstart+"1");
	int pend= pstart+9;
	int cnt = pdao.prod_dcnt(request, prod_dcategory);
	int page_cnt = cnt/20;
	if (cnt%10 != 0)
		page_cnt++;
	if (pend > page_cnt) // 마지막 페이지 업데이트
		pend = page_cnt;	

%>
<c:import url="../ssgtop.jsp"/>
<!-- 문서 시작 -->
<div id="third_prod_list" align="left"> <!-- 전체 문서의 시작 -->
<div align="center" id="category" style="width:1280px;"> <!-- 큰 카테고리 -->
<%
	String pc = rs2.getString("prod_category");
	if (pc.equals("fruit"))
		pc = "과 일";
	else if(pc.equals("vegetable"))
		pc = "채 소";
	else if(pc.equals("fish"))
		pc = "생 선";
	else if(pc.equals("pork"))
		pc = "정 육";
	
	String dcategory = prod_dcategory;
		if(dcategory.equals("gam"))
			dcategory = "감/곶감";
		else if (dcategory.equals("strawberry"))
			dcategory="딸기/키위/블루베리";
		else if (dcategory.equals("banana"))
			dcategory="바나나/파인애플";
		else if (dcategory.equals("apple"))
			dcategory="사과/배";
		else if (dcategory.equals("melon"))
			dcategory="수박/참외/멜론";
		else if (dcategory.equals("orange"))
			dcategory="오렌지/자몽/레몬";
		else if (dcategory.equals("grape"))
			dcategory="포도/자두/복숭아";
		else if (dcategory.equals("driedfish"))
			dcategory="건오징어/건어물";
		else if (dcategory.equals("fish"))
			dcategory="생선";
		else if (dcategory.equals("gul"))
			dcategory="전복/멍게/굴";
		else if (dcategory.equals("egg"))
			dcategory="계란/알류";
		else if (dcategory.equals("chicken"))
			dcategory="닭/오리고기";
		else if (dcategory.equals("ppork"))
			dcategory="돼지고기";
		else if (dcategory.equals("beef"))
			dcategory="소고기";
		else if (dcategory.equals("potato"))
			dcategory="고구마/감자";
		else if (dcategory.equals("chili"))
			dcategory="고추/피망/파프리카";
		else if (dcategory.equals("tofu"))
			dcategory="두부/콩나물/숙주나물";
		else if (dcategory.equals("ssam"))
			dcategory="상추/깻잎/쌈채소";
		else if (dcategory.equals("green"))
			dcategory="시금치/부추/나물";
		else if (dcategory.equals("onion"))
			dcategory="양파/마늘/파/생강";
		else if (dcategory.equals("corn"))
			dcategory="옥수수/오이/가지/호박";
%>
	<h2><%=dcategory %></h2>
	<div id="category_prod_number" align="right"><span id="prod_number"><%=rs.getInt("cnt") %></span>개의 상품이 있습니다.</div>
</div> <!-- 큰 카테고리 끝 -->

<div id="category_left" align="left" style="padding-left:10px;"> <!-- 왼쪽 div 시작 -->
	<div id="dcategory">
		<div align="left"><h4><a href="prod_list.jsp?prod_category=<%=rs2.getString("prod_category") %>"><%=pc %></a></h4></div> <!-- 상품의 상세 카테고리 -->
		<%
			while(rs3.next())
			{
				String pdc = rs3.getString("prod_dcategory");
				if(pdc.equals("gam"))
					pdc = "감/곶감";
				else if (pdc.equals("strawberry"))
					pdc="딸기/키위/블루베리";
				else if (pdc.equals("banana"))
					pdc="바나나/파인애플";
				else if (pdc.equals("apple"))
					pdc="사과/배";
				else if (pdc.equals("melon"))
					pdc="수박/참외/멜론";
				else if (pdc.equals("orange"))
					pdc="오렌지/자몽/레몬";
				else if (pdc.equals("grape"))
					pdc="포도/자두/복숭아";
				else if (pdc.equals("driedfish"))
					pdc="건오징어/건어물";
				else if (pdc.equals("fish"))
					pdc="생선";
				else if (pdc.equals("gul"))
					pdc="전복/멍게/굴";
				else if (pdc.equals("octopus"))
					pdc="오징어/낙지/주꾸미/문어";
				else if (pdc.equals("egg"))
					pdc="계란/알류";
				else if (pdc.equals("chicken"))
					pdc="닭/오리고기";
				else if (pdc.equals("ppork"))
					pdc="돼지고기";
				else if (pdc.equals("beef"))
					pdc="소고기";
				else if (pdc.equals("potato"))
					pdc="고구마/감자";
				else if (pdc.equals("chili"))
					pdc="고추/피망/파프리카";
				else if (pdc.equals("tofu"))
					pdc="두부/콩나물/숙주나물";
				else if (pdc.equals("ssam"))
					pdc="상추/깻잎/쌈채소";
				else if (pdc.equals("green"))
					pdc="시금치/부추/나물";
				else if (pdc.equals("onion"))
					pdc="양파/마늘/파/생강";
				else if (pdc.equals("corn"))
					pdc="옥수수/오이/가지/호박";
		%>
				<a href="prod_dlist.jsp?prod_dcategory=<%=rs3.getString("prod_dcategory") %>"><%=pdc %></a><p>
		<%
			}
		%>
	</div>
	<div id="price_search" align="left" style="border-top:1px solid black;"> <!-- 가격 별로 보여주기 -->
		<div align="left"><h4>가격</h4></div>
		<div id="price_search_list">
			<a href="prod_dlist.jsp?prod_dcategory=<%=prod_dcategory %>&min_prod_price=0&max_prod_price=10000">~1만원</a><p>
			<a href="prod_dlist.jsp?prod_dcategory=<%=prod_dcategory %>&min_prod_price=10000&max_prod_price=20000">1만원~2만원</a><p>
			<a href="prod_dlist.jsp?prod_dcategory=<%=prod_dcategory %>&min_prod_price=20000&max_prod_price=50000">2만원~5만원</a><p>
			<a href="prod_dlist.jsp?prod_dcategory=<%=prod_dcategory %>&min_prod_price=50000&max_prod_price=300000">5만원~30만원</a>
		</div>
	</div>
</div> <!-- 왼쪽 div끝 -->

<div id="prod_list" > <!-- 오른쪽 div 시작 -->
	<div align="center" id="prod_orderby"> <!-- 상품 order by 시작 -->
		<a href="prod_dlist.jsp?prod_dcategory=<%=prod_dcategory %>&ord=1">평점 순</a>
		<a href="prod_dlist.jsp?prod_dcategory=<%=prod_dcategory %>&ord=2">낮은 가격 순</a>
		<a href="prod_dlist.jsp?prod_dcategory=<%=prod_dcategory %>&ord=3">높은 가격 순</a>
	</div> <!-- 상품 order by 끝 -->
	<div id="list" style="width:1200px;"> <!-- 상품 목록 시작 -->
		<ul> <!-- while문 한줄에 4개 총 5줄 -->
			<c:forEach var="pdto" items="${plist }">
			<li>
				<div id="prod_img"><a href="prod_readnum.jsp?prod_id=${pdto.prod_id }"><img src="상품사진/${pdto.prod_id }_i1_290.jpg" id="img"></a></div>
				<div id="info">
					<div id="prod_dlist_emart" style="width:65px;background:#FFE400;padding:3px;font-weight:bold"> 이마트몰</div>
					<div> #No Brand</div>
					<div style="width:200px;height:60px;overflow:hidden;font-size:14px;"> <a href="prod_readnum.jsp?prod_id=${pdto.prod_id }">${pdto.prod_name }</a> </div>
					<div> <fmt:formatNumber value="${pdto.prod_price }"/>원 </div>
					<div> 평점 : ${pdto.prod_rate }</div>
				</div>
			</li>
			</c:forEach>
		</ul>
	</div> <!-- 상품 목록 끝 -->
</div> <!-- 오른쪽 div 끝 -->

<div align="center"> <!-- 페이징 처리 시작 -->
	<div id="prod_dpage">
		<%if(ppage != 1){ %>
			<a href="prod_dlist.jsp?prod_dcategory=<%=prod_dcategory %>&ppage=<%=(ppage-1) %>">◁</a>
		<%}
		String str = null;
		for (int i = pstart; i<=pend; i++)
		{
			if (ppage == i)
				str="style='color:red;font-weight:bold'";
			else
				str ="";
		%>
				<a href="prod_dlist.jsp?prod_dcategory=<%=prod_dcategory %>&ppage=<%=i %>" <%=str %>> <%=i %> </a>
		<%
			if (i==page_cnt)
				break;
		}
		if (ppage != page_cnt)
		{
		%>
			<a href="prod_dlist.jsp?prod_dcategory=<%=prod_dcategory %>&ppage=<%=(ppage+1) %>">▷</a>
		<%
		}
		else
		{
		%>
			▷
		<%
		}
		%>
	</div>
</div> <!-- 페이징 처리 끝 -->
</div> <!-- 전체 문서의 끝 -->
<c:import url="../ssgbottom.jsp"/>