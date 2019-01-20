package com.bdqn.oa.realm;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bdqn.oa.pojo.system.permission.Permission;
import com.bdqn.oa.pojo.system.role.Role;
import com.bdqn.oa.pojo.system.user.User;
import com.bdqn.oa.service.system.permission.PermissionService;
import com.bdqn.oa.service.system.role.RoleService;
import com.bdqn.oa.service.system.user.UserService;


@Service("userRealm")
public class UserRealm extends AuthorizingRealm{

    
	@Autowired
    private RoleService roleService;
    
    @Autowired
    private PermissionService permissionService;
    
    
    @Autowired
    private UserService userService;
   
    /**
     * 
    * @Title: doGetAuthorizationInfo 
    * @Description: 授权
    * @param pc
    * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection pc) {
    	
    	
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        // 根据当前用户查询对应角色和权限
        Subject subject = SecurityUtils.getSubject();
        
        // 获得当前用户
        User user = (User) subject.getPrincipal();
        // 调用业务层,查询当前用户的角色
        List<Role> roles = roleService.findRoleByUser(user);
        // 给当前用户授权(角色)
        for (Role role : roles) {
            authorizationInfo.addRole(role.getKeyword());
        }

        // 调用业务层,查询当前用户的权限
        List<Permission> permissions = permissionService.findPermissionByUser(user);

        // 给当前用户授权(权限)
        for (Permission permission : permissions) {
            authorizationInfo.addStringPermission(permission.getKeyword());
        }
        
        return authorizationInfo;
    }

    /**
     * 
    * @Title: doGetAuthenticationInfo 
    * @Description: 认证
    * @param token
    * @return
    * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
    	 UsernamePasswordToken usernamePasswordToken = (UsernamePasswordToken) token;
         
         String username = usernamePasswordToken.getUsername();
         
      	// 根据用户名查询用户信息
         User user = userService.findUserByUsername(username);

         if (user != null) {
         	//取出当前用户密码的颜值，对输入密码进行加密
             ByteSource credentialsSalt = ByteSource.Util.bytes(user.getSalt());
             return new SimpleAuthenticationInfo(user,  user.getPassword(), credentialsSalt, getName());
         } else {
         	//用户不存在
            throw new AuthenticationException();
         }
    }
}