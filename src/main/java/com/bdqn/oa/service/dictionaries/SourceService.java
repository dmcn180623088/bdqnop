package com.bdqn.oa.service.dictionaries;

import java.util.List;

import com.bdqn.oa.pojo.dictionaries.Source;
import com.bdqn.oa.vo.ResultVo;

public interface SourceService {

	List<ResultVo<Source>> getSourceListByNoPage();

}
