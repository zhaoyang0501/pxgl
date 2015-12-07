jQuery.adminSubmission = {
		submissionDataTable:null,
		initSearchDataTable : function() {
			if (this.submissionDataTable == null) {
				this.submissionDataTable = $('#dt_table_view').dataTable({
					"sDom" : "<'row-fluid'<'col-md-6'l>r>t<'row-fluid'<'col-md-6'i><'col-md-6 pager'p>>",
					"sPaginationType" : "bootstrap",
					"oLanguage" : {
						"sLengthMenu" : "每页显示 _MENU_ 条记录",
						"sZeroRecords" : "抱歉， 暂时没有记录",
						"sInfo" : "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
						"sSearch" : "",
						"sInfoEmpty" : "没有数据",
						"sInfoFiltered" : "(从 _MAX_ 条数据中检索)",
						"oPaginate" : {
							"sFirst" : "首页",
							"sPrevious" : "前一页",
							"sNext" : "后一页",
							"sLast" : "尾页"
						}
					},
					"bAutoWidth" : false,
					"iDisplayLength" : 10,
					"aLengthMenu" : [ 5, 10, 25, 50],
					"bServerSide" : true,
					"sServerMethod" : "POST",
					"bProcessing" : true,
					"bSort" : false,
					"sAjaxSource" : $.ace.getContextPath() + "/submission/list",
					"fnServerData" : function(sSource, aoData, fnCallback) {
						var name = $("#_name").val();
						if (!!name) {
							aoData.push({
								"name" : "submissionname",
								"value" : name
							});
						}
						$.ajax({
							"dataType" : 'json',
							"type" : "POST",
							"url" : sSource,
							"data" : aoData,
							"success" : function(data){
								fnCallback(data);
							}
						});
					},
					"aoColumns" : [ {
						"mDataProp" : "id"
					}, {
						"mDataProp" : "problem.name"
					}, {
						"mDataProp" : "createDate"
					}, {
						"mDataProp" : "language"
					}, {
						"mDataProp" : "problem.hard"
					},{
						"mDataProp" : "state"
					}],
					"aoColumnDefs" : [
					{
						'aTargets' : [0],
						'fnRender' : function(oObj, sVal) {
							return "<a href='submission/"+oObj.aData.id+"'> "+sVal+"</a>";
						}
					},
					{
						'aTargets' : [1],
						'fnRender' : function(oObj, sVal) {
							return "<a href='problemdetail/"+oObj.aData.problem.id+"'> "+sVal+"</a>";
						}
					},
					{
						'aTargets' : [3],
						'fnRender' : function(oObj, sVal) {
							if(sVal=="1")
								return "C";
							else if(sVal=="2")
								return "C++";
							else
								return "JAVA";
						}
					},
					{
						'aTargets' : [4],
						'fnRender' : function(oObj, sVal) {
								return "<div class='label label-primary'>"+sVal+"</div>";
						}
					},
					{
						'aTargets' : [5],
						'fnRender' : function(oObj, sVal) {
							if(sVal=='成功')
								return "<div class='label label-success'>"+sVal+"</div>";
							else  
								return "<div class='label label-danger'>"+sVal+"</div>";
						}
					},
					 {
						'aTargets' : [ '_all' ],
						'bSortable' : false,
						'sClass' : 'center'
					}]

				});
			} else {
				var oSettings = this.submissionDataTable.fnSettings();
				oSettings._iDisplayStart = 0;
				this.submissionDataTable.fnDraw(oSettings);
			}

		}
};