package com.bdqn.oa.vo;

import java.util.HashSet;
import java.util.Set;

public class MenuVo {
	private String title; //标题
	private String icon; //图标
	private boolean spread; //是否默认选中
	private String href;
	private Set<MenuVo> children = new HashSet<MenuVo>();//保存子节点
	public MenuVo() {}
	public MenuVo(String title, String icon,String href, boolean spread, Set<MenuVo> children) {
		super();
		this.title = title;
		this.icon = icon;
		this.spread = spread;
		this.href = href;
		this.children = children;
	}
	public MenuVo(String title, String icon,String href, boolean spread) {
		this.title = title;
		this.icon = icon;
		this.spread = spread;
		this.href = href;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getHref() {
		return href;
	}
	public void setHref(String href) {
		this.href = href;
	}
	public boolean isSpread() {
		return spread;
	}
	public void setSpread(boolean spread) {
		this.spread = spread;
	}
	public Set<MenuVo> getChildren() {
		return children;
	}
	public void setChildren(Set<MenuVo> children) {
		this.children = children;
	}
}
