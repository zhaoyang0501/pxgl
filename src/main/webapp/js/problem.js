jQuery.adminProblem = {
		problemDataTable:null,
		initSearchDataTable : function(typeid) {
			if(typeid!=null)
				$("#categoryid").val(typeid);
			else 
				$("#categoryid").val("");
			if (this.problemDataTable == null) {
				this.problemDataTable = $('#dt_table_view').dataTable({
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
					"sAjaxSource" : $.ace.getContextPath() + "/admin/problem/list",
					"fnServerData" : function(sSource, aoData, fnCallback) {
						var name = $("#keyword").val();
						var categoryid = $("#categoryid").val();
						if (!!name) {
							aoData.push({
								"name" : "problemname",
								"value" : name
							});
						}
						if (!!categoryid) {
							aoData.push({
								"name" : "categoryid",
								"value" : categoryid
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
						"mDataProp" : "name"
					}, {
						"mDataProp" : "hard"
					}, {
						"mDataProp" : "createDate"
					},{
						"mDataProp" : ""
					}],
					"aoColumnDefs" : [
					{
						'aTargets' : [1],
						'fnRender' : function(oObj, sVal) {
							return "<a href='problemdetail/"+oObj.aData.id+"'> "+sVal+"</a>";
							}
					},
					{
						'aTargets' : [4],
						'fnRender' : function(oObj, sVal) {
							if(oObj.aData.allNum==0)
								return "0%("+oObj.aData.passNum+"/"+oObj.aData.allNum+")";
							else
								return (Math.round((oObj.aData.passNum/oObj.aData.allNum)*100)/100)+ "%("+oObj.aData.passNum+"/"+oObj.aData.allNum+")";
							
						}
					},
					 {
						'aTargets' : [ '_all' ],
						'bSortable' : false,
						'sClass' : 'center'
					}]

				});
			} else {
				var oSettings = this.problemDataTable.fnSettings();
				oSettings._iDisplayStart = 0;
				this.problemDataTable.fnDraw(oSettings);
			}

		}
};