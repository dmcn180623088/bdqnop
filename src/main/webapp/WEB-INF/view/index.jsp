<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Access-Control-Allow-Origin" content="*">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/plugins/layui/css/layui.css" media="all"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/index_net.css" media="all" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css" media="all" />
<link id="layuicss-layer" rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/index_admin.css"
	media="all">
<title>石家庄东美春宁 智谷</title>
<style type="text/css">
	.layui-nav-tree .layui-nav-item a:hover{
		background-color:cornflowerblue !important; 
	}
</style>
</head>
<body class="main_body">
	<div class="layui-layout layui-layout-admin">
		<!-- 顶部 -->		
		<div class="layui-header header">
			<div class="layui-main">
				<a href="#" class="logo">东美春宁  智谷</a>
				<!-- 显示/隐藏菜单 -->
				<a href="javascript:;" class="iconfont hideMenu icon-menu1"></a>
				
			    <!-- 天气信息 -->
			    <div class="weather" pc>
			    	<div id="tp-weather-widget"></div>
					<script>(function(T,h,i,n,k,P,a,g,e){g=function(){P=h.createElement(i);a=h.getElementsByTagName(i)[0];P.src=k;P.charset="utf-8";P.async=1;a.parentNode.insertBefore(P,a)};T["ThinkPageWeatherWidgetObject"]=n;T[n]||(T[n]=function(){(T[n].q=T[n].q||[]).push(arguments)});T[n].l=+new Date();if(T.attachEvent){T.attachEvent("onload",g)}else{T.addEventListener("load",g,false)}}(window,document,"script","tpwidget","//widget.seniverse.com/widget/chameleon.js"))</script>
					<script>tpwidget("init", {
					    "flavor": "slim",
					    "location": "WX4FBXXFKE4F",
					    "geolocation": "enabled",
					    "language": "zh-chs",
					    "unit": "c",
					    "theme": "chameleon",
					    "container": "tp-weather-widget",
					    "bubble": "disabled",
					    "alarmType": "badge",
					    "color": "cornflowerblue",
					    "uid": "U9EC08A15F",
					    "hash": "039da28f5581f4bcb5c799fb4cdfb673"
					});
					tpwidget("show");</script>
			    </div>
			    <!-- 顶部右侧菜单 -->
			    <ul class="layui-nav top_menu">
			    	<li class="layui-nav-item showNotice" id="showNotice">
						<a href="javascript:;"><i class="iconfont icon-gonggao"></i><cite>系统公告<span class="layui-badge-dot" id="isHasNew" style="display:none;"></span></cite></a>
					</li>
			    
					<li class="layui-nav-item lockcms" pc>
						<a href="javascript:;"><i class="iconfont icon-lock1"></i><cite>锁屏</cite></a>
					</li>
					
					
			    	<!-- <li class="layui-nav-item" >
			    		<a href="#" onclick="editPwd()" class="signOut"><i class="iconfont icon-loginout"></i>  改密</a>
			    	</li> -->
			    	
					<li class="layui-nav-item layui-hide-xs" lay-unselect="">
			           <a href="javascript:;" layadmin-event="fullscreen">
			             <i class="layui-icon layui-icon-screen-full"></i>
			           </a>
			        </li>
					<%-- <li class="layui-nav-item" pc>
						<a href="javascript:;">
							<img src="${pageContext.request.contextPath}/static/images/32.jpg" class="layui-circle" width="35" height="35">
							<cite>${user.nickName }</cite>
						</a>
					</li> --%>
				</ul>
			</div>
		</div>
		<!-- 左侧导航 -->
		<div class="layui-side layui-bg-black">
			<div class="user-photo">
				<a class="img" title="我的头像" ><img src="static/img/badge/${user.identity }.png"></a>
				<p>你好！<span class="userName">${user.nickName }</span></p>
			</div>
			<div class="navBar layui-side-scroll"></div>
		</div>
		<!-- 右侧内容 -->
		<div class="layui-body layui-form">
			<div class="layui-tab marg0" lay-filter="bodyTab" id="top_tabs_box">
				<ul class="layui-tab-title top_tab" id="top_tabs">
					<li class="layui-this" lay-id=""><i class="iconfont icon-computer"></i> <cite>后台首页</cite></li>
				</ul>
				<ul class="layui-nav closeBox">
				  <li class="layui-nav-item">
				    <a href="javascript:;"><i class="iconfont icon-caozuo"></i> 页面操作</a>
				    <dl class="layui-nav-child">
					  <dd><a href="javascript:;" class="refresh refreshThis"><i class="layui-icon">&#x1002;</i> 刷新当前</a></dd>
					  <dd><a href="javascript:;" class="goParents"><i class="layui-icon">&#xe65c;</i> 返回父级</a></dd>
					  <dd><a href="javascript:;" class="closePageOther"><i class="iconfont icon-prohibit"></i> 关闭其他</a></dd>
				      <dd><a href="javascript:;" class="closePageAll"><i class="iconfont icon-guanbi"></i> 关闭全部</a></dd>
				    </dl>
				  </li>
				</ul>
				<div class="layui-tab-content clildFrame">
					<div class="layui-tab-item layui-show">

						<iframe id="myiframe" name="my_iframe"  src="${pageContext.request.contextPath }/system/charts/s/view.do"  frameborder="0">
						</iframe>

					</div>
				</div>
			</div>
		</div>
		<!-- 底部 -->
		<div class="layui-footer footer" style="width: 100%;padding: 0px;">
			<marquee id = "messageCard" style="width:100% ;margin:0px; color: white; background-color: darkgrey;" direction="left" behavior="scroll" scrollamount="3" scrolldelay="40">
			</marquee> 
		</div>
	</div>
	<!-- 项目地址 -->
	<input id ="getRootPath" type="hidden" value="${pageContext.request.contextPath }">
	<!-- 移动导航 -->
	<div class="site-tree-mobile layui-hide"><i class="layui-icon">&#xe602;</i></div>
	<div class="site-mobile-shade"></div>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>

	<script type="text/javascript" src="${pageContext.request.contextPath}/static/plugins/layui/layui.js"></script>

	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/leftNav.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/index.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/tool.js"></script>
	<script>
		layui.config({
			base : getRootPath() + '/static/js/layuiadmin/' //静态资源所在路径
		}).extend({
			index : 'lib/index' //主入口模块
		}).use([ 'index', 'console' ]);
	</script>
	
	<script type="text/javascript">
	
	//退出登录
	function editPwd() {
		parent.layer.open({
			type : 2,
			title : "修改密码",
			area:["70%","70%"],
			encodeURI : 'utf-8',
			shade : [1.2,"#000"],
			maxmin : true,
			content : getRootPath() + "/pwd/s/view.do",
			end:function(){
				window.location.href=getRootPath()+"/toLogin.do";
			}
		});
		
		
	}
	
	
		$(function(){
			history.pushState(null, null, document.URL);
			window.addEventListener('popstate', function () {
			    history.pushState(null, null, document.URL);
			});
			
			document.oncontextmenu = function () { 
				return false; 
			};
			
		    document.onkeydown = function () {
		       if (window.event && window.event.keyCode == 123) {
		           event.keyCode = 0;
		           event.returnValue = false;
		           return false;
		        }
		     };
		});
	</script>
	
	
	<style id='LAY_layadmin_theme'>
		.layui-nav-tree .layui-this, .layui-nav-tree .layui-this>a, .layui-nav-tree .layui-nav-child dd.layui-this, .layui-nav-tree .layui-nav-child dd.layui-this a{
			background-color: cornflowerblue !important;
		}
		.layui-nav-child dd:hover{
			background-color: cornflowerblue !important;
		}
	</style>
</body>
</html>