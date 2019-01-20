package com.bdqn.oa.service.system.role;

import java.util.List;
import java.util.Map;

import com.bdqn.oa.pojo.system.role.Role;
import com.bdqn.oa.pojo.system.user.User;
import com.bdqn.oa.utils.ResponseData;

public interface RoleService {

	List<Role> findRoleByUser(User user);

	ResponseData<Role> getList(Integer pageNumber, Integer pageSize, String roleName);
	//添加一个实体
	Map<String, Object> addEntity(Role role, String[] permissionIds);
	//通过角色id获取权限id
	List<Integer> getPermissionIdsByRoleId(Integer id);

	Map<String, Object> editEntity(Role role, String[] permission);

	Map<String, Object> delEntity(Integer id);

	Map<String, Object> optEntity(Integer id);

}
