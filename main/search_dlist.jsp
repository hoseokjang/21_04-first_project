<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="ssg.dto.ProductDto" %>
<%@ page import="ssg.dao.ProductDao" %>
<%@ page import="ssg.dao.MainDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");

	int pager;
	if(request.getParameter("pager")==null)
		pager=1;
	else
		pager=Integer.parseInt(request.getParameter("pager"));
	int index=(pager-1)*20;
	
	MainDao mdao=new MainDao();
	ArrayList<ProductDto> pslist=mdao.ssgsearch(request,index);
	int cnt=mdao.search_cnt(request);
	
	pageContext.setAttribute("pslist", pslist);
	
	String searchbar=request.getParameter("searchbar");
	int chk=Integer.parseInt(request.getParameter("chk").toString());
	pageContext.setAttribute("searchbar", searchbar);
	pageContext.setAttribute("chk", chk);
%>
<style>
#search_dlist
{width:1280px;margin:auto;text-align:center;}
#search_dlist a
{text-decoration:none;}
#search_titlebox
{width:1280px;margin:auto;border-bottom:1.5px solid black;margin-top:40px;}
#search_dlist_title
{line-height:100%;}
#searchcnt
{position:relative;top:-4px;right:-545px;display:inline-block;
font-size:13px;font-family:NanumBarunGothicBold, sans-serif;letter-spacing:-0.3px;}
#searchnum
{color:#ff5b59;}

#order
{position:relative;top:2px;right:-490px;display:inline-block;
font-size:13px;font-weight:550;font-family:NanumBarunGothicBold, sans-serif;letter-spacing:-0.3px;}
#order a
{text-decoration:none;color:black;padding:0px;color:#666666;font-size:12px;font-weight: 550;
font-family: NanumBarunGothicBold, sans-serif;letter-spacing: -0.2px;text-decoration: none;cursor: pointer;}
#order ul li
{list-style-type:none;width:80px;height:16px;border-right:0.5px dotted #666666;padding:1px;}


#search_dlist_box
{padding-top:40px;}
#search_dlist ul
{padding-inline-start:0px;}
#search_dlist li
{width:290px;height:440px;display:inline-block;list-style-type:None;padding:10px;}
#search_dlist .prodbox
{text-align:left;position:absolute;width:280px;height:130px;padding-left:8px;text-decoration:none;}
#search_dlist .prodname
{font-size:13px;font-family:NanumBarunGothicBold, sans-serif;letter-spacing:-0.5px;text-decoration:none;cursor:pointer;color:#555555;}
#search_dlist .prodrate
{font-size:13px;color:#555555;font-family:NanumBarunGothicBold, sans-serif;letter-spacing:-0.2px;}
#search_dlist .prodprice
{font-size:22px;font-weight:550;font-family:NanumBarunGothicBold, sans-serif;letter-spacing:-0.2px;text-decoration:none;color:black;}

#search_pager
{font-size:16px;font-family: NanumBarunGothicBold, sans-serif;border:0.5px solid #e5e5e5;
padding:5px 10px 5px 10px;color:black;background:white;cursor:pointer;}
.arrow{
color:black;font-size:16px;padding:5px 6px 5px 6px;color:black;
background:white;cursor:pointer;border:0.5px solid #e5e5e5;}
</style>
<script>
	
</script>
<c:import url="../ssgtop.jsp"/>
<div id="search_dlist">
	<div id="search_titlebox">
		<div id="search_dlist_title"><h2>'${searchbar}' 검색결과</h2></div>
			<div id="searchcnt"><span id="searchnum"><%=cnt%></span>개의 상품이 있습니다</div>
	</div>
	<%
		String str1=null;
		String str2=null;
		String str3=null;
		if(chk==0)
		{
			str1="style='color:#ff5b59;'";
		}
		else if(chk==1)
		{
			str2="style='color:#ff5b59;'";
		}
		else if(chk==2)
		{
			str3="style='color:#ff5b59;'";
		}
	%>
	<div id="order">
			<ul id="order_ul">
			<li><a class="order_a" href="search_dlist.jsp?searchbar=${searchbar}&chk=0&pager=1" <%=str1%>>평점 높은 순</a></li>
			<li><a class="order_a" href="search_dlist.jsp?searchbar=${searchbar}&chk=1&pager=1" <%=str2%>>가격 낮은 순</a></li>
			<li style="border-right:0px;"><a class="order_a" href="search_dlist.jsp?searchbar=${searchbar}&chk=2&pager=1" <%=str3%>>가격 높은 순</a></li>
			</ul>
	</div>
		<div id="search_dlist_box"> 
				<c:if test="${pslist.size() != 0}">
				<c:forEach var="psdto" items="${pslist}">
				<li><a href="../product/prod_readnum.jsp?prod_id=${psdto.prod_id}"><img src="../product/상품사진/${psdto.prod_id}_i1_290.jpg" width="280"><p>
					<div class="prodbox">
						<span class="prodname">${psdto.prod_name}</span><br></a>
						<span class="prodprice"><fmt:formatNumber value="${psdto.prod_price}"></fmt:formatNumber></span>원<br>
						<span class="prodrate">평점 : ${psdto.prod_rate}</span><p>
					</div>
				</li>
				</c:forEach>
				</c:if>
				<c:if test="${pslist.size() == 0}">
					<li>검색 결과가 없습니다.</li>
				</c:if>
		</div>
		<div style="height:60px;"> <!-- 페이징 -->
		<%
			if(pager!=1)
			{
		%>
			<a class="arrow" href="search_dlist.jsp?searchbar=${searchbar}&chk=${chk}&pager=<%=pager-1%>">◀</a>
		<%
			}
			int pstart=pager/10;
			if(pager%10==0)
				pstart--;
			pstart=Integer.parseInt(pstart+"1");
			int pend=pstart+9;
			
			int page_cnt=cnt/20;
			
			if(cnt%20!=0)
				page_cnt++;
			
			if(pend > page_cnt)
				{
					pend=page_cnt;
				}
				String str=null;
				for(int i=pstart;i<=pend;i++)
				{
					if(pager==i)
						str="style='color:white;background:black;'";
					else
						str="";	
		%>
			<a id="search_pager" href="search_dlist.jsp?searchbar=${searchbar}&chk=${chk}&pager=<%=i%>" <%=str%>><%=i%></a>
		<%
			}
			if(pager!=page_cnt)
			{
		%>
			<a class="arrow" href="search_dlist.jsp?searchbar=${searchbar}&chk=${chk}&pager=<%=pager+1%>">▶</a>
		<%
			}
		%>
		</div>
		
</div>
<c:import url="../ssgbottom.jsp"/>
























