package com.bdqn.oa.vo;

import java.util.Arrays;

import com.bdqn.oa.pojo.system.role.Role;

public class RolePermissionVo {
	private Role role;
	private String[] permission;
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	public String[] getPermission() {
		return permission;
	}
	public void setPermission(String[] permission) {
		this.permission = permission;
	}
	@Override
	public String toString() {
		return "RolePermissionVo [role=" + role + ", permission=" + Arrays.toString(permission) + "]";
	}
	
}
