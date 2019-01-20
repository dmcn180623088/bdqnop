package com.bdqn.oa.service.dictionaries.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bdqn.oa.mapper.dictionaries.EducationMapper;
import com.bdqn.oa.pojo.dictionaries.Education;
import com.bdqn.oa.service.dictionaries.EducationService;

@Service
@Transactional
public class EducationServiceImpl implements EducationService {

	@Autowired
	private EducationMapper educationMapper;

	@Override
	public List<Education> getEducationListByNoPage() {
		return educationMapper.getEducationListByNoPage();
	}
}
