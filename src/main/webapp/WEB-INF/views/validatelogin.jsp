<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   <%
if(request.getSession().getAttribute("user")==null){
	request.setAttribute("tip", "请登录后在操作");
	response.sendRedirect("login");
}

%>  