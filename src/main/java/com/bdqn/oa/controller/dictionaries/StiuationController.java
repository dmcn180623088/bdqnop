package com.bdqn.oa.controller.dictionaries;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bdqn.oa.pojo.dictionaries.Stiuation;
import com.bdqn.oa.service.dictionaries.StiuationService;

@Controller
@RequestMapping("/stiuation")
public class StiuationController {

	
	@Autowired
	private StiuationService stiuationService;
	
	@RequestMapping("/get/nopage")
	@ResponseBody
	public List<Stiuation> getStiuationListByNoPage(){
		return stiuationService.getStiuationListByNoPage();
	}
}
