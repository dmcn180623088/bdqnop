package com.bdqn.oa.mapper.system;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bdqn.oa.pojo.system.RoleAndPermissionKey;

public interface RoleAndPermissionMapper {
    int deleteByPrimaryKey(RoleAndPermissionKey key);

    int insert(RoleAndPermissionKey record);

    int insertSelective(RoleAndPermissionKey record);

	List<Integer> getPermissionIdsByRoleId(@Param("id")Integer id);

	void delectByRoleId(@Param("roleId")Integer roleId);
}