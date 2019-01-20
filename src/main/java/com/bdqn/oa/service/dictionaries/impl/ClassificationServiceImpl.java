package com.bdqn.oa.service.dictionaries.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bdqn.oa.mapper.dictionaries.ClassificationMapper;
import com.bdqn.oa.pojo.dictionaries.Classification;
import com.bdqn.oa.service.dictionaries.classificationService;

@Service
@Transactional
public class ClassificationServiceImpl implements classificationService {

	@Autowired
	private ClassificationMapper classificationMapper; 
	
	@Override
	public List<Classification> getClassificationListByNoPage() {
		return classificationMapper.getClassificationListByNoPage();
	}

}
