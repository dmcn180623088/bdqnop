package com.bdqn.oa.service.dictionaries.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bdqn.oa.mapper.dictionaries.ChannelMapper;
import com.bdqn.oa.pojo.dictionaries.Channel;
import com.bdqn.oa.service.dictionaries.ChannelService;
import com.bdqn.oa.vo.ResultVo;
@Service
@Transactional
public class ChannelServiceImpl implements ChannelService {

	@Autowired
	private ChannelMapper channelMapper;

	@Override
	public List<ResultVo<Channel>> getChannelListByNoPage() {
		
		List<ResultVo<Channel>> voList = new ArrayList<ResultVo<Channel>>();
		
		List<Channel> channel = channelMapper.getChannelParentListByPidIsZero();
		for (Channel parent : channel) {
			ResultVo<Channel> vo = new ResultVo<Channel>();
			vo.setParentName(parent.getChannelName());
			List<Channel> children = channelMapper.getChildrenListByPid(parent.getId());
			vo.setChildChannelList(children);
			voList.add(vo);
		}
		
		return voList;
		
	}
}
