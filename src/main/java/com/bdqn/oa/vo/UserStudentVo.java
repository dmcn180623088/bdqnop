package com.bdqn.oa.vo;

import java.util.Date;

import javax.persistence.Transient;

public class UserStudentVo {
	
		private Integer id;

	    private String username="";

	    private String password="";
	    
	    private String salt = "";

	    private String nickName="";

	    private String cord="";

	    private String telephoneA="";

	    private String telephoneB="";

	    private String email="";

	    private Date birthday;

	    private String identity="";

	    @Transient
	    private String identityName="";
	    
	    private String level="";

	    @Transient
	    private String levelName="";
	    
	    private String prohibition="";

	    private String status="";

	    private String createUser="";

	    private Date createTime;

	    private String modifyUser="";

	    private Date modifyTime;

	    private String description="";

	    private String address="";

	    private String sex="";

	    private Integer age=0;

	    private String qq="";

	    private String subName="";

	    private String searchName="";

	    private String unqueCode="";

	    private String isOver;
	    
	    private String isTemp;
	    
	    private Double pay;

	    private Integer classesId;

	    private Integer gradeId;
	    
	    @Transient
	    private String gradeName;
	    
	    private String gradeMsg;
	    
	    @Transient
	    private String classesNames;
	    
	  
		private Integer userId;

	    private String examId;

	    private Integer educationId;

	    @Transient
	    private String educationName="";
	    
	    
	    private Integer majorId;

	    @Transient
	    private String majorName="";
	    
	    private Integer stiuationId;

	    @Transient
	    private String stiuationName="";
	    
	    private Integer classificationId;

	    @Transient
	    private String classificationName="";
	    
	    private Integer sourceId;

	    @Transient
	    private String sourceName = "";
	    
	    private Integer toolId;

	    @Transient
	    private String toolName="";
	    
	    private Integer channelId;

	    @Transient
	    private String channelName="";
	    
	    private Integer user1;

	    @Transient
	    private String user1Name;
	    
	    private Integer user2;

	    @Transient
	    private String user2Name;
	    
	    private Integer user3;
	    
	    @Transient
	    private String user3Name;
	    
	    private String roleIds;
	    
	    
	    
	    private Integer backType;//是否回访 0未 1是
	    
	    
	    private Integer homeType; //是否上门 0未 1是
	    
	    
	    private Integer enrollType; //是否报名 0 未 1是
	    
	    

		public Integer getBackType() {
			return backType;
		}
		public void setBackType(Integer backType) {
			this.backType = backType;
		}
		public Integer getHomeType() {
			return homeType;
		}
		public void setHomeType(Integer homeType) {
			this.homeType = homeType;
		}
		public Integer getEnrollType() {
			return enrollType;
		}
		public void setEnrollType(Integer enrollType) {
			this.enrollType = enrollType;
		}
		public String getGradeMsg() {
			return gradeMsg;
		}
		public void setGradeMsg(String gradeMsg) {
			this.gradeMsg = gradeMsg;
		}
		public Integer getGradeId() {
			return gradeId;
		}
		public void setGradeId(Integer gradeId) {
			this.gradeId = gradeId;
		}
		public String getGradeName() {
			return gradeName;
		}
		public void setGradeName(String gradeName) {
			this.gradeName = gradeName;
		}
		public String getSalt() {
			return salt;
		}
		public void setSalt(String salt) {
			this.salt = salt;
		}
		public String getClassesNames() {
			return classesNames;
		}
		public void setClassesNames(String classesNames) {
			this.classesNames = classesNames;
		}
		public String getSourceName() {
			return sourceName;
		}
		public void setSourceName(String sourceName) {
			this.sourceName = sourceName;
		}
		public String getToolName() {
			return toolName;
		}
		public void setToolName(String toolName) {
			this.toolName = toolName;
		}
		public String getChannelName() {
			return channelName;
		}
		public void setChannelName(String channelName) {
			this.channelName = channelName;
		}
		public String getUser1Name() {
			return user1Name;
		}
		public void setUser1Name(String user1Name) {
			this.user1Name = user1Name;
		}
		public String getUser2Name() {
			return user2Name;
		}
		public void setUser2Name(String user2Name) {
			this.user2Name = user2Name;
		}
		public String getUser3Name() {
			return user3Name;
		}
		public void setUser3Name(String user3Name) {
			this.user3Name = user3Name;
		}
		public String getClassificationName() {
			return classificationName;
		}
		public void setClassificationName(String classificationName) {
			this.classificationName = classificationName;
		}
		public String getEducationName() {
			return educationName;
		}
		public void setEducationName(String educationName) {
			this.educationName = educationName;
		}
		public String getMajorName() {
			return majorName;
		}
		public void setMajorName(String majorName) {
			this.majorName = majorName;
		}
		
		
		
		public Double getPay() {
			return pay;
		}
		public void setPay(Double pay) {
			this.pay = pay;
		}
		public String getStiuationName() {
			return stiuationName;
		}
		public void setStiuationName(String stiuationName) {
			this.stiuationName = stiuationName;
		}
		public String getRoleIds() {
			return roleIds;
		}
		public void setRoleIds(String roleIds) {
			this.roleIds = roleIds;
		}
		public String getIsTemp() {
			return isTemp;
		}
		public void setIsTemp(String isTemp) {
			this.isTemp = isTemp;
		}
		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
		public String getUsername() {
			return username;
		}
		public void setUsername(String username) {
			this.username = username;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public String getNickName() {
			return nickName;
		}
		public void setNickName(String nickName) {
			this.nickName = nickName;
		}
		public String getCord() {
			return cord;
		}
		public void setCord(String cord) {
			this.cord = cord;
		}
		public String getTelephoneA() {
			return telephoneA;
		}
		public void setTelephoneA(String telephoneA) {
			this.telephoneA = telephoneA;
		}
		public String getTelephoneB() {
			return telephoneB;
		}
		public void setTelephoneB(String telephoneB) {
			this.telephoneB = telephoneB;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public Date getBirthday() {
			return birthday;
		}
		public void setBirthday(Date birthday) {
			this.birthday = birthday;
		}
		public String getIdentity() {
			return identity;
		}
		public void setIdentity(String identity) {
			this.identity = identity;
		}
		public String getLevel() {
			return level;
		}
		public void setLevel(String level) {
			this.level = level;
		}
		public String getProhibition() {
			return prohibition;
		}
		public void setProhibition(String prohibition) {
			this.prohibition = prohibition;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		public String getCreateUser() {
			return createUser;
		}
		public void setCreateUser(String createUser) {
			this.createUser = createUser;
		}
		public Date getCreateTime() {
			return createTime;
		}
		public void setCreateTime(Date createTime) {
			this.createTime = createTime;
		}
		public String getModifyUser() {
			return modifyUser;
		}
		public void setModifyUser(String modifyUser) {
			this.modifyUser = modifyUser;
		}
		public Date getModifyTime() {
			return modifyTime;
		}
		public void setModifyTime(Date modifyTime) {
			this.modifyTime = modifyTime;
		}
		public String getDescription() {
			return description;
		}
		public void setDescription(String description) {
			this.description = description;
		}
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		public String getSex() {
			return sex;
		}
		public void setSex(String sex) {
			this.sex = sex;
		}
		public Integer getAge() {
			return age;
		}
		public void setAge(Integer age) {
			this.age = age;
		}
		public String getQq() {
			return qq;
		}
		public void setQq(String qq) {
			this.qq = qq;
		}
		public String getSubName() {
			return subName;
		}
		public void setSubName(String subName) {
			this.subName = subName;
		}
		public String getSearchName() {
			return searchName;
		}
		public void setSearchName(String searchName) {
			this.searchName = searchName;
		}
		public String getUnqueCode() {
			return unqueCode;
		}
		public void setUnqueCode(String unqueCode) {
			this.unqueCode = unqueCode;
		}
		public String getIsOver() {
			return isOver;
		}
		public void setIsOver(String isOver) {
			this.isOver = isOver;
		}
		public Integer getClassesId() {
			return classesId;
		}
		public void setClassesId(Integer classesId) {
			this.classesId = classesId;
		}
		public Integer getUserId() {
			return userId;
		}
		public void setUserId(Integer userId) {
			this.userId = userId;
		}
		public String getExamId() {
			return examId;
		}
		public void setExamId(String examId) {
			this.examId = examId;
		}
		public Integer getEducationId() {
			return educationId;
		}
		public void setEducationId(Integer educationId) {
			this.educationId = educationId;
		}
		public Integer getMajorId() {
			return majorId;
		}
		public void setMajorId(Integer majorId) {
			this.majorId = majorId;
		}
		public Integer getStiuationId() {
			return stiuationId;
		}
		public void setStiuationId(Integer stiuationId) {
			this.stiuationId = stiuationId;
		}
		public Integer getClassificationId() {
			return classificationId;
		}
		public void setClassificationId(Integer classificationId) {
			this.classificationId = classificationId;
		}
		public Integer getSourceId() {
			return sourceId;
		}
		public void setSourceId(Integer sourceId) {
			this.sourceId = sourceId;
		}
		public Integer getToolId() {
			return toolId;
		}
		public void setToolId(Integer toolId) {
			this.toolId = toolId;
		}
		public Integer getChannelId() {
			return channelId;
		}
		public void setChannelId(Integer channelId) {
			this.channelId = channelId;
		}
		public Integer getUser1() {
			return user1;
		}
		public void setUser1(Integer user1) {
			this.user1 = user1;
		}
		public Integer getUser2() {
			return user2;
		}
		public void setUser2(Integer user2) {
			this.user2 = user2;
		}
		public Integer getUser3() {
			return user3;
		}
		public void setUser3(Integer user3) {
			this.user3 = user3;
		}
		public String getLevelName() {
			return levelName;
		}
		public void setLevelName(String levelName) {
			this.levelName = levelName;
		}
		public String getIdentityName() {
			return identityName;
		}
		public void setIdentityName(String identityName) {
			this.identityName = identityName;
		}
		@Override
		public String toString() {
			return "UserStudentVo [id=" + id + ", username=" + username + ", password=" + password + ", salt=" + salt
					+ ", nickName=" + nickName + ", cord=" + cord + ", telephoneA=" + telephoneA + ", telephoneB="
					+ telephoneB + ", email=" + email + ", birthday=" + birthday + ", identity=" + identity
					+ ", identityName=" + identityName + ", level=" + level + ", levelName=" + levelName
					+ ", prohibition=" + prohibition + ", status=" + status + ", createUser=" + createUser
					+ ", createTime=" + createTime + ", modifyUser=" + modifyUser + ", modifyTime=" + modifyTime
					+ ", description=" + description + ", address=" + address + ", sex=" + sex + ", age=" + age
					+ ", qq=" + qq + ", subName=" + subName + ", searchName=" + searchName + ", unqueCode=" + unqueCode
					+ ", isOver=" + isOver + ", isTemp=" + isTemp + ", pay=" + pay + ", classesId=" + classesId
					+ ", classesNames=" + classesNames + ", userId=" + userId + ", examId=" + examId + ", educationId="
					+ educationId + ", educationName=" + educationName + ", majorId=" + majorId + ", majorName="
					+ majorName + ", stiuationId=" + stiuationId + ", stiuationName=" + stiuationName
					+ ", classificationId=" + classificationId + ", classificationName=" + classificationName
					+ ", sourceId=" + sourceId + ", sourceName=" + sourceName + ", toolId=" + toolId + ", toolName="
					+ toolName + ", channelId=" + channelId + ", channelName=" + channelName + ", user1=" + user1
					+ ", user1Name=" + user1Name + ", user2=" + user2 + ", user2Name=" + user2Name + ", user3=" + user3
					+ ", user3Name=" + user3Name + ", roleIds=" + roleIds + "]";
		}
		
}
