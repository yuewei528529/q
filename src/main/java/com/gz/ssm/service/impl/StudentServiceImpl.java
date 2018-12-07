package com.gz.ssm.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gz.ssm.dao.StudentMapper;
import com.gz.ssm.entity.Student;
import com.gz.ssm.service.StudentService;

@Service
public class StudentServiceImpl implements StudentService{

	@Autowired
	private StudentMapper studentMapper;
	
	
	@Override
	public List<Student> listAll() {
		
		return studentMapper.listAll();
	}

	@Override
	public List<Student> listAllOrder(String sort,String sortOrder,String searchName,String searchBeginDate,String searchEndDate) {
		return studentMapper.listAllOrder(sort,sortOrder,searchName,searchBeginDate,searchEndDate);
	}
	
	//插入学生，并返回新增id
	@Override 
	public Long insert(Student student) {
		//System.out.println("s"+student);
		//return studentMapper.insertSelective(student);
		return studentMapper.insert(student);
	}

	@Override
	public Long countByName(Student student) {
		return studentMapper.countByExample(student);
	 
	}

	@Override
	public Student updateShow(Long id) {
		
		return studentMapper.selectByPrimaryKey(id);
	}

	@Override
	public Integer update(Student student) {
		
		return studentMapper.updateByExampleSelective(student);
	}

	@Override
	public Integer delete(Long id) {
		 
		return studentMapper.deleteByExample(id);
	}
 

	//批量删除学生（将list结合传递个mybatis批量删除）
	public Integer deleteBanch(String delete_id_banch) {
		//System.out.println(delete_id_banch);//27,28,29,30,31
		
		//将字符串转成List<Integer>集合（第一步：将字符串转成字符串数组，第二步：将字符串数组转成数值型list集合）
		List<Integer> list=new ArrayList<>();
		String[] strArray=delete_id_banch.split(",");
		for(String tmp :strArray) {
			list.add(Integer.parseInt(tmp));
		}
//		for(Integer tmp : list) {
//			System.out.println(tmp);
//			System.out.println(tmp.getClass());//class java.lang.Integer是数字类型了。
//		}
		/**
		 *  1
			2
			3
			4
			6
		 */
		return studentMapper.deleteByExampleBanch(list);
	}

 
 


 

}
