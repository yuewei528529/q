package com.gz.ssm.controller;

import java.text.SimpleDateFormat;
import java.util.TimeZone;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.InitBinder;
 
/**
 * Date类型格式（被 @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")标签代替，功能一样）
 * 
 * .功能：控制器Controller接受浏览器string类型的时间值参数时，通过本控制器增强的操作，将string类型转成Date类型后，传给后台使用）。
 * 
 * .注意：本控制器增强必须被mvc.xml中IoC注解解析器扫描到，用于增强使用了@RequestMapping的处理器。
 * 
 * .原理：比如前台通过文本框传递一个string类型的时间”2018-09-06 07:11:01“，通过本控制器增强转成了Date类型。 当提交表单时，controller会把表单元素注入到command类里，但是系统注入的只能是基本类型，如int，char，String。但当我们在command类里需要复杂类型，如Integer，date，或自己定义的类时，controller就不会那么聪明了。这时，就需要我们帮助他们了。
 *
 * .例子：studentListJson.jsp新增会员有用到这个增强类。
 * 
 */

//控制器增强
//@ControllerAdvice
//public class DateFormatAdvice {
//
//	@InitBinder
//	public void initBinderDateType(WebDataBinder binder) {
//		SimpleDateFormat sdf = new SimpleDateFormat();
//		sdf.applyPattern("yyyy-MM-dd hh:mm:ss");
//		//sdf.setTimeZone(TimeZone.getTimeZone("GMT"));//时区
//		binder.registerCustomEditor(java.util.Date.class,new CustomDateEditor(sdf,true)); //true:允许前端时间输入空值，false:前端时间不能为空值
//	}
// 
//}
