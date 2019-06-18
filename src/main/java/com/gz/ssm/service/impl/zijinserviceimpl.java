package com.gz.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gz.ssm.dao.zijinMapper;  
import com.gz.ssm.entity.kemu;
import com.gz.ssm.entity.zijin;
import com.gz.ssm.entity.zjxq;
import com.gz.ssm.service.zijinservice;

@Service
public class zijinserviceimpl implements zijinservice {
	@Autowired
	private zijinMapper EE;

	public List<zijin> listAll() {  
		return EE.listAll();

	}

	public List<zijin> listAllOrder(String xxxx,int id) {
		// TODO Auto-generated method stub
		return EE.listAllOrder(xxxx,id);
	}

	public int deleteByPrimaryKey(Integer id) {
		return EE.deleteByPrimaryKey(id);
	}

	@Override
	public int insertSelective(zijin record) {
		// TODO Auto-generated method stub
		return EE.insert(record);
	}

	@Override
	public int insert(zijin record) {
		// TODO Auto-generated method stub
		return  EE.insert(record);
	}

}
