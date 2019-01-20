package com.bdqn.oa.utils;

import java.util.List;

public class ResponseData<T> {

	private Integer count;
	private List<T> data;
	private Integer code;
	private String msg;
	
	public ResponseData(Integer count, List<T> data, Integer code, String msg) {
		super();
		this.count = count;
		this.data = data;
		this.code = code;
		this.msg = msg;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public List<T> getData() {
		return data;
	}
	public void setData(List<T> data) {
		this.data = data;
	}
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
}
