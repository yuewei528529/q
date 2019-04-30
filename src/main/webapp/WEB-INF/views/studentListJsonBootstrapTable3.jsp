<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%--引入header配置 --%>
<%@ include file="/commons/header_bootstrap3.jsp"%>


<script type="text/javascript" src="${APP_PATH }/static/bootstrap-table/jquery.dropdown.min.js"></script>
<link href="//cdnjs.cloudflare.com/ajax/libs/x-editable/1.5.0/bootstrap3-editable/css/bootstrap-editable.css" rel="stylesheet" />
<!--bootstrap-table  -->
<link href="${APP_PATH }/static/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">

<link href="${APP_PATH }/static/bootstrap-table/2/style.css" rel="stylesheet">

<!-- //<link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet"> -->

<link href="${APP_PATH }/static/js/JQuery_plugs/jeDate/skin/jedate.css" rel="stylesheet">

<meta charset="UTF-8">
<title>出差行程补助明细表</title>
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
						<div class="input-group-addon">出差人员名称</div>
						<input type="text" class="form-control" name="chuchairenyuan" id="chuchairenyuan" placeholder="" />
					</div>
				</div>
				<div class="form-group">
					<div class="input-group">
						<div class="input-group-addon">是否为合同制</div>

					</div>
				</div>
				<div class="radio-inline">
					<input type="radio" data-toggle="tooltip" data-placement="bottom" title="合同制" name="hetong" value="8" /> <label for="killOrder1">是</label>&nbsp&nbsp&nbsp&nbsp&nbsp <input
						type="radio" data-toggle="tooltip" data-placement="bottom" title="外包制" name="hetong" value="2" /> <label for="killOrder1">否</label>
				</div>



				<div class="form-group">
					<div class="input-group">
						<div class="input-group-addon">员工级别</div>
						<!-- 						<input type="text" class="form-control" data-toggle="tooltip" data-placement="bottom" title="项目经理补助180,副经理160，其他140" name="searchgys" placeholder="" /> -->
						<select data-toggle="tooltip" data-placement="bottom" id="jibie" title="项目经理在项目上补助180,副经理160，其他140">
							<option value="yiban">一般项目人员</option>
							<option value="xmj">项目经理</option>
							<option value="xmfj">项目副经理</option>

							<option value="xs">销售人员</option>
							<option value="bg">办公室人员</option>
						</select>
					</div>
				</div>
				<div class="form-group" id="jj">
					<div class="input-group">
						<div class="input-group-addon">项目名称</div>
						<!-- 	<input type="text" class="form-control" data-toggle="tooltip" data-placement="bottom" id="xmmc" title="项目人员请选择项目名称" name="searchgys" placeholder="" /> -->
						<select data-toggle="tooltip" data-placement="bottom" title="项目人员请选择项目名称">
							<option value="辽宁盛基风电">辽宁盛基风电</option>
							<option value="汝州光伏扶贫">汝州光伏扶贫</option>
							<option value="叶县平煤光伏">叶县平煤光伏</option>
							<option value="豫粮光伏">豫粮光伏</option>
							<option value="叶县将军山">叶县将军山</option>
						</select>
					</div>
				</div>
				<div class="form-group hidden">
					<div class="input-group">
						<div class="input-group-addon">暂无</div>
						<div class="jeinpbox">
							<input type="text" class="jeinput" name="searchDate" id="jeDateArea"
								style="width: 60px; height: 33px; border: 1px solid #CCCCCC; border-radius: 0 5px 5px 0; padding-left: 10px">
						</div>
					</div>
				</div>
				<div class="form-group">
					<button type="button" class="btn btn-primary" id="xinzeng" onclick="dayin()">打印</button>
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
						<div class="form-inline">
							<div class="form-group">
								<div class="input-group">
									<div class="input-group-addon">出发时间</div>
									<input type="text" class="form-control" id="chufashijian" placeholder="出发时间." style="width: 100px" />
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<div class="input-group-addon">出发时间段选择</div>
									<!-- <input type="text" class="form-control" id="chufashijian1" data-toggle="tooltip" data-placement="bottom" title="出差人员14点以前离开出差地（以车船票为准），不予报销当天住宿费；14点至21点离开出差地（以车船票为准），报销半天住宿费；21点以后离开出差地（以车船票为准），报销全天住宿费；" style="width: 100px" /> -->
									<select id="chufatime" data-toggle="tooltip" onchange="jisuanjtts()" data-placement="bottom"
										title="出差人员14点以前离开出差地（以车船票为准），不予报销当天住宿费；14点至21点离开出差地（以车船票为准），报销半天住宿费；21点以后离开出差地（以车船票为准），报销全天住宿费；">
										<option value="1" selected>14点前离开</option>
										<option value="2">14点至21点离开</option>
										<option value="3">21点以后离开</option>

									</select>
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<div class="input-group-addon" data-toggle="tooltip" data-placement="bottom" title="出发地点不用填写">出发地点</div>
									<input type="text" class="form-control" id="chufadidian" style="width: 20px" readonly="readonly" />
								</div>
							</div>
							<div class="form-group ">
								<div class="input-group">
									<div class="input-group-addon">到达时间</div>
									<div class="jeinpbox">
										<input type="text" class="form-control" id="daodashijian" placeholder="到达时间." style="width: 100px" />
									</div>
								</div>
							</div>
							<div class="form-group ">
								<div class="input-group">
									<div class="input-group-addon">到达地点</div>
									<div class="jeinpbox">
										<input type="text" class="jeinput" name="daodadidian" id="daodadidian" onclick="danji1()"
											style="width: 200px; height: 33px; border: 1px solid #CCCCCC; border-radius: 0 5px 5px 0; padding-left: 10px" />
									</div>
								</div>
							</div>
							<div class="form-group " id="sfxm">
								<div class="input-group">
									<div class="input-group-addon">到达地点是否在项目</div>

								</div>

								<div class="radio-inline">
									<input type="radio" data-toggle="tooltip" data-placement="bottom" title="打钩为在项目上，不打勾为非项目上" name="xmdd" value="0" /> <label for="killOrder1">在</label>&nbsp&nbsp&nbsp&nbsp&nbsp
									<input type="radio" data-toggle="tooltip" data-placement="bottom" title="打钩为在项目上，不打勾为非项目上" name="xmdd" value="1" /> <label for="killOrder1">不在</label>
								</div>
							</div>
							<div class="form-group ">
								<div class="input-group">
									<div class="input-group-addon">交通工具</div>
									<div class="jeinpbox">
										<!-- 									<input type="text" class="jeinput" name="jitonggj" id="jitonggj"
										style="width: 60px; height: 33px; border: 1px solid #CCCCCC; border-radius: 0 5px 5px 0; padding-left: 10px"> -->
										<select id="chep">
											<option value="有票">有票</option>
											<option value="无票">无票</option>
										</select>
									</div>
								</div>
							</div>
							<div class="form-group">
								<button type="button" class="btn btn-primary" id="xinzeng" onclick="_stu_add_form()">新增</button>
							</div>
						</div>
						<div class="form-group ">
							<div class="input-group">
								<div class="input-group-addon">交通补助天数</div>
								<div>
									<input type="text" id="jtbzts" style="width: 60px; height: 33px; border: 1px solid #CCCCCC; border-radius: 0 5px 5px 0; padding-left: 10px">
								</div>
							</div>
						</div>
						<div class="form-group ">
							<div class="input-group">
								<div class="input-group-addon">交通补助标准</div>
								<div>
									<input type="text" name="jtbzbz" id="jtbzbz" style="width: 60px; height: 33px; border: 1px solid #CCCCCC; border-radius: 0 5px 5px 0; padding-left: 10px">
								</div>
							</div>
						</div>
						<div class="form-group ">
							<div class="input-group">
								<div class="input-group-addon">交通补助金额</div>
								<div>
									<input type="text" name="jtbzje" readonly="readonly" id="jtbzje"
										style="width: 60px; height: 33px; border: 1px solid #CCCCCC; border-radius: 0 5px 5px 0; padding-left: 10px">
								</div>
							</div>
						</div>
						<div class="form-group ">
							<div class="input-group">
								<div class="input-group-addon">伙食补助天数</div>
								<div class="jeinpbox">
									<input type="text" class="jeinput" name="hsbzts" id="hsbzts" style="width: 60px; height: 33px; border: 1px solid #CCCCCC; border-radius: 0 5px 5px 0; padding-left: 10px">
								</div>
							</div>
						</div>
						<div class="form-group ">
							<div class="input-group">
								<div class="input-group-addon">伙食补助标准</div>
								<div class="jeinpbox">
									<input type="text" class="jeinput" name="hsbzbz" id="hsbzbz" style="width: 60px; height: 33px; border: 1px solid #CCCCCC; border-radius: 0 5px 5px 0; padding-left: 10px">
								</div>
							</div>
						</div>
						<div class="form-group ">
							<div class="input-group">
								<div class="input-group-addon">伙食补助金额</div>
								<div class="jeinpbox">
									<input type="text" class="jeinput" name="hsbzje" id="hsbzje" readonly="readonly"
										style="width: 60px; height: 33px; border: 1px solid #CCCCCC; border-radius: 0 5px 5px 0; padding-left: 10px">
								</div>
							</div>
						</div>
						<div class="form-group ">
							<div class="input-group">
								<div class="input-group-addon">住宿补助天数</div>
								<div class="jeinpbox">
									<input type="text" class="jeinput" name="zhusuts" id="zhusuts" style="width: 60px; height: 33px; border: 1px solid #CCCCCC; border-radius: 0 5px 5px 0; padding-left: 10px">
								</div>
							</div>
							<div class="form-group ">
								<div class="input-group">
									<div class="input-group-addon">住宿补助标准</div>
									<div class="jeinpbox">
										<input type="text" class="jeinput" name="zsbzbz" id="zsbzbz" holder=" YYYY-MM-DD hh:mm:ss"
											style="width: 60px; height: 33px; border: 1px solid #CCCCCC; border-radius: 0 5px 5px 0; padding-left: 10px">
									</div>
								</div>
								<div class="form-group ">
									<div class="input-group">
										<div class="input-group-addon">住宿补助金额</div>
										<div class="jeinpbox">
											<input type="text" class="jeinput" name="zsbzje" id="zsbzje" readonly="readonly"
												style="width: 60px; height: 33px; border: 1px solid #CCCCCC; border-radius: 0 5px 5px 0; padding-left: 10px">
										</div>
									</div>
								</div>
							</div>
						</div>

						</form>

					</div>
				</div>
				<!-- 工具栏 end-->

				<!-- bootstrap-table表格 -->
				<table id="test-table" class="col-xs-12" data-toolbar="#toolbar"></table>

			</div>

			<!-- bootstrap模态框  -->
			<!-- 新增学生模态框 -->
			<div class="modal fade" id="myInsertModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title " id="myModalLabel">选择地址</h4>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<!-- 模态框自己内容：form提交表单begin -->
							<div class="form-group">

								<label for="inputPassword3" class="col-sm-2 control-label">出发地点</label>
								<div class="col-sm-10">
									<input type="text" value="" id="addr-show">
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<select id="prov" onchange="showCity(this)">
										<option>=请选择省份=</option>

									</select> <select id="city" onchange="showCountry(this)">
										<option>=请选择城市=</option>
									</select>

									<!--县区选择-->
									<select id="country" onchange="selecCountry(this)">
										<option>=请选择县区=</option>
									</select>

								</div>
							</div>
							<!--  <button type="button" class="btn met1" onClick="showAddr()">确定</button>
 -->
							<!-- 模态框自己内容：form提交表单end -->
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal" onClick="showAddr()">确定</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 新增学生模态框end -->


			<!-- bootstrap模态框  -->
			<!-- 新增学生模态框 -->
			<div class="modal fade" id="myInsertModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title " id="myModalLabel">选择地址</h4>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<!-- 模态框自己内容：form提交表单begin -->
							<div class="form-group">

								<label for="inputPassword3" class="col-sm-2 control-label">出发地点</label>
								<div class="col-sm-10">
									<input type="text" value="" id="addr-show1">
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<select id="prov1" onchange="showCity1(this)">
										<option>=请选择省份=</option>

									</select> <select id="city1" onchange="showCountry1(this)">
										<option>=请选择城市=</option>
									</select>

									<!--县区选择-->
									<select id="country1" onchange="selecCountry1(this)">
										<option>=请选择县区=</option>
									</select>

								</div>
							</div>
							<!--  <button type="button" class="btn met1" onClick="showAddr()">确定</button>
 -->
							<!-- 模态框自己内容：form提交表单end -->
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal" onClick="showAddr1()">确定</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 新增学生模态框end -->
			<!-- bootstrap模态框  -->
			<!-- 修改学生模态框 -->

			<!-- 修改学生模态框end -->
		</div>
		<!-- 打印模态框 -->
		<div class="modal fade" id="dayinModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title " id="myModalLabel">选择打印时间</h4>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<!-- 模态框自己内容：form提交表单begin -->
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">起始时间</div>
								<input type="text" class="form-control" id="dayinchufashijian" placeholder="起始时间" style="width: 100px" />
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">结束时间</div>
								<input type="text" class="form-control" id="dayinjieshushijian" placeholder="结束时间" style="width: 100px" />
							</div>
						</div>

						<!--  <button type="button" class="btn met1" onClick="showAddr()">确定</button>
 -->
						<!-- 模态框自己内容：form提交表单end -->
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal" onClick="dayin1()">确定</button>
					</div>
				</div>
			</div>
		</div>

		<a href="#" id="username" data-type="text" data-title="用户名">用户名</a>
</body>
<script type="text/javascript" src="${APP_PATH }/static/js/JQuery_plugs/jeDate/src/jedate.js"></script>
<script type="text/javascript" src="${APP_PATH }/static/bootstrap-table/2/city.js"></script>
<script type="text/javascript" src="${APP_PATH }/static/bootstrap-table/2/method01.js"></script>
<script type="text/javascript" src="${APP_PATH }/static/bootstrap-table/2/method012.js"></script>
<script type="text/javascript" src="${APP_PATH }/static/bootstrap-table/bootstrap-table.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/x-editable/1.5.0/bootstrap3-editable/js/bootstrap-editable.min.js"></script>
<!-- //wwwwwwww -->
<script type="text/javascript" src="${APP_PATH }/static/bootstrap-table/bootstrap-table-editable.js"></script>


<!-- bootstrap-table-export数据导出 -->
<script type="text/javascript" src="${APP_PATH }/static/bootstrap-table/bootstrap-table-export.min.js"></script>
<script type="text/javascript" src="${APP_PATH }/static/bootstrap-table/tableExport.js"></script>
<script type="text/javascript">
	window.operateEvents1 = {
		'click .RoleOfdelete' : function(e, value, row, index) {
			alert("确认删除吗");
			_stu_delete_banch(row.id);
		},
		'click .RoleOfedit' : function(e, value, row, index) {
			jQuery("#myUpdateModal").modal('show');
			console.log("ssssssssssssss" + row.xiangmumc);
			jQuery("#myUpdateModal form input[name=id1]").val(row.id1);
			jQuery("#myUpdateModal form input[name=hetongbh]").val(row.hetongbh);
			jQuery("#myUpdateModal form input[name=shoukdanw]").val(row.shoukdanw);
			jQuery("#myUpdateModal form input[name=yongtu]").val(row.yongtu);
			jQuery("#myUpdateModal form input[name=danw]").val(row.danw);
			jQuery("#myUpdateModal form input[name=shuliang]").val(row.shuliang);
			jQuery("#myUpdateModal form input[name=danjia]").val(row.danjia);
			jQuery("#myUpdateModal form input[name=hetongjiner]").val(row.hetongjiner);
			jQuery("#myUpdateModal form input[name=kaipjiner]").val(row.kaipjiner);
			jQuery("#myUpdateModal form input[name=yifujiner]").val(row.yifujiner);
			jQuery("#myUpdateModal form input[name=yuer]").val(row.yuer);
			jQuery("#myUpdateModal form input[name=yifubili]").val(row.yifubili);
			jQuery("#myUpdateModal form input[name=sjjhq]").val(row.sjjhq);
			jQuery("#myUpdateModal form input[name=xiangmumc]").val(row.xiangmumc);
			jQuery("#myUpdateModal form input[name=id]").val(row.id);
		}
	}
	$("select#jibie").change(function() {
		console.log($(this).val());
		if ($(this).val() == "xs") {
			$("#jj").hide();
			$("#sfxm").hide();
		}
		if ($(this).val() !== "xs") {
			$("#jj").show();
			$("#sfxm").show();
		}
	});
	$('input:radio[id="yg"]').change(function() {
		if ($("#input1").is(":checked")) {
			alert("选中第一个！")
		}
		if ($("#input2").is(":checked")) {
			alert("选中第二个！")
		}
	})
	function aaa() {

		var length = document.getElementById('test-table').rows.length;
		alert(length);

	}
	function jisuanjtts() {
		var d = new Date($("#chufashijian").val());
		var n = d.getTime();
		var dd = new Date($("#daodashijian").val());
		var ddc = dd.getTime();
		$("#jtbzts").val((ddc - n) / (1000 * 60 * 60 * 24));
		$("#hsbzts").val((ddc - n) / (1000 * 60 * 60 * 24));
		if (document.getElementById('test-table').rows[document.getElementById('test-table').rows.length - 1].cells[3] == undefined) {
			return false

		}
		var ddd = new Date(document.getElementById('test-table').rows[document.getElementById('test-table').rows.length - 1].cells[3].innerText);
		var ddda = ddd.getTime();
		// 	$("#zhusuts").val((n-ddda)/(1000*60*60*24));
		if ($("#chufatime").val() == 2) {
			$("#zhusuts").val((n - ddda) / (1000 * 60 * 60 * 24) + 0.5);
		}
		if ($("#chufatime").val() == 3) {
			$("#zhusuts").val((n - ddda) / (1000 * 60 * 60 * 24) + 1);
		}
		if ($("#chufatime").val() == 1) {
			$("#zhusuts").val((n - ddda) / (1000 * 60 * 60 * 24));
		}
	}
	function jisuanzsbz() {
		var chufadidian = $("#chufadidian").val().substring($("#chufadidian").val().lastIndexOf("-") + 1, $("#chufadidian").val().length);
		if ([ "北京", "上海", "广州", "深圳" ].indexOf(chufadidian) != -1) {
			$("#zsbzbz").val(320)
		}
		;
		if ([ "哈尔滨", '郑州', "乌鲁木齐", "西宁", "兰州", "石家庄", "太原", "西安", "济南", "沈阳", "长春", "南京", "杭州", "合肥", "南昌", "福州", "武汉", "长沙", "成都", "贵阳", "昆明", "海口", "呼和浩特", "南宁", "银川", "大连",
				"青岛", "宁波", "厦门", "深圳" ].indexOf(chufadidian) != -1) {
			$("#zsbzbz").val(260)
		}
		;
	}

	/* $("chufashijian").on(" input propertychange",function(){
	 alert("变化了");
	 }); */
	/*  $('#chufadidian').bind('input propertychange', function() {
	
	 });  */
	$("#city1").change(function() {

		// showCountry1(this);
		$("#country1 option:selected").text($("#city1 option:selected").text());
	})
	function hh() {
		alert("eeeeee");
		  var tmp=window.open("about:blank","","fullscreen=1");

	        tmp.moveTo(100,100);

	        tmp.resizeTo(600,400);

	        tmp.focus();

	        tmp.location="https://www.baidu.com";
	}
	function dd() {
		alert("dddddd");
	}
	jQuery(function() {
		jQuery('#username').editable();
	});

	//全局变量
	var _table = jQuery('#test-table');

	//页面加载完成后执行（仅一次，除非刷新），类似控制器Controoler只起流程作用。
	$(function() {

		$('#hsbzbz').val(50);
		$('#jtbzbz').val(50);
		jisuanzsbz();
		var ee = $("#daodadidian").val();
		if ($("input[name='xmdd']:checked").val() == "1") {
			$("#daodadidian").val(ee + "(项)");
		}
		if ($("input[name='xmdd']:checked").val() == "0") {
			$("#daodadidian").val(ee);
		}
	});

	$(function() {
		$("[data-toggle='tooltip']").tooltip();
	});

	$('#jtbzts').on('input change oninput propertychange onpropertychange', function(event) {
		$('#jtbzje').val($('#jtbzts').val() * $('#jtbzbz').val());
		//    alert("55555");
	});
	$('#jtbzbz').on('input  change oninput  propertychange onpropertychange', function(event) {
		$('#jtbzje').val($('#jtbzts').val() * $('#jtbzbz').val());
		//  alert("8888");
	});
	$('#hsbzts').bind('input propertychange', function() {
		$('#hsbzje').val($('#hsbzts').val() * $('#hsbzbz').val());
	});
	$('#hsbzbz').bind('input propertychange', function() {
		$('#hsbzje').val($('#hsbzts').val() * $('#hsbzbz').val());
	});
	$('#zhusuts').bind('input propertychange', function() {
		$('#zsbzje').val($('#zhusuts').val() * $('#zsbzbz').val());
	});
	$('#zsbzbz').bind('input propertychange', function() {
		$('#zsbzje').val($('#zhusuts').val() * $('#zsbzbz').val());
	});

	jeDate("#chufashijian", {
		format : "YYYY-MM-DD",
	/* 	 donefun: function(obj){  
			 var objJS = obj.elem; 
		 $(objJS).trigger("change"); } */

	// isTime:false,
	// minDate:"2014-09-19 00:00:00"
	});
	jeDate("#daodashijian", {
		format : "YYYY-MM-DD"

	// isTime:false,
	// minDate:"2014-09-19 00:00:00"
	});
	jeDate("#dayinchufashijian", {
		format : "YYYY-MM-DD",
	/* 	 donefun: function(obj){  
			 var objJS = obj.elem; 
		 $(objJS).trigger("change"); } */

	// isTime:false,
	// minDate:"2014-09-19 00:00:00"
	});
	jeDate("#dayinjieshushijian", {
		format : "YYYY-MM-DD",
	/* 	 donefun: function(obj){  
			 var objJS = obj.elem; 
		 $(objJS).trigger("change"); } */

	// isTime:false,
	// minDate:"2014-09-19 00:00:00"
	});
	/*  $("#chufashijian").jeDate({
	    format:"YYYY-MM-DD",
	    isTime:false, 
	    minDate:"2014-09-19 00:00:00"
	})  */
	/*     $('#chufashijian').jeDate({
	 format:"YYYY-MM-DD",
	 isTime:false, 
	 minDate:"2014-09-19 00:00:00"
	 }) */
	/*   $('#chufashijian').datetimepicker({
	      format: 'YYYY-MM-DD' ,
	      autoclose: true,
	      todayBtn: true,
	      pickerPosition: "bottom-left",
	      //language:  'cn',
	     // language: 'zh',
	     // weekStart: 1,
	      //locale: moment.locale('zh-CN'),
	      todayBtn : true,
	    //showMeridian:true,
	     defaultDate: "2019-1-1"
	  });  */

	//$('#chufashijian').datetimepicker('setStartDate', '2018-01-01');
	//加载bootstrap-table并显示列表
	_bootstrap_table(666666);//默认第一页
	//	document.getElementById('chufadidian').value=document.getElementById('test-table').rows[document.getElementById('test-table').rows.length-1].cells[3].innerText;
	//新增按钮事件

	//"确定新增"按钮事件（模态框中）
	/* 		

	 //"修改"按钮事件(用于显示修改界面) 
	 jQuery('#toolbar #updateA').click(function() {
	 _update_btn();
	 });
	 //“确定修改”按钮事件
	 jQuery("#stu_update_btn").click(function() {
	 _update_stu_form();//传入当前页（全局变量）
	 });

	 //jeDate日期选择jquery插件,jeDate:3/4  
	 //_jeDate();

	 //"确定删除"按钮事件(单个，批量删除)
	 jQuery("#deleteA").click(function() {
	 _stu_delete_banch(c);
	 });

	 //初始化导出下拉框select的change事件
	 jQuery("#sel_exportoption").change(function() {
	 _table.bootstrapTable('refreshOptions', {
	 exportDataType : jQuery(this).val()
	 });
	 });

	 //点击查询按钮事件
	 jQuery("#queryBjQuerytton").click(function() {
	 _table.bootstrapTable('refresh');//刷新bootstraptable后，查询的参数就可以提取到了。
	 });

	 //document.getElementById('chufadidian').value=document.getElementById('test-table').rows[document.getElementById('test-table').rows.length-1].cells[3].innerText;
	 /*
	 Bootstrap-Table显示数据到表格的方式有两种，一种是客户端（client）模式，一种是服务器（server）模式。
	
	 客户端模式：指的是在服务器中把要显示到表格的数据一次性加载出来，然后转换成JSON格式传到要显示的界面中，客户端模式较为简单，它是把数据一次性加载出来放到界面上，然后根据你设置的每页记录数，自动生成分页。当点击第二页时，会自动加载出数据，不会再向服务器发送请求。同时用户可以使用其自带的搜索功能，可以实现全数据搜索。对于数据量较少的时候，可以使用这个方法。
	
	 服务器模式：指的是根据设定的每页记录数和当前要显示的页码，发送数据到服务器进行查询，然后再显示到表格中。该方法可以根据用户的需要动态的加载数据，节省了服务器的资源，但是不能使用其自带的全数据搜索功能。
	 */
	function danji() {
		_stu_add_btn();
	}
	/* function danji2() {
	//	document.getElementById('chufadidian').value=
		var dds=document.getElementById('test-table').rows[document.getElementById('test-table').rows.length-1].cells[4];

	//.cells[4].innerText;
	}	 */

	function danji1() {
		_stu_add_btn1();
	}
	function _bootstrap_table(_pageNum) {

		//---先销毁表格 ---      
		_table.bootstrapTable('destroy');

		//初始化bootstrap-table的内容
		_table.bootstrapTable({
			sidePagination : "server", //分页方式：client客户端分页，server服务端分页（*）
			method : 'get',
			url : "${APP_PATH}/student/getJsonPageInfoBootstraptable",//这个接口需要处理bootstrap table传递的固定参数
			striped : true, //是否显示行间隔色
			cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）	设置为 false 禁用 AJAX 数据缓存。
			sortable : true,
			//sortName:id,
			//【分页设置】
			pagination : true, //是否显示分页（*）
			paginationLoop : false,//设置为 true 启用分页条无限循环的功能
			sortOrder : "asc", //排序方式
			pageNumber : _pageNum, //初始化加载第一页，默认第一页
			pageSize : 10, //每页的记录行数（*）
			pageList : [ 5, 10, 15, 20, 50, 80, 100, 200 ], //可供选择的每页的行数 pageList: [5,10,15,20,50,100,200,'all']

			//【样式设置】
			/*  
					自定义行样式 参数为：
				row: 行数据
				index: 行下标
				返回值可以为class或者css
				颜色：共5种颜色['active', 'success', 'info', 'warning', 'danger']
			 */
			rowStyle : function(row, index) {
				var style = "";
				//设置每行颜色，颜色参考bootstrap3
				if (index % 2 == 0) {
					style = 'active';
				}

				//单独设置颜色
				if (row.name == "高晓松0") {
					style = 'success';
				}
				if (row.id == "2") {
					style = 'danger';
				}//结果：<tr class="danger" data-index="1" data-uniqueid="2"> 添加了个class=danger配合bootstrap使用

				return {
					classes : style
				}
			},
			paginationDetailHAlign : "left",//分页详情内容水平位置
			paginationHAlign : "right",//分页条水平位置
			toolbar : '#toolbar', //工具按钮用哪个容器
			buttonsAlign : "right", ///工具按钮位置
			showColumns : true,//显示下拉框(选择显示的列)
			//search: true,      //是否显示表格搜索，需要配合client模式才好用，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
			showColumns : true, //是否显示所有的列（选择显示的列）
			showRefresh : true, //是否显示刷新按钮
			minimumCountColumns : 2, //最少允许的列数,配合showColumns使用
			clickToSelect : true, //是否启用点击选中行（配合复选框使用）
			showToggle : true, //是否显示切换视图（table/card）按钮。
			paginationPreText : "上一页",
			paginationNextText : "下一页",
			showPaginationSwitch : true, //是否显示切换分页按钮。
			showFullscreen : true, //是否显示全屏按钮
			detailView : false, //是否显示加号，展开详细页面模式。
			checkboxHeader : true, //是否显示全选复选框
			silentSort : false, //设置为 false 将在点击分页按钮时，自动记住排序项。仅在 sidePagination设置为 server时生效。
			showFooter : true,//是否显示列脚。
			//icons: {refresh: "glyphicon-repeat", toggle: "glyphicon-list-alt", columns: "glyphicon-list"},//各种bootstrap-table按钮的图标
			editable : true,
			//【其它设置】
			//height:$(window).height()-100,		//表格总体高度
			locale : 'zh-CN', //中文支持
			undefinedText : "-",//当数据为 undefined 时显示的字符(没数据显示的列显示的内容)

			//【导出表格excel】
			//需要2个额外jar包：bootstrap-table-export.min.js和tableExport.js
			//其他问题：1：导出量太大中途结束：http://www.cnblogs.com/huanghuahui/p/9229511.html
			//测试时分页先选择'client',因为分页是客户端的话,导出数据会方便可以随意定义'basic', 'all', 'selected'.如果分页是服务端的话即使选择'all导出的也是当前页('basic'),如果想导出全部话,可以先将页面显示条目数为全部,再导出当前页即就是全部数据了.
			showExport : true, //是否显示导出
			exportDataType : "basic", //basic当前页', 'all所有页', 'selected选中内容'.
			//exportTypes:['csv', 'txt', 'sql', 'doc', 'excel', 'xlsx', 'pdf'],//规定导出文件类型,导出xmls格式：https://blog.csdn.net/javayoucome/article/details/80081771
			exportOptions : {
				ignoreColumn : [ 0, 5 ], //忽略某一列的索引
				fileName : '合同报表', //文件名称设置
				worksheetName : 'sheet1', //表格工作区名称
				tableName : '合同帐报表',
			//excelstyles: ['background-color', 'color', 'font-size', 'font-weight']//保持表格样式 ,必须使用tableExport.js，不能用tableExport.min.js（缺点：导出表格比较大）
			},

			//【设置列】
			//读取出返回的json数据，其中field对应读取出的json中的对应列
			columns : [
			//一级表头（可不加）
			[ {
				title : "出差补助明细表",
				halign : "center",
				align : "center",
				colspan : 20
			} ],
			//二级表头（可不加）
			[ {
				//field: 'name',
				title : "序号",
				valign : "middle",
				align : "center",
				colspan : 1,
				rowspan : 1
			}, {
				//field: 'name',
				title : "出发",
				valign : "middle",
				align : "center",
				colspan : 2,
				rowspan : 1
			}, {
				title : "到达",
				align : "center",
				colspan : 2,
				rowspan : 1
			}, {
				title : "交通补助",
				align : "center",
				colspan : 3,
				rowspan : 1
			}, {
				title : "伙食补助",
				align : "center",
				colspan : 3,
				rowspan : 1
			}, {
				title : "住宿标准补助",
				align : "center",
				colspan : 3,
				rowspan : 1
			}, {
				title : "备注",
				align : "center",
				colspan : 1,
				rowspan : 1
			}, ],
			//数据字段
			[
			// {checkbox: true, visible: true,valign:"center"}, //是否显示复选框  ，包括全选功能

			{
				field : 'id1',
				title : '序号',
				align : 'center',
			//	sortable : true
			}, {
				field : 'xiangmumc',
				title : '时间',
				align : 'center',
			//	sortable : true,

			},
			//底部合计，需开启 showFooter: true,

			{
				field : 'hetongbh',
				title : '地点',
				align : 'center',
			//	sortable : true,

			},

			{
				field : 'shoukdanw',
				title : '时间',
				align : 'center',
				sortable : true,

			//底部合计，需开启 showFooter: true,

			},

			{
				field : 'yongtu',
				title : '地点',
				align : 'center',
			//	sortable : true,

			}, {
				field : 'danw',
				title : '天数',
				align : 'center',
				//	sortable : true,
				footerFormatter : function(value) {
					var count = 0;
					for ( var i in value) {
						if (Number(value[i].danw) == "NaN")
							value[i].danw = 0;
						count += Number(value[i].danw);
					}
					return count;
				}

			}, {
				field : 'shuliang',
				title : '标准',
				align : 'center',
			//sortable : true,					

			}, {
				field : 'danjia',
				title : '金额',
				align : 'center',
				//sortable : true,
				footerFormatter : function(value) {
					var count = 0;
					for ( var i in value) {
						if (Number(value[i].danjia) == "NaN")
							value[i].danjia = 0;
						count += Number(value[i].danjia);
					}
					return count;
				}

			}, {
				field : 'hetongjiner',
				title : '天数',
				align : 'center',
				//sortable : true,
				footerFormatter : function(value) {
					var count = 0;
					for ( var i in value) {
						if (Number(value[i].hetongjiner) == "NaN")
							value[i].danw = 0;
						count += Number(value[i].hetongjiner);
					}
					return count;
				}

			}, {
				field : 'kaipjiner',
				title : '标准',
				align : 'center',
			//	sortable : true,

			}, {
				field : 'yifujiner',
				title : '金额',
				align : 'center',
				//	sortable : true,
				footerFormatter : function(value) {
					var count = 0;
					for ( var i in value) {
						if (Number(value[i].yifujiner) == "NaN")
							value[i].yifujiner = 0;
						count += Number(value[i].yifujiner);
					}
					return count;
				}

			}, {
				field : 'yuer',
				title : '天数',
				align : 'center',
				//	sortable : true,					
				footerFormatter : function(value) {
					var count = 0;
					for ( var i in value) {
						if (Number(value[i].yuer) == "NaN")
							value[i].yuer = 0;
						count += Number(value[i].yuer);
					}
					return count;
				}

			},

			{
				field : 'yifubili',
				title : '标准',
				align : 'center',
			//sortable : true,					

			}, {
				field : 'sjjhq',
				title : '金额',
				align : 'center',
				//sortable : true,
				footerFormatter : function(value) {
					var count = 0;
					for ( var i in value) {
						if (Number(value[i].sjjhq) == "NaN")
							value[i].sjjhq = 0;
						count += Number(value[i].sjjhq);
					}
					return count;
				}

			}, {
				field : 'fukuanbili',
				title : '备注',
				align : 'center',
			//	sortable : true,					

			},
			/*  {field: 'danw',title: '单位',align: 'center', sortable: true},
			 {field: 'shuliang',title: '数量',align: 'center', sortable: true},
			 {field: 'danjia',title: '单价',align: 'center', sortable: true},
			 {field: 'kaipjiner',title: '开票金额',align: 'center', sortable: true},
			 {field: 'sjjhq',title: '实际交货期',align: 'center', sortable: true},
			 */
			{
				field : 'operate',
				title : '操作',
				width : '80px',
				events : operateEvents1,
				formatter : operateFormatter
			} ] ],
			uniqueId : "id", //每一行的唯一标识，一般为主键列<tr data-uniqueid="2"></tr>
			idField : "id",//设置主键，为复选框赋值个value=id的值：<input data-index="1" name="btSelectItem" type="checkbox" value="2">

			//【设置请求参数queryParams，获取响应参数responseHandler 】
			queryParamsType : '', //默认值为 'limit' ,在默认情况下 传给服务端的参数为：offset,limit,sort
			// 设置为 ''  在这种情况下传给服务器的参数为：pageSize,pageNumber
			//queryParams:前端调用服务时，会默认传递上边提到的参数，如果需要添加自定义参数，可以自定义一个函数返回请求参数
			//（1）【查询设置】传递给控制器的参数
			queryParams : function(params) {
				//params 参数就是上面的表格参数（文档提到的表格参数）
				//这里的键的名字和控制器的变量名必须一致，这边改动，控制器也需要改成一样的
				var temp = {
					//分页
					pageNumber : params.pageNumber, //当前页码
					pageSize : params.pageSize, //每页显示数量
					//排序
					sort : params.sortName, //排序列名 name,age等要进行排序的列名
					sortOrder : params.sortOrder, //排位命令（desc，asc） 
					//查询
					searchName : GetQueryString("aa"),//搜索姓名
					searchBeginDate : jQuery.trim(jQuery("#form-search input[name=searchgys]").val()),//开始时间，原始：2018-09-21 12:53:23 至 2018-10-27 03:11:06，截取时间
					searchEndDate : jQuery("#form-search input[name=searchDate]").val().substring(22, 49)
				//结束时间

				};
				return temp;
			},
			//（2）获取控制器传回来的json数据（核心操作）
			//在ajax获取到数据，渲染表格之前，修改数据源.  目的：将获取的json格式替换成bootstrap-table需要的json格式
			responseHandler : function(res) {//加载服务器数据之前的处理程序，可以用来格式化数据。 	参数：res为从服务器请求到的数据。
				//在ajax获取到数据，渲染表格之前，修改数据源
				var nres = [];
				//	console.log("ooooooooooooooo"+JSON.stringify(res.resultMap.pageInfo.list[0].xiangmumc));
				/* 					for ( var i=1;i<res.resultMap.pageInfo.list.length;i++) 
				 {
				 if(res.resultMap.pageInfo.list[i].yongtu!=res.resultMap.pageInfo.list[i-1].hetongbh)
				 //console.log("bbbbbbb"+JSON.stringify(res.resultMap.pageInfo.list[i].xiangmumc));
				 //  res.resultMap.pageInfo.list[i].yuer="eeeeeeeeeee";
				 }; */

				nres.push({
					total : res.resultMap.pageInfo.total,
					rows : res.resultMap.pageInfo.list
				});//为bootstraptable的total和rows赋值，必须用这个格式
				return nres[0];
				//AjaxMsg返回的格式：{"code":200,"msg":"success","resultMap":{"pageInfo":{"total":982,"list":[{"id":1100,"name":"12321","age":321,"date":"2018-09-28 00:00:00"},{"id":1101,"name":"123212","age":222,"date":"2018-09-26 00:00:00"},{"id":1109,"name":"123422","age":12,"date":"2018-09-21 11:37:01"},{"id":1118,"name":"gggg3","age":123,"date":"2018-09-20 18:27:09"},{"id":1115,"name":"321213","age":3122,"date":"2018-09-20 11:51:00"},{"id":1114,"name":"321312","age":23,"date":"2018-09-20 11:50:28"},{"id":1113,"name":"dsfdads","age":1231,"date":"2018-09-20 11:50:03"},{"id":1112,"name":"4637433","age":2134,"date":"2018-09-20 11:49:46"},{"id":1111,"name":"12321312","age":123,"date":"2018-09-20 11:45:15"},{"id":1110,"name":"fffdd","age":12,"date":"2018-09-20 11:41:08"}],"pageNum":1,"pageSize":10,"size":10,"startRow":1,"endRow":10,"pages":99,"prePage":0,"nextPage":2,"isFirstPage":true,"isLastPage":false,"hasPreviousPage":false,"hasNextPage":true,"navigatePages":10,"navigatepageNums":[1,2,3,4,5,6,7,8,9,10],"navigateFirstPage":1,"navigateLastPage":10,"firstPage":1,"lastPage":10}}}
				//pagehelper分页插件返回的格式：        {total: 1067, list: [{id: 1, name: "高晓松0", age: 26, date: "2018-09-04 05:23:05"},…], pageNum: 1,…}
				//bootstrap-table需要返回的格式：：{total: 1067, rows:[{id: 1, name: "高晓松0", age: 26, date: "2018-09-04 05:23:05"}]}
			},

			//【事件】
			onLoadSuccess : function(data) { //表格数据加载成功事件
				var cNodes = document.getElementsByClassName("RoleOfdelete");

				for (var i = 0; i < cNodes.length - 1; i++) {

					cNodes[i].style.display = "none";
				}

				$("#chufadidian").val(""), $("#chufashijian").val(""), $("#daodashijian").val(""), $("#daodadidian").val("")

			},
			onPageChange : function(number, size) { //表格翻页事件

			},
			onLoadError : function() { //表格数据加载失败事件
				//	showTips("数据加载失败！");
			},
			onEditableSave : function(field, row, oldValue, $el) {
				$.ajax({
					type : "post",
					url : "update",
					data : row,
					dataType : 'JSON',
					success : function(data, status) {
						if (status == "success") {
							alert('提交数据成功');
						}
					},
					error : function() {
						alert('编辑失败');
					},
					complete : function() {

					}

				});
			}

		});

		//【补充设置：设置按钮等文字】
		jQuery("button[name=toggle]").append("切换样式");
	}

	function operateFormatter(value, row, index) {
		//	if(index==document.getElementById('test-table').rows.length){
		return [ '<button id="btn_detail1" type="button" class="RoleOfdelete btn btn-danger  btn-sm">删除</button>' ];
		//	}

	}

	function GetQueryString(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
		var r = window.location.search.substr(1).match(reg);
		if (r != null)
			return unescape(decodeURI(r[2]));
		return null;
	}

	function _update_btn() {

		//1、获取修改信息(免查数据库操作了)，使用的是bootstrap-table的getSelections方法。 http://bootstrap-table.wenzhixin.net.cn/zh-cn/documentation/
		/*
			getSelections返回json样式：
			0:{0: true, id: 2, name: "高晓松1", age: 26, date: "2018-09-04 05:23:05"}
			length:1
		 */
		_row = _table.bootstrapTable('getSelections');//获取选中行的信息（包括每列）
		console.log(_row);

		//1.1 、判断违规操作
		if (_row.length != 1) {
			alert("请选择一行数据...");
			return;//终止向后进行
		}

		//1.2、修改回显
		jQuery("#myUpdateModal form #updateId").text(_row[0].id);
		jQuery("#myUpdateModal form input[name=id]").val(_row[0].id);
		jQuery("#myUpdateModal form input[name=name]").val(_row[0].name);
		jQuery("#myUpdateModal form input[name=age]").val(_row[0].age);
		jQuery("#myUpdateModal form input[name=date]").val(_row[0].date);

		//2、显示模态框：https://v3.bootcss.com/javascript/#modals
		jQuery('#myUpdateModal').modal({
			//在这里可以为模态框添加一些属性与事件：https://v3.bootcss.com/javascript/#modals，事件：http://www.runoob.com/bootstrap/bootstrap-modal-plugin.html
			//show:false 当初始化时显示模态框。
			//keyboard:true 当按下 escape 键时关闭模态框，设置为 false 时则按键无效。
			backdrop : "static" //指定一个静态的背景，当用户点击模态框外部时不会关闭模态框。
		//remote 用 jQuery .load 方法，为模态框的主体注入内容。如果添加了一个带有有效 URL 的 href，则会加载其中的内容。如下面的实例所示：<a data-toggle="modal" href="remote.html" data-target="#modal">请点击我</a>
		});

	}

	/*
	 * 修改学生
	 */
	function _update_stu_form() {

		if (!isNumber(jQuery("#stu_update_form input[name=shuliang]").val())) {
			alert("数量必须为数字");
			return

			

		}
		if (!isNumber(jQuery("#stu_update_form input[name=danjia]").val())) {
			alert("单价必须为数字");
			return

			

		}
		if (!isNumber(jQuery("#stu_update_form input[name=yifujiner]").val())) {
			alert("已付金额必须为数字");
			return

			

		}
		if (!isNumber(jQuery("#stu_update_form input[name=kaipjiner]").val())) {
			alert("开票金额必须为数字");
			return

			

		}
		jQuery.ajax({
			//async: false,//将ajax异步传输改成同步传输。默认是true：异步（或不写这句），false：同步。将ajax异步传输改成同步传输的话，则必须执行完ajax程序后才会执行后面的，不加则是异步传输同步进行。
			//cache : false,//禁用缓存（POST请求默认禁用缓存，只是GET方式默认启用缓存）。默认情况下，请求总会被发出去，但浏览器有可能从他的缓存中调取数据。要禁止使用缓存的结果，可以设置cache参数为false。会在请求后就一个随机数来避免缓存效果

			type : 'POST',//可改用PUT，见https://study.163.com/course/courseLearn.htm?courseId=1003862031#/learn/video?lessonId=1004622400&courseId=1003862031
			url : "${APP_PATH}/student/update",
			data : decodeURIComponent(jQuery('form#stu_update_form').serialize(), true),//序列化，获取form表单中所有name和value值
			/*
				serialize序列化获取form表单所有内容，上面一句话代替了下面的内容，效果一样都获取到了input的value给后台，decodeURIComponent解码，不然中文乱码 
				测试参数：id:1,name:"dd",age:22,date:"2018:09:05 00:38:21"
				
				data:{
					id:$("#sjQueryu_update_form input[name=id]").val(),
					name:$("#stu_update_form input[name=name]").val(),
					age:$("#stu_update_form input[name=age]").val(),
					date:$("#stu_update_form input[name=date]").val()
				},
			 */
			dataType : 'json',//返回类型，有html，json，xml，text，如果返回的内容不符，则执行error的内容

			//请求前的处理
			beforeSend : function() {
				//加载中提醒
				_loadTip("loading", "修改中...", "black");
			},
			//请求成功处理
			success : function(_response, _status, _xhr) {
				console.log(_response)//查看所有返回结果JSON格式:

				if (_response.msg == "success") {
					//1、执行成功提醒
					_loadTip("oking", "修改完成", "black");//to_page中的提示框会覆盖这里，所以跳转to_page要延迟会执行	

					//2、模态框隐藏
					jQuery('#myUpdateModal').modal("hide");//$('#myModal').modal('show')

					//3、跳转到当前页
					// setTimeout(function(){//两秒后跳转
					//获取当前页码	 
					//	 var pageNum=_table.bootstrapTable('getOptions').pageNumber;//用bootstrap-table的getOptions方法
					//	 _bootstrap_table(pageNum);
					// },1500);
					_table.bootstrapTable('refresh');//使用bootstrap_table自带刷新功能，还能保持在当前页

				} else {
					alert("修改学生失败")
				}

			},
			//请求失败处理
			error : function(XMLHttpRequest, textStatus, errorThrown) {//返回类型错误，或传入类型错误
				console.log(decodeURIComponent(jQuery('form#stu_update_form').serialize(), true));//排错
				alert("操作错误");
			},
		});
	};

	/*
	 * 新增学生按钮事件，显示模态框
	 */

	function _stu_add_btn() {

		//1、清空模态框表单内容
		/* 	$('form#stu_insert_form')[0].reset();//重置清空form表单中input的value内容，reset是js的，jquery没有，所以用【0】获取dom对象。
		 //2、清空校验样式，错误提示文字
		 $('form#stu_insert_form input').removeClass('border border-success  border-danger');
		 $('form#stu_insert_form span').text('');
		 */
		//3、显示模态框：https://v3.bootcss.com/javascript/#modals
		document.getElementById('addr-show').value = '';
		document.getElementById('prov').value = '';
		document.getElementById('city').value = '';
		document.getElementById('country').value = '';
		jQuery('#myInsertModal').modal({
			//在这里可以为模态框添加一些属性与事件：https://v3.bootcss.com/javascript/#modals，事件：http://www.runoob.com/bootstrap/bootstrap-modal-plugin.html
			//show:false 当初始化时显示模态框。
			//keyboard:true 当按下 escape 键时关闭模态框，设置为 false 时则按键无效。
			backdrop : "static" //指定一个静态的背景，当用户点击模态框外部时不会关闭模态框。
		//remote 用 jQuery .load 方法，为模态框的主体注入内容。如果添加了一个带有有效 URL 的 href，则会加载其中的内容。如下面的实例所示：<a data-toggle="modal" href="remote.html" data-target="#modal">请点击我</a>

		});
	}
	/*
	 * 新增提交事件
	 */

	/*
	 * 新增学生按钮事件，显示模态框
	 */
	function _stu_add_btn1() {

		//1、清空模态框表单内容
		/* 	$('form#stu_insert_form')[0].reset();//重置清空form表单中input的value内容，reset是js的，jquery没有，所以用【0】获取dom对象。
		 //2、清空校验样式，错误提示文字
		 $('form#stu_insert_form input').removeClass('border border-success  border-danger');
		 $('form#stu_insert_form span').text('');
		 */
		//3、显示模态框：https://v3.bootcss.com/javascript/#modals
		document.getElementById('addr-show').value = '';
		document.getElementById('prov').value = '';
		document.getElementById('city').value = '';
		document.getElementById('country').value = '';
		jQuery('#myInsertModal1').modal({
			//在这里可以为模态框添加一些属性与事件：https://v3.bootcss.com/javascript/#modals，事件：http://www.runoob.com/bootstrap/bootstrap-modal-plugin.html
			//show:false 当初始化时显示模态框。
			//keyboard:true 当按下 escape 键时关闭模态框，设置为 false 时则按键无效。
			backdrop : "static" //指定一个静态的背景，当用户点击模态框外部时不会关闭模态框。
		//remote 用 jQuery .load 方法，为模态框的主体注入内容。如果添加了一个带有有效 URL 的 href，则会加载其中的内容。如下面的实例所示：<a data-toggle="modal" href="remote.html" data-target="#modal">请点击我</a>

		});
	}
	function dayin() {

/* 	
		jQuery('#dayinModal').modal({
			
			backdrop : "static" //指定一个静态的背景，当用户点击模态框外部时不会关闭模态框。
		
		}); */
	}
	function dayin1() {
		if (document.getElementById("dayinchufashijian").value == '') {
			alert("起始时间不能为空");
			return true;
		}
		;
		if (document.getElementById("dayinjieshushijian").value == '') {
			alert("结束时间不能为空");
			return true;
		}
		;
		window.open("http://localhost:8080/demo/reportJsp/tree.jsp?aa=" + GetQueryString("aa") + "&bb=" + document.getElementById("dayinchufashijian").value + "&cc="
				+ document.getElementById("dayinjieshushijian").value);
	}
	/*
	 * 新增提交事件
	 */
	function isNumber(val) {

		var regPos = /^\d+(\.\d+)?$/; //非负浮点数
		var regNeg = /^(-(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*)))$/; //负浮点数
		if (regPos.test(val) || regNeg.test(val)) {
			return true;
		} else {
			return false;
		}

	}
	function _stu_add_form() {

		if ($("#chufashijian").val() == '') {
			alert("出发时间不能为空");
			return 

			

									

			

		}
		if ($("#daodashijian").val() == '') {
			alert("到达时间不能为空");
			return 

			

									

			

		}
		if ($("#daodadidian").val() == '') {
			alert("到达地点不能为空");
			return 

			

									

			

		}

		if (document.getElementById('test-table').rows[document.getElementById('test-table').rows.length - 1].innerText != "No matching records found") {
			if ($("#chufashijian").val() < document.getElementById('test-table').rows[document.getElementById('test-table').rows.length - 1].cells[3].innerText) {
				alert("出发时间不能晚于上次的到达时间");
				return false
			}

		}
		if ($("#daodashijian").val() < $("#chufashijian").val()) {
			alert("到达时间不能晚于出发时间");
			return 

			

									

			

		}
		var tem = false;
		//return false;
		if (document.getElementById('test-table').rows[document.getElementById('test-table').rows.length - 1].cells[4] == undefined) {
			document.getElementById('chufadidian').value = "河南省-平顶山市-平顶山";
		}
		//return}
		if (document.getElementById('test-table').rows[document.getElementById('test-table').rows.length - 1].cells[4] != undefined) {
			document.getElementById('chufadidian').value = document.getElementById('test-table').rows[document.getElementById('test-table').rows.length - 1].cells[4].innerText;
		}
		$("#zsbzbz").val(200);
		var chufadidian = $("#chufadidian").val().substring($("#chufadidian").val().lastIndexOf("-") + 1, $("#chufadidian").val().length);

		if ([ "北京市", "上海市", "广州市", "深圳市" ].indexOf(chufadidian) != -1) {
			$("#zsbzbz").val(300);
		}
		;
		if ([ "哈尔滨市", '郑州市', "乌鲁木齐市", "西宁市", "兰州市", "石家庄市", "太原市", "西安市", "济南市", "沈阳市", "长春市", "南京市", "杭州市", "合肥市", "南昌市", "福州市", "武汉市", "长沙市", "成都市", "贵阳市", "昆明市", "海口市",
				"呼和浩特市", "南宁市", "银川市", "大连市", "青岛市", "宁波市", "厦门市" ].indexOf(chufadidian) != -1) {
			$("#zsbzbz").val(260);

		}
		;

		$('#hsbzje').val($('#hsbzts').val() * $('#hsbzbz').val());

		$('#zsbzje').val($('#zhusuts').val() * $('#zsbzbz').val());

		$('#jtbzje').val($('#jtbzts').val() * $('#jtbzbz').val());

		jQuery.ajax({
			async : true,//将ajax异步传输改成同步传输。默认是true：异步（或不写这句），false：同步。将ajax异步传输改成同步传输的话，则必须执行完ajax程序后才会执行后面的，不加则是异步传输同步进行。
			//cache : false,//禁用缓存（POST请求默认禁用缓存，只是GET方式默认启用缓存）。默认情况下，请求总会被发出去，但浏览器有可能从他的缓存中调取数据。要禁止使用缓存的结果，可以设置cache参数为false。会在请求后就一个随机数来避免缓存效果

			type : 'POST',
			url : "${APP_PATH}/student/insert",
			data : {
				danw : $("#jtbzts").val(),
				shuliang : $("#jtbzbz").val(),
				danjia : $("#jtbzje").val(),
				hetongbh : $("#chufadidian").val(),
				kaipjiner : $("#hsbzbz").val(),
				hetongjiner : $("#hsbzts").val(),
				yifujiner : $("#hsbzje").val(),
				yuer : $("#zhusuts").val(),
				yifubili : $("#zsbzbz").val(),
				sjjhq : $("#zsbzje").val(),
				xiangmumc : $("#chufashijian").val(),
				shoukdanw : $("#daodashijian").val(),
				yongtu : $("#daodadidian").val(),
				fukuanbili : $("#chep").val(),
				name : $("#chuchairenyuan").val(),
			}

			,
			/* decodeURIComponent(jQuery('form#stu_insert_form')
				.serialize(), true), */
			/*  serialize序列化获取form表单所有内容，上面一句话代替了下面的内容，效果一样都获取到了input的value给后台.decodeURIComponent解码，不然中文乱码
				data:{
					name:$("#stu_form input[name=name]").val(),
					age:$("#stu_form input[name=age]").val(),
					date:$("#stu_form input[name=date]").val()
				},
			 */
			dataType : 'json',//返回类型，有html，json，xml，text，如果返回的内容不符，则执行error的内容

			//请求前的处理
			beforeSend : function() {

				//加载中提醒
				_loadTip("loading", "添加中...", "red");
			},
			//请求成功处理
			success : function(_response, _status, _xhr) {
				//console.log(_response)//查看所有返回结果JSON格式
				if (_response.msg == "success") {//自定义success或code=200表示返回成功
					//1、执行成功提醒
					_loadTip("oking", "添加成功", "black");

					//2、模态框隐藏
					jQuery('#myInsertModal').modal("hide");//$('#myModal').modal('show')

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
					_bootstrap_table(99999999);

				} else {
					//后端验证：新增出错

					//网页检查元素--》NetWork--》insert内容--》Response可以看到返回的json内容
					console.log(_response.resultMap.errors);
					_loadTip("none", "", "");

					//检查到新增的问题
					if (undefined != _response.resultMap.errors.name) {
						alert(_response.resultMap.errors.name);
						return;
					}
					if (undefined != _response.resultMap.errors.age) {
						alert(_response.resultMap.errors.age);
						return;
					}
					if (undefined != _response.resultMap.errors.date) {
						alert(_response.resultMap.errors.date);
						return;
					}
					if (undefined != _response.resultMap.errors.nameUniqueErr) {
						alert(_response.resultMap.errors.nameUniqueErr);
						return;
					}

					alert("新增学生失败");
					//window.location.href=""
					//window.location.href=""
				}
			},
			//请求失败处理
			error : function(XMLHttpRequest, textStatus, errorThrown) {//返回类型错误，或传入类型错误
				alert("插入失败,类型错误");
			},
			//请求结束处理
			complete : function(msg) {
			},
		});

	}

	/*
	 * -批量删除
	 */
	function _stu_delete_banch(c) {

		console.log("CCCCCCCCCCCCCCC" + c),
		//执行批量删除
		jQuery.ajax({
			async : false,//将ajax异步传输改成同步传输。默认是true：异步（或不写这句），false：同步。将ajax异步传输改成同步传输的话，则必须执行完ajax程序后才会执行后面的，不加则是异步传输同步进行。
			//cache : false,//禁用缓存（POST请求默认禁用缓存，只是GET方式默认启用缓存）。默认情况下，请求总会被发出去，但浏览器有可能从他的缓存中调取数据。要禁止使用缓存的结果，可以设置cache参数为false。会在请求后就一个随机数来避免缓存效果

			type : 'GET',// 
			url : "${APP_PATH}/student/delete",
			data : {
				id : c
			},

			dataType : 'json',//返回类型，有html，json，xml，text，如果返回的内容不符，则执行error的内容

			//请求前的处理
			beforeSend : function() {
				//加载中提醒
				_loadTip("loading", "批量删除中...", "black");
			},
			//请求成功处理
			success : function(_response, _status, _xhr) {
				console.log(_response)//查看所有返回结果JSON格式:

				if (_response.msg == "success") {
					//1、执行成功提醒
					_loadTip("oking", "删除成功", "black"); //to_page中的提示框会覆盖这里，所以跳转to_page要延迟会执行		

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

				} else {
					alert("删除学生失败")
				}

			},
			//请求失败处理
			error : function(XMLHttpRequest, textStatus, errorThrown) {//返回类型错误，或传入类型错误
				console.log();//排错
				alert("操作错误");
			},
		});

	}

	function danji2() {
		//document.getElementById('chufadidian').value=document.getElementById('test-table').rows[document.getElementById('test-table').rows.length-1].cells[4];

		if (document.getElementById('test-table').rows[document.getElementById('test-table').rows.length - 1].cells[4] == undefined) {
			document.getElementById('chufadidian').value = "河南省-平顶山市-平顶山市";
			return;
		}
		document.getElementById('chufadidian').value = document.getElementById('test-table').rows[document.getElementById('test-table').rows.length - 1].cells[4].innerText;
		var chufadidian = $("#chufadidian").val().substring($("#chufadidian").val().lastIndexOf("-") + 1, $("#chufadidian").val().length);
		if ([ "北京", "上海", "广州", "深圳" ].indexOf(chufadidian) != -1) {
			$("#zsbzbz").val(300);
			return;
		}
		;
		if ([ "哈尔滨", '郑州', "乌鲁木齐", "西宁", "兰州", "石家庄", "太原", "西安", "济南", "沈阳", "长春", "南京", "杭州", "合肥", "南昌", "福州", "武汉", "长沙", "成都", "贵阳", "昆明", "海口", "呼和浩特", "南宁", "银川", "大连",
				"青岛", "宁波", "厦门" ].indexOf(chufadidian) != -1) {
			$("#zsbzbz").val(260);
			return;
		}
		;
		$("#zsbzbz").val(200);

	}
	function GetQueryString(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
		var r = window.location.search.substr(1).match(reg);
		if (r != null)
			return unescape(decodeURI(r[2]));
		return null;
	}
	window.onload = function() {
		document.getElementById('chuchairenyuan').readOnly = true;
		document.getElementById('chuchairenyuan').value = GetQueryString("aa");

	}
</script>
</html>