<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>sss11111111
<!DOCTYPE html>
<html>
<head>
 
<%--引入header配置 --%>
<%@ include file="/commons/header_bootstrap4.jsp"%>
 
<link href="${APP_PATH }/static/css/studentList.css" rel="stylesheet">
<!--js工具类  -->
<script type="text/javascript" src="${APP_PATH }/static/js/jsUtil.js"></script>
<!--jeDate日期选择jquery插件
	1、使用：共4步,第一步：加载jedate.js核心文件，第二步：加载jedate.css样式，第三步，jquery中加载jeDate，第四步：html中使用jeDate  
	2：注意：一个input日期，就需要在function中添加一个js加载设置
-->
<script type="text/javascript" src="${APP_PATH }/static/js/JQuery_plugs/jeDate/src/jedate.js"></script><!-- jeDate:1/4 -->
<link href="${APP_PATH }/static/js/JQuery_plugs/jeDate/skin/jedate.css" rel="stylesheet"><!-- jeDate:2/4 -->

<script type="text/javascript"   >

//全局参数
var _currentPage;//当前页，在执行to_page（）方式时改变赋值

//页面加载完成后仅执行一次（若重复执行，可能是超链接没写href内容造成的提交事件重进本页）
$(function(){ 
	
	//jeDate日期选择jquery插件,jeDate:3/4
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
    //jeDate日期选择jquery插件（完） 
    
    
	 /*
	 	0、前端整体样式使用bootstrap框架
	 	
		1、若修改jquery内容后浏览器没变化，按ctrl+f5，或手动去清理缓存：审查元素-》Network=》刷新页面=》找到对应js内容清理缓存	，或在jsp页面多写点东西让其有变化后会自动更新。
		
		2、通过“审查元素”才能看到JQuery添加的html代码，查看源代码无法看到
		
		3、刷新页面 location.reload();
	 
	 	4、查找错误可以使用alert或者console.log(pageNumber);//网页--》审查元素--》Console--》刷新页面看到输出的内容
	 	
	 	5、js输出html时候，可以用单引号和双引号配合使用，也可以使用转移符全使用双引号：var html="<a href=\"www.baiud.com\">ddd</a>";
	 	
	 	6、新增按钮使用bootstrap模态框：http://www.runoob.com/bootstrap/bootstrap-modal-plugin.html，https://v3.bootcss.com/javascript/#modals
	 	
	 	7、return false来终止js程序进行。
	 	
	 	8、$.trim($("input[name=password]"))去除空格。
	 	
	 	9、js判断空有三个方法：$("input[name=password]").val()
	 	
	 */
	 
	
	 
	//核心：显示分页所有信息（列表+分页），传入页码
	 to_page(1);

		

	//点击1,2,3页码事件（事件委托），如果是新加入的 DOM 节点，是无法使用 click 等普通事件的，必须使用委托动态绑定
	/*
		传统事件写法无效
		 $(".pageNavNumber").click(function(){
			 alert($(this).html());
		 })
	*/
	$('#pageNav').on('click','.pageNavNumber',function(){
		to_page($(this).html());//alert($(this).html());//这里的this指的是class=pageNavNumber的<a>,而不是#pageNav
	})
	
	//点击上一页事件（事件委托）
	$('#pageNav').on('click','.preNumber',function(){
		to_page(parseInt($(this).attr('pagenownumber'))-1); //用自建的属性pagenownumber来传递和计算上一页页码数
	})
	
	//点击下一页事件（事件委托）
	$('#pageNav').on('click','.nextNumber',function(){
		to_page(parseInt($(this).attr('pagenownumber'))+1); //用自建的属性pagenownumber来传递和计算下一页页码数
	})
	
	//点击首页事件（事件委托）
	$('#pageNav').on('click','.firstNumber',function(){
		to_page(1); 
	})
	
	//点击最后一页事件（事件委托）
	$('#pageNav').on('click','.lastNumber',function(){
		to_page($(this).attr('pagenownumber')); //用自建的属性pagenownumber来传递和计算下一页页码数
	})
	
	
	
	//"新增"按钮事件()
	$("#addBtn").click(function(){
		//console.log(2);
		//显示模态框：https://v3.bootcss.com/javascript/#modals
		$('#myInsertModal').modal({
			 //在这里可以为模态框添加一些属性与事件：https://v3.bootcss.com/javascript/#modals，事件：http://www.runoob.com/bootstrap/bootstrap-modal-plugin.html
			//show:false 当初始化时显示模态框。
			//keyboard:true 当按下 escape 键时关闭模态框，设置为 false 时则按键无效。
			backdrop:"static" //指定一个静态的背景，当用户点击模态框外部时不会关闭模态框。
			//remote 用 jQuery .load 方法，为模态框的主体注入内容。如果添加了一个带有有效 URL 的 href，则会加载其中的内容。如下面的实例所示：<a data-toggle="modal" href="remote.html" data-target="#modal">请点击我</a>
		});
	});
	
	
	//前端验证：检查用户名是否重复：用户名文本框改变触发事件(写完内容，必须有变化后，鼠标离开点击其他地方执行)
	$("#stu_form input[name=name]").change(function(){					
		if(check_name_unique()==1){
			//重名，则给提交按钮添加个属性，让其判断后不要提交新增
			$("#stu_insert_btn").attr("nameUnique","false");//破解前端校验方法：浏览器--》审查元素--》找到这个提交按钮的属性，直接修改就破解了。
		}else{
			$("#stu_insert_btn").attr("nameUnique","success");
		}
	});
	
	
	//"确定新增"按钮事件（模态框中）
	$("#stu_insert_btn").click(function(){
		
		//前端验证：检查用户名是否重复，配合上面change方法使用
	 	if($(this).attr("nameUnique")=="false"){
	 		return false;
	 	}
	
		//前端验证：表单内容验证
		if(!form_validate()){
		 	return false;//终止程序进行下去
		}
		
		//可以把下面ajax单独放到一个function去，懒得做了。
		
		//serialize序列化，获取表单中所有name对应的value值:name=钉钉&age=112&date=2018-09-06T11:22
		console.log(decodeURIComponent($("form#stu_form").serialize(),true));
 
		$.ajax({
			async: false,//将ajax异步传输改成同步传输。默认是true：异步（或不写这句），false：同步。将ajax异步传输改成同步传输的话，则必须执行完ajax程序后才会执行后面的，不加则是异步传输同步进行。
			//cache : false,//禁用缓存（POST请求默认禁用缓存，只是GET方式默认启用缓存）。默认情况下，请求总会被发出去，但浏览器有可能从他的缓存中调取数据。要禁止使用缓存的结果，可以设置cache参数为false。会在请求后就一个随机数来避免缓存效果
			
			type:'POST',
			url:"${APP_PATH}/student/insert", 
			data:decodeURIComponent($('form#stu_form').serialize(),true),
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
					to_page(_response.resultMap.id);
				 
				}else{
					//后端验证：新增出错
					
						//网页检查元素--》NetWork--》insert内容--》Response可以看到返回的json内容
						console.log(_response.resultMap.errors);
					
						//检查到新增的问题
						if(undefined!=_response.resultMap.errors.name){
							alert(_response.resultMap.errors.name);
						}
						if(undefined!=_response.resultMap.errors.age){
							alert(_response.resultMap.errors.age);
						}
						if(undefined!=_response.resultMap.errors.date){
							alert(_response.resultMap.errors.date);
						}
						if(undefined!=_response.resultMap.errors.nameUniqueErr){
							alert(_response.resultMap.errors.nameUniqueErr);
						} 
						
						alert("新增学生失败");
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
	});
	
	//模态框”插入“隐藏时执行事件。show.bs.modal显示时执行，hide.bs.modal隐藏时执行
	$('#myInsertModal').on('hide.bs.modal', function () {
		//清空表单内容
		$('form#stu_form')[0].reset();//重置清空form表单中input的value内容，reset是js的，jquery没有，所以用【0】获取dom对象。
		//清空校验样式，错误提示文字
		$('form#stu_form input').removeClass('border border-success  border-danger');
		$('form#stu_form span').text('');
		
	});
 

	
	//"修改"按钮事件(用于显示修改界面)（事件委托）
	$('#showTable').on('click','.updateBtn',function(){
		//console.log(2);
		//1、查询员工信息
		var id=$(this).attr("studentid");
		var _response=get_student_by_primaryKey(id);
		$("#stu_update_form p#primaryKey").text(_response.resultMap.studentOne.id);
		$("#stu_update_form input[name=id]").val(_response.resultMap.studentOne.id);
		$("#stu_update_form input[name=name]").val(_response.resultMap.studentOne.name);
		$("#stu_update_form input[name=age]").val(_response.resultMap.studentOne.age);
		$("#stu_update_form input[name=date]").val(_response.resultMap.studentOne.date);
	
		
		//2、显示模态框：https://v3.bootcss.com/javascript/#modals
		$('#myUpdateModal').modal({
			 //在这里可以为模态框添加一些属性与事件：https://v3.bootcss.com/javascript/#modals，事件：http://www.runoob.com/bootstrap/bootstrap-modal-plugin.html
			//show:false 当初始化时显示模态框。
			//keyboard:true 当按下 escape 键时关闭模态框，设置为 false 时则按键无效。
			backdrop:"static" //指定一个静态的背景，当用户点击模态框外部时不会关闭模态框。
			//remote 用 jQuery .load 方法，为模态框的主体注入内容。如果添加了一个带有有效 URL 的 href，则会加载其中的内容。如下面的实例所示：<a data-toggle="modal" href="remote.html" data-target="#modal">请点击我</a>
		});
	});
	
	/*
		确定修改事件
	*/
	$("#stu_update_btn").click(function(){
		student_update(_currentPage);//传入当前页（全局变量）
	});
	
	
	//删除按钮事件（事件委托）
	$('#showTable').on('click','.deleteBtn',function(){
 
		var _name = $(this).parent().parent().find("td:eq(2)").text();//找到name值
		var _id=$(this).attr("studentId");//主键
		if(confirm("确认删除【"+_name+"】吗")){
			_student_delete(_id,_currentPage);//传入主键和当前页
		}

	});
	
	
	//全选按钮事件（1/3）
	$("#checkbox_all").click(function(){
 		//attr获取checked属性会报undefined错误，需要用js原生的prop来获取属性
 		//使用prop获取原生dom属性值，使用attr获取自定义的属性值
		//alert($(this).prop("checked"));//选中则返回true，取消则显示false
		$("#showTable tbody tr td input[type=checkbox]").prop("checked",$(this).prop("checked"));//让每行的复选框状态与全选复选框一致
	});
	//每行复选框事件（事件委托）（全选择后成为全选状态）（2/3）
	$("#showTable").on("click","tbody tr td input[type=checkbox]",function(){
		 var flag=$("#showTable tbody tr td input[type=checkbox]:checked").length==$("#showTable tbody tr td input[type=checkbox]").length;
		 $("#checkbox_all").prop("checked",flag);//flag为true，则全选按钮被选择上，否则不选择上
	});
	//点击每行都可以等同点击了每行的复选框
	$("#showTable").on("click","tbody tr",function(){
		if($(this).find("input[type=checkbox]").prop("checked")==false){
			$(this).find("input[type=checkbox]").prop("checked",true);
		}else{
			$(this).find("input[type=checkbox]").prop("checked",false);
		}
	});
	
	
	
	//全部（批量）删除按钮事件
	$("#stu_delete_all").click(function(){
		var _delete_id_row="";//要删除的id字符串
		var _delete_name_row="";//要删除的名字
		
 		$.each($("#showTable tbody tr td input[type=checkbox]:checked"),function(){
 			_delete_id_row+=$(this).attr("studentId")+",";//删除的id字符串1,2,3,4，5,
 			_delete_name_row+=$(this).parent().parent().find("td:eq(2)").text()+",";//高晓松0,高晓松1,高晓松2,高晓松3,高晓松5,
 		});
 
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
 			_stu_delete_banch(_delete_id_row,_currentPage);//执行批量删除
 		}
	});
	
	

})
 
 
//核心：显示分页所有信息（列表+分页），传入页码
function to_page(pageNumber){
	
	//全选复选框取消选中
	$("#checkbox_all").prop("checked",false);
	
	//显示分页信息
	$.ajax({
		async: false,//将ajax异步传输改成同步传输。默认是true：异步（或不写这句），false：同步。将ajax异步传输改成同步传输的话，则必须执行完ajax程序后才会执行后面的，不加则是异步传输同步进行。
		cache : false,//禁用缓存（POST请求默认禁用缓存，只是GET方式默认启用缓存）。默认情况下，请求总会被发出去，但浏览器有可能从他的缓存中调取数据。要禁止使用缓存的结果，可以设置cache参数为false。会在请求后就一个随机数来避免缓存效果
		
		type:'GET',
		url:"${APP_PATH}/student/getJsonPageInfo", 
		data:{
			pn:pageNumber
		},
		dataType:'json',//返回类型，有html，json，xml，text，如果返回的内容不符，则执行error的内容
		
		 //请求前的处理
		beforeSend: function() {	
			//加载中提醒
			_loadTip("loading","加载中...","red");

	    },
	    //请求成功处理
		success:function(_response,_status,_xhr){
			//console.log(_response)//查看所有返回结果JSON格式
			if(_response.code==200){//自定义200表示返回成功
				
				//加载完成，隐藏转圈加载
				_loadTip("none","","black");
				
				//alert("第三个执行，因为调用数据用了些时间，如果加上async，则第二个执行");
				//alert(_response.resultMap.pageInfoJson.list[0].name);
				/*_response返回的json内容
					{
						"code": 200,
						"msg": "success",
						"resultMap": {
							"pageInfoJson": {
								"total": 5000,
								"list": [{
									"id": 1,
									"name": "习近平",
									"age": 99,
									"date": 1535689417000
								}, {
									"id": 3,
									"name": "高晓松2",
									"age": 26,
									"date": 1535689417000
								}, {
									"id": 4,
									"name": "高晓松3",
									"age": 26,
									"date": 1535689417000
								}, {
									"id": 5,
									"name": "高晓松4",
									"age": 26,
									"date": 1535689417000
								}, {
									"id": 6,
									"name": "高晓松5",
									"age": 26,
									"date": 1535689417000
								}],
								"pageNum": 1,
								"pageSize": 5,
								"size": 5,
								"startRow": 1,
								"endRow": 5,
								"pages": 1000,
								"prePage": 0,
								"nextPage": 2,
								"isFirstPage": true,
								"isLastPage": false,
								"hasPreviousPage": false,
								"hasNextPage": true,
								"navigatePages": 6,
								"navigatepageNums": [1, 2, 3, 4, 5, 6],
								"navigateFirstPage": 1,
								"navigateLastPage": 6,
								"firstPage": 1,
								"lastPage": 6
							}
						}
					}
				*/
				//网页查看页码是否传入成功，等同alert测试功能
				console.log(pageNumber);//网页--》审查元素--》Console--》刷新页面看到输出的内容
				//alert(pageNumber);
				
				//输出student列表
				build_student_tabel(_response);
				
				//输出分页信息
				build_page(_response);//输出分页信息
				
				//为全局当前页变量赋值
				_currentPage=_response.resultMap.pageInfoJson.pageNum;

				
			}
		},
		 //请求失败处理
		error:function(XMLHttpRequest, textStatus, errorThrown){//返回类型错误，或传入类型错误
			//弹出自制好看的提示框
		
			//var _html='<p style="color:red;font-size:20px">暂无数据</p>';
			//$('#div9').append(_html);
		},
		
		 //请求结束处理
	    complete: function(msg){
	       //alert('最后执行收尾，，如果加上async，则第三个执行');
	    },
	});
	//alert("第二个执行，因为ajax默认async:true执行异步传输，在执行ajax内部程序的时候，同时进行后面的js内容。如果加上async，则最后执行");

}

//输出student列表
/*
  <c:forEach items="${pageInfo.list}" var="item" varStatus="vs">
	<tr><!-- 偶数行粉色，奇数行黄色 -->
		<td>${item.id}</td>
		<td>${item.name}</td>
		<td>${item.getAge()}</td>
		<td><fmt:formatDate value="${item.date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		 <td>
                   <a href="" class="btn btn-primary btn-sm" ><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 修改</a>
                   <a href="" class="btn btn-danger btn-sm" ><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> 删除</a>
               </td>
	</tr>
</c:forEach> 
*/
function build_student_tabel(_response){
	 //清空
	 $("tbody").html("");
	 //alert(_response.resultMap.pageInfoJson.list[0].name);
	 
	 var studentList = _response.resultMap.pageInfoJson.list;//获取学生列表
	 var html='';
	 //循环输出列表，可以单双引号配合，也可以用转移符使用。还可以采用append的方法添加：https://study.163.com/course/courseLearn.htm?courseId=1003862031#/learn/video?lessonId=1004624260&courseId=1003862031
	 $.each(studentList,function(index,item){
		 html+="<tr>";
		 	 html+="<td><input type=\"checkbox\" studentId="+item.id+" style='width:15px;height:15px;position:relative;top:8px;left:8px' class=\"checkboxOne\"/></td>";
			 html+="<td>"+item.id+"</td>";
			 html+="<td>"+item.name+"</td>";
			 html+="<td>"+item.age+"</td>";
			 html+="<td>"+item.date+"</td>";
			 html+="<td>";
				 html+="<a href='#' class='btn btn-primary btn-sm updateBtn' style='margin-right:10px' studentId="+item.id+"><span class='glyphicon glyphicon-pencil' aria-hidden='true'></span> 修改</a>";
				 html+="<a href='#' class=\"btn btn-danger btn-sm deleteBtn\" studentId="+item.id+"><span class=\"glyphicon glyphicon-remove\" aria-hidden=\"true\"></span> 删除</a>";//这里用的是\"来讲"转义后使用
			html+="</td>";
		 html+="</tr>";
	 })
	 $("tbody").html(html);
	      
}
	 
	 
 //输出分页
 /*			
    <!--分页信息-->
		<div class="col-md-4 text-center">
			<p>当前第<code>${pageInfo.pageNum }</code>页，总页码数<code>${pageInfo.pages }</code>页，共有<code>${pageInfo.total }</code>条数据</p>
		</div>
		
		<!--分页,pc和移动端分别设置-->
		<div class="col-12  col-md-8 text-center">
			<nav aria-label="fenye">
				<ul class="pagination pagination-sm justify-content-center">
					
					<!-- 首页 ，若为首页则禁用-->
					<li  <c:if test="${pageInfo.isFirstPage }">class="page-item disabled"</c:if>>
						<a class="page-link" href="${APP_PATH}/student/list?pn=1" tabindex="-1">首页</a>
					</li>
					
					<!-- 上一页 ，若无上一页了则不显示-->
					<c:if test="${pageInfo.hasPreviousPage}">
						<li class="page-item "><a class="page-link" href="${APP_PATH }/student/list?pn=${pageInfo.pageNum - 1}" tabindex="-1">上一页</a></li>
					</c:if>
					
					<!-- 显示数字页数 -->
					<c:forEach items="${pageInfo.navigatepageNums }" var="pageNumber"><!-- 获取所有页码，循环显示出来 -->
						<li class="page-item <c:if test="${pageNumber==pageInfo.pageNum}">active</c:if>"><!-- 当前页码高亮 -->
							<a class="page-link" href="${APP_PATH }/student/list?pn=${pageNumber }">${pageNumber }</a>
						</li>
					</c:forEach>
					
					<!-- 下一页 ，若无下一页了则不显示 -->
					<c:if test="${pageInfo.hasNextPage}">
						<li class="page-item"><a class="page-link" href="${APP_PATH }/student/list?pn=${pageInfo.pageNum + 1}">下一页</a></li>
					</c:if>
					
					<!-- 尾页 ，若为尾页则禁用-->
					<li <c:if test="${pageInfo.isLastPage }">class="page-item disabled"</c:if>>
						<a class="page-link" href="${APP_PATH }/student/list?pn=${pageInfo.pages }" tabindex="-1">最后一页</a>
					</li>
				</ul>
			</nav>
		</div>
	*/
function build_page(_response){
	//清空
	$("#pageNav").html("");
	
	var html='';
	
		//左边分页信息
	html="<p>当前第<code>"+_response.resultMap.pageInfoJson.pageNum+"</code>页，总页码数<code>"+_response.resultMap.pageInfoJson.pages+"</code>页，共有<code>"+_response.resultMap.pageInfoJson.total+"</code>条数据</p>";
	$("#pageInfo").html(html);
	html="";//清空
	
	
	//右边分页   

	//首页,若已是首页则禁用
	/*
	  if(_response.resultMap.pageInfoJson.isFirstPage){
		html+="<li class='page-item disabled'>";
	  }else{
		html+="<li class='page-item'>";	
	  }
	*/
	_response.resultMap.pageInfoJson.isFirstPage==true ? html="<li class='page-item disabled'>":html="<li class='page-item'>";	//若已是首页则禁用	
	html+="<a class='page-link firstNumber' href='#' tabindex='-1'>首页</a>";
	html+="</li>";
	
	 
	//上一页   若无上一页了则不显示-->
	/*
		<c:if test="${pageInfo.hasPreviousPage}">
			<li class="page-item "><a class="page-link" href="${APP_PATH }/student/list?pn=${pageInfo.pageNum - 1}" tabindex="-1">上一页</a></li>
		</c:if>
	*/
	if(_response.resultMap.pageInfoJson.hasPreviousPage==true){
		html+="<li class='page-item'><a class='page-link preNumber' pagenownumber="+_response.resultMap.pageInfoJson.pageNum+" href='#' tabindex='-1'>上一页</a></li>";
	}
	
	//显示数字页数
	/*
		<c:forEach items="${pageInfo.navigatepageNums }" var="pageNumber"><!-- 获取所有页码，循环显示出来 -->
			<li class="page-item <c:if test="${pageNumber==pageInfo.pageNum}">active</c:if>"><!-- 当前页码高亮 -->
				<a class="page-link" href="${APP_PATH }/student/list?pn=${pageNumber }">${pageNumber }</a>
			</li>
		</c:forEach>
	*/
	$.each(_response.resultMap.pageInfoJson.navigatepageNums,function(index,item){
		_response.resultMap.pageInfoJson.pageNum==item ? html+="<li class='page-item active'>" :  html+="<li class='page-item'>";//选中页高亮显示
		 				
		 html+="<a class='page-link  pageNavNumber' href='#'>"+item+"</a>";
		 html+="</li>";
	})

		
	// 下一页  若无下一页了则不显示
	/*
		<c:if test="${pageInfo.hasNextPage}">
			<li class="page-item"><a class="page-link" href="${APP_PATH }/student/list?pn=${pageInfo.pageNum + 1}">下一页</a></li>
		</c:if>
	*/
	if(_response.resultMap.pageInfoJson.hasNextPage){
		html+="<li class='page-item'><a class='page-link nextNumber' href='#' pagenownumber="+_response.resultMap.pageInfoJson.pageNum+">下一页</a></li>";
	}
		
	// 尾页 若为尾页则禁用-->
	/*
		<li <c:if test="${pageInfo.isLastPage }">class="page-item disabled"</c:if>>
			<a class="page-link" href="${APP_PATH }/student/list?pn=${pageInfo.pages }" tabindex="-1">最后一页</a>
		</li>
	*/
	 _response.resultMap.pageInfoJson.isLastPage==true ? html+="<li class='page-item disabled'>" : html+="<li class='page-item'>";
	 html+="<a class='page-link lastNumber'  href='#'  pagenownumber="+_response.resultMap.pageInfoJson.pages+">最后一页</a>";
	 html+="</li>";

	$("#pageNav").html(html);

} 
	
//表单验证(确定新增用户时触发该事件)
/**
 * 如果校验出问题，则文本框边框为红色（bootstrap样式http://code.z01.com/v4/utilities/borders.html），且显示错误信息
 */
function form_validate(){
	
	//用户名验证(数字或 英文大于4位)
	var name=$("#stu_form input[name=name]").val();
	var regName= /^[a-zA-Z0-9_-]{4,16}$/;
	var nameBtn=$("#stu_form input[name=name]");
	if(!regName.test(name)){
		//验证没通过：文本框变红 + 错误提示语		
		nameBtn.addClass("border border-danger");
		nameBtn.next("span").css("color","red").text("用户名可以是4-16位字母或数字组成");
		return false;
	}else{
		//验证通过：文本框变绿 + 取消错误提示语		
		nameBtn.removeClass("border border-danger").addClass("border border-success");//取消掉红色框的class属性，添加新的
		nameBtn.next("span").text("");
	}
	
	//年龄验证（正整数）
	var age=$("#stu_form input[name=age]").val();
	var regAge=/^\d+$/
	var ageBtn=$("#stu_form input[name=age]");
	if(!regAge.test(age)){
		//验证没通过：文本框变红 + 错误提示语	
		show_validate_msg(ageBtn,"error","年龄必须是正整数");//整合下面两句
		//ageBtn.addClass("border border-danger");
		//ageBtn.next("span").css("color","red").text("年龄必须是正整数");
		return false;
	}else{
		//验证通过：文本框变绿 + 取消错误提示语		
		show_validate_msg(ageBtn,"success","");//整合下面两句
		//ageBtn.removeClass("border border-danger").addClass("border border-success");//取消掉红色框的class属性，添加新的
		//ageBtn.next("span").text("");
	}
	
	//日期验证
	if($("#stu_form input[name=date]").val()==''|| $("#stu_form input[name=date]").val()==null){
		var dateBtn=$("#stu_form input[name=date]");
		//验证没通过：文本框变红 + 错误提示语		
		dateBtn.addClass("border border-danger");
		dateBtn.next("span").css("color","red").text("日期不能为空");
		return false;
	}else{
		//验证通过：文本框变绿 + 取消错误提示语		
		ageBtn.removeClass("border border-danger").addClass("border border-success");//取消掉红色框的class属性，添加新的
		ageBtn.next("span").text("");
	}

	
	//全通过则返回无问题
	return true;
	 
}

//判断用户名是否重复
function check_name_unique(){
	var ele=$("#stu_form input[name=name]");//文本框dom
	var textName=$.trim(ele.val());//用户名
	var back=0;//1为重名，2为ok
	$.ajax({
		async: false,//将ajax异步传输改成同步传输。默认是true：异步（或不写这句），false：同步。将ajax异步传输改成同步传输的话，则必须执行完ajax程序后才会执行后面的，不加则是异步传输同步进行。
		//cache : false,//禁用缓存（POST请求默认禁用缓存，只是GET方式默认启用缓存）。默认情况下，请求总会被发出去，但浏览器有可能从他的缓存中调取数据。要禁止使用缓存的结果，可以设置cache参数为false。会在请求后就一个随机数来避免缓存效果
		
		type:'POST',
		url:"${APP_PATH}/student/countByName", 
		data:{
			name:textName
		},
		dataType:'json',//返回类型，有html，json，xml，text，如果返回的内容不符，则执行error的内容

		success:function(_response,_status,_xhr){
			//console.log(_response)//查看所有返回结果JSON格式
			//console.log(_response);
		    if(_response.code==200){//返回成功，说明有返回值，说明查到了用户名重复项
		    	show_validate_msg($("#stu_form input[name=name]"),"error",_response.resultMap.statusMsg);//用户名重复
		    	back=1;
		    }else{
		    	show_validate_msg(ele,"success","");//用户名可用
		    	back=0;	   
		    }
		    
		},
		 //请求失败处理
		error:function(XMLHttpRequest, textStatus, errorThrown){//返回类型错误，或传入类型错误
			alert("查询是否重复用户名失败,类型错误");
			return false;
		},

	});

	return back;
}

//显示校验结果信息
function show_validate_msg(ele,status,msg){
	if(status=="success"){
		ele.removeClass("border border-danger").addClass("border border-success");//取消掉红色框的class属性，添加新的
		ele.next("span").text("");
	}else{
		ele.addClass("border border-danger");
		ele.next("span").css("color","red").text(msg);
	}
	
}

//查询员工信息（根据主键id）
function get_student_by_primaryKey(_id){
	//返回json结果集，不能在ajax中直接返回
	var response;
	
	$.ajax({
		async: false,//将ajax异步传输改成同步传输。默认是true：异步（或不写这句），false：同步。将ajax异步传输改成同步传输的话，则必须执行完ajax程序后才会执行后面的，不加则是异步传输同步进行。
		cache : false,//禁用缓存（POST请求默认禁用缓存，只是GET方式默认启用缓存）。默认情况下，请求总会被发出去，但浏览器有可能从他的缓存中调取数据。要禁止使用缓存的结果，可以设置cache参数为false。会在请求后就一个随机数来避免缓存效果
		
		type:'GET',
		url:"${APP_PATH}/student/updateShow/"+_id, 
		data:{
			//id:_id,
		},

		dataType:'json',//返回类型，有html，json，xml，text，如果返回的内容不符，则执行error的内容
		
		 //请求前的处理
		beforeSend: function() {	
			//加载中提醒
			_loadTip("loading","读取中...","red");					
	    },
	    //请求成功处理
		success:function(_response,_status,_xhr){
			console.log(_response)//查看所有返回结果JSON格式:{"code":200,"msg":"success","resultMap":{"studentOne":{"id":1,"name":"高晓松0","age":26,"date":"2018-09-01 00:38:21"}}}
			_loadTip("none");
			
			if(_response.code==200){
				//读取成功,回显学生信息
				 /*
					$("#stu_update_form input[name=name]").val(_response.resultMap.studentOne.name);
					$("#stu_update_form input[name=age]").val(_response.resultMap.studentOne.age);
					$("#stu_update_form input[name=date]").val(_response.resultMap.studentOne.date);
			 */
				response=_response;
				 
		 

			}else{
				alert("修改回显学生信息失败")
			}
					
		},
		 //请求失败处理
		error:function(XMLHttpRequest, textStatus, errorThrown){//返回类型错误，或传入类型错误
			alert("操作错误");
		},
	});
	
	return response;	//返回json结果集
};

/*
 * 修改学生
   @param _currentPage当前页
 */
function student_update(_currentPage){
	$.ajax({
		//async: false,//将ajax异步传输改成同步传输，必须执行完ajax程序后才会执行后面的，不加则是异步传输同步进行。
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
				 setTimeout(function(){//两秒后跳转
			    	to_page(_currentPage)
				 },1500);
			 
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
 * 删除学生
   @param _id主键
		  _currentPage当前页
 */
function _student_delete(_id,_currentPage){
	$.ajax({
		async: false,//将ajax异步传输改成同步传输。默认是true：异步（或不写这句），false：同步。将ajax异步传输改成同步传输的话，则必须执行完ajax程序后才会执行后面的，不加则是异步传输同步进行。
		cache : false,//禁用缓存（POST请求默认禁用缓存，只是GET方式默认启用缓存）。默认情况下，请求总会被发出去，但浏览器有可能从他的缓存中调取数据。要禁止使用缓存的结果，可以设置cache参数为false。会在请求后就一个随机数来避免缓存效果
	
		type:'GET',// 
		url:"${APP_PATH}/student/delete",  
		data: {id:_id},
		dataType:'json',//返回类型，有html，json，xml，text，如果返回的内容不符，则执行error的内容
		
		 //请求前的处理
		beforeSend: function() {	
			//加载中提醒
			_loadTip("loading","删除中...","black");					
	    },
	    //请求成功处理
		success:function(_response,_status,_xhr){
			console.log(_response)//查看所有返回结果JSON格式:
			
			if(_response.msg=="success"){
				//1、执行成功提醒
				_loadTip("oking","删除完成","black");	//to_page中的提示框会覆盖这里，所以跳转to_page要延迟会执行	
		
			    //2、跳转到当前页，如果是最后一页最后一条，返回的页数大于实际页数，默认会去最后一页，不会出错。
				 setTimeout(function(){//两秒后跳转
			    	to_page(_currentPage)
				 },1500);
			 
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
};

/*
 * -批量删除
   @param _delete_id_row要删除学生的id字符串1,2,3,4,5
  		  _currentPage当前页
 */
function _stu_delete_banch(_delete_id_row,_currentPage){
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
		
			    //2、跳转到当前页，如果是最后一页最后一条，返回的页数大于实际页数，默认会去最后一页，不会出错。
			    setTimeout(function(){//两秒后跳转
			    	to_page(_currentPage)
				 },1500);


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
	
 
	 
</script>
<title>首页AJAX无刷新学生列的12221</title>
</head>
<body>
  
	<!-- bootstrap模态框  -->
	<!-- 新增学生模态框 -->
	<div class="modal fade" id="myInsertModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"  >
	  <div class="modal-dialog" role="document">
	    <div class="modal-content" >
	      <div class="modal-header">
	        <h4 class="modal-title " id="myModalLabel" >新增学生</h4>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	      </div>		
	      <div class="modal-body">
		      <!-- 模态框自己内容：form提交表单begin -->  	
		      <form class="form-horizontal " id="stu_form">
				  <div class="form-group row" style="margin-top:20px;">
					    <label class="col-2 control-label text-center">姓名</label>
					    <div class="col-10">
					      <input type="text" name="name"  class="form-control " placeholder="请输入姓名..."   />
					      <span title="errText" ></span>
					    </div>
				  </div>
				  <div class="form-group row">
					    <label  class="col-2 control-label text-center">年龄</label>
					    <div class="col-10">
					      <input type="text" name="age" class="form-control " name="date"  placeholder="请输入年龄..." />
					      <span title="errText" ></span>
					    </div>
				  </div>
				   <div class="form-group row">
				 		 <label class="col-2 control-label text-center" style="position: relative;top:10px">日期</label>
				 		 <div class="col-10">
				 		    <!-- jeDate日期插件 ,jeDate:4/4  -->
					        <input type="text" class="jeinput" id="jeDateInputInsert" name="date" placeholder="日期格式：YYYY-MM-DD hh:mm:ss" /> 
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
	        <h4 class="modal-title " id="myModalLabel" >修改学生（未做前端与后端jsr303验证，参考新增）</h4>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	      </div>		
	      <div class="modal-body">
		      <!-- 模态框自己内容：form提交表单begin -->  	
		      <form class="form-horizontal " id="stu_update_form">
		     	 <div class="form-group row" style="margin-top:20px;">
					    <label class="col-2 control-label text-center">编号</label>
					    <div class="col-10">
	 						  <p class="form-control-static" id="primaryKey">1</p>
					    </div>
				  </div>
				  <div class="form-group row" >
					    <label class="col-2 control-label text-center">姓名</label>
					    <div class="col-10">
					      <input type="text" name="name"  class="form-control " placeholder="请输入姓名..."   />
					      <span title="errText" ></span>
					    </div>
				  </div>
				  <div class="form-group row">
					    <label  class="col-2 control-label text-center">年龄</label>
					    <div class="col-10">
					      <input type="text" name="age" class="form-control "   placeholder="请输入年龄..." />
					      <span title="errText" ></span>
					    </div>
				  </div>
				   <div class="form-group row">
				 		 <label class="col-2 control-label text-center" style="position: relative;top:10px">日期</label>
				 		 <div class="col-10">
				 		    <!-- jeDate日期插件 ,jeDate:4/4  -->
					        <input type="text" class="jeinput" id="jeDateInputUpdate" name="date" placeholder="日期格式：YYYY-MM-DD hh:mm:ss" /> 
					        <span title="errText" ></span>
					    </div>
				  </div>
				  <input name="id" type="hidden" value="1" placeholder="学生编号，隐藏传值"/>
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

	<!-- 主页 -->
	<div class="container-fluid  ">
		<!--标题-->
		<div class="row alert-success">
			<div class="col-4 text-center  alert-danger " style="height: 40px">
				<h5 style="line-height: 40px">学生列表JSON获取</h5>
			</div>
		</div>
		
		<!--添加按钮-->
		<div class="row  no-gutters text-center ">
			<div class="col-4 offset-8 alert-info">
				<input type="button" class="btn btn-sm btn-success"  id="addBtn" value="新增" /> 
				<input type="button" class="btn btn-sm btn-danger" id="stu_delete_all" value="全部删除" />
			</div>
		</div>
		<br />
		<!--表格  tr>td*5按table自动生成-->
		<div class="row  text-center  ">
			<table class="table table-striped" id="showTable">
				<caption>List of users</caption>
				<thead class="thead-dark ">
					<th><input type="checkbox" id="checkbox_all"  style="width:15px;height:15px;position:relative;left:8px"/></th>
					<th>编号</th>
					<th>姓名</th>
					<th>年龄</th>
					<th>日期</th>
					<th>操作</th>
				</thead>
				<tbody>
 					<!-- ajax传入学生列表 -->
				</tbody>
				 
			</table>
		</div>

		<!--分页-->
		<div class="row">
		
			<!--分页信息-->
			<div class="col-md-4 text-center" id="pageInfo">
				 <!-- ajax传入 -->
			</div>
			
			<!--分页,pc和移动端分别设置-->
			<div class="col-12  col-md-8 text-center">
					<nav aria-label="fenye">
						<ul class="pagination pagination-sm justify-content-center" id="pageNav">
							 <!-- ajax传入 -->
						</ul>
					</nav>
				</div>
			</div>
		
	</div>
 
</body>
111
</html>