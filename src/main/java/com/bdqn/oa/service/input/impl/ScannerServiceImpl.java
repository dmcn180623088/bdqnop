package com.bdqn.oa.service.input.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bdqn.oa.mapper.system.user.UserMapper;
import com.bdqn.oa.service.input.ScannerService;
import com.bdqn.oa.utils.ResponseData;
import com.bdqn.oa.vo.UserStudentVo;

@Service
@Transactional
public class ScannerServiceImpl implements ScannerService {

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public ResponseData<UserStudentVo> getList(Integer pageNumber,Integer pageSize,Integer grade, Integer backMsg,
			Integer toHome,Integer classification,Integer user1,Integer user2,Integer user3,Integer channel,Integer source,
			Integer education,Integer stiuation,Integer enroll,String address,String nickName) {
		
		Integer count = userMapper.getCountByTemp(grade,backMsg,toHome,classification,user1,user2,user3,channel
				,source,education,stiuation,enroll,address,nickName);
		
		List<UserStudentVo> list = userMapper.getUserStudentVoList((pageNumber-1)*pageSize,pageSize,grade,backMsg,toHome,classification,user1,user2,user3,channel
				,source,education,stiuation,enroll,address,nickName);
		
		return new ResponseData<UserStudentVo>(count,list,0,"请求成功");
	}

}
