<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ch">
<%@ include file="../common/meta.jsp"%>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/ace/admin.weather.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/falgun/bootbox.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/falgun/bootstrap-datetimepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/falgun/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".date").datetimepicker({
			language:  'zh-CN',
	        weekStart: 1,
	        todayBtn:  1,
	        format:'yyyy-mm-dd',
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			minView: 2,
			forceParse: 0
	    });
	});
</script>
</head>
<body>
	<div class="layout">
		<!-- top -->
		<%@ include file="../top.jsp"%>
		<!-- 导航 -->
		<%@ include file="../menu.jsp"%>
		
		<input type="hidden" id="hf_id" />

		<div class="main-wrapper">
			<div class="container-fluid">
				<div class="row-fluid ">
					<div class="span12">
						<div class="content-widgets light-gray">
							<div class="widget-head  bondi-blue" >
								<h3>大气管理</h3>
							</div>
							<div class="box well form-inline">
								<span>城市：</span>
								<input type="text" id="_name" >
								<a onclick="$.adminWeather.initSearchDataTable()"
									class="btn btn-info" data-loading-text="正在加载..."><i class="icon-search"></i>查询</a>
							</div>
							<div class="widget-container">
								<a class="btn btn-success" style="float: right; margin: 5px;" onclick="$.adminWeather.updateall()"><i class="icon-plus"></i>自动同步当天数据 </a>
								
								<a class="btn btn-success" style="float: right; margin: 5px;" onclick="$.adminWeather.showaddModal()"><i class="icon-plus">新增</i></a>
							
								<table class="responsive table table-striped table-bordered"
									id="dt_table_view">
									<thead>
										<tr>
											<th>流水号</th>
											<th >城市</th>
											<th >所属日期</th>
											<th >天气</th>
											<th >最高低温</th>
											<th >最低气温</th>
											<th >空气质量</th>
											<th >PM25</th>
											<th >湿度</th>
											<th >操作</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../foot.jsp"%>
	</div>

	<!-- 编辑新增弹出框 -->
	<div class="modal hide fade" id="_modal">
		<div class="modal-header blue">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<label id="_modal_header_label"></label>
		</div>
		<div class="modal-body" >
			<div class="row-fluid">
				<div class="span12">
					<div class="form-container grid-form form-background left-align form-horizontal">
						<form action="" method="get" id=''>
							<input type="hidden"  name='id' id="id" value="">
							
							<div class="control-group">
								<label for="title" class="control-label">地区：</label>
								<div class="controls">
									<select name='city.id'>
										<c:forEach items="${citys}" var="bean">
											<option value="${bean.id }">${bean.name }</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="control-group">
								<label for="title" class="control-label">天气：</label>
								<div class="controls">
									<select name='type'>
											<option value="晴">晴</option>
											<option value="多云">多云</option>
											<option value="阴">阴</option>
											<option value="小雨">小雨</option>
											<option value="中雨">中雨</option>
											<option value="大雨">大雨</option>
												<option value="小雪">小雪</option>
													<option value="中雪">中雪</option>
														<option value="大雪">大雪</option>
									</select>
								</div>
							</div>
							
							<div class="control-group">
								<label for="title" class="control-label">所属日期：</label>
								<div class="controls">
									<div class="input-append date">
											 <input  id="nowDate" name="nowDate" type="text" readonly="readonly" >
											 <span class="add-on"><i class="icon-th"></i></span>
									 </div>
								</div>
							</div>
							
							
							<div class="control-group">
								<label for="title" class="control-label">最高气温：</label>
								<div class="controls">
									
									
									<div class="input-prepend input-append">
										<input type="text" name='temmax' id="temmax" placeholder="">
										<span class="add-on">℃</span>
									</div>
									
								</div>
							</div>
							<div class="control-group">
								<label for="title" class="control-label">最低气温：</label>
								<div class="controls">
									<div class="input-prepend input-append">
									<input type="text" name='temmin' id="temmin" placeholder="">
										<span class="add-on">℃</span>
									</div>
								</div>
							</div>
							<div class="control-group">
								<label for="title" class="control-label">空气指数：</label>
								<div class="controls">
									<input type="text" name='aqi' id="aqi" placeholder="">
								</div>
							</div>
							
							<div class="control-group">
								<label for="title" class="control-label">pm2.5：</label>
								<div class="controls">
									<input type="text" name='pm25' id="pm25" placeholder="">
								</div>
							</div>
							<div class="control-group">
								<label for="title" class="control-label">湿度：</label>
								<div class="controls">
									<input type="text" name='sd' id="sd" placeholder="">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<div class="modal-footer center" id="div_footer">
			<a class="btn btn-primary" onclick="$.adminWeather.saveWeather()">保存</a>
			<a href="#" class="btn" data-dismiss="modal" id="closeViewModal">关闭</a>
		</div>
	</div>
</body>
</html>