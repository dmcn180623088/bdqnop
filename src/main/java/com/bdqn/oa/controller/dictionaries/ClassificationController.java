package com.bdqn.oa.controller.dictionaries;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bdqn.oa.pojo.dictionaries.Classification;
import com.bdqn.oa.service.dictionaries.classificationService;

@Controller
@RequestMapping("/classification")
public class ClassificationController {

	
	@Autowired
	private classificationService classificationService;
	
	@RequestMapping("/get/nopage")
	@ResponseBody
	public List<Classification> getClassificationListByNoPage(){
		return classificationService.getClassificationListByNoPage();
	}
}
