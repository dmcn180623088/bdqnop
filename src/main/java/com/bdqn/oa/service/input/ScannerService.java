package com.bdqn.oa.service.input;

import com.bdqn.oa.utils.ResponseData;
import com.bdqn.oa.vo.UserStudentVo;

public interface ScannerService {

	ResponseData<UserStudentVo> getList(Integer pageNumber,Integer pageSize,Integer grade, Integer backMsg,
			Integer toHome,Integer classification,Integer user1,Integer user2,Integer user3,Integer channel,Integer source,
			Integer education,Integer stiuation,Integer enroll,String address,String nickName);

}
