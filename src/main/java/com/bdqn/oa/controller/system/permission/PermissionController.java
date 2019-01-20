package com.bdqn.oa.controller.system.permission;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bdqn.oa.pojo.system.permission.Permission;
import com.bdqn.oa.service.system.permission.PermissionService;

@Controller
@RequestMapping("/permission")
public class PermissionController {
	
	@Autowired PermissionService permissionService;
	
	//查询所有权限
	@RequestMapping("/get/list")
	@ResponseBody
	public List<Permission> getAll(){
		return permissionService.getAll();
	}
}
