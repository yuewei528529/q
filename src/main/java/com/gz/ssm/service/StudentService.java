package com.gz.ssm.service;

import java.util.Date;
import java.util.List;

import com.gz.ssm.entity.Student;

public interface StudentService {

	//获取所有student
	List<Student> listAll();
	
	/**
	 * 获取所有student(带分页,带查询）
	 * @param sort 排序内容
	 * @param sortOrder 排序方式
	 * @param searchName 查询姓名
	 * @return
	 */
	List<Student> listAllOrder(String sort,String sortOrder,String searchName,String searchBeginDate,String searchEndDate);
 

	//插入学生信息
	Long insert(Student student);

	//根据条件获取总数
	Long countByName(Student student);

	//修改回显学生信息
	Student updateShow(Long id);

	/**
	 * 修改学生
	 * @param student对象
	 * @return 修改数量
	 */
	Integer update(Student student);

	/**
	 * 删除学生
	 * @param id主键
	 * @return 删除条数
	 */
	Integer delete(Long id);

	/**
	 * 批量删除学生
	 * @param delete_id_banch 删除的id行1，2，3，4，5
	 * @return
	 */
	Integer deleteBanch(String delete_id_banch);

	
	 
}
