package com.bdqn.oa.service.system.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bdqn.oa.mapper.system.user.UserMapper;
import com.bdqn.oa.pojo.system.user.User;
import com.bdqn.oa.service.system.user.UserService;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public User findUserByUsername(String username){
		return userMapper.findUserByUsername(username);
	}

	@Override
	public List<User> getUserListByIdentity(String identity) {
		
		return userMapper.getUserListByIdentity(identity);
	}

}
