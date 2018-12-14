package com.gz.ssm.entity;
/**
 * ♀描述：学生模块实体类
 * 
 * -要求：数据类型不能是基础数据类型（int要用Integer，long要用Long），否则在springMVC获取对象作为参数的时候会出错，见《05、SpringMVC自己学习》中传入参数原理。
 * 
 * -校验：使用的是JSR303后端验证，@Pattern表示使用自定义的正则来进行验证
 * 
 * -日期：直接将两个 @DateTimeFormat，@JsonFormat贴到datetime类型上即可。
 * 
 * @author gz
 * @version 1.0 2018-8-28
 */
import java.util.Date;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;



public class Student {
	
    public Student() {
		super();
	}

	public Student(String name, Integer age, Date date,String hetongjiner,
			String xiangmumc,String shoukdanw,String yongtu,String fukuanbili,String yifujiner,String yifubili,String yuer
			,String hetongbh,String danw,String shuliang,String danjia,String kaipjiner,String sjjhq,String id1) {
		super();
		this.name = name;
		this.age = age;
		this.date = date;
		this.hetongjiner = hetongjiner;
		this.xiangmumc = xiangmumc;		
		this.shoukdanw = shoukdanw;		
		this.yongtu = yongtu;	
		this.fukuanbili = fukuanbili;	
		this.yifujiner = yifujiner;		
		this.yifubili = yifubili;		
		this.yuer = yuer;	
		this.hetongbh = hetongbh;	
		this.danw = danw;	
		this.shuliang = shuliang;	
		this.danjia = danjia;	
		this.kaipjiner = kaipjiner;	
		this.sjjhq = sjjhq;
		this.id1 = id1;
	}
	private String hetongjiner;
	private Long id;
    private String xiangmumc;
    private String shoukdanw;
    private String yongtu;
    private String fukuanbili;
    private String yifujiner;
    private String yifubili;
    private String yuer;  
    private String    hetongbh;
    private String danw;  
    private String shuliang;  
    private String danjia;  
    private String kaipjiner;  
    private String sjjhq;  
    private String id1;    
	//String类型使用正则来验证比较合适，验证的内容必须符合数据类型，不然报错
	@Pattern(regexp="^[a-zA-Z0-9_-]{4,16}$",message="用户名可以是4-16位字母或数字组成(后端jsr303验证）")
    private String name;
	
	//错误写法：@Pattern(regexp="^\\d$",message="年龄必须是正整数（后端jsr303验证）")，问题：Integer属性上加了不属于整型的校验，比如@NotEmpty,@Length等
    @NotNull(message="年龄必须是正整数（后端jsr303验证1）")
	@Min(value=1,message="年龄必须是正整数（后端jsr303验证2）")
    private Integer age;
    
    /**
     * Date类型格式 （入参转换，出参转换）
     * 
     * .核心思想：java是强语言，类型必须严格符合要求，要存入数据库字段为datetime类型的，就必须是Date类型，其他类型都不成，会报错，所以用到这里的转化类型。
     * 
     * .功能：（1：入参）将前端页面传入String类型的日期（“2018-08-10 13:08:20”）转换成Date类型（Fri Aug 10 13:08:20 CST 2018）存入数据库datetime类型字段。
     * 		    （2：出参）读出数据库Date类型（Fri Aug 10 13:08:20 CST 2018），在前端页面jsp通过<fmt:formatDate value="${item.date}" pattern="yyyy-MM-dd HH:mm:ss"/>将Date类型转成字符串日期值2018-09-01 00:38:21进而显示出来。
     * 		    （3：出参，仅在返回内容为JSON格式下使用）需配合控制器@ResponseBody注解使用。读出数据库Date类型（Fri Aug 10 13:08:20 CST 2018），经过@ResponseBody注解成为JSON格式，值变成了1535733501000，再通过这里的@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")注解，将1535733501000转成字符串日期值2018-09-01 00:38:21进而显示出来。
     * 
     * .注意： (1)注意 @DateTimeFormat(pattern="yyyy:MM:dd HH:mm:ss")后面的格式，传入的String类型时间也必须完全符合其格式才可以，比如2018:09:10 07:23:34，格式可以修改，但是必须保持一致。
     * 		  (2)本控制器增强必须被mvc.xml中IoC注解解析器扫描到，用于增强使用了@RequestMapping的处理器。
     * 
     * .原理： 当提交表单时，controller会把表单元素注入到command类里，但是系统注入的只能是基本类型，如int，char，String。但当我们在command类里需要复杂类型，如Integer，date，或自己定义的类时，controller就不会那么聪明了。这时，就需要我们帮助他们了。
     *
     * .例子：studentListJson.jsp新增会员有用到这个增强类。
     * 
     */
    //前端-》后端。前端页面传递过来是String类型时间（“2018-08-10 13:08:20”）通过本注解转成Date格式时间（Fri Aug 10 13:08:20 CST 2018）后再传递给后台进而存入数据库（数据库中date是datetime类型）【这就是强语言特点，数据库要存入的是Date类型，就必须先把String类型转成Date类型后操作，不然报错】。
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    //后端-》前端（仅在返回JSON格式时起作用）。前端页面在js代码中调用date参数的时候【item.date执行的就是getDate（）方法】执行【本注解也可以放到getDate（）上）】，将JSON格式的时间1535733501000【后台读出去的date是Date类型，值为Fri Aug 10 13:08:20 CST 2018，经过@ResponseBody转成了JSON格式】转换成string类型2018-09-01 00:38:21进而显示出来。
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")//东八区向前加8小时
    @NotNull(message="日期不能为空（后端jsr303验证1）")
    private Date date;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
    public String gethetongjiner() {
        return hetongjiner;
    }

    public void sethetongjiner(String hetongjiner) {
        this.hetongjiner = hetongjiner;
    }
    
    public String getxiangmumc() {
        return xiangmumc;
    }

    public void setxiangmumc(String xiangmumc) {
        this.xiangmumc = xiangmumc;
    }    
    
    public String getshoukdanw() {
        return shoukdanw;
    }

    public void setshoukdanw(String shoukdanw) {
        this.shoukdanw = shoukdanw;
    }
    public String getyongtu() {
        return yongtu;
    }

    public void setyongtu(String yongtu) {
        this.yongtu = yongtu;
    }
    public String getfukuanbili() {
        return fukuanbili;
    }

    public void setfukuanbili(String fukuanbili) {
        this.fukuanbili = fukuanbili;
    }
    
    public String getyifujiner() {
        return yifujiner;
    }

    public void setyifujiner(String yifujiner) {
        this.yifujiner = yifujiner;
    }
    
    public String getyuer() {
        return yuer;
    }

    public void setyuer(String yuer) {
        this.yuer = yuer;
    }  
    
    
    public String getyifubili() {
        return yifubili;
    }

    public void setyifubili(String yifubili) {
        this.yifubili = yifubili;
    }  
    
    public String gethetongbh() {
        return hetongbh;
    }

    public void sethetongbh(String hetongbh) {
        this.hetongbh = hetongbh;
    }  
    
    public String getdanw() {
        return danw;
    }

    public void setdanw(String danw) {
        this.danw = danw;
    }     
    
    public String getshuliang() {
        return shuliang;
    }

    public void setshuliang(String shuliang) {
        this.shuliang = shuliang;
    }    
    
    public String getdanjia() {
        return danjia;
    }

    public void setdanjia(String danjia) {
        this.danjia = danjia;
    }      
    public String getkaipjiner() {
        return kaipjiner;
    }

    public void setkaipjiner(String kaipjiner) {
        this.kaipjiner = kaipjiner;
    }     
    
    public String getsjjhq() {
        return sjjhq;
    }

    public void setsjjhq(String sjjhq) {
        this.sjjhq = sjjhq;
    }    
    
    public String getid1() {
        return id1;
    }

    public void setid1(String id1) {
        this.id1 = id1;
    }       
	@Override
	public String toString() {
		return "Student [id=" + id + ", name=" + name + ", age=" + age + ", date=" + date + "]"+", hetongbh="+hetongbh;
	}
    
    
}