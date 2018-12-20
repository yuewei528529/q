<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<a href="${pageContext.request.contextPath}/student/list">常规分页显示(没做crud，只是分页显示)</a>

<br /><br />
<a href="${pageContext.request.contextPath}/student/listJson">bootstarp4 + mybatis的pagehelper插件 + ajax分页显示（扩展性好，但写起来麻烦）</a>


<br /><br />
<a href="${pageContext.request.contextPath}/student/listStudentBootstrapTable">bootstrap3 + bootstrap-table + mybatis的pagehelper插件分页显示（极度容易分页，排序等，但没上面的灵活）</a>
<br /><br />
<a href="${pageContext.request.contextPath}/student/listStudentBootstrapTable2">bootstrap3 + bootstrap-table + mybatis的pagehelper插件分页显示（极度容易分页，排序等，但没上面的灵活）</a>