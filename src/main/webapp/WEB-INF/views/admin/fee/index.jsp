<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ch">
<%@ include file="../common/meta.jsp"%>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/ace/admin.fee.js"></script>
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
								<h3>缴费管理</h3>
							</div>
							<div class="box well form-inline">
								<span>学生：</span>
								<input type="text" id="_name" >
								<a onclick="$.adminFee.initSearchDataTable()"
									class="btn btn-info" data-loading-text="正在加载..."><i class="icon-search"></i>查询</a>
							</div>
							<div class="widget-container">
								
									<a class="btn btn-success" style="float: right; margin: 5px;" onclick="$.adminFee.showFeeAddModal()"><i class="icon-plus"></i>新增</a>
								<table class="responsive table table-striped table-bordered"
									id="dt_table_view">
									<thead>
										<tr>
											<th rowspan="2" >ID</th>
											<th rowspan="2" >学生</th>
											<th rowspan="2" >年份</th>
											<th colspan="3" style="    text-align: center;">教程费用</th>
											<th colspan="3" style="    text-align: center;">学费</th>
											<th colspan="3" style="    text-align: center;">多媒体材料费</th>
											<th rowspan="2">状态</th>
											<th rowspan="2">操作</th>
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
		<div class="modal-body" style="min-height: 400px;">
			<div class="row-fluid">
				<div class="span12">
					<div class="form-container grid-form form-background left-align form-horizontal">
						<form action="" method="get" id=''>
							<input type="hidden"  name='id' id="id" value="">
							
							<div class="control-group">
								<label for="title" class="control-label">年份：</label>
								<div class="controls">
									<select name="year">
										<option value="2015上学期">2015上学期</option>
									</select>
								</div>
							</div>
							
							<div class="control-group">
								<label for="title" class="control-label">学生：</label>
								<div class="controls">
									<select name="user.id">
									<c:forEach items="${users }" var="bean">
									<option value="${bean.id }">${bean.name }</option>
									</c:forEach>
									</select>
								</div>
							</div>
							<div class="control-group">
								<label for="title" class="control-label">教程费用(应缴)：</label>
								<div class="controls">
									<input name="needa" type="text" />
								</div>
							</div>
							
							<div class="control-group">
								<label for="title" class="control-label">教程费用(实缴)：</label>
								<div class="controls">
									<input name="reala" type="text" />
								</div>
							</div>
							<div class="control-group">
								<label for="title" class="control-label">教程费用(未缴)：</label>
								<div class="controls">
									<input name="resta" type="text" />
								</div>
							</div>
							<div class="control-group">
								<label for="title" class="control-label">学费(应缴)：</label>
								<div class="controls">
									<input name="needb" type="text" />
								</div>
							</div>
							
							<div class="control-group">
								<label for="title" class="control-label">学费(实缴)：</label>
								<div class="controls">
									<input name="realb" type="text" />
								</div>
							</div>
							<div class="control-group">
								<label for="title" class="control-label">学费(未缴)：</label>
								<div class="controls">
									<input name="restb" type="text" />
								</div>
							</div>
							
							<div class="control-group">
								<label for="title" class="control-label">多媒体材料费(应缴)：</label>
								<div class="controls">
									<input name="needc" type="text" />
								</div>
							</div>
							
							<div class="control-group">
								<label for="title" class="control-label">多媒体材料费(实缴)：</label>
								<div class="controls">
									<input name="realc" type="text" />
								</div>
							</div>
							<div class="control-group">
								<label for="title" class="control-label">多媒体材料费(未缴)：</label>
								<div class="controls">
									<input name="restc" type="text" />
								</div>
							</div>
							
							<div class="control-group">
								<label for="title" class="control-label">状态：</label>
								<div class="controls">
									<select name="state">
										<option value="未缴">未缴</option>
										<option value="已缴">已缴</option>
									</select>
								</div>
							</div>
							
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<div class="modal-footer center" id="div_footer">
			<a class="btn btn-primary" onclick="$.adminFee.saveFee()">保存</a>
			<a href="#" class="btn" data-dismiss="modal" id="closeViewModal">关闭</a>
		</div>
	</div>
</body>
</html>