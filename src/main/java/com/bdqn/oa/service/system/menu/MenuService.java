package com.bdqn.oa.service.system.menu;

import java.util.List;

import com.bdqn.oa.exception.CustomException;
import com.bdqn.oa.pojo.system.menu.Menu;
import com.bdqn.oa.utils.ResponseData;
import com.bdqn.oa.vo.MenuVo;

public interface MenuService {

	List<MenuVo> getMenuListByUser() throws CustomException;

	ResponseData<Menu> getList(String title,Integer currpage, Integer pagesize);

}
