package com.bdqn.oa.service.system.role.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bdqn.oa.mapper.system.RoleAndPermissionMapper;
import com.bdqn.oa.mapper.system.role.RoleMapper;
import com.bdqn.oa.pojo.system.RoleAndPermissionKey;
import com.bdqn.oa.pojo.system.role.Role;
import com.bdqn.oa.pojo.system.user.User;
import com.bdqn.oa.service.base.BaseService;
import com.bdqn.oa.service.system.role.RoleService;
import com.bdqn.oa.utils.ResponseData;

@Service
@Transactional
public class RoleServiceImpl extends BaseService implements RoleService {

	@Autowired
	private RoleMapper roleMapper;
	
	@Autowired
	private RoleAndPermissionMapper roleAndPermissionMapper;
	
	@Override
	public List<Role> findRoleByUser(User user) {

		if("admin".equals(user.getUsername())) {
			return roleMapper.findAllRoleList();
		}else {
			return roleMapper.findRoleListByUserId(user.getId());
		}
	}

	@Override
	public ResponseData<Role> getList(Integer pageNumber,Integer pageSize,String roleName) {
		
		Integer count = roleMapper.getCount(roleName);
		
		List<Role> list = roleMapper.getRoleListByPage((pageNumber-1)*pageSize,pageSize,roleName);
		
		return new ResponseData<Role>(count,list,0,"请求成功");
	}
	//添加
	@Override
	public Map<String, Object> addEntity(Role role, String[] permissionIds) {
		// 获得当前登录的用户
		User user = (User) SecurityUtils.getSubject().getPrincipal();
		role.setCreateTime(new Date());
		role.setMdifyTime(new Date());
		role.setCreateUser(user.getNickName());
		role.setModifyUser(user.getNickName());
		role.setStatus(STRING_NUMBER_ONE);
		role.setProhibition(STRING_NUMBER_ONE);

		roleMapper.insertBackPrimaryKey(role);//插入角色数据到角色表中

		Integer roleId = role.getId();// 主键返回
		
		for (String idStr : permissionIds) {
			Integer permissionId = Integer.parseInt(idStr);

			//保存权限ID和角色ID到中间表
			RoleAndPermissionKey key = new RoleAndPermissionKey();

			key.setPermissionId(permissionId);
			
			key.setRoleId(roleId);

			roleAndPermissionMapper.insert(key);
		}
		
		return createMessageMap(SAVE, SUCCESS);
	}
	//修改
	@Override
	public List<Integer> getPermissionIdsByRoleId(Integer id) {
		List<Integer> permissionIds = roleAndPermissionMapper.getPermissionIdsByRoleId(id);
		return permissionIds;
	}

	@Override
	public Map<String, Object> editEntity(Role role, String[] permissionIds) {
		// 获得当前登录的用户
		User user = (User) SecurityUtils.getSubject().getPrincipal();
		role.setMdifyTime(new Date());
		role.setModifyUser(user.getNickName());
		roleMapper.updateByPrimaryKeySelective(role);
		
		Integer roleId = role.getId();
		
		roleAndPermissionMapper.delectByRoleId(roleId);
		
		for (String idStr : permissionIds) {
			
			Integer permissionId = Integer.parseInt(idStr);
			
			//保存权限ID和角色ID到中间表
			RoleAndPermissionKey key = new RoleAndPermissionKey();

			key.setPermissionId(permissionId);
			
			key.setRoleId(roleId);

			roleAndPermissionMapper.insert(key);
		}
		
		return createMessageMap(EDIT, SUCCESS);
	}

	@Override
	public Map<String, Object> delEntity(Integer id) {
		
		Role role = roleMapper.selectByPrimaryKey(id);
		User user = (User) SecurityUtils.getSubject().getPrincipal();
		role.setMdifyTime(new Date());
		role.setModifyUser(user.getNickName());
		role.setStatus(STRING_NUMBER_ZERO);
		roleMapper.updateByPrimaryKeySelective(role);
		
		return createMessageMap(DEL, SUCCESS);
	}

	@Override
	public Map<String, Object> optEntity(Integer id) {
		Role role = roleMapper.selectByPrimaryKey(id);
		User user = (User) SecurityUtils.getSubject().getPrincipal();
		role.setMdifyTime(new Date());
		role.setModifyUser(user.getNickName());
		
		if(STRING_NUMBER_ZERO.equals(role.getProhibition())) role.setProhibition(STRING_NUMBER_ONE);
		else if(STRING_NUMBER_ONE.equals(role.getProhibition())) role.setProhibition(STRING_NUMBER_ZERO);
		
		roleMapper.updateByPrimaryKeySelective(role);
		return createMessageMap(EDIT, SUCCESS);
	}

}
