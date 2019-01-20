package com.bdqn.oa.controller.dictionaries;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bdqn.oa.pojo.dictionaries.Channel;
import com.bdqn.oa.service.dictionaries.ChannelService;
import com.bdqn.oa.vo.ResultVo;

//渠道
@Controller
@RequestMapping("/channel")
public class ChannelController {

	@Autowired
	private ChannelService channelService;
	
	@RequestMapping("/get/nopage")
	@ResponseBody
	public List<ResultVo<Channel>> getChannelListByNoPage(){
		return channelService.getChannelListByNoPage();
	}
}
