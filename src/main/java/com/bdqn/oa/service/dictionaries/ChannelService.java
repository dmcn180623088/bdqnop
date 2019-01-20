package com.bdqn.oa.service.dictionaries;

import java.util.List;

import com.bdqn.oa.pojo.dictionaries.Channel;
import com.bdqn.oa.vo.ResultVo;

public interface ChannelService {

	List<ResultVo<Channel>> getChannelListByNoPage();

}
