package com.bdqn.oa.controller.system.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bdqn.oa.pojo.system.user.User;
import com.bdqn.oa.service.system.user.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	@RequestMapping("/get/nopage/{identity}")
	@ResponseBody
	public List<User> getUserListByIdentity(@PathVariable("identity")String identity){
		return userService.getUserListByIdentity(identity);
	}
	
	@RequestMapping("/get/info/{id}")
	public String toInfoView(@PathVariable("id")Integer id) {
		return "input/user_info";
	}
}
