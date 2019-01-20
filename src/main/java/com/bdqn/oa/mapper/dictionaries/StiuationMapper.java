package com.bdqn.oa.mapper.dictionaries;

import java.util.List;

import com.bdqn.oa.pojo.dictionaries.Stiuation;

public interface StiuationMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Stiuation record);

    int insertSelective(Stiuation record);

    Stiuation selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Stiuation record);

    int updateByPrimaryKey(Stiuation record);

	List<Stiuation> getStiuationListByNoPage();
}