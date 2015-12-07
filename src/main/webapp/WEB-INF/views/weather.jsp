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
	function fun_maptype(type){
		if(type=="晴"){
		return "d00.gif";
		}
		if(type=="多云"){
		return "d01.gif";
		}
		if(type=="阴"){
			return "d02.gif";
		}
		if(type=="小雨"){
			return "d03.gif";
		}
		if(type=="中雨"){
			return "d04.gif";
		}
		if(type=="大雨"){
			return "d05.gif";
		}
		if(type=="小雪"){
			return "d14.gif";
		}
		if(type=="中雪"){
			return "d15.gif";
		}
		if(type=="大雪"){
			return "d16.gif";
		}
	}
	function fun_query(){
		$.ajax({
			type : "POST",
			url : $.ace.getContextPath() + "/weather",
			data:{
				"cityid":$("#cityid").val(),
				"start":$("#start").val(),
				"end":$("#end").val()
			},
			success : function(json) {
				$("#table").html("");
				for(i=0;i<json.weathers.length;i++){
					$("#table").append("<tr>"+
				 			"<td>"+json.weathers[i].nowDate+"</td>"+
			 				"<td>"+json.weathers[i].type+"</td>"+
			 				"	<td> "+json.weathers[i].temmin+"℃/"+json.weathers[i].temmax+"℃</td>"+
			 				"	<td><img src='http://www.15tianqi.com/Images/weather/"+fun_maptype(json.weathers[i].type)+"' width='48' height='48'> </td>"+
			 		"</tr>");
				}
				 var tmp_chart = echarts.init(document.getElementById('tmp_chart')); 
				 var aqi_chart = echarts.init(document.getElementById('aqi_chart')); 
				 var sd_chart = echarts.init(document.getElementById('sd_chart')); 
				 var pm_chart = echarts.init(document.getElementById('pm_chart')); 
				 pm_option = {
			        	    title : {
			        	        text: 'pm25',
			        	    },
			        	    tooltip : {
			        	        trigger: 'axis'
			        	    },
			        	    legend: {
			        	        data:['pm25']
			        	    },
			        	    toolbox: {
			        	        show : true,
			        	        feature : {
			        	            mark : {show: true},
			        	            dataView : {show: true, readOnly: false},
			        	            magicType : {show: true, type: ['line', 'bar']},
			        	            restore : {show: true},
			        	            saveAsImage : {show: true}
			        	        }
			        	    },
			        	    calculable : true,
			        	    xAxis : [
			        	        {
			        	            type : 'category',
			        	            boundaryGap : false,
			        	            data : json.dates
			        	        }
			        	    ],
			        	    yAxis : [
			        	        {
			        	            type : 'value',
			        	            axisLabel : {
			        	                formatter: '{value}'
			        	            }
			        	        }
			        	    ],
			        	    series : [
			        	              {
			        	                  name:'pm25',
			        	                  type:'line',
			        	                  data:json.pm25,
			        	                  markLine : {
			        	                	  data : [
			        	                              [{name: '正常',value: "警戒", xAxis: -1, yAxis: 100},{xAxis:json.dates.length,yAxis: 100}]
			        	                 ]
			        	                  }
			        	              }
			        	          ]
			        	      };
				 sd_option = {
			        	    title : {
			        	        text: '空气湿度',
			        	    },
			        	    tooltip : {
			        	        trigger: 'axis'
			        	    },
			        	    legend: {
			        	        data:['aqi']
			        	    },
			        	    toolbox: {
			        	        show : true,
			        	        feature : {
			        	            mark : {show: true},
			        	            dataView : {show: true, readOnly: false},
			        	            magicType : {show: true, type: ['line', 'bar']},
			        	            restore : {show: true},
			        	            saveAsImage : {show: true}
			        	        }
			        	    },
			        	    calculable : true,
			        	    xAxis : [
			        	        {
			        	            type : 'category',
			        	            boundaryGap : false,
			        	            data : json.dates
			        	        }
			        	    ],
			        	    yAxis : [
			        	        {
			        	            type : 'value',
			        	            axisLabel : {
			        	                formatter: '{value}'
			        	            }
			        	        }
			        	    ],
			        	    series : [
			        	              {
			        	                  name:'aqi',
			        	                  type:'line',
			        	                  data:json.sd,
			        	                  markLine : {
			        	                	  data : [
			        	                              [{name: '正常',value: 50, xAxis: -1, yAxis: 50},{xAxis:json.dates.length,yAxis: 50}]
			        	                 ]
			        	                  }
			        	              }
			        	          ]
			        	      };
				 aqi_option = {
			        	    title : {
			        	        text: '空气质量指数',
			        	    },
			        	    tooltip : {
			        	        trigger: 'axis'
			        	    },
			        	    legend: {
			        	        data:['aqi']
			        	    },
			        	    toolbox: {
			        	        show : true,
			        	        feature : {
			        	            mark : {show: true},
			        	            dataView : {show: true, readOnly: false},
			        	            magicType : {show: true, type: ['line', 'bar']},
			        	            restore : {show: true},
			        	            saveAsImage : {show: true}
			        	        }
			        	    },
			        	    calculable : true,
			        	    xAxis : [
			        	        {
			        	            type : 'category',
			        	            boundaryGap : false,
			        	            data : json.dates
			        	        }
			        	    ],
			        	    yAxis : [
			        	        {
			        	            type : 'value',
			        	            axisLabel : {
			        	                formatter: '{value}'
			        	            }
			        	        }
			        	    ],
			        	    series : [
			        	              {
			        	                  name:'aqi',
			        	                  type:'line',
			        	                  data:json.aqi,
			        	                  markLine : {
			        	                	  data : [
			        	                              [{name: '警戒值',value: "警戒值", xAxis: -1, yAxis: 100},{xAxis:json.dates.length,yAxis: 100}]
			        	                 ]
			        	                  }
			        	              }
			        	          ]
			        	      };
				 tmp_option = {
			        	    title : {
			        	        text: '气温变化',
			        	    },
			        	    tooltip : {
			        	        trigger: 'axis'
			        	    },
			        	    legend: {
			        	        data:['最高气温','最低气温']
			        	    },
			        	    toolbox: {
			        	        show : true,
			        	        feature : {
			        	            mark : {show: true},
			        	            dataView : {show: true, readOnly: false},
			        	            magicType : {show: true, type: ['line', 'bar']},
			        	            restore : {show: true},
			        	            saveAsImage : {show: true}
			        	        }
			        	    },
			        	    calculable : true,
			        	    xAxis : [
			        	        {
			        	            type : 'category',
			        	            boundaryGap : false,
			        	            data : json.dates
			        	        }
			        	    ],
			        	    yAxis : [
			        	        {
			        	            type : 'value',
			        	            axisLabel : {
			        	                formatter: '{value} °C'
			        	            }
			        	        }
			        	    ],
			        	    series : [
			        	              {
			        	                  name:'最高气温',
			        	                  type:'line',
			        	                  data:json.tmpmax,
			        	                  markLine : {
			        	                      data : [
			        	                          {type : 'average', name: '平均值'}
			        	                      ]
			        	                  }
			        	              },
			        	              {
			        	                  name:'最低气温',
			        	                  type:'line',
			        	                  data:json.tmpmin,
			        	                 
			        	                  markLine : {
			        	                      data : [
			        	                          {type : 'average', name : '平均值'}
			        	                      ]
			        	                  }
			        	              }
			        	          ]
			        	      };
			        tmp_chart.setOption(tmp_option); 
			        aqi_chart.setOption(aqi_option); 
			        sd_chart.setOption(sd_option); 
			        pm_chart.setOption(pm_option); 
			}
		});
		
	}

	$(document).ready(function(){
		$('.input-daterange').datepicker({
			 format: 'yyyy-mm-dd'
		});
		$('#myTabs a').click(function (e) {
			  e.preventDefault()
			  $(this).tab('show');
			  fun_query();
		});
		
		  // 基于准备好的dom，初始化echarts图表
       
		
			
			
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
						 <div class="panel-heading">大气查询</div>
						 <div class="panel-body">
							<div class="text-center center-block">
						<form class="form-inline" role="form">
						 <div class="form-group">
							<label class="sr-only" for="input-email">地区</label>
							<select  class="form-control" id='cityid'>
								<c:forEach items="${citys }" var="bean">
									<option value="${bean.id }"> ${bean.name }</option>
								</c:forEach>
							</select>
							
						 </div>
						 <div class="form-group">
							<div class="input-daterange input-group" id="datepicker">
							    <input type="text" class=" form-control" id="start"  placeholder="起始日期"/>
							    <span class="input-group-addon">to</span>
							    <input type="text" class=" form-control" id="end"  placeholder="终止日期" />
							</div>
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
      <!-- Nav tabs -->
  <ul class="nav nav-tabs" id='myTabs' role="tablist">
    <li role="presentation" class="active"><a href="#weather" aria-controls="home" role="tab" data-toggle="tab">天气</a></li>
    <li role="presentation"><a href="#tmp" aria-controls="profile" role="tab" data-toggle="tab">温度</a></li>
    <li role="presentation"><a href="#aqi" aria-controls="messages" role="tab" data-toggle="tab">空气质量</a></li>
    <li role="presentation"><a href="#pm25" aria-controls="settings" role="tab" data-toggle="tab">PM25</a></li>
    <li role="presentation"><a href="#sd" aria-controls="settings" role="tab" data-toggle="tab">湿度</a></li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="weather">
					     <table class="table" id="table">
					 			</table>
    </div>
    <div role="tabpanel" class="tab-pane" id="tmp"><div id="tmp_chart" style="height:400px"></div></div>
    <div role="tabpanel" class="tab-pane" id="aqi"><div id="aqi_chart" style="height:400px"></div></div>
    <div role="tabpanel" class="tab-pane" id="pm25"><div id="pm_chart" style="height:400px"></div></div>
    <div role="tabpanel" class="tab-pane" id="sd"><div id="sd_chart" style="height:400px"></div></div>
  </div>

</div>
    <%@include file="./foot.jsp" %>
</body>
</html>
