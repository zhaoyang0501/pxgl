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
<div class="container main">
        <ul class="nav nav-tabs nav-tabs-google">
            <li role="presentation" class="active">
                <a href="${pageContext.request.contextPath}/about">关于我们</a>
            </li>
        </ul>
        <div>
            <h2 class="text-center">为什么选择我们</h2>
            <h4>师资力量</h4>
            <ul>
                <li>我们的讲师全部是拥有商务背景的高素质人才，了解经理人英语胜任力不足的主要障碍及问题；所有讲师在行业培训开始前必须通过公司内部的该行业基础考试，熟悉行业、企业知识后才能上岗执教。</li>
            </ul>

            <h4>定制化教材</h4>
            <ul>
                <li>联洋英语关注学员岗位英语胜任力的提升，教学中主要使用定制化教材。培训前收集并分析学员职场情景，提炼高频词汇和话题，根据行业特色、企业特点及职业身份，定制教材，保证学以致用。</li>
            </ul>
            
            <h4> 多角度精准评估</h4>
            <ul>
                <li>联洋英语采用在线测评与口语测评相结合的方式，从日常英语、商务英语、行业英语、沟通能力和跨文化思维等方面，科学地评估学员的英语胜任力水平，准确地找出其在英语胜任力方面的长处与不足。</li>
            </ul>
        </div>
    </div>
    <%@include file="./foot.jsp" %>
</body>
</html>