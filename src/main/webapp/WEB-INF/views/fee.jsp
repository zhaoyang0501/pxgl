<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		 <link id="bsdp-css" href="http://eternicode.github.io/bootstrap-datepicker/bootstrap-datepicker/css/datepicker3.css" rel="stylesheet">
		<!-- DataTables http://www.datatables.net/  -->
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/ace.js"></script>
		<script src="${pageContext.request.contextPath}/js/problem.js"></script>
		  <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/admin/js/falgun/jquery.dataTables.min.js"></script>
		<script src="${pageContext.request.contextPath}/admin/js/falgun/dataTables.bootstrap.js"></script>
		<script src="${pageContext.request.contextPath}/admin/js/falgun/TableTools.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/js/codemirror/codemirror.css">
		<script src="${pageContext.request.contextPath}/js/codemirror/codemirror.js"></script>
		<script src="${pageContext.request.contextPath}/js/codemirror/mode/xml/xml.js"></script>
		<script src="${pageContext.request.contextPath}/js/codemirror/mode/xml/xml.js"></script>
		<script src="${pageContext.request.contextPath}/js/codemirror/mode/javascript/javascript.js"></script>
		<script src="${pageContext.request.contextPath}/js/codemirror/mode/css/css.js"></script>
		<script src="${pageContext.request.contextPath}/js/codemirror/mode/htmlmixed/htmlmixed.js"></script>
		<script src="${pageContext.request.contextPath}/js/codemirror/addon/edit/matchbrackets.js"></script>
		<script src="http://eternicode.github.io/bootstrap-datepicker/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
		<script src="http://eternicode.github.io/bootstrap-datepicker/bootstrap-datepicker/js/locales/bootstrap-datepicker.zh-CN.js"></script>
		<script src="${pageContext.request.contextPath}/js/echart/echarts-all.js"></script>

		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
<script type="text/javascript">
$.ace.setContextPath('${pageContext.request.contextPath}');
	function fun_query(){
		$.ajax({
			type : "POST",
			url : $.ace.getContextPath() + "/fee",
			data:{
				"lessonid":$("#lessonid").val()
			},
			success : function(json) {
				$("#table").html("");
				for(i=0;i<json.fees.length;i++){
					$("#table").append("<tr>"+
				 			"<td>"+json.fees[i].user.name+"</td>"+
			 				"<td>"+json.fees[i].year+"</td>"+
			 				"<td>"+json.fees[i].needa+"</td>"+
			 				"<td>"+json.fees[i].reala+"</td>"+
			 				"<td>"+json.fees[i].resta+"</td>"+
			 				"<td>"+json.fees[i].needb+"</td>"+
			 				"<td>"+json.fees[i].realb+"</td>"+
			 				"<td>"+json.fees[i].restb+"</td>"+
			 				"<td>"+json.fees[i].needc+"</td>"+
			 				"<td>"+json.fees[i].realc+"</td>"+
			 				"<td>"+json.fees[i].restc+"</td>"+
			 				"<td><span class='label label-success'>"+json.fees[i].state+"</span></td>"+
			 		"</tr>");
				}
			}
		});
		
	}

	$(document).ready(function(){
	});
</script>
	</head>
<body>
<%@include file="./header.jsp" %>
<!-- nav end -->
<div class="container">
				<div class="row">
					<div class="col-sm-12">
					
					<div class="panel panel-default">
						 <div class="panel-heading">成绩查询</div>
						 <div class="panel-body">
							<div class="text-center center-block">
						<form class="form-inline" role="form">
						 <div class="form-group">
							<label class="sr-only" for="input-email">学期</label>
							<select  class="form-control" id='lessonid'>
							<option value=""> 全部</option>
								<option value="2015上学期"> 2015上学期</option>
								<option value="2015下学期"> 2015下学期</option>
								<option value="2016上学期"> 2016上学期</option>
								<option value="2016下学期"> 2016下学期</option>
							</select>
							
						 </div>
						 <a class="btn btn-primary" onclick="fun_query()">查询</a>
					  </form>
							</div>
						 </div>
					
					</div>
					</div>
				</div>
			</div>


  <div class="container main">
   <table class="table">
   <thead>
										<tr>
											<th rowspan="2" >学生</th>
											<th rowspan="2" >年份</th>
											<th colspan="3" style="    text-align: center;">教程费用</th>
											<th colspan="3" style="    text-align: center;">学费</th>
											<th colspan="3" style="    text-align: center;">多媒体材料费</th>
											<th rowspan="2">状态</th>
										</tr>
										<tr>
											<th>应缴</th>
											<th>已缴</th>
											<th>未缴</th>
											<th>应缴</th>
											<th>已缴</th>
											<th>未缴</th>
											<th>应缴</th>
											<th>已缴</th>
											<th>未缴</th>
										</tr>
									</thead>
   <tbody  id="table"></tbody>
   <tbody>
   
   </tbody>
	</table>

</div>
    <%@include file="./foot.jsp" %>
</body>
</html>
