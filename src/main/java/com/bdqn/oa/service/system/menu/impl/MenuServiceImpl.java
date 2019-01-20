package com.bdqn.oa.service.system.menu.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bdqn.oa.exception.CustomException;
import com.bdqn.oa.mapper.system.menu.MenuMapper;
import com.bdqn.oa.pojo.system.menu.Menu;
import com.bdqn.oa.pojo.system.user.User;
import com.bdqn.oa.service.system.menu.MenuService;
import com.bdqn.oa.utils.ResponseData;
import com.bdqn.oa.vo.MenuVo;

@Service
@Transactional
public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuMapper menuMapper;
	
	@Override
	public List<MenuVo> getMenuListByUser() throws CustomException {
		// 获得当前登录的用户
		User user = (User) SecurityUtils.getSubject().getPrincipal();

		List<MenuVo> list = new ArrayList<MenuVo>();// 反参集合

		if ("admin".equals(user.getUsername())) {
			List<Menu> parentMenus = menuMapper.getParentMenuListByPidIsNull();
			for (Menu menu : parentMenus) {
				Set<Menu> childSet = menuMapper.getChildrenMenuListByPid(menu.getId());
				Set<MenuVo> childMenuVo = new HashSet<MenuVo>();
				for (Menu menuChild : childSet) {
					childMenuVo.add(new MenuVo(menuChild.getTitle(),"",menuChild.getHref(), false));
				}
				MenuVo mv = new MenuVo(menu.getTitle(),"","", false, childMenuVo);
				list.add(mv);
			}
		} else {
			List<Menu> menuList = menuMapper.getMenuListByUserId(user.getId());
			for (Menu menu : menuList) {
				if (menu.getPid() == null) {
					Set<Menu> childMenuSet = menuMapper.getAllChildrenMenuListByPid(menu.getId(), user.getId());
					Set<MenuVo> childMenuVo = new HashSet<MenuVo>();
					for (Menu menuChild : childMenuSet) {
						childMenuVo.add(new MenuVo(menuChild.getTitle(),"",menuChild.getHref(), false));
					}
					MenuVo mv = new MenuVo(menu.getTitle(),"","", false, childMenuVo);
					list.add(mv);
				}
			}
		}
		return list;
	}

	@Override
	public ResponseData<Menu> getList(String title,Integer currpage, Integer pagesize) {
	//	Integer total = menuMapper.getCount(title);
	//	List<Menu> list = menuMapper.getList(title,currpage,pagesize);
	//	return new ResponseData<>(total, list);
		return null;
	}


	
}
