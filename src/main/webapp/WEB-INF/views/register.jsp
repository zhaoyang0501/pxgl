<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Smart - UI Elements</title>

		<!-- Bootstrap -->
		<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/css/font-awesome.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
		<!-- DataTables http://www.datatables.net/  -->
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/ace.js"></script>
		<script src="${pageContext.request.contextPath}/js/problem.js"></script>
		<script src="${pageContext.request.contextPath}/admin/js/falgun/jquery.dataTables.min.js"></script>
		<script src="${pageContext.request.contextPath}/admin/js/falgun/dataTables.bootstrap.js"></script>
		<script src="${pageContext.request.contextPath}/admin/js/falgun/TableTools.min.js"></script>
		
		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
<script type="text/javascript">
	$(document).ready(function(){
		$.ace.setContextPath('${pageContext.request.contextPath}');
	});
</script>
	</head>
<body>
<%@include file="./header.jsp" %>
<!-- nav end -->

<!-- custom body begin -->
<div class="container main">
	<c:if test="${tip!=null}"><div class="alert alert-success" role="alert">注册成功</div></c:if>
        <div class="col-md-6 col-md-offset-3">
            <h2 class="text-center">用户注册</h2>

            <form  action="register" method="post">
                <div class="form-group ">
                    <label for="username">用户名</label>
                    <input type="text" class="form-control input-lg" id="username" name="username" placeholder="用户名" >
                </div>
                <div class="form-group">
                     <label for="name">真实姓名</label>
                    <input type="text" class="form-control input-lg" id="name" name="name" placeholder="真实姓名" >
                </div>
                <div class="form-group">
                       <label for="address">地址</label>
                    <input type="text" class="form-control input-lg" id="address" name="address" placeholder="地址" >
                </div>
                <div class="form-group">
                       <label for="email">邮箱</label>
                    <input type="text" class="form-control input-lg" id="email" name="email" placeholder="邮箱" >
                </div>
                <div class="form-group">
                    <label for="password">密码</label>
                    <input type="password" class="form-control input-lg" id="password" name="password" >
                    <div class="help-block with-errors"></div>
                </div>
                
                <div class="form-group">
                    <button type="submit" class="btn btn-primary ">提交</button>
                </div>
            </form>
        </div>
    </div>
    <%@include file="./foot.jsp" %>
</body>
</html>