package com.bdqn.oa.controller.dictionaries;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bdqn.oa.pojo.dictionaries.Education;
import com.bdqn.oa.service.dictionaries.EducationService;

@Controller
@RequestMapping("/education")
public class EducationController {

	
	@Autowired
	private EducationService educationService;
	
	@RequestMapping("/get/nopage")
	@ResponseBody
	public List<Education> getEducationListByNoPage(){
		return educationService.getEducationListByNoPage();
	}
}
