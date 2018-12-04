package com.gz.ssm.dao;

import com.gz.ssm.entity.Student;

import java.util.Date;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface StudentMapper {
 

    Long insert(Student record);

    Long insertSelective(Student record);

    Long  insertBatch(@Param("studentList")List<Student> list);
    
    int updateByExampleSelective(Student record);
    
    int deleteByExample(@Param("id")Long id);
    
    Long countByExample();
    
    List<Student> selectByExample(@Param("student")Student record,@Param("orderByClause")String orderByClause);
    
    List<Student> listAll();
    
    List<Student> listAllOrder(@Param("sort")String sort,@Param("sortOrder")String sortOrder,@Param("searchName")String searchName,@Param("searchBeginDate")String searchBeginDate,@Param("searchEndDate")String searchEndDate);

    Long countByExample(Student student);
    
    Student selectByPrimaryKey(@Param("id")Long id);

	Integer deleteByExampleBanch(@Param("idList") List<Integer> list);
}