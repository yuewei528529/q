package com.gz.ssm.dao;
 
import static org.junit.jupiter.api.Assertions.*;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.gz.ssm.entity.Student;

/**
 * ♀描述：测试dao层关于数据库操作工作
 * 
 * .功能： 
 * 
 * .配置： 在pom.xml中添加org.junit.jupiter等3个junit5依赖，添加spring-test依赖。
 * 
 * .执行： test方法上，Run as-》JUnit test测试
 * 
 * .注意： 
 * 
 * @author gz
 * @version 1.0 2018-8-28
 */
//Spring整合Junit5进行单元测试。为了便于使用spring的依赖注入，
@ExtendWith(SpringExtension.class)//@ExtendWith(SpringExtension.class)//是junit4
//导入spring的配置文件
@ContextConfiguration(locations= {
		"classpath:/spring_config.xml"
})
public class MapperTest {

	@Autowired
	private StudentMapper studentMapper;
	
	@Autowired
	private SqlSession sqlSession;
 
 
	//单条插入测试
    @Test
	void testInsertOne() throws Exception {
    	 
    	 System.out.println(studentMapper);
    	 
         Date date = new Date(); 
    	 long longTime = date.getTime();
         Timestamp timestamp = new Timestamp(longTime); 
         System.out.println(new Date());
         
         //插入操作
         Student student = new Student("景强章", 26, timestamp);
    	 studentMapper.insertSelective(student);
    	 System.out.println("新增学生id是：" + student.getId());
	}
    
    //多条插入测试（性能差，插入1000条耗时52468 ms，用下面的testInsertMore2方法代替批量插入）
    /**
     * .比如插入3条数据，要使用3条sql，所以效率批量很低
     * DEBUG [main] - ==>  Preparing: insert into student ( name, age, date ) values ( ?, ?, ? ) 
		DEBUG [main] - ==> Parameters: 景强章0(String), 26(Integer), 2018-09-01 11:36:51.692(Timestamp)
		DEBUG [main] - <==    Updates: 1
		DEBUG [main] - ==>  Preparing: insert into student ( name, age, date ) values ( ?, ?, ? ) 
		DEBUG [main] - ==> Parameters: 景强章1(String), 26(Integer), 2018-09-01 11:36:51.692(Timestamp)
		DEBUG [main] - <==    Updates: 1
		DEBUG [main] - ==>  Preparing: insert into student ( name, age, date ) values ( ?, ?, ? ) 
		DEBUG [main] - ==> Parameters: 景强章2(String), 26(Integer), 2018-09-01 11:36:51.692(Timestamp)
		DEBUG [main] - <==    Updates: 1
     * @throws Exception
     */
    @Test
	void testInsertMore() throws Exception {
    	
    	Date date = new Date(); 
    	long longTime = date.getTime();
        Timestamp timestamp = new Timestamp(longTime); 
        
    	Student student ;
    	
		//记录执行时间
		long beginMillis = System.currentTimeMillis();
    	for(int i=0;i<1000;i++) {
    		student=new Student("景强章"+i, 26, timestamp);
    		studentMapper.insertSelective(student);
    	}
    	
    	System.out.println("批量插入完成，用时：" + (System.currentTimeMillis()-beginMillis) +" ms");
	}
     
	//批量插入测试（推荐，高效），插入1000条仅用时：331 ms
    /**
     * 	批量插入组合成一条sql，所以效率高出很多
		DEBUG [main] - ==>  Preparing: insert into student (name, age, date) values (?,?,?) , (?,?,?) , (?,?,?) 
		DEBUG [main] - ==> Parameters: 高晓松0(String), 26(Integer), 2018-09-01 11:37:44.477(Timestamp), 高晓松1(String), 26(Integer), 2018-09-01 11:37:44.477(Timestamp), 高晓松2(String), 26(Integer), 2018-09-01 11:37:44.477(Timestamp)
		DEBUG [main] - <==    Updates: 3
		DEBUG [main] - ==>  Preparing: SELECT LAST_INSERT_ID() 
		DEBUG [main] - ==> Parameters: 
		DEBUG [main] - <==      Total: 1
     * @throws Exception
     */
	@Test
	void testInsertMore2() throws Exception {
		
		Date date = new Date(); 
    	long longTime = date.getTime();
        Timestamp timestamp = new Timestamp(longTime); 

        List<Student> list = new ArrayList<Student>();
    	//记录执行时间
		long beginMillis = System.currentTimeMillis();
    	
 
    	for(int i=0;i<1000;i++) {
    		list.add(new Student("高晓松"+i, 26, timestamp));
    	}
    	long  resultNu=studentMapper.insertBatch(list); //一次性插入，不是一条一条插入，所以效率高
     
    	//StudentMapper mapper = sqlSession.getMapper(StudentMapper.class);
    	//System.out.println(mapper.insertBatch(list));
    	
    	
 
    	System.out.println("批量插入数量：" + resultNu +"，用时：" + (System.currentTimeMillis()-beginMillis) +" ms");
	}
	
	
	//修改测试
	@Test
	void testUpdate() throws Exception {
		Student student =new Student();
		student.setId(1L);//修改的id
		student.setName("习近平");
		student.setAge(99);
		
		int resultNum=studentMapper.updateByExampleSelective(student);
		if(resultNum>0) {
			System.out.println("修改成功，影响的行数为：" + resultNum);
		}
 
	}
	
	//删除测试
	@Test
	void testDelete() throws Exception {
		long deleteId=112;
		int resultNum=studentMapper.deleteByExample(deleteId);
		if(resultNum>0) {
			System.out.println("删除成功，影响的行数为：" + resultNum);
		}
	}
	
	//查询总数测试
	@Test
	void testCount() throws Exception {
		System.out.println("总数为：" + studentMapper.countByExample());
	}
	
	//查询按条件测试（模糊 + 排序）
	@Test
	void testList() throws Exception {
		Student student =new Student();
		student.setName("德");//模糊搜索
		List<Student> list = studentMapper.selectByExample(student, "name DESC");//排序
		System.out.println("查询数量"+list.size());
		System.out.println(list);
	}
	
	//查询所有测试
	@Test
	void testListAll() throws Exception {
		List<Student> list=studentMapper.listAll();
		System.out.println(list.size());
	}
 
	
	
	
	
	
}
