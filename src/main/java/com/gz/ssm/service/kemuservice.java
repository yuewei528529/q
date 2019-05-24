package com.gz.ssm.service;

import java.util.List;

import com.gz.ssm.entity.Student;
import com.gz.ssm.entity.kemu;

public interface kemuservice {
	List<kemu> listAll();

	List<kemu> listAllOrder(String i,int id);

	int deleteByPrimaryKey(Integer id);

}
