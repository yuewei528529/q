<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<link href="//cdn.bootcss.com/jqueryui/1.12.0-rc.2/jquery-ui.min.css" rel="stylesheet">
<link href="//cdn.bootcss.com/jqgrid/4.6.0/css/ui.jqgrid.css" rel="stylesheet">
<script src="//cdn.bootcss.com/jquery/3.0.0-beta1/jquery.js"></script>
<script src="//cdn.bootcss.com/jqgrid/4.6.0/js/i18n/grid.locale-en.js"></script>
<script src="//cdn.bootcss.com/jqgrid/4.6.0/js/jquery.jqGrid.min.js"></script>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

<!-- 可选的Bootstrap主题文件（一般不使用） -->
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap-theme.min.css"></script>



<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta charset="utf-8" />
<title>资金需求审核明细表</title>

</head>
<body>

	<div class="form-inline">

		<div class="form-group">
			<button type="button" class="btn btn-primary" id="xinzeng" onclick="_stu_add_form()">新增</button>
		</div>
	</div>
	<table id="jqGrid"></table>
	<div id="jqGridPager"></div>

	<script type="text/javascript"> 
        $(document).ready(function () {
            $("#jqGrid").jqGrid({
            	
                url: 'http://localhost:8081/GzMavenSSM/student/zongb',
                mtype: "GET",
                datatype: "json",
                colModel: [
                    { label: '序号', name:'id' ,width:20},
                    { label: '项目名称',  name: 'xmmc',width:30},
                    { label: '收款单位', name: 'skdw'},
                    { label: '用途', name: 'yt', width:30 },
                    { label: '合同金额(元)', name: 'htje',  width:30   },
                    { label: '已付金额(元)', name: 'yif', width:30 },
                    { label: '已付比例', name: 'yifbl', width:30 },
                    { label: '预算金额(元)', name: 'yus',  width:30 },
                    { label: '本次预算比例及款项', name: 'bc'  },
                    { label: '资金紧急等级', name: 'jjqk',  width:30  },
                    { label: '备注', name: 'bz', },
          
     
                ],
/*                 autoScroll: false,//当autoScroll和shrinkToFit均为false时，会出现行滚动条
                shrinkToFit: false, */
				viewrecords: true,
                width: 1600,
                height: 950,
                rowNum: 70,
                pager: "#jqGridPager",
/*                 grouping:true, 
                groupingView : {
                	groupField : ['hetongh'], //需要分组的列
                	groupSummary : [true], //是否显示汇总 如果为true需要在colModel中进行配置 如： 

                	groupColumnShow:[true],
                	groupText : ['<b>{0}</b>'],
                	groupCollapse : false, //该属性表示在加载数据的时候是否只显示分组信息，false表示既显示分组信息也显示每个分组里面的详细信息，true则只显示分组信息
                    groupDataSorted: true, // 分组中的数据是否排序
                    groupOrder: ['asc'], // 分组后的排序
                    groupSummary: [true], // 是否显示汇总.如果为true需要在colModel中进行配置
                    summaryType: 'sum', // 运算类型，可以为max,sum,avg</div>
                    summaryTpl: '<b>规范化股份: {0}</b>',

                    groupSummaryPos: ['footer'], //汇总数据显示位置，footer或header。默认是footer
                    showSummaryOnHide: false //是否显示汇总信息并且当收起表格时是否隐藏下面的分组

                	}, //统计 footerrow:true, //开启统计 userDataOnFooter : true, //在页脚显示统计 altRows : true ,
                    footerrow:true,                   //开启统计
                    userDataOnFooter : true,          //在页脚显示统计
                    altRows : true , */			                  
/*                     gridComplete:function(){ //隐藏grid底部滚动条 
                    	//$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" }); 
	                    var rowNum=parseInt($(this).getGridParam("records"),10); 
	                    if(rowNum>0)
	                    { $(".ui-jqgrid-sdiv").show(); 
	                    var sum_inAmount = $(this).getCol("yif",false,"sum"); 
	                    var sum_balance = $(this).getCol("htze",false,"sum"); 
	                    $(this).footerData("set",{ "yif" : sum_inAmount, "htze" : sum_balance});
	                    //将合计值显示出来 
	                    }
	                    else{ $(".ui-jqgrid-sdiv").hide(); } } */
        		//公共调用方法合并单元格（无需修改）

            });
        });

        $("#jqGrid").jqGrid('setFrozenColumns');
        $("#jqGrid").css("overflow-x","hidden");
       // $("#jqGrid").filterToolbar(options);  

      //  jQuery("#jqGrid").jqGrid('filterToolbar',options);
		function MergerRowspan(gridName, CellName) {
			//得到显示到界面的id集合
			var mya = $("#" + gridName + "").getDataIDs();
			//当前显示多少条
			var length = mya.length;
			for (var i = 0; i < length; i++) {
				//从上到下获取一条信息
				var before = $("#" + gridName + "").jqGrid('getRowData', mya[i]);
				//定义合并行数
				var rowSpanTaxCount = 1;
				for (j = i + 1; j <= length; j++) {
					//和上边的信息对比 如果值一样就合并行数+1 然后设置rowspan 让当前单元格隐藏
					var end = $("#" + gridName + "").jqGrid('getRowData', mya[j]);
					if (before[CellName] == end[CellName]) {
						rowSpanTaxCount++;
						$("#" + gridName + "").setCell(mya[j], CellName, '', { display: 'none' });
					} else {
						rowSpanTaxCount = 1;
						break;
					}
					$("#" + CellName + "" + mya[i] + "").attr("rowspan", rowSpanTaxCount);
				}
			}
		};
  
		//公共调用方法合并单元格（根据需要修改修改）
		function MergerColspan(gridName,rowId,id,CellName) {
			
			$("#" + gridName + "").setCell(rowId, id, '', { display: 'none' });
			$("#" + CellName + "" + rowId + "").attr("colspan", 2);
			
		}
   </script>
	<div class="modal fade" id="myInsertModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title " id="myModalLabel">资金需求支付</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- 模态框自己内容：form提交表单begin -->
					<div class="form-group hidden">

						<label for="inputPassword3" class="col-sm-2 control-label">申请日期</label>
						<div class="col-sm-15">
							<input type="text" value="" id="sqsj">
						</div>
					</div>
					<div class="form-group">

						<label for="inputPassword3" class="col-sm-2 control-label">合同编号</label>
						<div class="col-sm-15">
							<input type="text" onchange="jisuanjtts()" id="heth">
						</div>
					</div>
					<div class="form-group">

						<label for="inputPassword3" class="col-sm-2 control-label">供应商</label>
						<div class="col-sm-15">
							<input type="text" value="" id="gys">
						</div>
					</div>

					<div class="form-group">

						<label for="inputPassword3" class="col-sm-2 control-label">工程名称</label>
						<div class="col-sm-15">
							<input type="text" value="" id="xmmc">
						</div>
					</div>
					<div class="form-group">

						<label for="inputPassword3" class="col-sm-2 control-label">合同金额</label>
						<div class="col-sm-15">
							<input type="text" value="" id="htje">
						</div>
					</div>
					<div class="form-group">

						<label for="inputPassword3" class="col-sm-2 control-label">已付金额</label>
						<div class="col-sm-15">
							<input type="text" value="" id="yif">
						</div>
					</div>

					<div class="form-group">

						<label for="inputPassword3" class="col-sm-2 control-label">申请金额</label>
						<div class="col-sm-15">
							<input type="text" value="" id="sqje">
						</div>
					</div>
					<div class="form-group">

						<label for="inputPassword3" class="col-sm-2 control-label">支付条件</label>


						<textarea style="width: 500px;  height: 100px" id="zftj">支付条件</textarea>


						<div class="form-group">

							<label for="inputPassword3" class="col-sm-9 control-label">资金需求事由</label>


							<textarea style="width: 500px; height: 100px" id="zzxqsy">资金需求事由</textarea>


						</div>

						<!--  <button type="button" class="btn met1" onClick="showAddr()">确定</button>
 -->
						<!-- 模态框自己内容：form提交表单end -->
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal" onClick="add()">确定</button>
					</div>
				</div>
			</div>
		</div>
</body>
<script type="text/javascript"> 
    function add(){
    	alert($("#heth").val()),
    	alert($("#zftj").val()),
    	alert($("#sqsj").val()),
    	alert($("#zzxqsy").val()),
    	$.ajax({
			//async : false,//将ajax异步传输改成同步传输。默认是true：异步（或不写这句），false：同步。将ajax异步传输改成同步传输的话，则必须执行完ajax程序后才会执行后面的，不加则是异步传输同步进行。
			//cache : false,//禁用缓存（POST请求默认禁用缓存，只是GET方式默认启用缓存）。默认情况下，请求总会被发出去，但浏览器有可能从他的缓存中调取数据。要禁止使用缓存的结果，可以设置cache参数为false。会在请求后就一个随机数来避免缓存效果

			type : 'GET',// 
			url : "${APP_PATH}/GzMavenSSM/student/xinzenys",
			data : {
				id:$("#heth").val(),
				zftj:$("#zftj").val(),
				sqrq: new Date().toLocaleDateString(),
				zjxqsy:$("#zzxqsy").val()
			},

			dataType : 'json',//返回类型，有html，json，xml，text，如果返回的内容不符，则执行error的内容

			//请求前的处理
	/* 		beforeSend : function() {
				//加载中提醒
				_loadTip("loading", "批量删除中...", "black");
			}, */
			//请求成功处理
			success : function(data) {
				alert("操作成功");
				//console.log(data)//查看所有返回结果JSON格式:
				/* 
				if (_response.msg == "success") {
					//1、执行成功提醒
					_loadTip("oking", "删除成功", "black"); //to_page中的提示框会覆盖这里，所以跳转to_page要延迟会执行		

					_table.bootstrapTable("refresh");//方法三：使用bootstrap_table自带刷新功能，还能保持在当前页

				} else {
					alert("删除学生失败")
				} */
				//alert(data[0].skdw);
	/* 			$("#sqsj").val(new Date().toLocaleDateString());				
				$("#gys").val(data[0].gys);
				$("#htje").val(data[0].htze);	
				$("#xmmc").val(data[0].xmjc);	
				$("#yif").val(data[0].yif);	 */				
				//alert("删除学生失败")
			},
			//请求失败处理
			error : function(XMLHttpRequest, textStatus, errorThrown) {//返回类型错误，或传入类型错误
				console.log();//排错
				alert("操作错误");
			},
		});
    	
    }
    function jisuanjtts(){
    	alert("dddddd");
    	$.ajax({
			//async : false,//将ajax异步传输改成同步传输。默认是true：异步（或不写这句），false：同步。将ajax异步传输改成同步传输的话，则必须执行完ajax程序后才会执行后面的，不加则是异步传输同步进行。
			//cache : false,//禁用缓存（POST请求默认禁用缓存，只是GET方式默认启用缓存）。默认情况下，请求总会被发出去，但浏览器有可能从他的缓存中调取数据。要禁止使用缓存的结果，可以设置cache参数为false。会在请求后就一个随机数来避免缓存效果

			type : 'GET',// 
			url : "${APP_PATH}/GzMavenSSM/student/getJsonPageInfoBootstraptable3",
			data : {
				id: $("#heth").val()
			},

			dataType : 'json',//返回类型，有html，json，xml，text，如果返回的内容不符，则执行error的内容

			//请求前的处理
	/* 		beforeSend : function() {
				//加载中提醒
				_loadTip("loading", "批量删除中...", "black");
			}, */
			//请求成功处理
			success : function(data) {
				//console.log(data)//查看所有返回结果JSON格式:
				/* 
				if (_response.msg == "success") {
					//1、执行成功提醒
					_loadTip("oking", "删除成功", "black"); //to_page中的提示框会覆盖这里，所以跳转to_page要延迟会执行		

					_table.bootstrapTable("refresh");//方法三：使用bootstrap_table自带刷新功能，还能保持在当前页

				} else {
					alert("删除学生失败")
				} */
				//alert(data[0].skdw);
				$("#sqsj").val(new Date().toLocaleDateString());				
				$("#gys").val(data[0].gys);
				$("#htje").val(data[0].htze);	
				$("#xmmc").val(data[0].xmjc);	
				$("#yif").val(data[0].yif);					
				//alert("删除学生失败")
			},
			//请求失败处理
			error : function(XMLHttpRequest, textStatus, errorThrown) {//返回类型错误，或传入类型错误
				console.log();//排错
				alert("操作错误");
			},
		});

    }
function _stu_add_form() {
	jQuery('#myInsertModal1').modal({
		//在这里可以为模态框添加一些属性与事件：https://v3.bootcss.com/javascript/#modals，事件：http://www.runoob.com/bootstrap/bootstrap-modal-plugin.html
		//show:false 当初始化时显示模态框。
		//keyboard:true 当按下 escape 键时关闭模态框，设置为 false 时则按键无效。
		backdrop : "static" //指定一个静态的背景，当用户点击模态框外部时不会关闭模态框。
	//remote 用 jQuery .load 方法，为模态框的主体注入内容。如果添加了一个带有有效 URL 的 href，则会加载其中的内容。如下面的实例所示：<a data-toggle="modal" href="remote.html" data-target="#modal">请点击我</a>

	});
}
   </script>
</html>
