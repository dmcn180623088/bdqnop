package com.bdqn.oa.mapper.system.role;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bdqn.oa.pojo.system.role.Role;

public interface RoleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);

	List<Role> findAllRoleList();

	List<Role> findRoleListByUserId(@Param("userId")Integer userId);

	Integer getCount(@Param("roleName")String roleName);
	
	List<Role> getRoleListByPage(@Param("page")Integer pageNumber, @Param("limit")Integer pageSize, @Param("roleName")String roleName);

	void insertBackPrimaryKey(Role role);

}