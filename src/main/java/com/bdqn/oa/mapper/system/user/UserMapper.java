package com.bdqn.oa.mapper.system.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bdqn.oa.pojo.system.user.User;
import com.bdqn.oa.vo.UserStudentVo;

public interface UserMapper {
	
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

	User findUserByUsername(@Param("username")String username);

	Integer getCountByTemp(
			@Param("gradeId")Integer grade, 
			@Param("backType")Integer backMsg,
			@Param("homeType")Integer toHome,
			@Param("classificationId")Integer classification,
			@Param("user1")Integer user1,
			@Param("user2")Integer user2,
			@Param("user3")Integer user3,
			@Param("channelId")Integer channel,
			@Param("sourceId")Integer source,
			@Param("educationId")Integer education,
			@Param("stiuationId")Integer stiuation,
			@Param("enrollType")Integer enroll,
			@Param("address")String address,
			@Param("nickName")String nickName);

	List<UserStudentVo> getUserStudentVoList(
			@Param("page")Integer pageNumber, 
			@Param("limit")Integer pageSize,
			@Param("gradeId")Integer grade, 
			@Param("backType")Integer backMsg,
			@Param("homeType")Integer toHome,
			@Param("classificationId")Integer classification,
			@Param("user1")Integer user1,
			@Param("user2")Integer user2,
			@Param("user3")Integer user3,
			@Param("channelId")Integer channel,
			@Param("sourceId")Integer source,
			@Param("educationId")Integer education,
			@Param("stiuationId")Integer stiuation,
			@Param("enrollType")Integer enroll,
			@Param("address")String address,
			@Param("nickName")String nickName);

	List<User> getUserListByIdentity(@Param("identity")String identity);
}