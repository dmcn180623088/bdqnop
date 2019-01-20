<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色列表</title>
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
<script type="text/html" id="tableBar">
  <div class="layui-btn-container">
    <button class="layui-btn layui-btn-sm" lay-event="reload"><i class="layui-icon">&#xe615;</i>查询</button>
    <button class="layui-btn layui-btn-sm" lay-event="clear"><i class="layui-icon">&#xe9aa;</i>重置</button>
    <button class="layui-btn layui-btn-sm" lay-event="scanner"><i class="layui-icon">&#xe654;</i>录入</button>
    <button class="layui-btn layui-btn-sm" lay-event="edit"><i class="layui-icon">&#xe642;</i>编辑</button>
	<button class="layui-btn layui-btn-sm" lay-event="opt"><i class="layui-icon">&#xe672;</i>启禁</button>    
	<button class="layui-btn layui-btn-sm" lay-event="del"><i class="layui-icon">&#xe640;</i>删除</button>
  </div>
</script>
<div class="layui-fluid" style="height:auto"> 
		<div class="layui-row">
			<div class="layui-col-md12 layui-col-sm12 layui-col-xs12 layui-col-lg12">
				<div class="layui-form" style="margin-top: 10px;margin-left: 5px;">
					<div class="layui-role-group">	
						<div class="layui-role-inline">
							<input type="text" class="layui-input" style="width:90%;" id="roleName" lay-filter="nameFilter" placeholder="请输入角色进行筛选" />
						</div>
					</div>	
				</div>			
			</div>
		</div>
		<div class="layui-row">
			<div class="layui-col-md12 layui-col-sm12 layui-col-xs12 layui-col-lg12">
				<table class="layui-hide" id="roleTable" lay-filter="roleTableFilter"></table>
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
  
  //第一个实例
  table.render({
	id:'driverCode',//表格的id,当查询时，可以使用该id进行表格重载
	cellMinWidth: 95,
	toolbar:'#tableBar',
    elem: '#roleTable',
    url: getRootPath()+'/role/get/list',
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
      {type:'radio',field: 'id',title:'序号',align:'center'},
      {field: 'name', title: '名称',align:'center',templet:function(d){return objectIsNull(d.name)?"暂无数据":d.name}},
      {field: 'keyword', title: '关键字',align:'center',templet:function(d){return objectIsNull(d.keyword)?"暂无数据":d.keyword;}},
      {field: 'description', title: '描述',align:'center',templet:function(d){return objectIsNull(d.description)?"暂无数据":d.description;}},
      {field: 'prohibition', title: '启禁',align:'center',templet:function(d){
    	  if(d.prohibition==0){
    		  return "<font color='red'>禁用</font>"
    	  }else{
    		  return "<font color='green'>启用</font>"
    	  }
      }},
      {field: 'modifyUser', title: '最后录入',align:'center'}
    ]]
  });
  
		table.on('toolbar(roleTableFilter)',function(data){
			var query = table.checkStatus(data.config.id);
			switch(data.event){
				case "reload":
					var roleName = $("#roleName").val();
					table.reload('driverCode',{
						page:{
							curr:1
						},
						where:{
							roleName:roleName
						}
					});
					break;
				case "clear":
					location.reload(false);
					break;
				case "scanner":
					parent.layer.open({
						area:["100%","100%"],
						title:'新增学生信息',
						type:2,
						shade:[1.2,"#000"],
		    			shadeClose:true,
		    			maxmin:true,
		    			content:getRootPath()+'/role/show/addentity',
		    			end:function(index){
		    				location.reload(false);
		    			}
					});
					break;
				case "opt":
					var checkStatus = table.checkStatus('driverCode');
					var data = checkStatus.data;
					if(data.length != 1){
						parent.layer.msg("请选择一条记录进行操作",function(){});
						return;
					}
					var id = data[0].id;
					parent.layer.confirm(
							'您确定要启禁该条数据吗?'
							,{title:'启禁确认'},
							function(index){
								axios.get('/role/opt/entity/'+id).then(function(resquest){
									parent.layer.msg(resquest.data.message);
									layer.close(index);
									location.reload(false);
								 })
							},
							function(index){
								layer.close(index);
								parent.layer.msg("取消了操作");
							}
					);
					break;
		    	case 'edit': // 修改
		    		var checkStatus = table.checkStatus('driverCode');
					var data = checkStatus.data;
					if(data.length != 1){
						parent.layer.msg("请选择一条记录进行操作",function(){});
						return;
					}
					parent.layer.open({
						area:["100%","100%"],
						title:'修改学生信息',
						type:2,
						shade:[1.2,"#000"],
		    			shadeClose:true,
		    			maxmin:true,
		    			content:getRootPath()+'/role/show/addentity',
		    			success:function(layero,index){
		    			    var body = parent.layer.getChildFrame('body', index);  
                			var iframeWin = parent.window[layero.find('iframe')[0]['name']]; 
		    	            body.find('input[name="id"]').val(data[0].id);
		    	            body.find('input[name="name"]').val(data[0].name);
		    	            body.find('input[name="keyword"]').val(data[0].keyword);
		    	            body.find('input[name="description"]').val(data[0].description);
		    	            },
		    			end:function(layero,index){
		    				location.reload(false);
		    			}
					});
		    		break;
		    	case 'del': // 删除
		    		var checkStatus = table.checkStatus('driverCode');
					var data = checkStatus.data;
					if(data.length != 1){
						parent.layer.msg("请选择一条记录进行操作",function(){});
						return;
					}
					var id = data[0].id;
					parent.layer.confirm(
							'您确定要删除该条数据吗?'
							,{title:'删除确认'},
							function(index){
								axios.get('/role/del/entity/'+id).then(function(resquest){
									parent.layer.msg(resquest.data.message);
									layer.close(index);
									location.reload(false);
								 })
							},
							function(index){
								layer.close(index);
								parent.layer.msg("取消了操作");
							}
					);
		   			break;
			}
		});
	
		table.on('tool(roleTableFilter)', function(obj){
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