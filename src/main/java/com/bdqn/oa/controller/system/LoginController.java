package com.bdqn.oa.controller.system;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bdqn.oa.pojo.system.user.User;
import com.bdqn.oa.service.system.user.UserService;


@Controller
public class LoginController {

	@Autowired
	private UserService userService;
	
	
	@RequestMapping("/ln")
	@ResponseBody
	public Map<String,Object> toLogin(User user,HttpSession session){
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		if(user.getUsername() == null) {
			map.put("type", true);
			map.put("message", "用户名不能为空");
			return map;
		}
		
		if(user.getPassword() == null) {
			map.put("type", true);
			map.put("message", "密码不能为空");
			return map;
		}
		
		Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(user.getUsername(),user.getPassword());
        
        try {
			subject.login(token);
			if(subject.isAuthenticated()) {
				//任意页调用user
				User checkUser = userService.findUserByUsername(user.getUsername());
				//校验用户是不是临时用户
				if("0".equals(checkUser.getIsTemp())) {
					map.put("type", true);
					map.put("message", "对不起,临时用户无法登录系统");
					return map;
				}
				session.setAttribute("user", checkUser);
				map.put("type", false);
				return map;
			}
		}catch(IncorrectCredentialsException ice){  
			map.put("type", true);
			map.put("message", "密码不正确");
			return map;
        }catch(LockedAccountException lae){  
        	map.put("type", true);
			map.put("message", "账户已锁定");
			return map;
        }catch(ExcessiveAttemptsException eae){  
        	map.put("type", true);
			map.put("message", "密码输入错误的次数过多");
			return map;
        }catch(AuthenticationException ae){  
            //通过处理Shiro的运行时AuthenticationException就可以控制用户登录失败或密码错误时的情景  
        	map.put("type", true);
			map.put("message", "用户或密码不正确");
			return map;
        }
        map.put("type", true);
		return map;
	}
	
	@RequestMapping("/login")
	public String initIndex(HttpSession session) {
		
		if(session.getAttribute("user") == null) {
			return "login";
		}
		
		return "index";
	}
	
	@RequestMapping("/exit")
	public String exit(HttpSession session) {
		session.removeAttribute("user");
		return "login";
	}
	
	
	@RequestMapping("/toLogin")
	public String initLoginView(HttpSession session) {
		return "login";
	}
	
	@RequestMapping("/to404")
	public String init404() {
		return "404";
	}
	
	@RequestMapping("/aboutUs")
	public String aboutUs() {
		return "team";
	}
	
	
}
