package com.bdqn.oa.mapper.dictionaries;

import java.util.List;

import com.bdqn.oa.pojo.dictionaries.Grade;

public interface GradeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Grade record);

    int insertSelective(Grade record);

    Grade selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Grade record);

    int updateByPrimaryKey(Grade record);

	List<Grade> getListByNoPage();
}