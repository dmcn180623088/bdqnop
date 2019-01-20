package com.bdqn.oa.controller.system.menu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bdqn.oa.exception.CustomException;
import com.bdqn.oa.pojo.system.menu.Menu;
import com.bdqn.oa.service.system.menu.MenuService;
import com.bdqn.oa.utils.ResponseData;
import com.bdqn.oa.vo.MenuVo;

@Controller
@RequestMapping("/menu")
public class MenuController {

	@Autowired
	private MenuService menuService;
	
	@RequestMapping("/show")
	@ResponseBody
	public List<MenuVo> initMenuListView() throws CustomException {
		return menuService.getMenuListByUser();
	}
	
	@RequestMapping("/s/view")
	public String toMenuView() {
		return "system/menu";
	}
	
	@RequestMapping("/list/{currpage}/{pagesize}/{title}")
	@ResponseBody
	public ResponseData<Menu> getList(@PathVariable("title")String title, @PathVariable("currpage")Integer currpage,@PathVariable("pagesize")Integer pagesize){
		return menuService.getList(title,currpage,pagesize);
	}
}
