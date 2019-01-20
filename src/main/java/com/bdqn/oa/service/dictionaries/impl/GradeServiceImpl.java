package com.bdqn.oa.service.dictionaries.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bdqn.oa.mapper.dictionaries.GradeMapper;
import com.bdqn.oa.pojo.dictionaries.Grade;
import com.bdqn.oa.service.dictionaries.GradeService;

@Service
@Transactional
public class GradeServiceImpl implements GradeService {

	@Autowired
	private GradeMapper gradeMapper;

	@Override
	public List<Grade> getListByNoPage() {
		return gradeMapper.getListByNoPage();
	}
}
