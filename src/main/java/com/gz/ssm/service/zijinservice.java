package com.gz.ssm.service;

import java.util.List;

import com.gz.ssm.entity.kemu;
import com.gz.ssm.entity.zijin;
import com.gz.ssm.entity.zjxq;

public interface zijinservice {
	List<zijin> listAll();

	List<zijin> listAllOrder(String xxxx, int id);

	int deleteByPrimaryKey(Integer id);

	int insertSelective(zijin record);
	int insert(zijin record);

}
