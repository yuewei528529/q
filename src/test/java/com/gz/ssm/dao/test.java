package com.gz.ssm.dao;

import javax.annotation.Resource;

import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.junit.Test;
import org.junit.runner.RunWith;

import com.gz.ssm.entity.zijin;
import com.gz.ssm.service.impl.kemuserviceimpl;

public class test extends basetest {
   private static final Logger logger =  LoggerFactory.getLogger(test.class);
	@Resource
	private kemuMapper aa;
	@Resource
	private kemuserviceimpl aad;
	@Resource
	private zijinMapper zijin;

	@Test
	public void testGetUserById() {
		zijin record=new zijin(null, "444444","","", null, null, null, null, null, null, null, null, null, null, null);
		System.out.println("ddddddddddddddddddddddddd");
		System.out.println(zijin.insert(record));
	}
}
