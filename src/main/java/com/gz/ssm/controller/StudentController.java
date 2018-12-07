package com.gz.ssm.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gz.ssm.entity.AjaxMsg;
import com.gz.ssm.entity.Student;
import com.gz.ssm.service.StudentService;

import javafx.scene.control.Alert;
/**
 * ♀描述：学生控制器 ，负责页面分发与跳转
 * 
 * @author gz
 * @version 1.0 2018-8-28
 */
@Controller
@RequestMapping("/student")
 public class StudentController {
	
	@Autowired
	private StudentService studentService;

	
	//显示所有student+分页（传统写法，返回java的PageInfo对象类型，其他平台无法使用，被下面返回json的写法代替）
	//分页插件说明：https://github.com/pagehelper/Mybatis-PageHelper/blob/master/wikis/en/HowToUse.md
	@RequestMapping("/list")//传递的参数若为post形式，可以直接用@PostMapping或@GetMapping
	//分页0：pom.xml添加pagehelper分页插件依赖
	//分页1（传入当前第几页pn，若不传默认为1）
	public ModelAndView show(@RequestParam(value="pn",defaultValue="1")Integer pn) {//不传值pn的话默认为第一页，模拟点击第三页http://192.168.3.3:8080/GzMavenSSM/student/list?pn=3
		
		//分页2：在查询前调用分页插件，传入页面pg，以及每页显示数量5
		PageHelper.startPage(pn,5);
		//分页3：分页查询,startPage后面跟着的查询自动成为分页查询，比如这里就只查询5条数据
		List<Student> list=studentService.listAll();
		//分页4：使用PageInfo包装查询后结果，只需要将pageInfo交给页面即可，pageInfo包含了非常多内容(ctrl+左键点进PageInfo类中查看），显示6个页码数字
		PageInfo pageInfo=new PageInfo(list,6);
		//System.err.println(list.size());
		//System.err.println(pageInfo.getList());//Page{count=true, pageNum=1, pageSize=5, startRow=0, endRow=5, total=642, pages=129, reasonable=true, pageSizeZero=false}[Student [id=1, name=高晓松0, age=26, date=Sat Sep 01 08:38:21 CST 2018], Student [id=2, name=高晓松1, age=26, date=Sat Sep 01 08:38:21 CST 2018], Student [id=3, name=高晓松2, age=26, date=Sat Sep 01 08:38:21 CST 2018], Student [id=4, name=高晓松3, age=26, date=Sat Sep 01 08:38:21 CST 2018], Student [id=5, name=高晓松4, age=26, date=Sat Sep 01 08:38:21 CST 2018]]
		//分页5：将pageInfo传给jsp页面
		return new ModelAndView("studentList", "pageInfo", pageInfo);//第一个参数是view视图jsp文件，第二个是model模型数据传递给视图
		 
	}
	
	//显示以JSON格式响应浏览器的分页（jsp使用ajax调用getJsonPageInfo获取分页数据）
	@RequestMapping("/listJson")//传递的参数若为post形式，可以直接用@PostMapping或@GetMapping
	public String  listJson() {
		return "studentListJson";
	}
	
	//显示所有student+分页，需要jsp页面通过ajax获取这里分页数据，然后响应JSON类型给浏览器（支持jsp，苹果，安卓，接口等，json数据通用作为响应拓展性很强）
	//分页插件说明：https://github.com/pagehelper/Mybatis-PageHelper/blob/master/wikis/en/HowToUse.md
	@RequestMapping("/getJsonPageInfo")//传递的参数若为post形式，可以直接用@PostMapping或@GetMapping
	//将返回的内容通过jackson工具转换成json格式，javabean可以与json很容易转化，格式都是key，value的。
	@ResponseBody
	//分页0：pom.xml添加pagehelper分页插件依赖
	//分页1（传入当前第几页pn，若不传默认为1）
	public AjaxMsg list(@RequestParam(value="pn",defaultValue="1")Integer pn) {//不传值pn的话默认为第一页，模拟点击第三页http://192.168.3.3:8080/GzMavenSSM/student/list?pn=3
		
		//分页2：在查询前调用分页插件，传入页面pg，以及每页显示数量5
		PageHelper.startPage(pn,5);
		//分页3：分页查询,startPage后面跟着的查询自动成为分页查询，比如这里就只查询5条数据
		List<Student> list=studentService.listAll();
		//分页4：使用PageInfo包装查询后结果，只需要将pageInfo交给页面即可，pageInfo包含了非常多内容(ctrl+左键点进PageInfo类中查看），显示6个页码数字
		PageInfo pageInfo=new PageInfo(list,6);
		//System.err.println(list.size());
		//System.err.println(pageInfo.getList());//Page{count=true, pageNum=1, pageSize=5, startRow=0, endRow=5, total=642, pages=129, reasonable=true, pageSizeZero=false}[Student [id=1, name=高晓松0, age=26, date=Sat Sep 01 08:38:21 CST 2018], Student [id=2, name=高晓松1, age=26, date=Sat Sep 01 08:38:21 CST 2018], Student [id=3, name=高晓松2, age=26, date=Sat Sep 01 08:38:21 CST 2018], Student [id=4, name=高晓松3, age=26, date=Sat Sep 01 08:38:21 CST 2018], Student [id=5, name=高晓松4, age=26, date=Sat Sep 01 08:38:21 CST 2018]]
		//分页5：将pageInfo封装入AjaxMsg对象中，并添加两个参数code和msg
		//System.out.println(AjaxMsg.ajaxResultSuccess().addResultMap("pageInfoJson", pageInfo));//AjaxMsg [code=200, msg=success, resultMap={pageInfoJson=PageInfo{pageNum=1, pageSize=5, size=5, startRow=1, endRow=5, total=5000, pages=1000, list=Page{count=true, pageNum=1, pageSize=5, startRow=0, endRow=5, total=5000, pages=1000, reasonable=true, pageSizeZero=false}[Student [id=1, name=习近平, age=99, date=Fri Aug 31 12:23:37 CST 2018], Student [id=3, name=高晓松2, age=26, date=Fri Aug 31 12:23:37 CST 2018], Student [id=4, name=高晓松3, age=26, date=Fri Aug 31 12:23:37 CST 2018], Student [id=5, name=高晓松4, age=26, date=Fri Aug 31 12:23:37 CST 2018], Student [id=6, name=高晓松5, age=26, date=Fri Aug 31 12:23:37 CST 2018]], prePage=0, nextPage=2, isFirstPage=true, isLastPage=false, hasPreviousPage=false, hasNextPage=true, navigatePages=6, navigateFirstPage=1, navigateLastPage=6, navigatepageNums=[1, 2, 3, 4, 5, 6]}}]
		return  AjaxMsg.ajaxResultSuccess().addResultMap("pageInfoJson", pageInfo);
		/**
		 * .解释上面一句话
		 * AjaxMsg.ajaxResultSuccess()返回一个AjaxMsg对象，等于操作了AjaxMsg ajaxMsg = new AjaxMsg（）操作。
		 * AjaxMsg.ajaxResultSuccess().addResultMap("pageInfoJson", pageInfo);等于ajaxMsg.addResultMap("pageInfoJson", pageInfo);所以两次对同一个AjaxAMsg对象进行的操作，并且addResultMap也无需是静态方法
		 *
		 *.返回json的结果：总的是AjaxMsg对象格式，并且附带了很多分页信息，javabean格式与json格式基本一致，所以很容易相互转换
		 *{
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
		 
	}


	//新增学生
	@PostMapping("/insert")
	@ResponseBody
	public AjaxMsg insert(@Valid Student student,BindingResult result) {//@Valid和BindingResult result是JSR303验证学生实体数据
		//Date date= new Date();
		//System.out.println(date);//当前时间Date类型：Thu Sep 06 21:11:20 CST 2018
		System.out.println("SpringMVC获取到的信息:" + student);//Student [id=null, name=2, age=2, date=Thu Sep 06 07:55:45 CST 2018] 
		
		//报错出错信息Map集合
		Map<String,Object> mapErr=new HashMap<>();
		
		//1、检查用户名是否重复(非jsr303校验所以只能写这里）
		//Long count=studentService.countByName(student);
	//	if(count>0) {
			//mapErr.put("nameUniqueErr", "用户名重复");
			//return AjaxMsg.ajaxResultFaild().addResultMap("errors", mapErr);
		//}
		/**
		 * {
				"code": 100,
				"msg": "faild",
				"resultMap": {
					"errors": {
						"nameUniqueErr": "用户名重复",
					}
				}
			}
		 * {"code":100,"msg":"faild","resultMap":{"nameUniqueErr":"用户名重复"}}
		 */
		
	/*	if(result.hasErrors()) {
			//2、JSR303字段检验不合格
			
			List<FieldError> errors=result.getFieldErrors();
			System.out.println(errors);
			for(FieldError err :errors) {
				System.err.println("每次循环的总错误信息："+ err);//Field error in object 'student' on field 'age': rejected value [null]; codes [NotNull.student.age,NotNull.age,NotNull.java.lang.Integer,NotNull]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [student.age,age]; arguments []; default message [age]]; default message [年龄必须是正整数（后端jsr303验证1）]
				System.out.println("错误字段:"+ err.getField());
				System.out.println("错误信息:"+err.getDefaultMessage());//获取错误信息用户名可以是4-16位字母或数字组成(后端jsr303验证）
				mapErr.put(err.getField(), err.getDefaultMessage());
			}
			
			return AjaxMsg.ajaxResultFaild().addResultMap("errors", mapErr);
			*//**
			 * -返回前端的json格式数据
			 * {
					"code": 100,
					"msg": "faild",
					"resultMap": {
						"errors": {
							"date": "日期不能为空（后端jsr303验证1）",
							"name": "用户名可以是4-16位字母或数字组成(后端jsr303验证）",
							"age": "年龄必须是正整数（后端jsr303验证1）"，
							"nameUniqueErr": "用户名重复",
						}
					}
				}
				-前端获取json格式数据很容易
				if(undefined!=_response.resultMap.errors.name){//定义了说明出错了
					alert(_response.resultMap.errors.name);
				}
			 *//*
		}else {*/
			
			//3、用户名不重复，且JSR303字段检验合格后，新增学生
			studentService.insert(student);
			Long id=student.getId();
			System.out.println(id);
			if(id>0) {
			   return AjaxMsg.ajaxResultSuccess().addResultMap("id", id); 
			}else {
				return AjaxMsg.ajaxResultFaild();
			}		 
			//return count > 0 ?  AjaxMsg.ajaxResultSuccess().addResultMap("id", id): AjaxMsg.ajaxResultFaild();
		//}
		
		
	}
	
	/**
	 * -根据条件获取总数（条件：name，id）
	 * 1、判断用户名是否重复，判断用户名是否合规。使用对象作为参数效果：student[name=123,id=null]
	 *  
	 * @param student对象，可以传入name或id，自动和entity中student的属性匹配进行接收传递
	 * @return 查询总数
	 */
	@ResponseBody
	@PostMapping("/countByName")
	public AjaxMsg countByName(Student student) {//传入student对象原理见自己总结《05、SpringMVC自己学习，传入参数处理》
		//1、判断用户名是否合规
		String regName="^[a-zA-Z0-9_-]{4,16}$";//java正则没有前后的/，js才用：var regName= /^[a-zA-Z0-9_-]{4,16}$/;
		if(!student.getName().matches(regName)) {
			//不合规
			return AjaxMsg.ajaxResultSuccess().addResultMap("statusMsg", "用户名可以是4-16位字母或数字组成");
		}else {
			//合规
			//2、判断用户名是否重复
			//System.out.println(student);//将这个Student [id=null, name=1234, age=null, date=null]对象内容传递最终给mapper
			Long count=studentService.countByName(student);
			return count > 0 ?  AjaxMsg.ajaxResultSuccess().addResultMap("statusMsg", "用户名重复"): AjaxMsg.ajaxResultFaild();
		}
		

	}
	
	//回显修改学生信息
	@ResponseBody
	@GetMapping(value="/updateShow/{id}")//1、RESTfull风格参数写法，接收url:"/student/updateShow/1”这里传入的id就为1了。, 
	public AjaxMsg updateShow(@PathVariable("id") Long  id) {//2、RESTfull风格参数写法，也可用普通url写法，见《SpringMVC自己总结：ajax的GET两种用法》
		 
		Student student=studentService.updateShow(id);
		return AjaxMsg.ajaxResultSuccess().addResultMap("studentOne", student);
	}
	
	
	
	//修改学生信息
	@ResponseBody
	@PostMapping("/update")
	public AjaxMsg update(Student student) {
		System.out.println(student);//Student [id=1, name=习近平, age=99, date=Thu Sep 06 00:38:21 CST 2018],jsp传递过来的Json数据：name=习近平1&age=99&date=2018-09-01 00:38:21&id=1，springMVC根据student对象的属性自动装配
		int backNum=studentService.update(student);
		return backNum>0?AjaxMsg.ajaxResultSuccess():AjaxMsg.ajaxResultFaild();
 
	}
	
	
	//删除学生
	@ResponseBody
	@GetMapping("/delete")
	public AjaxMsg delete(Long id) {
		int backNum=studentService.delete(id);
		return backNum>0?AjaxMsg.ajaxResultSuccess():AjaxMsg.ajaxResultFaild();
	}
	
	/**
	 * -批量删除学生
	 * @param delete_id_banch 要删除的id字符串：1，2，3，4，5
	 * @return
	 */
	@ResponseBody
	@PostMapping("/deleteBanch")
	public AjaxMsg deleteBanch(String delete_id_banch) {
		//System.out.println(delete_id_banch);//27,28,29,30,31
		return studentService.deleteBanch(delete_id_banch)>0?AjaxMsg.ajaxResultSuccess():AjaxMsg.ajaxResultFaild();
	}
	
	
	
	/**
	 * 显示所有学生（使用bootstrap-table快速实现分页，排序等功能）
	 */
	@RequestMapping("/listStudentBootstrapTable")
	public String showBootstrapTable() {
		return "/studentListJsonBootstrapTable";
	}
	
	
	

	//显示所有student+分页，需要jsp页面通过ajax获取这里分页数据，然后响应JSON类型给浏览器（支持jsp，苹果，安卓，接口等，json数据通用作为响应拓展性很强）
	//mybatis pagehelp分页插件说明：https://github.com/pagehelper/Mybatis-PageHelper/blob/master/wikis/en/HowToUse.md
	@RequestMapping("/getJsonPageInfoBootstraptable")//传递的参数若为post形式，可以直接用@PostMapping或@GetMapping
	//将返回的内容通过jackson工具转换成json格式，javabean可以与json很容易转化，格式都是key，value的。
	@ResponseBody
	public AjaxMsg list(//传入参数，通过网页--》审查元素--》NetWork-》找到getJsonPageInfoBootstraptable请求--》Headers最下面有显示
							//分页+显示页数
							@RequestParam(value="pageNumber",defaultValue="1")Integer pageNumber,//当前页码，不传值pageNumber的话默认为第一页 
							@RequestParam(value="pageSize",defaultValue="5")Integer pageSize,//每页显示数量
							//排序
							@RequestParam(value="sort",required=false)String  sort,//要排序的列id,name,age,date，required=false作用：若没有传入sort参数，则默认sort=NULL的操作了
							@RequestParam(value="sortOrder",required=false)String  sortOrder,//要排序方式acs，desc
							//搜索
							@RequestParam(value="searchName",required=false)String  searchName,//要查询的i姓名
							@RequestParam(value="searchBeginDate",required=false)String searchBeginDate,//开始时间:2018-09-20 18:27:09
							@RequestParam(value="searchEndDate",required=false)String searchEndDate//结束时间：2018-09-22 18:27:09
					   ){
	 
		//System.out.println(searchBeginDate+ searchEndDate);
		//分页2：在查询前调用分页插件，传入页面pg，以及每页显示数量5
		PageHelper.startPage(pageNumber,pageSize);
		//分页3：分页查询,startPage后面跟着的查询自动成为分页查询，比如这里就只查询5条数据
		List<Student> list=studentService.listAllOrder(sort,sortOrder,searchName,searchBeginDate,searchEndDate);
		//分页4：使用PageInfo包装查询后结果，只需要将pageInfo交给页面即可，pageInfo包含了非常多内容(ctrl+左键点进PageInfo类中查看），显示6个页码数字
		PageInfo pageInfo=new PageInfo(list,pageSize);
		//System.err.println(list.size());
		//System.err.println(pageInfo.getList());//Page{count=true, pageNum=1, pageSize=5, startRow=0, endRow=5, total=642, pages=129, reasonable=true, pageSizeZero=false}[Student [id=1, name=高晓松0, age=26, date=Sat Sep 01 08:38:21 CST 2018], Student [id=2, name=高晓松1, age=26, date=Sat Sep 01 08:38:21 CST 2018], Student [id=3, name=高晓松2, age=26, date=Sat Sep 01 08:38:21 CST 2018], Student [id=4, name=高晓松3, age=26, date=Sat Sep 01 08:38:21 CST 2018], Student [id=5, name=高晓松4, age=26, date=Sat Sep 01 08:38:21 CST 2018]]
		//分页5：将pageInfo封装入AjaxMsg对象中，并添加两个参数code和msg
		//System.out.println(AjaxMsg.ajaxResultSuccess().addResultMap("pageInfoJson", pageInfo));//AjaxMsg [code=200, msg=success, resultMap={pageInfoJson=PageInfo{pageNum=1, pageSize=5, size=5, startRow=1, endRow=5, total=5000, pages=1000, list=Page{count=true, pageNum=1, pageSize=5, startRow=0, endRow=5, total=5000, pages=1000, reasonable=true, pageSizeZero=false}[Student [id=1, name=习近平, age=99, date=Fri Aug 31 12:23:37 CST 2018], Student [id=3, name=高晓松2, age=26, date=Fri Aug 31 12:23:37 CST 2018], Student [id=4, name=高晓松3, age=26, date=Fri Aug 31 12:23:37 CST 2018], Student [id=5, name=高晓松4, age=26, date=Fri Aug 31 12:23:37 CST 2018], Student [id=6, name=高晓松5, age=26, date=Fri Aug 31 12:23:37 CST 2018]], prePage=0, nextPage=2, isFirstPage=true, isLastPage=false, hasPreviousPage=false, hasNextPage=true, navigatePages=6, navigateFirstPage=1, navigateLastPage=6, navigatepageNums=[1, 2, 3, 4, 5, 6]}}]
		return AjaxMsg.ajaxResultSuccess().addResultMap("pageInfo", pageInfo);
	
		/**
		 * .解释上面一句话
		 * AjaxMsg.ajaxResultSuccess()返回一个AjaxMsg对象，等于操作了AjaxMsg ajaxMsg = new AjaxMsg（）操作。
		 * AjaxMsg.ajaxResultSuccess().addResultMap("pageInfoJson", pageInfo);等于ajaxMsg.addResultMap("pageInfoJson", pageInfo);所以两次对同一个AjaxAMsg对象进行的操作，并且addResultMap也无需是静态方法
		 *
		 *.返回json的结果：总的是AjaxMsg对象格式，并且附带了很多分页信息，javabean格式与json格式基本一致，所以很容易相互转换
		 *{
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
		 
	}
	
 
	
}
