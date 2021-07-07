<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ssg.dao.AddressDao" %>
<%
	AddressDao adao = new AddressDao();
	adao.a_write_ok(request, session);
%>
<script>
window.close();
opener.location.reload();
</script>