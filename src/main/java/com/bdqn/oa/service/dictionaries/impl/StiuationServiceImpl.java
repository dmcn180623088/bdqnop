package com.bdqn.oa.service.dictionaries.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bdqn.oa.mapper.dictionaries.StiuationMapper;
import com.bdqn.oa.pojo.dictionaries.Stiuation;
import com.bdqn.oa.service.dictionaries.StiuationService;

@Service
@Transactional
public class StiuationServiceImpl implements StiuationService {

	@Autowired
	private StiuationMapper stiuationMapper;

	@Override
	public List<Stiuation> getStiuationListByNoPage() {
		return stiuationMapper.getStiuationListByNoPage();
	}
}
