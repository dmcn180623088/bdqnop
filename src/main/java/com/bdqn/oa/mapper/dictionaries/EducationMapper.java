package com.bdqn.oa.mapper.dictionaries;

import java.util.List;

import com.bdqn.oa.pojo.dictionaries.Education;

public interface EducationMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Education record);

    int insertSelective(Education record);

    Education selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Education record);

    int updateByPrimaryKey(Education record);

	List<Education> getEducationListByNoPage();
}