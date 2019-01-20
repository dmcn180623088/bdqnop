package com.bdqn.oa.controller.dictionaries;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bdqn.oa.pojo.dictionaries.Grade;
import com.bdqn.oa.service.dictionaries.GradeService;

@Controller
@RequestMapping("/grade")
public class GradeController {

	
	@Autowired
	private GradeService gradeService;
	
	@RequestMapping("/get/nopage")
	@ResponseBody
	public List<Grade> getListByNoPage(){
		return gradeService.getListByNoPage();
	}
}
