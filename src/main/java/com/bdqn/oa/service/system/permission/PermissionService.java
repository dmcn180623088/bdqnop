package com.bdqn.oa.service.system.permission;

import java.util.List;

import com.bdqn.oa.pojo.system.permission.Permission;
import com.bdqn.oa.pojo.system.user.User;

public interface PermissionService {

	List<Permission> findPermissionByUser(User user);
	//查询所有用户信息
	List<Permission> getAll();
	
}
