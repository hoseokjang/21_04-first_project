<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="ssg.dao.GongjiDao" %>
<%@ page import="ssg.dto.GongjiDto" %>
<%@ page import="java.util.ArrayList" %>
<%
	int pager;
	if(request.getParameter("pager")==null)
		pager=1;
	else
		pager=Integer.parseInt(request.getParameter("pager"));
	int index=(pager-1)*10;
	
	GongjiDao gdao=new GongjiDao();
	ArrayList<GongjiDto> glist=gdao.gonglist(index);
	pageContext.setAttribute("glist", glist);
	
	int cnt=gdao.gong_cnt(request);
%>
<style>
.gong
{font-family:NanumBarunGothicBold, sans-serif;letter-spacing:-0.2px;padding-top:50px;padding-bottom:50px;
border-bottom:1.5px solid black;}
#gong_list 
{position:relative;width:1280px;margin:auto;text-align:center;}
#gong_list .gong_list_box
{position:relative;width:1280px;margin:auto;text-align:left;display:inline-block;}
#gong_list .gong_list_box #title
{font-size:16px;font-family:NanumBarunGothicBold, sans-serif;font-weight:550;
letter-spacing:-0.2px;text-decoration:none;}
#gong_list .gong_list_box #writeday
{font-size:16px;color:#969696;font-family:NanumBarunGothicBold, sans-serif;letter-spacing:-0.2px;
font-weight:550;text-decoration:none;position:absolute;right:2px;display:inline-block;}
#gong_bottom
{padding:50px 0px 150px 0px;}
.answer
{display: none;padding:30px 0px 30px 50px;background:#f5f5f5;font-family:NanumBarunGothicBold, sans-serif;}
.question 
{font-size: 19px;padding: 30px 0;cursor: pointer;border-top:none;
border-left:none;border-right:none;border-bottom:0.4px solid #969696;
outline: none;background: none;width: 100%;text-align: left;}
.question:hover 
{color: #2962ff;}
[id$="-toggle"]
{margin-right: 15px;}

#gongji_pager
{font-size:16px;font-family: NanumBarunGothicBold, sans-serif;border:0.5px solid #e5e5e5;
padding:5px 10px 5px 10px;color:black;background:white;cursor: pointer;text-decoration:none;}
.arrow{
font-size:16px;border:0.5px solid #e5e5e5;color:black;
padding:5px 6px 5px 6px;color:black;background:white;cursor: pointer;text-decoration:none;}
</style>
<script>
	//아코디언 적용 찾아보기
</script>
<c:import url="../ssgtop.jsp"/>
<div id="gong_list">
	<div class="gong"><h2>공지사항</h2></div>
	<c:forEach items="${glist}" var="gdto">
		<div class="gong_list_box">
			<button class="question" id="que-${gdto.id}"><span id="que-${gdto.id}-toggle">∨</span>
			<span id="title">${gdto.title}</span><div id="writeday">${gdto.writeday}</div></button>
			<div class="answer" id="ans-${gdto.id}">
				${gdto.content}<p>
				<!-- 관리자만 수정삭제 메뉴를 볼수있게 설정하기 -->
				<c:if test="${userid=='admin'}">
				<div style="display:inline-block;"><a href="gongupdate.jsp?id=${gdto.id}">수정하기</a></div>
				<div style="display:inline-block;"><a href="gongdelete.jsp?id=${gdto.id}">삭제하기</a></div>
				</c:if>
			</div>
		</div>
	</c:forEach>
	<!-- 관리자만 작성할수있게 설정 -->
	<div id="gong_bottom" style="height:60px;">
		<%
			if(pager!=1)
			{
		%>
			<a class="arrow" href="gonglist.jsp?pager=<%=pager-1%>">◀</a>
		<%
			}
			int pstart=pager/10;
			if(pager%10==0)
				pstart--;
			pstart=Integer.parseInt(pstart+"1");
			int pend=pstart+9;
			
			int page_cnt=cnt/10;
			
			if(cnt%10!=0)
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
			<a id="gongji_pager" href="gonglist.jsp?pager=<%=i%>" <%=str%>><%=i%></a>
		<%
			}
			if(pager!=page_cnt)
			{
		%>
			<a class="arrow" href="gonglist.jsp?pager=<%=pager+1%>">▶</a>
		<%
			}
		%>
		<p>
		<c:if test="${userid=='admin'}">
		<div><a href="gongwrite.jsp">공지사항 작성</a></div>
		</c:if>	
	</div>
</div>
<c:import url="../ssgbottom.jsp"/>
<script>
	const items = document.querySelectorAll('.question');
	
	function openCloseAnswer() 
	{
  		const answerId = this.id.replace('que', 'ans');

  		if(document.getElementById(answerId).style.display === 'block') 
  		{
    		document.getElementById(answerId).style.display = 'none';
    		document.getElementById(this.id + '-toggle').textContent = '∨';
  		} 
  		else 
  		{
    		document.getElementById(answerId).style.display = 'block';
    		document.getElementById(this.id + '-toggle').textContent = '∧';
  		}	
	}
	items.forEach(item => item.addEventListener('click', openCloseAnswer));
</script>