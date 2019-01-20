<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>欢迎登陆</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/bootstrap/vendor/bootstrap/css/bootstrap.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/bootstrap/dist/css/bootstrapValidator.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/bootstrap/bootstraptable/bootstrap-table.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/bootstrap/bootstrapselect/css/bootstrap-select.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/bootstrap/bootstrapdatetimepicker/css/bootstrap-datetimepicker.min.css" />


<script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/vendor/jquery/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/tool.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/bootstraptable/bootstrap-table.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/bootstraptable/bootstrap-table-zh-CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/dist/js/bootstrapValidator.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/bootstrapselect/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/bootstrapselect/js/i18n/defaults-zh_CN.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/plugins/layer/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/bootstrapdatetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/bootstrapdatetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/hold-up.js"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/plugins/layui/css/layui.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/static/plugins/layui/layui.js"></script>
<link href="${pageContext.request.contextPath}/static/login/css/login.css" rel="stylesheet" rev="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/static/login/css/demo.css" rel="stylesheet" rev="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/static/login/css/verify.css" rel="stylesheet" rev="stylesheet" type="text/css" media="all">

<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/login/js/jquery.SuperSlide.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/login/js/Validform_v5.3.2_min.js"></script>

<style>

#msg {
  width: 100%;
  line-height: 40px;
  font-size: 14px;
  text-align: center;
}

</style>
</head>

<body>
	<div class="header">
	    <h1 class="headerLogo">
	  	<%--   <a title="后台管理系统" href="javascript:void(0)">
	  		<img alt="logo" width="230px" height="100px" src="${pageContext.request.contextPath}/static/login/images/logo1.png">
	  	  </a> --%>
	  	  
	  	  <a title="后台管理系统" href="javascript:void(0)">
		  	<img alt="logo" width="186px" height="71px" src="${pageContext.request.contextPath}/static/login/images/logo.png" style="padding-top: 20px;" />
		  </a>
	    </h1>
	</div>
	
	<div class="banner">
		<div class="login-aside">			  
		
		  <div id="o-box-up"></div>
		  <div id="o-box-down"  style="table-layout:fixed;">
		  	<div class="headerNav">
				<a target="_blank" href="${pageContext.request.contextPath}/aboutUs">开发团队</a>
			</div>
		  <div class="error-box"></div>
			   <form class="registerform" id="userForm" action="${pageContext.request.contextPath}/ln">
				  <div class="fm-item">
					   <label for="logonId" class="form-label">登陆用户：</label>
					   <input id="username"  type="text" class="i-text" name="username" placeholder="请输入账户名" required autofocus />
				       <div class="ui-form-explain"></div>
				  </div>
				  
				  <div class="fm-item">
					   <label for="logonId" class="form-label">登陆密码：</label>
					   <input id="password" type="password" class="i-text" name="password" placeholder="请输入密码" required autofocus />
				       <div class="ui-form-explain"></div>
				  </div>
				  <div class="fm-item" style="margin-top: 0px">
				  	<div id="yin" style="display:none; width: 246px;background: rgba(0,0,0,0);height: 170px;position: absolute;z-index: 4;"></div>
				  		<div id="mpanel4" style="margin-top:20px;"></div>
				   </div>
			 		
				  <div class="fm-item">
					   <label for="logonId" class="form-label"></label>
				       <button type="button"  onclick="ajaxSub()" class="btn-login"></button>
				       <div class="ui-form-explain"></div>
				  </div>
			  </form>
		  </div>
		</div>
		<div class="bd">
			<ul style="height: 540px;"><!-- theme-pic1.jpg -->
				<li style="height: 540px;background:url(static/login/themes/theme-pic1.png) #CCE1F3 100% 0 no-repeat; background-size: cover;"></li>
				<li style="height: 540px;background:url(static/login/themes/theme-pic1.png) #BCE0FF 100% 0 no-repeat; background-size: cover;"></li>
			</ul>
		</div>
		
	</div>
<script type="text/javascript">jQuery(".banner").slide({ titCell:".hd ul", mainCell:".bd ul", effect:"fold",  autoPlay:true, autoPage:true, trigger:"click" });</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/login/js/verify.js"></script>
<div class="banner-shadow"></div>
<script type="text/javascript">


$('#mpanel4').slideVerify({
	type : 2,		//类型
	vOffset : 5,	//误差量，根据需求自行调整
	vSpace : 5,	//间隔
	imgName : ['1.jpg', '2.jpg','3.jpg','4.jpg','5.jpg','6.jpg','7.jpg','8.jpg','9.jpg','10.jpg'],
	imgSize : {
		width: '240px',
		height: '120px',
	},
	blockSize : {
		width: '40px',
		height: '40px',
	},
	barSize : {
		width : '240px',
		height : '40px',
	},
	ready : function() {
	},
	success : function() {
		msg.meges = true;
	},
	error : function() {
//	        	alert('验证失败！');
	}
	
});

$(function(){
	$(".sliderIcon").css("background","url("+getRootPath()+"/static/img/icon_light.f13cff3.png) 0 -26px");
	$(".refreshIcon").css("background","url("+getRootPath()+"/static/img/icon_light.f13cff3.png) 0 -437px");
	
	var xian=$(document).width();
	if(xian<parseInt(700)){
		$(".mycenter").addClass("bodyWidth");
	}else{
		$(".mycenter").removeClass("bodyWidth");
	}
	
	history.pushState(null, null, document.URL);
	window.addEventListener('popstate', function () {
	    history.pushState(null, null, document.URL);
	});
	
	document.oncontextmenu = function () { 
		return false; 
	};
	
    document.onkeydown = function () {
	    if(window.event && window.event.keyCode == 123) {
	      event.keyCode = 0;
	      event.returnValue = false;
	      return false;
	    }
    };

	$(document).bind("keydown", function(e) {//文档绑定键盘按下事件 
		e = window.event || e;//解决浏览器兼容的问题   
		if(e.keyCode == 116) {//F5按下 
			return false; 
		}else{//让刷新，并完成特定事件 //完成特定事件 
			
		} 
	});
});

function ajaxSub(){
	if(!msg.meges) {layer.msg("验证未通过"); return;}	
	else{
		$.ajax({
			type:'POST',
			data:$("#userForm").serialize(),
			url:$("#userForm").attr('action'),
			success:function(data){						
				if(!data.type){
					window.location.href=getRootPath()+"/login";
				}else{
					layer.msg(data.message,function(){});									
					$(".verify-refresh").click();
					$("#username").val("");
					$("#password").val("");
					return;
				}
			}
		});
	}
	
}


$(window).resize(function(){
	var xian=$(document).width();
	if(xian<parseInt(700)){
		$(".mycenter").addClass("bodyWidth");
	}else{
		$(".mycenter").removeClass("bodyWidth");
	}
})
</script>
</body>
</html>
