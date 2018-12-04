<!-- 
	=============
	 全局配置文件
	=============
	author：耿正
	date：2018/8/26

 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %><%-- 这个命令可以使jsp输出的html时去除多余的空行（jsp上使用EL和tag会产生大量的空格和空行）。 --%>

<!-- 引入JSTL -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><!-- JSTL核心操作-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %><!-- JSTL格式化操作-->

<%-- 

	获取项目名（上下文）
	
	1、用< % %>是JSP注释，在前台源代码无法看到

	2、比如localhost:8080/GzWeb/index.jsp，获取的就是/GzWeb，若是比如localhost:8080/index.jsp则获取到/，进而形成绝对路径
	
	3、set可以传值，其他页面用${}获取
	
	4、ctrl +?可以快速书写备注

 --%>
 
<%--ctxPath--%>
<c:set var="ctxPath" value="${pageContext.request.contextPath}" />
<%--项目路径 --%>
<c:set var="path" value="${ctxPath}" />
<%--静态文件目录 --%>
<c:set var="staticPath" value="${ctxPath}" />
 
<%--版本号（暂时没用） --%>
<c:set var="version" value="201807091100" />

