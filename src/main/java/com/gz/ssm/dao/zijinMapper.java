package com.gz.ssm.dao;

import java.util.List;

import com.gz.ssm.entity.zijin;

public interface zijinMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table zijin
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table zijin
     *
     * @mbggenerated
     */
    int insert(zijin record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table zijin
     *
     * @mbggenerated
     */
    int insertSelective(zijin record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table zijin
     *
     * @mbggenerated
     */
    zijin selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table zijin
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(zijin record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table zijin
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(zijin record);

	List<zijin> listAllOrder(String xxxx, int id);

	List<zijin> listAll();
}