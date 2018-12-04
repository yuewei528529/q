<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%--引入header配置 --%>
<%@ include file="/commons/header_bootstrap4.jsp"%>

<link href="${APP_PATH }/static/css/studentList.css" rel="stylesheet">

<title>首页</title>
</head>
<body>

	
	<div class="container-fluid  ">
		<!--标题-->
		<div class="row alert-success">
			<div class="col-4 text-center  alert-danger " style="height: 40px">
				<h5 style="line-height: 40px">学生列表</h5>
			</div>
		</div>
		<!--添加按钮-->
		<div class="row  no-gutters text-center ">
			<div class="col-4 offset-8 alert-info">
				<input type="button" class="btn btn-sm btn-success" value="新增" /> <input
					type="button" class="btn btn-sm btn-danger" value="删除" />
			</div>
		</div>
		<br />
		<!--表格  tr>td*5按table自动生成-->
		<div class="row  text-center  ">
			<table class="table table-striped">
				<caption>List of users</caption>
				<thead class="thead-dark ">
					<th>编号</th>
					<th>姓名</th>
					<th>年龄</th>
					<th>日期</th>
					<th>操作</th>
				</thead>
				<tbody>
					<c:forEach items="${pageInfo.list}" var="item" varStatus="vs">
						<tr><!-- 偶数行粉色，奇数行黄色 -->
							<td>${item.id}</td>
							<td>${item.name}</td>
							<td>${item.getAge()}</td>
						 	<!-- 将数据库中读取出的Date类型值Fri Aug 10 13:08:20 CST 2018转成字符串形式2018-09-01 00:38:21 -->
							<td><fmt:formatDate value="${item.date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							 <td>
	                            <a href="" class="btn btn-primary btn-sm" ><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 修改</a>
	                            <a href="" class="btn btn-danger btn-sm" ><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> 删除</a>
	                        </td>
						</tr>
					</c:forEach>
				</tbody>
				 
			</table>
		</div>

		<!--分页-->
		<div class="row">
		
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
			
		</div>
		
	</div>
</body>
</html>