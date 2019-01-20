package com.bdqn.oa.mapper.dictionaries;

import java.util.List;

import com.bdqn.oa.pojo.dictionaries.Classification;

public interface ClassificationMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Classification record);

    int insertSelective(Classification record);

    Classification selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Classification record);

    int updateByPrimaryKey(Classification record);

	List<Classification> getClassificationListByNoPage();
}