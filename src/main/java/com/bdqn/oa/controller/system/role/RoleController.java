package com.bdqn.oa.controller.system.role;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bdqn.oa.pojo.system.role.Role;
import com.bdqn.oa.service.system.role.RoleService;
import com.bdqn.oa.utils.ResponseData;

@Controller
@RequestMapping("/role")
public class RoleController {
	
	@Autowired RoleService roleService;
	
	//获取角色页面
	@RequestMapping("/s/view")
	public String toRoleView() {
		return "system/role/role_list";
	}
	//获取角色分页列表
	@RequestMapping("/get/list")
	@ResponseBody
	public ResponseData<Role> getList(Integer pageNumber,Integer pageSize,String roleName){
		return roleService.getList(pageNumber,pageSize,roleName);
	}
	//获取角色添加或修改页面  @PathVariable("id")Integer id
	@RequestMapping("/show/addentity")
	public String toRoleAddView() {
		return "system/role/role_add";
	}
	
	//添加
	@RequestMapping("/add/entity")
	@ResponseBody
	public Map<String,Object> addEntity(Role role,String[] permission){
		return roleService.addEntity(role,permission);
	}
	//根据id获取当前角色拥有的权限id
	@RequestMapping("/get/entity/{id}")
	@ResponseBody
	public List<Integer> getPermissionIdsByRoleId(@PathVariable("id")Integer id){
		return roleService.getPermissionIdsByRoleId(id);
	}
	//修改角色
	@RequestMapping("/edit/entity")
	@ResponseBody
	public Map<String,Object> editEntity(Role role,String[] permission){
		return roleService.editEntity(role,permission);
	}
	//删除角色
	@RequestMapping("/del/entity/{id}")
	@ResponseBody
	public Map<String,Object> delEntity(@PathVariable("id")Integer id){
		return roleService.delEntity(id);
	}
	//修改角色
	@RequestMapping("/opt/entity/{id}")
	@ResponseBody
	public Map<String,Object> optEntity(@PathVariable("id")Integer id){
		return roleService.optEntity(id);
	}
}
