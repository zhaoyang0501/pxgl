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
			url : $.ace.getContextPath() + "/score",
			data:{
				"lessonid":$("#lessonid").val()
			},
			success : function(json) {
				$("#table").html("");
				for(i=0;i<json.scores.length;i++){
					$("#table").append("<tr>"+
				 			"<td>"+json.scores[i].user.name+"</td>"+
			 				"<td>"+json.scores[i].year+"</td>"+
			 				"<td>"+json.scores[i].lesson.name+"</td>"+
			 				"<td>"+json.scores[i].total+"</td>"+
			 				"<td>"+json.scores[i].score+"</td>"+
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
							<label class="sr-only" for="input-email">课程</label>
							<select  class="form-control" id='lessonid'>
							<option value=""> 全部</option>
								<c:forEach items="${lessons }" var="bean">
									<option value="${bean.id }"> ${bean.name }</option>
								</c:forEach>
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
   <tr> <th>学生</th> <th>年份</th><th>课程</th><th>总分</th><th>得分</th></tr> 
   </thead>
   <tbody  id="table"></tbody>
   <tbody>
   
   </tbody>
	</table>

</div>
    <%@include file="./foot.jsp" %>
</body>
</html>
