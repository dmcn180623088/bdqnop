package com.bdqn.oa.controller.input;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bdqn.oa.service.input.ScannerService;
import com.bdqn.oa.utils.ResponseData;
import com.bdqn.oa.vo.UserStudentVo;

/**咨询录量*/
@Controller
@RequestMapping("/input")
public class ScannerController {

	@Autowired
	private ScannerService scannerService;
	
	
	@RequestMapping("/s/view")
	public String toInputView() {
		return "input/input_list";
	}
	
	@RequestMapping("/get/list")
	@ResponseBody
	public ResponseData<UserStudentVo> getList(Integer pageNumber,Integer pageSize,Integer grade, Integer backMsg,
			Integer toHome,Integer classification,Integer user1,Integer user2,Integer user3,Integer channel,Integer source,
			Integer education,Integer stiuation,Integer enroll,String address,String nickName){
		return scannerService.getList(pageNumber,pageSize,grade,backMsg,toHome,classification,user1,user2,user3,channel
				,source,education,stiuation,enroll,address,nickName);
	}
}
