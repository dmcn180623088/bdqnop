package com.bdqn.oa.vo;

import java.util.ArrayList;
import java.util.List;


public class ResultVo<T> {
	
	private String parentName;
	
	private List<T> childChannelList = new ArrayList<>();

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}

	public List<T> getChildChannelList() {
		return childChannelList;
	}

	public void setChildChannelList(List<T> childChannelList) {
		this.childChannelList = childChannelList;
	}
}
