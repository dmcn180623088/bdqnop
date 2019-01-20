package com.bdqn.oa.mapper.system.permission;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bdqn.oa.pojo.system.permission.Permission;

public interface PermissionMapper {
    
	int deleteByPrimaryKey(Integer id);

    int insert(Permission record);

    int insertSelective(Permission record);

    Permission selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Permission record);

    int updateByPrimaryKey(Permission record);

    List<Permission> findAllPermissionList();

	List<Permission> findPermissionListByUserId(@Param("userId")Integer userId);

}