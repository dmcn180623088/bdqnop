(function(){
	//封装一个函数,用于获取指定id的dom对象
	var $ = function(id){
		return document.getElementById(id);
	}
	
	//让局部变量 $ 全局化
	//window.$ = $;
	
	//创建AJAX对象
	$.init=function(){
		//w3c内核浏览器
		try{
			return new XMLHttpRequest();
		}catch(e){}
		
		//IE内核浏览器
		try{
			return new ActiveXObject('Microsoft.XMLHTTP');
		}catch(e){}
		alert("您的浏览器版本过低,请更换浏览器运行!");
	}
	
	//封装get请求
	$.get = function(url,data,callback){
		//第一步:创建ajax对象
		var xhr = $.init();
		
		//第二步:设置回调函数
		xhr.onreadystatechange = function(){
			//第五步:判断与执行
			if(xhr.readyState == 4 && xhr.status == 200){
				//返回结果
				callback(xhr.responseText);
			}
		}
		
		//第三步:初始化ajax对象
		//解决ajax中get请求的缓存问题
		//data 的格式为: xxx=xxxx&xxxx=xxxx
		url = '${pageContext.request.contextPath}/' + url +'.do?x=' + new Date().getTime();
		if(data != null){
			url = url + "&" + data;
		}
		
		xhr.open('get',url);
		//第四步:发送ajax
		xhr.send(null);
	}
	
	//封装post
	$.post = function(url,data,callback){
		//第一步:创建ajax对象
		var xhr = $.init();
		
		//第二步:设置回调函数
		xhr.onreadystatechange = function(){
			//第五步:判断与执行
			if(xhr.readyState == 4 && xhr.status == 200){
				//返回结果
				callback(xhr.responseText);
			}
		}
		
		url = '${pageContext.request.contextPath}/' + url +'.do?x=' + new Date().getTime();
		
		//第三步:初始化ajax
		xhr.open('post',url);
		
		//第四步:设置请求头信息
		xhr.setRequestHeader('Content-type','application/x-www-form-urlencoded');
		
		//第五步:发送ajax
		xhr.send(data);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
})();