<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增角色</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/layui-v2.4.5/layui/css/layui.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/layui-v2.4.5/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/tool.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/axios.min.js"></script>

</head>
<body>
<form class="layui-form" action="" style="margin-top: 40px; padding:10px;">
		
  <input type="hidden" name="id" value="">
  
  <div class="layui-form-item">
    <label class="layui-form-label">角色名称</label>
    <div class="layui-input-block">
      <input type="text" name="name" lay-verify="name" autocomplete="off" placeholder="请输入角色名称" class="layui-input">
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">角色关键字</label>
    <div class="layui-input-block">
      <input type="text" name="keyword" lay-verify="keyword" autocomplete="off" placeholder="请输入角色关键字" class="layui-input">
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">角色描述</label>
    <div class="layui-input-block">
      <input type="text" name="description" lay-verify="description" autocomplete="off" placeholder="请输入角色描述" class="layui-input">
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">复选框</label>
    <div class="layui-input-block" id="checkboxs">
    </div>
  </div>
  
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</form>

<script>
layui.use(['form', 'layedit','jquery','laydate'], function(){
  	var form = layui.form
	,layer = layui.layer
	,$ = layui.$
  	,layedit = layui.layedit
  	,laydate = layui.laydate;
  
  
  	axios.defaults.baseURL = getRootPath();
  	axios.defaults.timeout = 2000;
  
  	function getGradeListByNoPage() {
		return axios.get('/permission/get/list');
	}
  	
  	
  	var id = $("input[name='id']").val();
	var arrStr="";
	if(id!=null && id!="" && id!=undefined){
		axios.get('/role/get/entity/'+id).then(function(perIds){
			var groupCheckbox = $("input[name='permission']");
			var arr = new Array();
			$.each(perIds.data, function(index,it) {
				arr.push(it.permissionId);
			});
			arrStr = arr.join(',');
		 })
	}
  	
  	//遍历显示复选框
  	axios.get('/permission/get/list').then(function (per) {
  		$.each(per.data, function(index,item) {
  	  			if(arrStr.indexOf(item.id)!=-1){
  	  				$("#checkboxs").append(' <input type="checkbox" name="permission" id="permission['+item.id+']" title='+item.name+' value='+item.id+' checked="">');
  	  		    }else{
  	  		    	$("#checkboxs").append(' <input type="checkbox" name="permission" id="permission['+item.id+']" title='+item.name+' value='+item.id+'>');
  	  		    }
  	  	});
  		form.render();
  	 })
  //创建一个编辑器
  var editIndex = layedit.build('LAY_demo_editor');
 
  //自定义验证规则
  form.verify({
    name: function(value){
  	  	var checkValue = value.trim();
     	if(checkValue.length == 0){
        	return '权限名称不可以为空';
      	}
    },
    keyword: function(value){
    	var checkValue = value.trim();
     	if(checkValue.length == 0){
          return '权限关键字不可以为空';
        }
    },
    description: function(value){
    	var checkValue = value.trim();
     	if(checkValue.length == 0){
          return '权限描述不可以为空';
        }
    },
    content: function(value){
      layedit.sync(editIndex);
    }
  });
  
  //监听提交
  form.on('submit(demo1)', function(data){
	  	var formData = $(".layui-form").serialize();
	  	if(id==null && id=="" && id==undefined){
	  		axios({
	  		  method: 'post',
	  		  url: getRootPath()+'/role/add/entity',
	  		  data:formData
	  		}).then(function (response) {
	  		   parent.layer.msg(response.data.message);
	  		   parent.layer.closeAll('iframe');
	  		   parent.layer.closeAll('loading');
	  		});
	  	}else{
	  		axios({
	  		  method: 'post',
	  		  url: getRootPath()+'/role/edit/entity',
	  		  data:formData
	  		}).then(function (response) {
	  		   parent.layer.msg(response.data.message);
	  		   parent.layer.closeAll('iframe');
	  		   parent.layer.closeAll('loading');
	  		});
	  	}
	  	
	  	return false;
  });
 
  //表单初始赋值
 /* form.val('example', {
    "username": "贤心" // "name": "value"
    ,"password": "123456"
    ,"interest": 1
    ,"like[write]": true //复选框选中状态
    ,"close": true //开关状态
    ,"sex": "女"
    ,"desc": "我爱 layui"
  }) */
  
  
});
</script>
</body>
</html>