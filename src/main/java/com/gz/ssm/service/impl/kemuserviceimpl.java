package com.gz.ssm.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gz.ssm.dao.kemuMapper;
import com.gz.ssm.entity.kemu;
import com.gz.ssm.service.kemuservice;
@Service
public class kemuserviceimpl implements kemuservice {
	@Autowired
	private kemuMapper gg;
	public List<kemu> listAll() {
		return gg.listAll();

	}
	@Override
	public List<kemu> listAllOrder(String searchName,int id) {
		// TODO Auto-generated method stub
		return gg.listAllOrder(searchName, id);
	}
	
	public int deleteByPrimaryKey(Integer id) {
		return gg.deleteByPrimaryKey(id);
	}



	
	}

	

