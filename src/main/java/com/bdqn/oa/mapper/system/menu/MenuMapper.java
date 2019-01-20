package com.bdqn.oa.mapper.system.menu;

import java.util.List;
import java.util.Set;

import org.apache.ibatis.annotations.Param;

import com.bdqn.oa.pojo.system.menu.Menu;

public interface MenuMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Menu record);

    int insertSelective(Menu record);

    Menu selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Menu record);

    int updateByPrimaryKey(Menu record);

    /**登录相关(动态菜单): 获得所有父节点*/
  	List<Menu> getParentMenuListByPidIsNull();

  	/**登录相关(动态菜单): 通过父节点id查询当前父节点下的子节点集合*/
  	Set<Menu> getChildrenMenuListByPid(Integer id);

  	/**登录相关(动态菜单): 通过用户id查询菜单集合*/
  	List<Menu> getMenuListByUserId(Integer id);

  	/**登录相关(动态菜单): 通过父节点id和用户id查询所有当前父节点下的子节点集合*/
  	Set<Menu> getAllChildrenMenuListByPid(@Param("pid")Integer pid, @Param("userId")Integer userId);

	Integer getCount(@Param("title")String title);

	List<Menu> getList(@Param("title")String title,@Param("currpage")Integer currpage, @Param("pagesize")Integer pagesize);
}