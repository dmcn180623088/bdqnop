package com.bdqn.oa.controller.dictionaries;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bdqn.oa.pojo.dictionaries.Source;
import com.bdqn.oa.service.dictionaries.SourceService;
import com.bdqn.oa.vo.ResultVo;

@Controller
@RequestMapping("/source")
public class SourceController {

	@Autowired
	private SourceService sourceService;
	
	
	@RequestMapping("/get/nopage")
	@ResponseBody
	public List<ResultVo<Source>> getSourceListByNoPage(){
		return sourceService.getSourceListByNoPage();
	}
}
