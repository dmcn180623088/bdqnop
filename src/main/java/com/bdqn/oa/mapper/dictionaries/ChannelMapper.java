package com.bdqn.oa.mapper.dictionaries;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bdqn.oa.pojo.dictionaries.Channel;

public interface ChannelMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Channel record);

    int insertSelective(Channel record);

    Channel selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Channel record);

    int updateByPrimaryKey(Channel record);

	List<Channel> getChannelParentListByPidIsZero();

	List<Channel> getChildrenListByPid(@Param("pid")Integer pid);
}