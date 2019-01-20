package com.bdqn.oa.service.system.user;

import java.util.List;

import com.bdqn.oa.pojo.system.user.User;

public interface UserService {

	User findUserByUsername(String username);

	List<User> getUserListByIdentity(String identity);

}
