<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>录量列表</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/layui-v2.4.5/layui/css/layui.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/layui-v2.4.5/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/tool.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/axios.min.js"></script>
<style type="text/css">
div .layui-select-title{
	width:170px;
}
.laytable-cell-radio{
	 padding: 15px 0 0 0;
}
th .laytable-cell-radio{
	 padding: 0 0 0 0;
}
</style>
</head>
<body>
	<!--[if lt IE 9]>
	  <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
	  <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
<script type="text/html" id="tableBar">
  <div class="layui-btn-container">
    <button class="layui-btn layui-btn-sm" lay-event="reload"><i class="layui-icon">&#xe615;</i>查询</button>
    <button class="layui-btn layui-btn-sm" lay-event="clear"><i class="layui-icon">&#xe9aa;</i>重置</button>
    <button class="layui-btn layui-btn-sm" lay-event="scanner"><i class="layui-icon">&#xe654;</i>录入</button>
    <button class="layui-btn layui-btn-sm" lay-event="show"><i class="layui-icon">&#xe60c;</i>详情</button>
    <button class="layui-btn layui-btn-sm" lay-event="visit"><i class="layui-icon">&#xe611;</i>回访</button>
    <button class="layui-btn layui-btn-sm" lay-event="distribution"><i class="layui-icon">&#xe653;</i>分配</button>
    <button class="layui-btn layui-btn-sm" lay-event="grade"><i class="layui-icon">&#xe658;</i>评级</button>
    <button class="layui-btn layui-btn-sm" lay-event="edit"><i class="layui-icon">&#xe642;</i>编辑</button>
    <button class="layui-btn layui-btn-sm" lay-event="del"><i class="layui-icon">&#xe640;</i>删除</button>
  </div>
</script>
	<div class="layui-fluid" style="height:auto"> 
		<div class="layui-row">
			<div class="layui-col-md12 layui-col-sm12 layui-col-xs12 layui-col-lg12">
				<div class="layui-form" style="margin-top: 10px;margin-left: 5px;">
					<div class="layui-input-group">	
						<div class="layui-input-inline">
							<select id="grade" lay-filter="grade">
								<option id="gradeOption" value="">按评级筛选</option>
							</select>
						</div>
						<div class="layui-input-inline">
							<select id="backMsg" lay-filter="backMsg">
								<option value="">按回访筛选</option>
								<option value="0">未回访</option>
								<option value="1">已回访</option>
							</select>
						</div>
						<div class="layui-input-inline">
							<select id="toHome" lay-filter="toHome">
								<option value="">按上门筛选</option>
								<option value="0">未上门</option>
								<option value="1">已上门</option>
							</select>
						</div>
						
						<div class="layui-input-inline">
							<select id="classification" lay-filter="classification">
								<option value="">按学业筛选</option>
							</select>
						</div>
						<div class="layui-input-inline">
							<select id="user1" lay-filter="user1">
								<option value="">按网咨筛选</option>
							</select>
						</div>
						<div class="layui-input-inline">
							<select id="user2" lay-filter="user2">
								<option value="">按咨询筛选</option>
							</select>
						</div>
						<div class="layui-input-inline">
							<select id="user3" lay-filter="user3">
								<option value="">按助理筛选</option>
							</select>
						</div>
					</div>
					<div class="layui-input-group" style="padding-top:5px">	
						<div class="layui-input-inline">
							<select id="channel" lay-filter="channel">
								<option value="">按渠道筛选</option>
							</select>
						</div>
						<div class="layui-input-inline">
							<select id="source" lay-filter="source">
								<option value="">按网站筛选</option>
							</select>
						</div>
						<div class="layui-input-inline">
							<select id="education" lay-filter="education">
								<option value="">按学历筛选</option>
							</select>
						</div>
						<div class="layui-input-inline">
							<select id="stiuation" lay-filter="stiuation">
								<option value="">按现状筛选</option>
							</select>
						</div>
						<div class="layui-input-inline">
							<select id="enroll" lay-filter="enroll">
								<option value="">按报名筛选</option>
								<option value="0">未报名</option>
								<option value="1">已报名</option>
							</select>
						</div>
						<div class="layui-input-inline">
							<input type="text" class="layui-input" style="width:170px;" id="address" lay-filter="addressFilter" placeholder="请输入地址进行筛选" />
						</div>
						<div class="layui-input-inline">
							<input type="text" style="width:170px;" class="layui-input" id="nickName" lay-filter="nickNameFilter" placeholder="请输入姓名进行筛选" />
						</div>
					</div>	
				</div>			
			</div>
		</div>
		<div class="layui-row">
			<div class="layui-col-md12 layui-col-sm12 layui-col-xs12 layui-col-lg12">
				<table class="layui-hide" id="inputTable" lay-filter="inputTableFilter"></table>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
layui.use(['table','laypage','jquery','form'], function(){
  var table = layui.table,
      laypage = layui.laypage,
  	  $ = layui.$,
      form = layui.form;

  	$("body").on('click','tr',function(){
	  var tableDiv;
		var index = $(this).attr('data-index');
		var tableBox = $(this).parents('.layui-table-box');
		//存在固定列
		if (tableBox.find(".layui-table-fixed.layui-table-fixed-l").length>0) {
			tableDiv = tableBox.find(".layui-table-fixed.layui-table-fixed-l");
		} else {
			tableDiv = tableBox.find(".layui-table-body.layui-table-main");
		}
		var checkCell = tableDiv.find("tr[data-index=" + index + "]").find("td div.layui-table-cell div.layui-form-radio I");
		if (checkCell.length>0) {
			checkCell.click();
		}

	})
	 
	//对td的单击事件进行拦截停止，防止事件冒泡再次触发上述的单击事件  将此代码在页面初始化后执行一次即可以。
	$('body').on("click", "td div.layui-table-cell div.layui-form-radio", function (e) {
		e.stopPropagation();
	});
  
  axios.defaults.baseURL = getRootPath();
  axios.defaults.timeout = 2000;
  
  function getGradeListByNoPage() {
	return axios.get('/grade/get/nopage');
  }

  function getClassificationListByNoPage() {
    return axios.get('/classification/get/nopage');
  }

  function getUser1ListByNoPage(){
	  return axios.get("/user/get/nopage/11");
  }
  
  function getUser2ListByNoPage(){
	  return axios.get("/user/get/nopage/13");
  }
  function getUser3ListByNoPage(){
	  return axios.get("/user/get/nopage/12");
  }
  
  function getChannelListByNoPage(){
	  return axios.get("/channel/get/nopage");
  }
  
  function getSourceListByNoPage(){
	  return axios.get("/source/get/nopage");
  }
  
  function getEducationListByNoPage(){
	  return axios.get("/education/get/nopage");
  }
  
  function getStiuationListByNoPage(){
	  return axios.get("/stiuation/get/nopage");
  }
  
  axios.all([
	  getGradeListByNoPage(), 
	  getClassificationListByNoPage(),
	  getUser1ListByNoPage(),
	  getUser2ListByNoPage(),
	  getUser3ListByNoPage(),
	  getChannelListByNoPage(),
	  getSourceListByNoPage(),
	  getEducationListByNoPage(),
	  getStiuationListByNoPage()])
	 .then(axios.spread(function (acct, perms,res1,res2,res3,channel,source,education,stiuation) {
    		// 两个请求现在都执行完成
	    $.each(acct.data,function(i,v){
			$("#grade").append($("<option>").val(this.id).text(this.gradeName));
		});
	    
	    $.each(perms.data,function(i,v){
			$("#classification").append($("<option>").val(this.id).text(this.name));
		});
	    
	    $.each(res1.data,function(i,v){
			$("#user1").append($("<option>").val(this.id).text(this.nickName));
		});
	    
	    $.each(res2.data,function(i,v){
			$("#user2").append($("<option>").val(this.id).text(this.nickName));
		});
	    
	    $.each(res3.data,function(i,v){
			$("#user3").append($("<option>").val(this.id).text(this.nickName));
		});
	    
		$.each(channel.data,function(index,value){
			$("#channel").append("<optgroup id='channel"+index+"' label='"+value.parentName+"'>");
				$.each(value.childChannelList,function(i,v){
					$("#channel"+index).append("<option value='"+v.id+"'>"+v.channelName+"</option>");
				});
			$("#channel"+index).append("</optgroup>");
		});	
	    
		$.each(source.data,function(index,value){
			$("#source").append("<optgroup id='source"+index+"' label='"+value.parentName+"'>");
				$.each(value.childChannelList,function(i,v){
					$("#source"+index).append("<option value='"+v.id+"'>"+v.sourceName+"</option>");
				});
			$("#channel"+index).append("</optgroup>");
		});	
	    
	    $.each(education.data,function(i,v){
			$("#education").append($("<option>").val(this.id).text(this.name));
		});
	    
	    $.each(stiuation.data,function(i,v){
			$("#stiuation").append($("<option>").val(this.id).text(this.name));
		});
	      
    	form.render('select'); //重新渲染select框，这个必须要加，否则不起作用
  	  })
  );
  
  

  //第一个实例
  table.render({
	id:'driverCode',//表格的id,当查询时，可以使用该id进行表格重载
	cellMinWidth: 95,
	toolbar:'#tableBar',
    elem: '#inputTable',
    url: getRootPath()+'/input/get/list',
    loading:true,
    limit:10,
    limits:[15,30,45,60,100,200],
    page: {
      layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'],
      curr: location.hash.replace('#!fenye=', ''), //获取起始页
      hash: 'fenye', //自定义hash值 
      groups: 5, //只显示 1 个连续页码
      first: "首页", //不显示首页
      last: "尾页" //不显示尾页
    },
    text: {
	  none: '暂无相关数据' //默认：无数据。注：该属性为 layui 2.2.5 开始新增
	},
	request: {
  	  pageName: 'pageNumber', //页码的参数名称，默认：page
  	  limitName: 'pageSize' //每页数据量的参数名，默认：limit
  	  //curr:'currPage' //当前第几页
  	},
  	response: {
	  statusName: 'code',
	  msgName:'msg',
	  countName: 'count', //数据总数的字段名称，默认：count
	  dataName: 'data' //数据列表的字段名称，默
  	},
	done:function(res, curr, count){
		
	},
    cols: [[ //表头
      {type:'radio',title:'序号',align:'center'},
      {field: 'gradeName', title: '评级',align:'center',templet:function(d){return objectIsNull(d.gradeName)?"暂无数据":d.gradeName}},
      {field: 'nickName', title: '姓名',width:400,align:'center',templet:function(d){
    	  var subName = objectIsNull(d.subName)?"":"<span id='a' class='layui-badge layui-bg-green '>"+d.subName+"</span>";
    	  //var backMessage = objectIsNull(d.backMessage)?"":"<span class='layui-badge layui-bg-orange'>"+d.backMessage+"</span>"; 回访次数
    	  //var toHome = objectIsNull(d.toHome)?"":"<span class='layui-badge layui-bg-blue'>"+d.toHome+"</span>"; 上门次数
    	  //var totalPay = objectIsNull(d.totalPay)?"":"<span class='layui-badge layui-bg-cyan'>"+d.totalPay+"</span>"; 累计订金金额
    	  //var enroll = d.enroll == 0 ?"":"<span class='layui-badge layui-bg-green'>已报名</span>"; //是否报名
    	  
    	  var backMessage = "<span class='layui-badge layui-bg-orange'>"+"回访次数:2次"+"</span>",
    	  toHome="<span class='layui-badge layui-bg-blue'>"+"上门次数:3次"+"</span>",
    	  enroll="<span class='layui-badge layui-bg-badge'>"+"已报名"+"</span>";
    	  
    	  return d.nickName+"&nbsp;&nbsp;&nbsp;&nbsp;" 
    	  + backMessage+"&nbsp;&nbsp;&nbsp;&nbsp;" 
    	  + toHome+"&nbsp;&nbsp;&nbsp;&nbsp;" 
    	  + enroll+"&nbsp;&nbsp;&nbsp;&nbsp;" 
    	  + subName;}
      },
      {field: 'user1Name', title: '网咨',align:'center',templet:function(d){return objectIsNull(d.user1Name)?"<font color='red'>未分配</font>":d.user1Name;}},
      {field: 'user2Name', title: '咨询',align:'center',templet:function(d){return objectIsNull(d.user2Name)?"<font color='red'>未分配</font>":d.user2Name;}},
      {field: 'user3Name', title: '助理',align:'center',templet:function(d){return objectIsNull(d.user3Name)?"<font color='red'>未分配</font>":d.user3Name;}},
      {field: 'educationName', title: '学历',align:'center',templet:function(d){return objectIsNull(d.educationName)?"<font color='gray'>暂无数据</font>":d.educationName;}},
      {field: 'stiuationName', title: '现状',align:'center',templet:function(d){return objectIsNull(d.stiuationName)?"<font color='gray'>暂无数据</font>":d.stiuationName;}}, 
      {field: 'channelName', title: '渠道',align:'center',templet:function(d){return objectIsNull(d.channelName)?"<font color='gray'>暂无数据</font>":d.channelName;}},
      {field: 'modifyUser', title: '最后录入',align:'center'}
    ]]
  });
  
/*   var active = {
			reload: function(){
			  var driverName = $('#driverNameGrabble').val();
			  //执行重载
			  table.reload('driverCode', {
				page: {
					pageNumber: 1 //重新从第 1 页开始
				}
				,where: {
					driverName: driverName,
				}
			  });
			}
		};

		$('.driverTable .layui-btn').on('click', function(){
			var type = $(this).data('type');
			active[type] ? active[type].call(this) : '';
		  }); */
		
		
		table.on('toolbar(inputTableFilter)',function(data){
			var query = table.checkStatus(data.config.id);
			switch(data.event){
				case "reload":
					var grade = $("#grade option:selected").val();
					var backMsg = $("#backMsg option:selected").val();
					var toHome = $("#toHome option:selected").val();
					var classification = $("#classification option:selected").val();
					var user1 = $("#user1 option:selected").val(); 
					var user2 = $("#user2 option:selected").val(); 
					var user3 = $("#user3 option:selected").val();
					var channel = $("#channel option:selected").val();
					var source = $("#source option:selected").val();
					var education = $("#education option:selected").val();
					var stiuation = $("#stiuation option:selected").val();
					var enroll = $("#enroll option:selected").val();
					var address = $("#address").val();
					var nickName = $("#nickName").val();
					table.reload('driverCode',{
						page:{
							curr:1
						},
						where:{
							grade:grade,
							backMsg:backMsg,
							toHome:toHome,
							classification:classification,
							user1:user1,
							user2:user2,
							user3:user3,
							channel:channel,
							source:source,
							education:education,
							stiuation:stiuation,
							enroll:enroll,
							address:address,
							nickName:nickName
						}
					});
					break;
				case "clear":
					location.reload(false);
					break;
				case "scanner":
					alert("scanner");
					break;
				case 'show': //详情
					var checkStatus = table.checkStatus('driverCode');
					var data = checkStatus.data;
					if(data.length != 1){
						parent.layer.msg("请选择一条记录进行操作",function(){});
						return;
					}
		    		parent.layer.open({
		    			area:["100%","100%"],
		    			title: data[0].nickName + '&nbsp;&nbsp;&nbsp;&nbsp;一一&nbsp;&nbsp;&nbsp;&nbsp;详细信息',
		    			type:2,
		    			shade:[1.2,"#000"],
		    			shadeClose:true,
		    			maxmin:true,
		    			content:getRootPath()+"/user/get/info/"+data[0].id,
		    			success:function(layero,index){
		    			    var body = parent.layer.getChildFrame('body', index);  
                			var iframeWin = parent.window[layero.find('iframe')[0]['name']]; 
		    	            body.find('.layui-username').append("<td>"+(data[0].username == null? "暂无数据":data[0].username)+"</td>");
		    	            body.find('.layui-password').append("<td>"+(data[0].password == null? "暂无数据":data[0].password)+"</td>");
		    	            body.find('.layui-telephoneA').append("<td>"+(data[0].telephoneA == null? "暂无数据":data[0].telephoneA)+"</td>");
		    	            body.find('.layui-telephoneB').append("<td>"+(data[0].telephoneB == null? "暂无数据":data[0].telephoneB)+"</td>");
		    	            body.find('.layui-qq').append("<td>"+(data[0].qq == null? "暂无数据":data[0].qq)+"</td>");
		    	            body.find('.layui-cord').append("<td>"+(data[0].cord == null? "暂无数据":data[0].cord)+"</td>");
		    	            body.find('.layui-nickName').append("<td>"+(data[0].nickName == null? "暂无数据":data[0].nickName)+"</td>");
		    	            body.find('.layui-age').append("<td>"+(data[0].age == null? "暂无数据":data[0].age)+"</td>");
		    	            body.find('.layui-sex').append("<td>"+(data[0].sex == 1 ? '男':'女')+"</td>");
		    	            body.find('.layui-email').append("<td>"+(data[0].email == null? "暂无数据":data[0].email)+"</td>");
		    	            body.find('.layui-birthday').append("<td>"+dateFormatter(data[0].birthday)+"</td>");
		    	            body.find('.layui-address').append("<td>"+(data[0].address == null? "暂无数据":data[0].address)+"</td>");
		    	            body.find('.layui-identityName').append("<td>"+(data[0].identityName == null? "暂无数据":data[0].identityName)+"</td>");
		    	            body.find('.layui-levelName').append("<td>"+(data[0].levelName == null? "暂无数据":data[0].levelName)+"</td>");
		    	            body.find('.layui-subName').append("<td>"+(data[0].subName == null? "暂无数据":data[0].subName)+"</td>");
		    	            body.find('.layui-createUser').append("<td>"+(data[0].createUser == null? "暂无数据":data[0].createUser)+"</td>");
		    	            body.find('.layui-createTime').append("<td>"+dateFormatter(data[0].createTime)+"</td>");
		    	            body.find('.layui-modifyUser').append("<td>"+(data[0].modifyUser == null? "暂无数据":data[0].modifyUser)+"</td>");
		    	            body.find('.layui-modifyTime').append("<td>"+dateFormatter(data[0].modifyTime)+"</td>");
		    	            body.find('.layui-searchName').append("<td>"+(data[0].searchName == null? "暂无数据":data[0].searchName)+"</td>");
		    	            body.find('.layui-unqueCode').append("<td>"+(data[0].unqueCode == null? "暂无数据":data[0].unqueCode)+"</td>");
		    	            body.find('.layui-pay').append("<td>"+(data[0].pay == null? "暂无数据":data[0].pay)+"</td>");
		    	            body.find('.layui-classesNames').append("<td>"+(data[0].classesNames == null? "暂无数据":data[0].classesNames)+"</td>");
		    	            body.find('.layui-gradeName').append("<td>"+(data[0].gradeName == null? "暂无数据":data[0].gradeName)+"</td>");
		    	            body.find('.layui-majorName').append("<td>"+(data[0].majorName == null? "暂无数据":data[0].majorName)+"</td>");
		    	            body.find('.layui-classificationName').append("<td>"+(data[0].classificationName == null? "暂无数据":data[0].classificationName)+"</td>");
		    	            body.find('.layui-sourceName').append("<td>"+(data[0].sourceName == null? "暂无数据":data[0].sourceName)+"</td>");
		    	            body.find('.layui-toolName').append("<td>"+(data[0].toolName == null? "暂无数据":data[0].toolName)+"</td>");
		    	            body.find('.layui-stiuationName').append("<td>"+(data[0].stiuationName == null? "暂无数据":data[0].stiuationName)+"</td>");
		    	            body.find('.layui-educationName').append("<td>"+(data[0].educationName == null? "暂无数据":data[0].educationName)+"</td>");
		    	            body.find('.layui-channelName').append("<td>"+(data[0].channelName == null? "暂无数据":data[0].channelName)+"</td>");
		    	            body.find('.layui-user1Name').append("<td>"+(data[0].user1Name == null? "暂无数据":data[0].user1Name)+"</td>");
		    	            body.find('.layui-user2Name').append("<td>"+(data[0].user2Name == null? "暂无数据":data[0].user2Name)+"</td>");
		    	            body.find('.layui-user3Name').append("<td>"+(data[0].user3Name == null? "暂无数据":data[0].user3Name)+"</td>");
		    			}
		    		});
		    		break;
		    	case 'visit': //回访
		    		var checkStatus = table.checkStatus('driverCode');
					var data = checkStatus.data;
		    		alert("visit");
		    		break;
		    	case 'distribution': //分配
		    		alert("distribution");
		    		break;
		    	case 'grade': //评级
		    		alert("grade");
		    		break;
		    	case 'edit': // 修改
		    		alert("edit");
		    		break;
		    	case 'del': // 删除
		    		alert("del");
		   			break;
			}
		});
	
		table.on('tool(inputTableFilter)', function(obj){
		    var data = obj.data;
		         
		    switch(obj.event){
		    	
		    }
/* 		    if(obj.event === 'del'){
		      layer.confirm('真的删除行么', function(index){
		        obj.del();
		        layer.close(index);
		      });
		    } else if(obj.event === 'edit'){
		      layer.prompt({
		        formType: 2
		        ,value: data.id
		      }, function(value, index){
		        obj.update({
		          email: value
		        });
		        layer.close(index);
		      });
		    } */
		  });
});


</script>
</html>