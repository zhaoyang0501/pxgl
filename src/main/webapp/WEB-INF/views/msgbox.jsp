<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@include file="./validatelogin.jsp" %>
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
    <div class="container">
      <div class="row"> 
      <c:forEach items="${msgboards}" var="bean">
      <div class="col-lg-12">
    			 <div class="panel panel-default">
						 <div class="panel-heading">发表于${bean.createDate }</div>
						 <div class="panel-body">
							<p class='lead'>发表者：${bean.user.username }</p>
							<p>${bean.msg }</p>
						 </div>
					  </div>
     	</div>
      </c:forEach>
     	<div class="col-lg-12">
     	<div class="panel panel-info">
						 <div class="panel-heading">发表</div>
						 <div class="panel-body">
						<form role="form" action="${pageContext.request.contextPath}/msgbox" method="post">
						   <div class="form-group">
							  <label>内容</label>
							  <textarea cols="4" name='msg' placeholder="Enter email" class="form-control"> </textarea>
						   </div>
						    <button type="submit" class="btn btn-primary" id="submit-code-button">
                	 	   发表
               	 </button>
						</form>
		</div>
		</div>
		</div>
       </div>
    </div>
</div>
    <%@include file="./foot.jsp" %>
</body>
</html>