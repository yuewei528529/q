package com.gz.ssm.other;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.exception.InvalidConfigurationException;
import org.mybatis.generator.exception.XMLParserException;
import org.mybatis.generator.internal.DefaultShellCallback;

/**
 * ♀描述：MyBatis Generator（MBG）
 * 
 * .功能：逆向工程，根据数据库表反向自动生成（替换）Mapper、Dao、entity（或PO或domain） 
 * 
 * .配置：mbg.xml，log4j2.xml，test/MBGTest.java
 * 
 * .执行：main方法右键，Run as-》Java Application
 * 
 * .注意：会覆盖Mapper、Dao、entity（或PO或domain） 中内容，慎用。
 * 
 * @author gz
 * @version 1.0 2018-8-28
 */
public class MBGTest {
	
	public static void main(String[] args) throws IOException, XMLParserException, InvalidConfigurationException, SQLException, InterruptedException {
		 
		   try {
			   List<String> warnings = new ArrayList<String>();
			   boolean overwrite = true;
			   File configFile = new File("mbg.xml");
			   ConfigurationParser cp = new ConfigurationParser(warnings);
			   Configuration config = cp.parseConfiguration(configFile);
			   DefaultShellCallback callback = new DefaultShellCallback(overwrite);
			   MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback, warnings);
			   myBatisGenerator.generate(null);
			   
			   System.out.println("MBG逆向工程成功，生成了entity的javabean，dao的mapper接口文件，mapper的mapper.xml文件");
		   }catch (Exception e) {
			 System.err.println("错误信息："+e.getMessage());
		   }
		   
		  
	}
}
