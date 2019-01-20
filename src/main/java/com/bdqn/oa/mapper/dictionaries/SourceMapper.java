package com.bdqn.oa.mapper.dictionaries;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bdqn.oa.pojo.dictionaries.Source;

public interface SourceMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Source record);

    int insertSelective(Source record);

    Source selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Source record);

    int updateByPrimaryKey(Source record);

	List<Source> getSourceListByPidIsZero();

	List<Source> getChildrenListByPid(@Param("pid")Integer pid);
}