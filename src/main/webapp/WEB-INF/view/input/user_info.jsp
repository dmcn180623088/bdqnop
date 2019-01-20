<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/layui-v2.4.5/layui/css/layui.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/layui-v2.4.5/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/tool.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/axios.min.js"></script>
</head>
<body>
	<div style="padding: 20px; background-color: #F2F2F2;">
      <div class="layui-row layui-col-space15">
        <div class="layui-col-md6">
          <div class="layui-card">
            <div class="layui-card-header">基本信息</div>
            <div class="layui-card-body">
            	<table class="layui-table" lay-even lay-skin="nob">
            		<tr class="layui-nickName"><td>用户姓名</td></tr>
            		<tr class="layui-age"><td>用户年龄</td></tr>
            		<tr class="layui-sex"><td>用户性别</td></tr>
            		<tr class="layui-email"><td>用户邮箱</td></tr>
            		<tr class="layui-birthday"><td>用户生日</td></tr>
            		<tr class="layui-cord"><td>身份证号</td></tr>
            		<tr class="layui-qq"><td>腾讯号码</td></tr>
            		<tr class="layui-address"><td>用户地址</td></tr>
            		<tr class="layui-username"><td>登录账号</td></tr>
            		<tr class="layui-password"><td>登录密码</td></tr>
            		<tr class="layui-telephoneA"><td>常用电话</td></tr>
            		<tr class="layui-telephoneB"><td>备用电话</td></tr>
            		<tr class="layui-identityName"><td>所在部门</td></tr>
            		<tr class="layui-levelName"><td>所属身份</td></tr>
            		<tr class="layui-subName"><td>用户关系</td></tr>
            		<tr class="layui-pay"><td>累计金额</td></tr>
            		<tr class="layui-classesNames"><td>所在班级</td></tr>
            		<tr class="layui-gradeName"><td>用户评级</td></tr>
            	</table>
            </div>
          </div>
        </div>
        <div class="layui-col-md6">
          <div class="layui-card">
            <div class="layui-card-header">维度信息</div>
            <div class="layui-card-body">
              <table class="layui-table" lay-even lay-skin="nob">
            		<tr class="layui-createUser"><td>创建人</td></tr>
            		<tr class="layui-createTime"><td>创建时间</td></tr>
            		<tr class="layui-modifyUser"><td>修改人</td></tr>
            		<tr class="layui-modifyTime"><td>修改时间</td></tr>
            		<tr class="layui-searchName"><td>关键词</td></tr>
            		<tr class="layui-unqueCode"><td>32位编码</td></tr>
            		<tr class="layui-stiuationName"><td>现状</td></tr>
            		<tr class="layui-educationName"><td>学历</td></tr>
            		<tr class="layui-majorName"><td>专业</td></tr>
            		<tr class="layui-classificationName"><td>课程</td></tr>
            	</table>
            </div>
          </div>
          
          <div class="layui-card">
            <div class="layui-card-header">来源信息</div>
            <div class="layui-card-body">
              <table class="layui-table" lay-even lay-skin="nob">
            		<tr class="layui-sourceName"><td>网站来源</td></tr>
            		<tr class="layui-toolName"><td>咨询工具</td></tr>
            		<tr class="layui-channelName"><td>渠道来源</td></tr>
            		<tr class="layui-user1Name"><td>网咨</td></tr>
            		<tr class="layui-user2Name"><td>咨询</td></tr>
            		<tr class="layui-user3Name"><td>助理</td></tr>			
            	</table>
            </div>
          </div>
        </div>
        
         <div class="layui-col-md12">
          <div class="layui-card">
            <div class="layui-card-header">回访记录</div>
            <div class="layui-card-body">
              	这里写回访记录
            </div>
          </div>
        </div>
          <div class="layui-col-md12">
          <div class="layui-card">
            <div class="layui-card-header">跟踪回访</div>
            <div class="layui-card-body">
              	<table class="layui-table" lay-even lay-skin="nob">
            		<tr class="layui-user1Name"><td>网络咨询师</td></tr>
            		<tr class="layui-user2Name"><td>咨询师</td></tr>
            		<tr class="layui-"><td>下次上门</td></tr>
            		<tr class="layui-"><td>下次回访</td></tr>
            		<tr class="layui-createUser"><td>录入人</td></tr>
            		<tr class="layui-createTime"><td>录入时间</td></tr>			
            	</table>
            </div>
          </div>
        </div>
        <div class="layui-col-md12">
          <div class="layui-card">
            <div class="layui-card-header">更新记录</div>
            <div class="layui-card-body">
              	这里写更新记录的时间线
            </div>
          </div>
        </div>
        
      </div>
    </div>
</body>
</html>