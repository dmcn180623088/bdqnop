var $,tab,skyconsWeather;
var path = $("#getRootPath").val();
//每次加载后台消息时初始化，保存全部的消息通知
var openContent = "";
//初始化消息数量，用来实现新增消息后出现提示
var messageCount = 0;
//是否再次弹出
var againOpen = false;
layui.config({
	base :path+"/static/js/"
}).use(['bodyTab','form','element','layer','jquery'],function(){
	var form = layui.form,
		layer = layui.layer,
		element = layui.element;
		$ = layui.jquery;
		tab = layui.bodyTab({
			openTabNum : "50",  //最大可打开窗口数量
			url :path+"/menu/show" //获取菜单json地址
		});

		
		
		
	//退出
	$(".signOut").click(function(){
		window.sessionStorage.removeItem("menu");
		menu = [];
		window.sessionStorage.removeItem("curmenu");
	})

	//隐藏左侧导航
	$(".hideMenu").click(function(){
		$(".layui-layout-admin").toggleClass("showMenu");
		//渲染顶部窗口
		tab.tabMove();
	})

	//渲染左侧菜单
	tab.render();

	//锁屏
	function lockPage(){
		layer.open({
			title : false,
			type : 1,
			content : '	<div class="admin-header-lock" id="lock-box">'+
							'<div class="admin-header-lock-name"style="margin-bottom:30px"><font color="" size="4" ><b>石家庄北大青鸟互联网教育集团</b></font></div>'+
							'<div class="input_btn">'+
								'<input type="password" class="admin-header-lock-input layui-input" autocomplete="off" placeholder="请输入密码解锁.." name="lockPwd" id="lockPwd" />'+
								'<button class="layui-btn" id="unlock">解锁</button>'+
							'</div>'+
							'<p style="margin-top:20px">请输入登录密码，否则不会解锁成功哦</p>'+
						'</div>',
			closeBtn : 0,
			shade : 0.9
		})
		$(".admin-header-lock-input").focus();
	}
	$(".lockcms").on("click",function(){
		window.sessionStorage.setItem("lockcms",true);
		lockPage();
	})
	// 判断是否显示锁屏
	if(window.sessionStorage.getItem("lockcms") == "true"){
		lockPage();
	}
	// 解锁
	$("body").on("click","#unlock",function(){
		var pwd = $(this).siblings(".admin-header-lock-input").val();
		if($(this).siblings(".admin-header-lock-input").val() == ''){
			layer.msg("请输入解锁密码！");
			$(this).siblings(".admin-header-lock-input").focus();
			return;
		}
		
		$.ajax({
			type:'POST',
			dataType:'json',
			cache:false,
			data:{"pwd":pwd},
			url:getRootPath()+'/user/get/unlock.do',
			success:function(data){
				if(data.code == 5000){
					window.location.href=getRootPath()+"/login.do";
				}else{
					if(data.code == 2000){
						window.sessionStorage.setItem("lockcms",false);
						$(this).siblings(".admin-header-lock-input").val('');
						layer.closeAll("page");
					}else{
						layer.msg("密码错误，请重新输入！");
						$(this).siblings(".admin-header-lock-input").val('').focus();
					}
				}
				
			}
		});
	});
	$(document).on('keydown', function(event) {
		if(event.keyCode == 13) {
			$("#unlock").click();
		}
	});

	//手机设备的简单适配
	var treeMobile = $('.site-tree-mobile'),
		shadeMobile = $('.site-mobile-shade')

	treeMobile.on('click', function(){
		$('body').addClass('site-mobile');
	});

	shadeMobile.on('click', function(){
		$('body').removeClass('site-mobile');
	});

	// 添加新窗口
	$("body").on("click",".layui-nav .layui-nav-item a",function(){
		//如果不存在子级
		if($(this).siblings().length == 0){
			addTab($(this));
			$('body').removeClass('site-mobile');  //移动端点击菜单关闭菜单层
		}
		$(this).parent("li").siblings().removeClass("layui-nav-itemed");
	})

	
	//判断是否处于锁屏状态(如果关闭以后则未关闭浏览器之前不再显示)
//	if(window.sessionStorage.getItem("lockcms") != "true" && window.sessionStorage.getItem("showNotice") != "true"){
//		showNotice();
//	}
	$(".showNotice").on("click",function(){
		showNotice();
	})

	

	//刷新当前
	$(".refresh").on("click",function(){  //此处添加禁止连续点击刷新一是为了降低服务器压力，另外一个就是为了防止超快点击造成chrome本身的一些js文件的报错(不过貌似这个问题还是存在，不过概率小了很多)
		if($(this).hasClass("refreshThis")){
			$(this).removeClass("refreshThis");
			$(".clildFrame .layui-tab-item.layui-show").find("iframe")[0].contentWindow.location.reload(true);
			setTimeout(function(){
				$(".refresh").addClass("refreshThis");
			},2000)
		}else{
			layer.msg("您点击的速度超过了服务器的响应速度，还是等两秒再刷新吧！");
		}
	})
	
	
	//返回父级
	$(".goParents").on("click",function(){
		$(this).removeClass("refreshThis");
		var src = $(".clildFrame .layui-tab-item.layui-show").find("iframe")[0].src;
        $(".clildFrame .layui-tab-item.layui-show").find("iframe")[0].src = src;
	});
	
	//关闭其他
	$(".closePageOther").on("click",function(){
		if($("#top_tabs li").length>2 && $("#top_tabs li.layui-this cite").text()!="后台首页"){
			var menu = JSON.parse(window.sessionStorage.getItem("menu"));
			$("#top_tabs li").each(function(){
				if($(this).attr("lay-id") != '' && !$(this).hasClass("layui-this")){
					element.tabDelete("bodyTab",$(this).attr("lay-id")).init();
					//此处将当前窗口重新获取放入session，避免一个个删除来回循环造成的不必要工作量
					for(var i=0;i<menu.length;i++){
						if($("#top_tabs li.layui-this cite").text() == menu[i].title){
							menu.splice(0,menu.length,menu[i]);
							window.sessionStorage.setItem("menu",JSON.stringify(menu));
						}
					}
				}
			})
		}else if($("#top_tabs li.layui-this cite").text()=="后台首页" && $("#top_tabs li").length>1){
			$("#top_tabs li").each(function(){
				if($(this).attr("lay-id") != '' && !$(this).hasClass("layui-this")){
					element.tabDelete("bodyTab",$(this).attr("lay-id")).init();
					window.sessionStorage.removeItem("menu");
					menu = [];
					window.sessionStorage.removeItem("curmenu");
				}
			})
		}else{
			layer.msg("没有可以关闭的窗口了@_@");
		}
		//渲染顶部窗口
		tab.tabMove();
	})
	//关闭全部
	$(".closePageAll").on("click",function(){
		if($("#top_tabs li").length > 1){
			$("#top_tabs li").each(function(){
				if($(this).attr("lay-id") != ''){
					element.tabDelete("bodyTab",$(this).attr("lay-id")).init();
					window.sessionStorage.removeItem("menu");
					menu = [];
					window.sessionStorage.removeItem("curmenu");
				}
			})
		}else{
			layer.msg("没有可以关闭的窗口了@_@");
		}
		//渲染顶部窗口
		tab.tabMove();
	})
	
	
	//公告层
	window.showNotice = function (content){
		$("#isHasNew").hide();
		  parent.layer.open({
		        type: 1
		        ,title: false //不显示标题栏
		        ,closeBtn: false
		        ,area:'70%'
		        ,shade: 0.8
		        ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
		        ,btn: ['我知道了']
		        ,btnAlign: 'c'
		        ,moveType: 1 //拖拽模式，0或者1
		        ,content:openContent
		        ,success: function(layero){
		        	var btn = layero.find('.layui-layer-btn');
					btn.css('text-align', 'center');
					btn.on("click",function(){
						window.sessionStorage.setItem("showNotice","true");
					})
					if($(window).width() > 432){  //如果页面宽度不足以显示顶部“系统公告”按钮，则不提示
						btn.on("click",function(){
							layer.tips('系统公告躲在了这里', '#showNotice', {
								tips: 3
							});
						})
					}
		        }
		      });
	}
	
	//每间隔5分钟，局部刷新一次消息
	$(function(){
		//进入网页执行一次ajax
		getMessage();
		//每隔5分钟执行一次消息查询
		setInterval("getMessage()", 1000 * 60 * 5 );
		
	});
})

function getMessage(){
		$.ajax({
			type:'post',
			dataType:'json',
			url:getRootPath()+"/message/get/entity.do",
			success:function(data){
				
				$('#messageCard').html("<font color='red'><strong>★★重要通知★★</strong></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
				for (var i = 0; i < data.length; i++) {
					$("#messageCard").append('<font color="green">第'+(i+1)+'条消息:</font><a href="#" ><font color="#FFFFFF" style="font-weight: 900;">【发布人:'+data[i].createUser+"     发布时间:"+dateFormatter(data[i].createTime)+"】"+data[i].content+'</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
					if(i==4) break; //如果展示完第五条就结束
				}
				
				openContent="";
				
				//初始化消息弹窗内容 background-color: gainsboro;  color: #fff; 
				openContent+='<div style="padding: 20px 50px; line-height: 22px; font-weight: 300;"><fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;"><legend>我的重要工作通知：</legend></fieldset>';
				
				$.each(data, function(idx, obj) {
					openContent+= '<li class="layui-timeline-item">'
									+'<i class="layui-icon layui-timeline-axis"></i>'
				    +'<div class="layui-timeline-content layui-text">'
				      +'<div class="layui-timeline-title">'+dateFormatter(obj.createTime)+'&nbsp;—&nbsp;'+obj.createUser+'&nbsp;&nbsp;&nbsp;&nbsp;'+obj.content+'</div>'
				    +'</div>'
				  +'</li>'
				});
				
				openContent+= '<li class="layui-timeline-item"><i class="layui-icon layui-anim layui-anim-rotate layui-anim-loop layui-timeline-axis"></i><div class="layui-timeline-content layui-text">'
			      +'<div class="layui-timeline-title">很久以前......</div></div></li></ul></div>';
				
				//是否显示徽章
				if(messageCount < data.length){
					$("#isHasNew").show();
					messageCount = data.length;
					//显示公告
					showNotice(openContent);
				}
			}
		})
	}

//打开新窗口
function addTab(_this){
	tab.tabAdd(_this);
}



