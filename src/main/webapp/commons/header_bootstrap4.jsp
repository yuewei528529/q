<!--
	=================
	author：耿正
	date：2018-9-1
	version:1.0
	==================
	
-->

<%--

	基础配置文件
	1、utf-8编译
	2、引入jstl
	3、引入ico图片和Jquery
	4、引入bootstrap
	5、引入上下文
	
	ps:	用< % %>是JSP注释，在前台源代码无法看到。《！----》是可以看到的

 --%> 
 <% 
 	/* 禁止jsp页面缓存，效果不知道有没有 */
	response.setHeader("Pragma","No-cache");
	response.setHeader("Cache-Control","no-cache");
	response.setDateHeader("Expires", 0);
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %><%-- 这个命令可以使jsp输出的html时去除多余的空行（jsp上使用EL和tag会产生大量的空格和空行）。 --%>
<%-- 引入JSTL --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><%-- JSTL核心操作--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %><%-- JSTL格式化操作--%>


<%-- bootstrap要求下面3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ --%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"><%--width=device-width实现响应式，user-scalable=no手机端不许缩放 --%>


<%-- 引入基本配置 --%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="如梦技术,java职业教育,java线教育平台,java在线学习,spring,mybatis,spring-boot,docker">
<meta name="description" content="如梦技术作为中国最权威的java在线教育平台,拥有海量高清java职业课程,涵盖个个组件,根据java在线学习特点,如梦技术推出java学习知识体系图,java职业学习实战路径图,帮助java学习者从零基础起步,结合java实战案例演练,系统学习,助你快速成为java优秀技术人才！">




<%-- 

	获取项目名（上下文）
	
	1、例如我们项目url：localhost：8080/GzMavenSSM/static/html/d.html，localhost:8080是网站目录，GzMavenSSM是项目名

	2、相对路径（不推荐）：static/html/d.html，不以/开头的就是相对路径，经常容易出错。
	
	3、绝对路径（不推荐）：GzMavenSSM/static/html/d.html，如果换了项目名就错了。
	
	4、上下文路径加绝对路径（推荐）：${pageContext.request.contextPath}/static/html/d.html,${pageContext.request.contextPath}用来获取项目名，若没有就是/，有就自动获取，这里获取到/GzMavenSSM
	
	5、set可以传值，其他页面用${}获取
	
	6、ctrl +?可以快速书写备注

 --%>
 
<%--ctxPath--%>
<c:set var="ctxPath" value="${pageContext.request.contextPath}" />
<%--项目路径 --%>
<c:set var="APP_PATH" value="${ctxPath}" />
<%--静态文件目录 --%>
<c:set var="STATIC_PATH" value="${ctxPath}" />
<%--版本号（暂时没用） --%>
<c:set var="version" value="201807091100" />





<%--引入图标 --%>
<link rel="shortcut icon" href="${APP_PATH }/static/images/favicon.ico" />
<%--引入JQuery --%>
<script type="text/javascript" src="${APP_PATH }/static/js/jquery-3.3.1.min.js"></script>

<!-- 引入bootstrap 4.0，和3.0有很多区别在代码上-->
<script type="text/javascript" src="${APP_PATH }/static/bootstrap-4.0.0-dist/js/bootstrap.min.js" ></script>
<link href="${APP_PATH }/static/bootstrap-4.0.0-dist/css/bootstrap.min.css" rel="stylesheet">
 
 

