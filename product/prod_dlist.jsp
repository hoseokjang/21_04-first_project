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
	if (pend > page_cnt) // ????????? ????????? ????????????
		pend = page_cnt;	

%>
<c:import url="../ssgtop.jsp"/>
<!-- ?????? ?????? -->
<div id="third_prod_list" align="left"> <!-- ?????? ????????? ?????? -->
<div align="center" id="category" style="width:1280px;"> <!-- ??? ???????????? -->
<%
	String pc = rs2.getString("prod_category");
	if (pc.equals("fruit"))
		pc = "??? ???";
	else if(pc.equals("vegetable"))
		pc = "??? ???";
	else if(pc.equals("fish"))
		pc = "??? ???";
	else if(pc.equals("pork"))
		pc = "??? ???";
	
	String dcategory = prod_dcategory;
		if(dcategory.equals("gam"))
			dcategory = "???/??????";
		else if (dcategory.equals("strawberry"))
			dcategory="??????/??????/????????????";
		else if (dcategory.equals("banana"))
			dcategory="?????????/????????????";
		else if (dcategory.equals("apple"))
			dcategory="??????/???";
		else if (dcategory.equals("melon"))
			dcategory="??????/??????/??????";
		else if (dcategory.equals("orange"))
			dcategory="?????????/??????/??????";
		else if (dcategory.equals("grape"))
			dcategory="??????/??????/?????????";
		else if (dcategory.equals("driedfish"))
			dcategory="????????????/?????????";
		else if (dcategory.equals("fish"))
			dcategory="??????";
		else if (dcategory.equals("gul"))
			dcategory="??????/??????/???";
		else if (dcategory.equals("egg"))
			dcategory="??????/??????";
		else if (dcategory.equals("chicken"))
			dcategory="???/????????????";
		else if (dcategory.equals("ppork"))
			dcategory="????????????";
		else if (dcategory.equals("beef"))
			dcategory="?????????";
		else if (dcategory.equals("potato"))
			dcategory="?????????/??????";
		else if (dcategory.equals("chili"))
			dcategory="??????/??????/????????????";
		else if (dcategory.equals("tofu"))
			dcategory="??????/?????????/????????????";
		else if (dcategory.equals("ssam"))
			dcategory="??????/??????/?????????";
		else if (dcategory.equals("green"))
			dcategory="?????????/??????/??????";
		else if (dcategory.equals("onion"))
			dcategory="??????/??????/???/??????";
		else if (dcategory.equals("corn"))
			dcategory="?????????/??????/??????/??????";
%>
	<h2><%=dcategory %></h2>
	<div id="category_prod_number" align="right"><span id="prod_number"><%=rs.getInt("cnt") %></span>?????? ????????? ????????????.</div>
</div> <!-- ??? ???????????? ??? -->

<div id="category_left" align="left" style="padding-left:10px;"> <!-- ?????? div ?????? -->
	<div id="dcategory">
		<div align="left"><h4><a href="prod_list.jsp?prod_category=<%=rs2.getString("prod_category") %>"><%=pc %></a></h4></div> <!-- ????????? ?????? ???????????? -->
		<%
			while(rs3.next())
			{
				String pdc = rs3.getString("prod_dcategory");
				if(pdc.equals("gam"))
					pdc = "???/??????";
				else if (pdc.equals("strawberry"))
					pdc="??????/??????/????????????";
				else if (pdc.equals("banana"))
					pdc="?????????/????????????";
				else if (pdc.equals("apple"))
					pdc="??????/???";
				else if (pdc.equals("melon"))
					pdc="??????/??????/??????";
				else if (pdc.equals("orange"))
					pdc="?????????/??????/??????";
				else if (pdc.equals("grape"))
					pdc="??????/??????/?????????";
				else if (pdc.equals("driedfish"))
					pdc="????????????/?????????";
				else if (pdc.equals("fish"))
					pdc="??????";
				else if (pdc.equals("gul"))
					pdc="??????/??????/???";
				else if (pdc.equals("octopus"))
					pdc="?????????/??????/?????????/??????";
				else if (pdc.equals("egg"))
					pdc="??????/??????";
				else if (pdc.equals("chicken"))
					pdc="???/????????????";
				else if (pdc.equals("ppork"))
					pdc="????????????";
				else if (pdc.equals("beef"))
					pdc="?????????";
				else if (pdc.equals("potato"))
					pdc="?????????/??????";
				else if (pdc.equals("chili"))
					pdc="??????/??????/????????????";
				else if (pdc.equals("tofu"))
					pdc="??????/?????????/????????????";
				else if (pdc.equals("ssam"))
					pdc="??????/??????/?????????";
				else if (pdc.equals("green"))
					pdc="?????????/??????/??????";
				else if (pdc.equals("onion"))
					pdc="??????/??????/???/??????";
				else if (pdc.equals("corn"))
					pdc="?????????/??????/??????/??????";
		%>
				<a href="prod_dlist.jsp?prod_dcategory=<%=rs3.getString("prod_dcategory") %>"><%=pdc %></a><p>
		<%
			}
		%>
	</div>
	<div id="price_search" align="left" style="border-top:1px solid black;"> <!-- ?????? ?????? ???????????? -->
		<div align="left"><h4>??????</h4></div>
		<div id="price_search_list">
			<a href="prod_dlist.jsp?prod_dcategory=<%=prod_dcategory %>&min_prod_price=0&max_prod_price=10000">~1??????</a><p>
			<a href="prod_dlist.jsp?prod_dcategory=<%=prod_dcategory %>&min_prod_price=10000&max_prod_price=20000">1??????~2??????</a><p>
			<a href="prod_dlist.jsp?prod_dcategory=<%=prod_dcategory %>&min_prod_price=20000&max_prod_price=50000">2??????~5??????</a><p>
			<a href="prod_dlist.jsp?prod_dcategory=<%=prod_dcategory %>&min_prod_price=50000&max_prod_price=300000">5??????~30??????</a>
		</div>
	</div>
</div> <!-- ?????? div??? -->

<div id="prod_list" > <!-- ????????? div ?????? -->
	<div align="center" id="prod_orderby"> <!-- ?????? order by ?????? -->
		<a href="prod_dlist.jsp?prod_dcategory=<%=prod_dcategory %>&ord=1">?????? ???</a>
		<a href="prod_dlist.jsp?prod_dcategory=<%=prod_dcategory %>&ord=2">?????? ?????? ???</a>
		<a href="prod_dlist.jsp?prod_dcategory=<%=prod_dcategory %>&ord=3">?????? ?????? ???</a>
	</div> <!-- ?????? order by ??? -->
	<div id="list" style="width:1200px;"> <!-- ?????? ?????? ?????? -->
		<ul> <!-- while??? ????????? 4??? ??? 5??? -->
			<c:forEach var="pdto" items="${plist }">
			<li>
				<div id="prod_img"><a href="prod_readnum.jsp?prod_id=${pdto.prod_id }"><img src="????????????/${pdto.prod_id }_i1_290.jpg" id="img"></a></div>
				<div id="info">
					<div id="prod_dlist_emart" style="width:65px;background:#FFE400;padding:3px;font-weight:bold"> ????????????</div>
					<div> #No Brand</div>
					<div style="width:200px;height:60px;overflow:hidden;font-size:14px;"> <a href="prod_readnum.jsp?prod_id=${pdto.prod_id }">${pdto.prod_name }</a> </div>
					<div> <fmt:formatNumber value="${pdto.prod_price }"/>??? </div>
					<div> ?????? : ${pdto.prod_rate }</div>
				</div>
			</li>
			</c:forEach>
		</ul>
	</div> <!-- ?????? ?????? ??? -->
</div> <!-- ????????? div ??? -->

<div align="center"> <!-- ????????? ?????? ?????? -->
	<div id="prod_dpage">
		<%if(ppage != 1){ %>
			<a href="prod_dlist.jsp?prod_dcategory=<%=prod_dcategory %>&ppage=<%=(ppage-1) %>">???</a>
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
			<a href="prod_dlist.jsp?prod_dcategory=<%=prod_dcategory %>&ppage=<%=(ppage+1) %>">???</a>
		<%
		}
		else
		{
		%>
			???
		<%
		}
		%>
	</div>
</div> <!-- ????????? ?????? ??? -->
</div> <!-- ?????? ????????? ??? -->
<c:import url="../ssgbottom.jsp"/>