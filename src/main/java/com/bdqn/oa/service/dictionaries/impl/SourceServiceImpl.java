package com.bdqn.oa.service.dictionaries.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bdqn.oa.mapper.dictionaries.SourceMapper;
import com.bdqn.oa.pojo.dictionaries.Source;
import com.bdqn.oa.service.dictionaries.SourceService;
import com.bdqn.oa.vo.ResultVo;

@Service
@Transactional
public class SourceServiceImpl implements SourceService {

	@Autowired
	private SourceMapper sourceMapper;

	@Override
	public List<ResultVo<Source>> getSourceListByNoPage() {
		
		List<ResultVo<Source>> voList = new ArrayList<ResultVo<Source>>();
		
		List<Source> source = sourceMapper.getSourceListByPidIsZero();
		for (Source parent : source) {
			ResultVo<Source> vo = new ResultVo<Source>();
			vo.setParentName(parent.getSourceName());
			List<Source> children = sourceMapper.getChildrenListByPid(parent.getId());
			vo.setChildChannelList(children);
			
			voList.add(vo);
		}
		
		return voList;
	}
}
