<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>  
<!DOCTYPE html> 
<html>
<head>
<%--引入header配置 --%>
<%@ include file="/commons/header_bootstrap3.jsp" %>
 
 
<script type="text/javascript" src="${APP_PATH }/static/bootstrap-table/jquery.dropdown.min.js"></script>
 
<!--bootstrap-table  -->
<link href="${APP_PATH }/static/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
<script type="text/javascript" src="${APP_PATH }/static/bootstrap-table/bootstrap-table.min.js"></script>
<script type="text/javascript" src="${APP_PATH }/static/bootstrap-table/bootstrap-table-zh-CN.min.js"></script><!--汉化文件，放在 bootstrap-table.js 后面 -->
<!-- bootstrap-table-export数据导出 -->
<script type="text/javascript" src="${APP_PATH }/static/bootstrap-table/bootstrap-table-export.min.js"></script> 
<script type="text/javascript" src="${APP_PATH }/static/bootstrap-table/tableExport.js"></script> 
 
 
<!--jeDate日期选择jquery插件
	1、使用：共4步,第一步：加载jedate.js核心文件，第二步：加载jedate.css样式，第三步，jquery中加载jeDate，第四步：html中使用jeDate  
	2：注意：一个input日期，就需要在function中添加一个js加载设置
-->
<script type="text/javascript" src="${APP_PATH }/static/js/JQuery_plugs/jeDate/src/jedate.js"></script><!-- jeDate:1/4 -->
<link href="${APP_PATH }/static/js/JQuery_plugs/jeDate/skin/jedate.css" rel="stylesheet"><!-- jeDate:2/4 -->
 
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> 

<div class="content">    
	<div class="table-responsive"> 
	
		 <!-- 搜索框 -->     
		 <div class="form-inline" id="form-search">
<!-- 		     <div class="form-group">
			     <label class="sr-only" for="product_line">没使用仅演示</label>
			     <div class="input-group">
				      <div class="input-group-addon">没使用仅演示</div>
				      <select class="form-control" name="product_line" id="productLine">
				     	 <option value="">请选择产品线...</option>
				      </select>
				  </div>
			 </div> -->
		    
		     <div class="form-group">
			     <div class="input-group">
				     <div class="input-group-addon">项目名称</div>
				     <input type="text" class="form-control" name="searchName"   placeholder="请输入姓名关键字..." />
		     	 </div>
		     </div>
		    <div class="form-group">
			     <div class="input-group">
				     <div class="input-group-addon">供应商名称</div>
				     <input type="text" class="form-control" name="searchgys"   placeholder="请输入姓名关键字..." />
		     	 </div>
		     </div>
		      <div class="form-group">
			     <div class="input-group">
				     <div class="input-group-addon">暂无</div>
				 	 <div class="jeinpbox"><input type="text" class="jeinput" name="searchDate" id="jeDateArea" placeholder=" YYYY-MM-DD hh:mm:ss" style="width:300px;height:33px;border:1px solid #CCCCCC;border-radius: 0 5px 5px 0;padding-left:10px"></div>
		     	 </div>
		     </div>
		      
		     <button type="button" class="btn btn-primary" id="queryButton">查询</button>
	    </div>
 
   <!--     工具栏      
       <select id="sel_exportoption" style="float:right;height:32px;position: relative;top:12px" >
               <option value="">导出当前页</option>
               <option value="basic">导出当前页</option>
               <option value="selected">导出选中数据</option>
               <option value="all">导出全部数据(bug,需要显示all后执行，等于导出当前页)</option>
         </select>   
 -->
		<div id="toolbar" class="btn-group">   	     
			<a href="javascript:void(0);" class="btn btn-primary" id="addA"><i class="glyphicon glyphicon-pencil"></i> 新增</a> 
			<a href="#" class="btn btn-warning" id="updateA" ><span class='glyphicon glyphicon-pencil' aria-hidden='true'></span>  修改</a> 
	        <a href="#" class="btn btn-danger " id="deleteA"><i class="glyphicon glyphicon-remove"></i> 删除</a> 
        </div> 
        <!-- 工具栏 end-->  
       
        <!-- bootstrap-table表格 -->         
        <table id="test-table" class="col-xs-12" data-toolbar="#toolbar"></table>    
    </div>
    
    <!-- bootstrap模态框  -->
	<!-- 新增学生模态框 -->
	<div class="modal fade" id="myInsertModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
	  <div class="modal-dialog" role="document">
	    <div class="modal-content" >
	      <div class="modal-header">
	        <h4 class="modal-title " id="myModalLabel" >新增合同信息</h4>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	      </div>		
	      <div class="modal-body">
		      <!-- 模态框自己内容：form提交表单begin -->  	
		      <form class="form-horizontal" id="stu_insert_form" method="POST">
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">序号</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="name" placeholder="请输入序号">
				      <span title="errText" ></span>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputPassword3" class="col-sm-2 control-label">年龄</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="age" placeholder="请输入项目名称">
				      <span title="errText" ></span>
				    </div>
				  </div>
				   <div class="form-group">
				 		<label for="inputPassword3" class="col-sm-2 control-label">合同编号</label>
				 		<div class="col-sm-10">
				 		   <input type="text" class="form-control" name="age" placeholder="请输入合同编号">
				      <span title="errText" ></span>
					    </div>
				  </div>
				  	 <div class="form-group">
				    <label for="inputPassword3" class="col-sm-2 control-label">供应商名称</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="age" placeholder="请输入供应商名称">
				      <span title="errText" ></span>
				    </div>
				  </div>
				  	 <div class="form-group">
				    <label for="inputPassword3" class="col-sm-2 control-label">货物名称</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="age" placeholder="请输入货物名称">
				      <span title="errText" ></span>
				    </div>
				  </div>
				  	 <div class="form-group">
				    <label for="inputPassword3" class="col-sm-2 control-label">单位</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="age" placeholder="请输入单位">
				      <span title="errText" ></span>
				    </div>
				  </div>	
				  	 <div class="form-group">
				    <label for="inputPassword3" class="col-sm-2 control-label">数量</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="age" placeholder="请输入数量">
				      <span title="errText" ></span>
				    </div>
				  </div>
				  	 <div class="form-group">
				    <label for="inputPassword3" class="col-sm-2 control-label">单价（万元）</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="age" placeholder="请输入单价（万元）">
				      <span title="errText" ></span>
				    </div>
				  </div>		
				  	 <div class="form-group">
				    <label for="inputPassword3" class="col-sm-2 control-label">合同总金额</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="age" placeholder="请输入合同金额">
				      <span title="errText" ></span>
				    </div>
				  </div>		
				  	 <div class="form-group">
				    <label for="inputPassword3" class="col-sm-2 control-label">开票金额</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="age" placeholder="请输入开票金额">
				      <span title="errText" ></span>
				    </div>
				  </div>
				  	 <div class="form-group">
				    <label for="inputPassword3" class="col-sm-2 control-label">已付金额</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="age" placeholder="请输入已付金额">
				      <span title="errText" ></span>
				    </div>
				  </div>	
				  	 <div class="form-group">
				    <label for="inputPassword3" class="col-sm-2 control-label">余额</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="age" placeholder="请输入余额">
				      <span title="errText" ></span>
				    </div>
				  </div>	
			  	 <div class="form-group">
				    <label for="inputPassword3" class="col-sm-2 control-label">付款比例</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="age" placeholder="请输入付款比例">
				      <span title="errText" ></span>
				    </div>
				  </div>	
			  	 <div class="form-group">
				    <label for="inputPassword3" class="col-sm-2 control-label">实际交货期</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="age" placeholder="请输入实际交货期">
				      <span title="errText" ></span>
				    </div>
				  </div>				  			  				  			  					  		  		  				  		  				  
			  </form>
		      <!-- 模态框自己内容：form提交表单end -->  		
	      </div>
	      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" id="stu_insert_btn">新增</button>
		        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 新增学生模态框end -->
	
	<!-- bootstrap模态框  -->
	<!-- 修改学生模态框 -->
	<div class="modal fade" id="myUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"  >
	  <div class="modal-dialog" role="document">
	    <div class="modal-content" >
	      <div class="modal-header">
	        <h4 class="modal-title " id="myModalLabel" >修改学生（未做前端验证，参考上个项目：student/listJson）</h4>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	      </div>		
	      <div class="modal-body">
		      <!-- 模态框自己内容：form提交表单begin -->  	
		      <form class="form-horizontal" id="stu_update_form">
		      	  <div class="form-group">
				    <label class="col-sm-2 control-label">id</label>
				    <div class="col-sm-10">
				      <p class="form-control-static" id="updateId">1</p>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">姓名</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="name" placeholder="请输入姓名...">
				      <span title="errText" ></span>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputPassword3" class="col-sm-2 control-label">年龄</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="age" placeholder="请输入年龄...">
				      <span title="errText" ></span>
				    </div>
				  </div>
				   <div class="form-group">
				 		<label for="inputPassword3" class="col-sm-2 control-label">日期</label>
				 		<div class="col-sm-10">
				 		    <!-- jeDate日期插件 ,jeDate:4/4  -->
					        <input type="text" class="form-control jeinput" id="jeDateInputUpdate" name="date" placeholder="日期格式：YYYY-MM-DD hh:mm:ss" /> 
					        <span title="errText" ></span>
					    </div>
				  </div>
				  <input type="hidden" class="form-control" name="id"  />
			  </form>
		      <!-- 模态框自己内容：form提交表单end -->  		
	      </div>
	      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" id="stu_update_btn">修改</button>
		        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 修改学生模态框end -->
</div>

</body>
<script type="text/javascript">
//全局变量
var _table=$('#test-table');

//页面加载完成后执行（仅一次，除非刷新），类似控制器Controoler只起流程作用。
$(function(){ 
	
	//加载bootstrap-table并显示列表
	_bootstrap_table(1);//默认第一页
	
	//新增按钮事件
	$("#addA").click(function(){
		_stu_add_btn();
	});

	//"确定新增"按钮事件（模态框中）
	$("#stu_insert_btn").click(function(){
		_stu_add_form();
	});

	
	//"修改"按钮事件(用于显示修改界面) 
	$('#toolbar #updateA').click(function(){			
		_update_btn();
	});
	//“确定修改”按钮事件
	$("#stu_update_btn").click(function(){
		_update_stu_form();//传入当前页（全局变量）
	});
	
	//jeDate日期选择jquery插件,jeDate:3/4  
    _jeDate();
	
	//"确定删除"按钮事件(单个，批量删除)
	$("#deleteA").click(function(){
		_stu_delete_banch();
	});
	
	 //初始化导出下拉框select的change事件
    $("#sel_exportoption").change(function () {
       _table.bootstrapTable('refreshOptions', {
            exportDataType: $(this).val()
        });
    });
	 
	 //点击查询按钮事件
	$("#queryButton").click(function(){
		 _table.bootstrapTable('refresh');//刷新bootstraptable后，查询的参数就可以提取到了。
	});
});


/*
	Bootstrap-Table显示数据到表格的方式有两种，一种是客户端（client）模式，一种是服务器（server）模式。
	
	客户端模式：指的是在服务器中把要显示到表格的数据一次性加载出来，然后转换成JSON格式传到要显示的界面中，客户端模式较为简单，它是把数据一次性加载出来放到界面上，然后根据你设置的每页记录数，自动生成分页。当点击第二页时，会自动加载出数据，不会再向服务器发送请求。同时用户可以使用其自带的搜索功能，可以实现全数据搜索。对于数据量较少的时候，可以使用这个方法。
	
	服务器模式：指的是根据设定的每页记录数和当前要显示的页码，发送数据到服务器进行查询，然后再显示到表格中。该方法可以根据用户的需要动态的加载数据，节省了服务器的资源，但是不能使用其自带的全数据搜索功能。
*/
function _bootstrap_table(_pageNum){
	
	//---先销毁表格 ---
	_table.bootstrapTable('destroy'); 
	
	//初始化bootstrap-table的内容
	_table.bootstrapTable({
		sidePagination: "server",   //分页方式：client客户端分页，server服务端分页（*）
		method: 'get',
		url: "${APP_PATH}/student/getJsonPageInfoBootstraptable",//这个接口需要处理bootstrap table传递的固定参数
		striped: true,      //是否显示行间隔色
		cache: false,      //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）	设置为 false 禁用 AJAX 数据缓存。
		
	
		//【分页设置】
		pagination: true,     //是否显示分页（*）
		paginationLoop:false,//设置为 true 启用分页条无限循环的功能
		sortOrder: "asc",     //排序方式
		pageNumber:_pageNum,      //初始化加载第一页，默认第一页
		pageSize: 10,      //每页的记录行数（*）
		pageList: [5,10,15,20,50,100,200],  //可供选择的每页的行数 pageList: [5,10,15,20,50,100,200,'all']
		
		//【样式设置】
		/* 
				自定义行样式 参数为：
			row: 行数据
			index: 行下标
			返回值可以为class或者css
			颜色：共5种颜色['active', 'success', 'info', 'warning', 'danger']
		*/
		rowStyle: function (row, index) {
		    var style = "";
		    //设置每行颜色，颜色参考bootstrap3
		    if(index%2==0) {style='active';}
		    
		    //单独设置颜色
		    if (row.name=="高晓松0") {style='success';}
		    if (row.id=="2") {style='danger';}//结果：<tr class="danger" data-index="1" data-uniqueid="2"> 添加了个class=danger配合bootstrap使用
		   
		    return { classes: style }
		},
		paginationDetailHAlign:"left",//分页详情内容水平位置
		paginationHAlign:"right",//分页条水平位置
		toolbar: '#toolbar',    //工具按钮用哪个容器
		buttonsAlign:"right",  ///工具按钮位置
		showColumns:true,//显示下拉框(选择显示的列)
		//search: true,      //是否显示表格搜索，需要配合client模式才好用，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
		showColumns: true,                  //是否显示所有的列（选择显示的列）
		showRefresh: true,                  //是否显示刷新按钮
		minimumCountColumns: 2,             //最少允许的列数,配合showColumns使用
		clickToSelect: true,                //是否启用点击选中行（配合复选框使用）
		showToggle:true,					//是否显示切换视图（table/card）按钮。
		paginationPreText: "上一页",
		paginationNextText: "下一页",
		showPaginationSwitch:true,		//是否显示切换分页按钮。
		showFullscreen:true,		//是否显示全屏按钮
		detailView:false,			//是否显示加号，展开详细页面模式。
		checkboxHeader:true,		//是否显示全选复选框
		silentSort:false,			//设置为 false 将在点击分页按钮时，自动记住排序项。仅在 sidePagination设置为 server时生效。
	    showFooter: true,//是否显示列脚。
		//icons: {refresh: "glyphicon-repeat", toggle: "glyphicon-list-alt", columns: "glyphicon-list"},//各种bootstrap-table按钮的图标
		
		//【其它设置】
		//height:$(window).height()-100,		//表格总体高度
		locale:'zh-CN',		//中文支持
		undefinedText:"-",//当数据为 undefined 时显示的字符(没数据显示的列显示的内容)
		
		//【导出表格excel】
		//需要2个额外jar包：bootstrap-table-export.min.js和tableExport.js
		//其他问题：1：导出量太大中途结束：http://www.cnblogs.com/huanghuahui/p/9229511.html
		//测试时分页先选择'client',因为分页是客户端的话,导出数据会方便可以随意定义'basic', 'all', 'selected'.如果分页是服务端的话即使选择'all导出的也是当前页('basic'),如果想导出全部话,可以先将页面显示条目数为全部,再导出当前页即就是全部数据了.
	    showExport: true,                     //是否显示导出
	    exportDataType: "basic",              //basic当前页', 'all所有页', 'selected选中内容'.
	    //exportTypes:['csv', 'txt', 'sql', 'doc', 'excel', 'xlsx', 'pdf'],//规定导出文件类型,导出xmls格式：https://blog.csdn.net/javayoucome/article/details/80081771
	    exportOptions:{
	          ignoreColumn: [0,5],  //忽略某一列的索引
	          fileName: '学生报表',  //文件名称设置
	          worksheetName: 'sheet1',  //表格工作区名称
	          tableName: '学生帐报表',
	          //excelstyles: ['background-color', 'color', 'font-size', 'font-weight']//保持表格样式 ,必须使用tableExport.js，不能用tableExport.min.js（缺点：导出表格比较大）
	      },
	 
		
		//【设置列】
		//读取出返回的json数据，其中field对应读取出的json中的对应列
		columns: [
			//一级表头（可不加）
			[
                 {
                   title: "合同付款统计表",
                   halign:"center",
                   align:"center",
                   colspan: 20
                }
            ],
            //二级表头（可不加）
            [
                 {
                     title: "全选/取消",
                     valign:"middle",
                     align:"center",
                     colspan: 1,
                     rowspan: 1
                 },
                 {
                	  //field: 'name',
                     title: "基础信息",
                     valign:"middle",
                     align:"center",
                     colspan: 4,
                     rowspan: 1
                 },
                 {
                     title: "付款信息",
                     align:"center",
                     colspan: 10,
                     rowspan: 1
                 }
             ],
             //数据字段
			 [
				 {checkbox: true, visible: true,valign:"center"}, //是否显示复选框  ，包括全选功能
				 
				 {field: 'id1',title: '序号',align: 'center', sortable: true}, 
				 {field: 'xiangmumc',title: '项目名称',align: 'center', sortable: true, 
						//底部合计，需开启 showFooter: true,

				 },
				 {field: 'hetongbh',title: '合同编号',align: 'center', sortable: true,//设置内容的水平和垂直位置
					
				
				 },
				 
				 {field: 'shoukdanw',title: '供应商名称',align: 'center', sortable: true, 
						//底部合计，需开启 showFooter: true,

				 },
				 
				 {field: 'yongtu',title: '货物名称',align: 'center', sortable: true},
				 {field: 'danw',title: '单位',align: 'center', sortable: true},
				 {field: 'shuliang',title: '数量',align: 'center', sortable: true},
				 {field: 'danjia',title: '单价（万元）',align: 'center', sortable: true},
				 {field: 'hetongjiner',title: '合同总金额（万元）',align: 'center', sortable: true},
				 {field: 'kaipjiner',title: '开票金额',align: 'center', sortable: true},
				 {field: 'yifujiner',title: '已付金额',align: 'center', sortable: true},
				 {field: 'yuer',title: '余额',align: 'center', sortable: true},
				 {field: 'yifubili',title: '付款比例',align: 'center', sortable: true},
				 {field: 'sjjhq',title: '实际交货期',align: 'center', sortable: true},
				/*  {field: 'danw',title: '单位',align: 'center', sortable: true},
				 {field: 'shuliang',title: '数量',align: 'center', sortable: true},
				 {field: 'danjia',title: '单价',align: 'center', sortable: true},
				 {field: 'kaipjiner',title: '开票金额',align: 'center', sortable: true},
				 {field: 'sjjhq',title: '实际交货期',align: 'center', sortable: true},
				 */
				 {field: 'tool',title: '操作', align: 'center',
					formatter:function(value,row,index){//row: 行数据(row.age,row.id,row.name),index: 行下标(第几行就是几)
					    var element = 
					    "<a class='edit btn btn-primary' data-id='"+row.id +"'><span class='glyphicon glyphicon-pencil' aria-hidden='true'></span> 编辑（没做）</a> "+ 
					    "<a class='delet btn btn-danger' data-id='"+row.id +"'> <span class='glyphicon glyphicon-remove' aria-hidden='true'></span> 删除（没做）</a> ";
					    return element;  
					} 
				  } 
			 ]
		 ],
		 uniqueId: "id",                     //每一行的唯一标识，一般为主键列<tr data-uniqueid="2"></tr>
		 idField:"id",//设置主键，为复选框赋值个value=id的值：<input data-index="1" name="btSelectItem" type="checkbox" value="2">
		
		 
		
		//【设置请求参数queryParams，获取响应参数responseHandler 】
		queryParamsType:'', //默认值为 'limit' ,在默认情况下 传给服务端的参数为：offset,limit,sort
		                    // 设置为 ''  在这种情况下传给服务器的参数为：pageSize,pageNumber
		//queryParams:前端调用服务时，会默认传递上边提到的参数，如果需要添加自定义参数，可以自定义一个函数返回请求参数
		//（1）【查询设置】传递给控制器的参数
		queryParams : function (params) {
			 //params 参数就是上面的表格参数（文档提到的表格参数）
		     //这里的键的名字和控制器的变量名必须一致，这边改动，控制器也需要改成一样的
		     var temp = {
				 //分页
		         pageNumber: params.pageNumber,   //当前页码
		    	 pageSize: params.pageSize,       //每页显示数量
		    	 //排序
		         sort: params.sortName,      	//排序列名 name,age等要进行排序的列名
		         sortOrder: params.sortOrder, 	//排位命令（desc，asc） 
		         //查询
		         searchName:$("#form-search input[name=searchName]").val(),//搜索姓名
		         searchBeginDate:$("#form-search input[name=searchgys]").val(),//开始时间，原始：2018-09-21 12:53:23 至 2018-10-27 03:11:06，截取时间
			 	 searchEndDate:$("#form-search input[name=searchDate]").val().substring(22,49)//结束时间
 
		     };
		     return temp;
		 },  
		 //（2）获取控制器传回来的json数据（核心操作）
		 //在ajax获取到数据，渲染表格之前，修改数据源.  目的：将获取的json格式替换成bootstrap-table需要的json格式
		 responseHandler:function(res){//加载服务器数据之前的处理程序，可以用来格式化数据。 	参数：res为从服务器请求到的数据。
		     //在ajax获取到数据，渲染表格之前，修改数据源
		     var nres = [];
		     nres.push({total:res.resultMap.pageInfo.total,rows:res.resultMap.pageInfo.list});//为bootstraptable的total和rows赋值，必须用这个格式
		     return nres[0];
		     //AjaxMsg返回的格式：{"code":200,"msg":"success","resultMap":{"pageInfo":{"total":982,"list":[{"id":1100,"name":"12321","age":321,"date":"2018-09-28 00:00:00"},{"id":1101,"name":"123212","age":222,"date":"2018-09-26 00:00:00"},{"id":1109,"name":"123422","age":12,"date":"2018-09-21 11:37:01"},{"id":1118,"name":"gggg3","age":123,"date":"2018-09-20 18:27:09"},{"id":1115,"name":"321213","age":3122,"date":"2018-09-20 11:51:00"},{"id":1114,"name":"321312","age":23,"date":"2018-09-20 11:50:28"},{"id":1113,"name":"dsfdads","age":1231,"date":"2018-09-20 11:50:03"},{"id":1112,"name":"4637433","age":2134,"date":"2018-09-20 11:49:46"},{"id":1111,"name":"12321312","age":123,"date":"2018-09-20 11:45:15"},{"id":1110,"name":"fffdd","age":12,"date":"2018-09-20 11:41:08"}],"pageNum":1,"pageSize":10,"size":10,"startRow":1,"endRow":10,"pages":99,"prePage":0,"nextPage":2,"isFirstPage":true,"isLastPage":false,"hasPreviousPage":false,"hasNextPage":true,"navigatePages":10,"navigatepageNums":[1,2,3,4,5,6,7,8,9,10],"navigateFirstPage":1,"navigateLastPage":10,"firstPage":1,"lastPage":10}}}
		     //pagehelper分页插件返回的格式：        {total: 1067, list: [{id: 1, name: "高晓松0", age: 26, date: "2018-09-04 05:23:05"},…], pageNum: 1,…}
		     //bootstrap-table需要返回的格式：：{total: 1067, rows:[{id: 1, name: "高晓松0", age: 26, date: "2018-09-04 05:23:05"}]}
		 },
		 
		 //【事件】
		 onLoadSuccess:function(data){   //表格数据加载成功事件
	         
	     },
	     onPageChange:function(number,size){  //表格翻页事件
	
	     },
		 onLoadError: function () { //表格数据加载失败事件
		     showTips("数据加载失败！");
		 },
		 
 
	
	});
	
	//【补充设置：设置按钮等文字】
	$("button[name=toggle]").append("切换样式");
}


/*
 * jeDate日期选择jquery插件,jeDate:3/4  
 */
function _jeDate(){
	jeDate("#jeDateInputInsert",{
    	theme:{bgcolor:"#00A1CB",pnColor:"#00CCFF"},//样式
        festival:true,
        minDate:"1900-01-01",              //最小日期
        maxDate:"2099-12-31",              //最大日期
        method:{
            choose:function (params) {
                
            }
        },
        format: "YYYY-MM-DD hh:mm:ss"
    }); 
    jeDate("#jeDateInputUpdate",{
    	theme:{bgcolor:"orange",pnColor:"orange"},//样式
        festival:true,
        minDate:"1900-01-01",              //最小日期
        maxDate:"2099-12-31",              //最大日期
        method:{
            choose:function (params) {
                
            }
        },
        format: "YYYY-MM-DD hh:mm:ss"
    }); 
    
    jeDate("#jeDateArea",{
        format: "YYYY-MM-DD hh:mm:ss",
        multiPane:false,
        range:" 至 "
    });
}

/*
 * 点击修改按钮事件，显示模态框
 */
function _update_btn(){
	
	//1、获取修改信息(免查数据库操作了)，使用的是bootstrap-table的getSelections方法。 http://bootstrap-table.wenzhixin.net.cn/zh-cn/documentation/
	/*
		getSelections返回json样式：
		0:{0: true, id: 2, name: "高晓松1", age: 26, date: "2018-09-04 05:23:05"}
		length:1
	*/
	_row=_table.bootstrapTable('getSelections');//获取选中行的信息（包括每列）
	console.log(_row);
	
	//1.1 、判断违规操作
	if(_row.length!=1){
		alert("请选择一行数据...");
		return;//终止向后进行
	} 
		
	//1.2、修改回显
	$("#myUpdateModal form #updateId").text(_row[0].id);
	$("#myUpdateModal form input[name=id]").val(_row[0].id);
	$("#myUpdateModal form input[name=name]").val(_row[0].name);
	$("#myUpdateModal form input[name=age]").val(_row[0].age);
	$("#myUpdateModal form input[name=date]").val(_row[0].date);
	
	//2、显示模态框：https://v3.bootcss.com/javascript/#modals
	$('#myUpdateModal').modal({
		//在这里可以为模态框添加一些属性与事件：https://v3.bootcss.com/javascript/#modals，事件：http://www.runoob.com/bootstrap/bootstrap-modal-plugin.html
		//show:false 当初始化时显示模态框。
		//keyboard:true 当按下 escape 键时关闭模态框，设置为 false 时则按键无效。
		backdrop:"static" //指定一个静态的背景，当用户点击模态框外部时不会关闭模态框。
		//remote 用 jQuery .load 方法，为模态框的主体注入内容。如果添加了一个带有有效 URL 的 href，则会加载其中的内容。如下面的实例所示：<a data-toggle="modal" href="remote.html" data-target="#modal">请点击我</a>
	});

}

/*
 * 修改学生
 */
function _update_stu_form(){
	$.ajax({
		//async: false,//将ajax异步传输改成同步传输。默认是true：异步（或不写这句），false：同步。将ajax异步传输改成同步传输的话，则必须执行完ajax程序后才会执行后面的，不加则是异步传输同步进行。
		//cache : false,//禁用缓存（POST请求默认禁用缓存，只是GET方式默认启用缓存）。默认情况下，请求总会被发出去，但浏览器有可能从他的缓存中调取数据。要禁止使用缓存的结果，可以设置cache参数为false。会在请求后就一个随机数来避免缓存效果
		
		type:'POST',//可改用PUT，见https://study.163.com/course/courseLearn.htm?courseId=1003862031#/learn/video?lessonId=1004622400&courseId=1003862031
		url:"${APP_PATH}/student/update", 
		data:decodeURIComponent($('form#stu_update_form').serialize(),true),//序列化，获取form表单中所有name和value值
			/*
				serialize序列化获取form表单所有内容，上面一句话代替了下面的内容，效果一样都获取到了input的value给后台，decodeURIComponent解码，不然中文乱码 
				测试参数：id:1,name:"dd",age:22,date:"2018:09:05 00:38:21"
				
				data:{
					id:$("#stu_update_form input[name=id]").val(),
					name:$("#stu_update_form input[name=name]").val(),
					age:$("#stu_update_form input[name=age]").val(),
					date:$("#stu_update_form input[name=date]").val()
				},
			*/
		dataType:'json',//返回类型，有html，json，xml，text，如果返回的内容不符，则执行error的内容
		
		 //请求前的处理
		beforeSend: function() {	
			//加载中提醒
			_loadTip("loading","修改中...","black");					
	    },
	    //请求成功处理
		success:function(_response,_status,_xhr){
			console.log(_response)//查看所有返回结果JSON格式:
			
			if(_response.msg=="success"){
				//1、执行成功提醒
				_loadTip("oking","修改完成","black");//to_page中的提示框会覆盖这里，所以跳转to_page要延迟会执行	
			
			    //2、模态框隐藏
			    $('#myUpdateModal').modal("hide");//$('#myModal').modal('show')
		
			    //3、跳转到当前页
				// setTimeout(function(){//两秒后跳转
					 //获取当前页码	 
				//	 var pageNum=_table.bootstrapTable('getOptions').pageNumber;//用bootstrap-table的getOptions方法
				//	 _bootstrap_table(pageNum);
				// },1500);
			    _table.bootstrapTable('refresh');//使用bootstrap_table自带刷新功能，还能保持在当前页
			 
			}else{
				alert("修改学生失败")
			}
					
		},
		 //请求失败处理
		error:function(XMLHttpRequest, textStatus, errorThrown){//返回类型错误，或传入类型错误
			console.log(decodeURIComponent($('form#stu_update_form').serialize(),true));//排错
			alert("操作错误");
		},
	});
};
 
/*
 * 新增学生按钮事件，显示模态框
 */
function _stu_add_btn(){
	
	//1、清空模态框表单内容
	$('form#stu_insert_form')[0].reset();//重置清空form表单中input的value内容，reset是js的，jquery没有，所以用【0】获取dom对象。
	//2、清空校验样式，错误提示文字
	$('form#stu_insert_form input').removeClass('border border-success  border-danger');
	$('form#stu_insert_form span').text('');
	
	//3、显示模态框：https://v3.bootcss.com/javascript/#modals
	$('#myInsertModal').modal({
		//在这里可以为模态框添加一些属性与事件：https://v3.bootcss.com/javascript/#modals，事件：http://www.runoob.com/bootstrap/bootstrap-modal-plugin.html
		//show:false 当初始化时显示模态框。
		//keyboard:true 当按下 escape 键时关闭模态框，设置为 false 时则按键无效。
		backdrop:"static" //指定一个静态的背景，当用户点击模态框外部时不会关闭模态框。
		//remote 用 jQuery .load 方法，为模态框的主体注入内容。如果添加了一个带有有效 URL 的 href，则会加载其中的内容。如下面的实例所示：<a data-toggle="modal" href="remote.html" data-target="#modal">请点击我</a>
	
	});
}
/*
 * 新增提交事件
 */
function _stu_add_form(){
 
		//serialize序列化，获取表单中所有name对应的value值:name=钉钉&age=112&date=2018-09-06T11:22
		console.log(decodeURIComponent($("form#stu_insert_form").serialize(),true));
 
		$.ajax({
			async: false,//将ajax异步传输改成同步传输。默认是true：异步（或不写这句），false：同步。将ajax异步传输改成同步传输的话，则必须执行完ajax程序后才会执行后面的，不加则是异步传输同步进行。
			//cache : false,//禁用缓存（POST请求默认禁用缓存，只是GET方式默认启用缓存）。默认情况下，请求总会被发出去，但浏览器有可能从他的缓存中调取数据。要禁止使用缓存的结果，可以设置cache参数为false。会在请求后就一个随机数来避免缓存效果
			
			type:'POST',
			url:"${APP_PATH}/student/insert", 
			data:decodeURIComponent($('form#stu_insert_form').serialize(),true),
			/*  serialize序列化获取form表单所有内容，上面一句话代替了下面的内容，效果一样都获取到了input的value给后台.decodeURIComponent解码，不然中文乱码
				data:{
					name:$("#stu_form input[name=name]").val(),
					age:$("#stu_form input[name=age]").val(),
					date:$("#stu_form input[name=date]").val()
				},
			*/
			dataType:'json',//返回类型，有html，json，xml，text，如果返回的内容不符，则执行error的内容
			
			 //请求前的处理
			beforeSend: function() {	
				//加载中提醒
				_loadTip("loading","添加中...","red");					
		    },
		    //请求成功处理
			success:function(_response,_status,_xhr){ 
				//console.log(_response)//查看所有返回结果JSON格式
				if(_response.msg=="success"){//自定义success或code=200表示返回成功
					//1、执行成功提醒
					_loadTip("oking","添加成功","black");
				
				    //2、模态框隐藏
				    $('#myInsertModal').modal("hide");//$('#myModal').modal('show')
				    
				    //3、清空模态框文本框内容
					    // 方法一：直接清空
					   // $('form#stu_form input').val('');
					    //方法二：调用模态框4个事件之一的，隐藏事件，隐藏模态框时执行
					    /*
							$('#myModal').on('hide.bs.modal', function () {
								$('form#stu_form input').val('');
							})
						*/
			
				    //4、跳转最后一页（大于应有的页数都默认为最后一页，比如可以设置99999999，这里用新增学生id的值作为跳转的页码数，肯定就是最后一页了。 
				   _bootstrap_table(_response.resultMap.id);

		             
				   
				}else{
					//后端验证：新增出错

					//网页检查元素--》NetWork--》insert内容--》Response可以看到返回的json内容
					console.log(_response.resultMap.errors);
					_loadTip("none","","");
				
					//检查到新增的问题
					if(undefined!=_response.resultMap.errors.name){
						alert(_response.resultMap.errors.name);
						return;
					}
					if(undefined!=_response.resultMap.errors.age){
						alert(_response.resultMap.errors.age);
						return;
					}
					if(undefined!=_response.resultMap.errors.date){
						alert(_response.resultMap.errors.date);
						return;
					}
					if(undefined!=_response.resultMap.errors.nameUniqueErr){
						alert(_response.resultMap.errors.nameUniqueErr);
						return;
					} 
					
					alert("新增学生失败");
					//window.location.href=""
						//window.location.href=""
				}
			},
			 //请求失败处理
			error:function(XMLHttpRequest, textStatus, errorThrown){//返回类型错误，或传入类型错误
				alert("插入失败,类型错误");
			},
			 //请求结束处理
		    complete: function(msg){
		    },
		});
 
 

}

/*
 * -批量删除
 */
function _stu_delete_banch(){
	
	//获取要删除的id字符串
	var _delete_id_row="";//要删除的id字符串
	var _delete_name_row="";//要删除的名字，仅用于显示
	//var _delete_id_array= new Array();//要删除的id数组
	
	var _rows=_table.bootstrapTable('getSelections');
	//console.log(_rows);
	/*
		console.log(_rows);
		0: {0: true, id: 2, name: "高晓松1", age: 26, date: "2018-09-04 05:23:05"}
		1: {0: true, id: 3, name: "高晓松2", age: 26, date: "2018-09-04 05:23:05"}
		2: {0: true, id: 4, name: "高晓松32", age: 26232, date: "2018-09-19 12:12:06"}length: 3__proto__: Array(0)
	*/
	$.each(_rows,function(index,value,array){
		_delete_id_row+=value.id+",";	   //删除的id字符串1,2,3,4,5,
		_delete_name_row+=value.name+","; //高晓松0,高晓松1,高晓松2,高晓松3,高晓松5,
		//_delete_id_array[index]=value.id;//要删除的id数组
	});
	console.log(_delete_id_row + "----" + _delete_name_row);//2,3,----高晓松1,高晓松2,
	
	//判断是否有选择复选框
	if(_delete_id_row.length==""){
		alert("请选择需要删除的行");
		return ;
	}
	
	//祛除最后多余的逗号：1,2,3,4,6,  ==>  1,2,3,4,6
	_delete_id_row=_delete_id_row.substring(0,_delete_id_row.length-1);//删除最后多余的逗号
	_delete_name_row=_delete_name_row.substring(0,_delete_name_row.length-1);//删除最后多余的逗号
	
	//删除操作
	if(confirm("确认删除【"+_delete_name_row+"】吗")){
		//执行批量删除
		$.ajax({
			async: false,//将ajax异步传输改成同步传输。默认是true：异步（或不写这句），false：同步。将ajax异步传输改成同步传输的话，则必须执行完ajax程序后才会执行后面的，不加则是异步传输同步进行。
			//cache : false,//禁用缓存（POST请求默认禁用缓存，只是GET方式默认启用缓存）。默认情况下，请求总会被发出去，但浏览器有可能从他的缓存中调取数据。要禁止使用缓存的结果，可以设置cache参数为false。会在请求后就一个随机数来避免缓存效果
		
			type:'POST',// 
			url:"${APP_PATH}/student/deleteBanch",  
			data: {delete_id_banch:_delete_id_row},
			dataType:'json',//返回类型，有html，json，xml，text，如果返回的内容不符，则执行error的内容
			
			 //请求前的处理
			beforeSend: function() {	
				//加载中提醒
				_loadTip("loading","批量删除中...","black");					
		    },
		    //请求成功处理
			success:function(_response,_status,_xhr){
				console.log(_response)//查看所有返回结果JSON格式:
				
				if(_response.msg=="success"){
					//1、执行成功提醒
					_loadTip("oking","删除成功","black");	//to_page中的提示框会覆盖这里，所以跳转to_page要延迟会执行		
			
					 //2、跳转到当前页
					 /*	 方法一：跳转到页面
							 setTimeout(function(){//两秒后跳转
								 //获取当前页码	 
								 var pageNum=_table.bootstrapTable('getOptions').pageNumber;//用bootstrap-table的getOptions方法
								 _bootstrap_table(pageNum);
							 },1500);
						方法二：bootstrap-table自带remove删除行方法
							_table.bootstrapTable('remove', {
		                        field: 'id',
		                    /   values: _delete_id_array
	                    });
					 */
					 _table.bootstrapTable("refresh");//方法三：使用bootstrap_table自带刷新功能，还能保持在当前页
					
				
				}else{
					alert("删除学生失败")
				}
						
			},
			 //请求失败处理
			error:function(XMLHttpRequest, textStatus, errorThrown){//返回类型错误，或传入类型错误
				console.log();//排错
				alert("操作错误");
			},
		});
	}
};
 
</script> 
</html>