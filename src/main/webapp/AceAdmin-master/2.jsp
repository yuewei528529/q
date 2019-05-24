<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>jqgrid</title>
<!-- jqgrid -->
<link href="//cdn.bootcss.com/jqueryui/1.12.0-rc.2/jquery-ui.min.css" rel="stylesheet">
<link href="//cdn.bootcss.com/jqgrid/4.6.0/css/ui.jqgrid.css" rel="stylesheet">
<script src="//cdn.bootcss.com/jquery/3.0.0-beta1/jquery.min.js"></script>
<script src="//cdn.bootcss.com/jqgrid/4.6.0/js/i18n/grid.locale-en.js"></script>
<script src="//cdn.bootcss.com/jqgrid/4.6.0/js/jquery.jqGrid.min.js"></script>
<style>
html, body {
	margin: 0;
	padding: 0;
	font-size: 75%;
}
</style>

</head>
<body>
	<table id="gridTable" border="1" cellspacing="0" cellpadding="0"></table>
</body>
<script type="text/javascript"> 
function modify(obj){
    //obj带的是参数rows.id
    alert(obj);
};
 $(function(){

		jQuery("#gridTable").jqGrid({
		                 	treeGrid: true,
			                treedatatype: "json",
			                datatype: "local",
			                height: 250,
			                colNames:['编号','用户名', '性别', '邮箱', 'QQ','手机号','出生日期'],
			                colModel:[
			                        {name:'id',index:'id', width:60, sorttype:"int"},
			                        {name:'userName',index:'userName', width:90},
			                        {name:'gender',index:'gender', width:90},
			                        {name:'email',index:'email', width:125,sorttype:"string"},
			                        {name:'QQ',index:'QQ', width:100,summaryType: 'sum'},                
			                        {name:'mobilePhone',index:'mobilePhone', width:120},                
			                        {name:'birthday',index:'birthday', width:100, sorttype:"date",formatter: function (value, grid, rows, state) { return '<a href="javascript:void(0);" style="color:#f60" onclick="modify(\''+ rows.id+ '\');">申请开卡</a>'; } }                
			                ],
			                sortname:'id',  
			                sortorder:'asc',
			                viewrecords:true,
			                rowNum:5,
			                rowList:[5,10,15],
			                pager:"#gridPager",
			                caption: "第一个jqGrid例子",
			             //   viewrecords: true, 
			                //sortname: 'QQ', //需要分组的列 
			                grouping:true, 
			                groupingView : {
			                	groupField : ['QQ'], //需要分组的列
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
			                    altRows : true ,
			                    gridComplete:function(){ //隐藏grid底部滚动条 
			                    	$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" }); 
			                    var rowNum=parseInt($(this).getGridParam("records"),10); if(rowNum>0){ $(".ui-jqgrid-sdiv").show(); 
			                    var sum_inAmount = $(this).getCol("inAmount",false,"sum"); 
			                    var sum_balance = $(this).getCol("balance",false,"sum"); 
			                    $(this).footerData("set",{"customerName" : "合计:", "inAmount" : sum_inAmount, "balance" : sum_balance});
			                    //将合计值显示出来 
			                    }else{ $(".ui-jqgrid-sdiv").hide(); } }
			                    
/* 							gridComplete: function() {
								//在gridComplete调用合并方法
								var gridName = "gridTable";
								MergerRowspan(gridName, 'id');
								MergerRowspan(gridName, 'QQ');								
								MergerColspan(gridName,8, 'id','userName');
								  }*/
			        }).navGrid('#pager2',{edit:false,add:false,del:false}); 
			        var mydata = [
			                {id:"1",userName:"polaris",gender:"男",email:"fef@163.com",QQ:"222222222",mobilePhone:"13223423424",birthday:"1985-10-01"},
			                {id:"1",userName:"李四",gender:"女",email:"faf@gmail.com",QQ:"222222222",mobilePhone:"222222222",birthday:"1986-07-01"},
			                {id:"2",userName:"王五",gender:"男",email:"fae@163.com",QQ:"222222222",mobilePhone:"1322342342",birthday:"1985-10-01"},
			                {id:"2",userName:"马六",gender:"女",email:"aaaa@gmail.com",QQ:"11",mobilePhone:"132234662",birthday:"1987-05-01"},
			                {id:"5",userName:"赵钱",gender:"男",email:"4fja@gmail.com",QQ:"22222222",mobilePhone:"1343434662",birthday:"1982-10-01"},
			                {id:"6",userName:"小毛",gender:"男",email:"ahfi@yahoo.com",QQ:"11",mobilePhone:"1328884662",birthday:"1987-12-01"},
			                {id:"6",userName:"333",gender:"男",email:"ahfi@yahoo.com",QQ:"11",mobilePhone:"1328884662",birthday:"1987-12-01"},
			                {id:"7",userName:"小李",gender:"女",email:"note@sina.com",QQ:"22",mobilePhone:"13220046620",birthday:"1985-10-01"},
			                {id:"7",userName:"王先生",gender:"男",email:"oefh@sohu.com",QQ:"33",mobilePhone:"1327734662",birthday:"1988-12-01"},
			                {id:"9",userName:"孙先",gender:"男",email:"76454533@qq.com",QQ:"33",mobilePhone:"132290062",birthday:"1989-11-21"}
			                ];
			        for(var i=0;i<=mydata.length;i++)
			                jQuery("#gridTable").jqGrid('addRowData',i+1,mydata[i]);  
		

		
		//公共调用方法合并单元格（无需修改）
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
 
	});
	
 </script>


</html>
