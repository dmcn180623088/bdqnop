package com.bdqn.oa.service.system.permission.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bdqn.oa.mapper.system.permission.PermissionMapper;
import com.bdqn.oa.pojo.system.permission.Permission;
import com.bdqn.oa.pojo.system.user.User;
import com.bdqn.oa.service.system.permission.PermissionService;

@Service
@Transactional
public class PermissionServiceImpl implements PermissionService {
	
	@Autowired
	private PermissionMapper permissionMapper;
	
	@Override
	public List<Permission> findPermissionByUser(User user){
		if("admin".equals(user.getUsername())) {
			return permissionMapper.findAllPermissionList();
		}else {
			return permissionMapper.findPermissionListByUserId(user.getId());
		}
	}

	@Override
	public List<Permission> getAll() {
		return permissionMapper.findAllPermissionList();
	}

}
