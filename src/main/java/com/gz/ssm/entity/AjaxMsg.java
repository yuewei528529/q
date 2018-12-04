package com.gz.ssm.entity;
/**
 * ♀描述：AJAX返回信息实体类
 * 
 * .功能： 返回实体类对象，控制器再对这个javabean使用jackson转成json格式数据
 * 
 * .使用：控制器 public AjaxMsg listreturn { AjaxMsg.ajaxResultSuccess().addResultMap("pageInfoJson", pageInfo);}
 * 
 * @author gz
 * @version 1.0 2018-8-28
 */

import java.util.HashMap;
import java.util.Map;
 

public class AjaxMsg {
	
	//状态码 200成功，100失败
	private int code;
	//提示信息
	private String msg;
	//返回给浏览器的数据,在控制器通过@ResponseBody将Map格式改成json格式，都是键值对的。可以再存入一个Map集合，参考控制层jsr303校验方式
	private Map<String,Object> resultMap=new HashMap<>();
	
	//ajax获取数据返回成功
	public static AjaxMsg ajaxResultSuccess(){//返回AjaxMsg对象类型，可以想成User对象来理解。
		AjaxMsg ajaxMsg=new AjaxMsg();//静态方法中无法用this获取成员变量
		ajaxMsg.setCode(200);
		ajaxMsg.setMsg("success");
		return ajaxMsg;
		/**
		 * 返回的是一个ajaxMsg对象，它包含了如下信息，保持面向对象的思路编程。
		 * ajaxMsg{
					"code": 0,
					"msg": null,
					"resultMap": {}
				  }
		 */
	}
	
	//同一个AjaxMsg对象添加resultMap返回信息，结合上面ajaxResultSuccess静态方法使用，。
	public  AjaxMsg addResultMap(String key,Object value) {		
		this.resultMap.put(key, value);
		return this;//返回本类ajaxMsg
	}
	
	//ajax获取数据返回失败
	public static AjaxMsg ajaxResultFaild(){
		AjaxMsg ajaxMsg=new AjaxMsg();//静态方法中无法用this获取成员变量
		ajaxMsg.setCode(100);
		ajaxMsg.setMsg("faild");
		return ajaxMsg;
		/**
		 * 返回的是一个ajaxMsg对象，它包含了如下信息，保持面向对象的思路编程。
		 * ajaxMsg{
					"code": 0,
					"msg": null,
					"resultMap": {}
				  }
		 */
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Map<String, Object> getResultMap() {
		return resultMap;
	}

	public void setResultMap(Map<String, Object> resultMap) {
		this.resultMap = resultMap;
	}

	@Override
	public String toString() {
		return "AjaxMsg [code=" + code + ", msg=" + msg + ", resultMap=" + resultMap + "]";
	}
	
 
	
	
	
	
	
	
	
	
	
	
	
	
	
}
