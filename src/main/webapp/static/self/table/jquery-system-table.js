




//创建被逻辑删除的角色数据列表
function initDelRoleTable(){
	$("#delRoleTable").bootstrapTable({
		url:getRootPath()+'/role/get/delentity.do',
		method : 'GET',
		dataType : 'json',
		checkboxHeader : false, //设置为false时,表头隐藏复选框
		singleSelect : true, //只能单选行
		striped : true, //隔行换色
		cache : false, ////是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
		clickToSelect : true, //点击行时,自动勾选复选框或单选框
		pagination : true,//是否显示分页工具条
		sidePagination : "server", //分页方式：client客户端分页，server服务端分页（*）
		pageNumber : 1, //首页页码
		pageSize : 10, //页面容量
		uniqueId : "id", //每一行的唯一标识，一般为主键列
		cardView : false, //是否显示详细视图
		queryParams : function(params) {//得到查询的参数
			//这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
			var temp = {
				limit : params.limit, // 每页显示数量
				offset : params.offset, // SQL语句起始索引
				page : (params.offset / params.limit) + 1
			};
			return temp;
		},
		columns:[
			{radio : true},
			{field : 'id',visible : false},//visible:false隐藏
			{field : 'name',title : '角色名称',titleTooltip : '这是角色的名称',align : 'center'},
			{field : 'keyword',title : '关键字',align : 'center'},
			{field : 'description',title : '角色描述',align : 'center'},
			{field : 'status',title : '删除状态',align : 'center', formatter : function(value,row,index){
				if (value == 0) return "<font color='red'>已删除</font>";
				else return "<font color='yellow'>数据加载异常</font>";
			}},
			{field : 'modifyUser',title : '操作人',align : 'center'},
			{field : 'mdifyTime',title : '操作时间',align : 'center',formatter : function(value,row,index){
				return dateFormatter(row.mdifyTime);
			}},
			{field : 'opt',title : '操作',align : 'center',formatter : function(value,row,index){
				var id = row.id;
				var result = "<div class='btn-group' role='group' aria-label='...''>";
				result += "<button  onclick='r("+ id+ ")' type='button' class='btn btn-success btn-xs'>恢复数据 ";
				result += "<button  onclick='z("+ id+ ")' type='button' class='btn btn-danger btn-xs'>物理删除";
				result += "</div>";
				return result;
			}},
		]
	});
}


//用户表格
function initUserTable(){
	$("#userTable").bootstrapTable({
		url:getRootPath()+'/user/get/list.do',
		method : 'GET',
		dataType : 'json',
		checkboxHeader : false, //设置为false时,表头隐藏复选框
		singleSelect : true, //只能单选行
		striped : true, //隔行换色
		cache : false, ////是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
		clickToSelect : true, //点击行时,自动勾选复选框或单选框
		pagination : true,//是否显示分页工具条
		sidePagination : "server", //分页方式：client客户端分页，server服务端分页（*）
		pageNumber : 1, //首页页码
		pageSize : 10, //页面容量
		uniqueId : "id", //每一行的唯一标识，一般为主键列
		cardView : false, //是否显示详细视图
		detailView : true, //是否显示父子表
		queryParams : function(params) {//得到查询的参数
			//这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
			var temp = {
				limit : params.limit, // 每页显示数量
				offset : params.offset, // SQL语句起始索引
				page : (params.offset / params.limit) + 1
			};
			return temp;
		},
		columns:[
			{radio : true},
			{field : 'id',visible : false},//visible:false隐藏
			{field : 'nickName',title : '用户姓名',titleTooltip : '这是用户的名称',align : 'center'},
			{field : 'sex',title : '性别',align : 'center',formatter : function(value,row,index){
				if(value == 1) return "男";
				if(value == 0) return "女";
			}},
			{field : 'username',title : '用户名',align : 'center'},
			{field : 'password',title : '密码',align : 'center'},
			{field : 'level',title : '所在部门',align : 'center',formatter:function(){return "市场部";}},
			{field : 'cord',title : '身份证',align : 'center'},
			{field : 'telephoneA',title : '常用电话',align : 'center'},
			{field : 'telephoneB',title : '备用电话',align : 'center'},
			{field : 'prohibition',title : '启禁状态',align : 'center', formatter : function(value,row,index){
				if (value == 0) return "<font color='red'>已禁用</font>";
				if (value == 1) return "<font color='green'>已启用</font>";
				else return "<font color='yellow'>数据加载异常</font>";
			}}
		],
		//注册加载子表的事件。你可以理解为点击父表中+号时触发的事件
		onExpandRow : function(index, row, $detail) {
			//这一步就是相当于在当前点击列下新创建一个table
			var parentId = row.id;
			var cur_table = $detail.html('<table></table>')
					.find('table');
			var html = "";
			html += "<table class='table table-bordered table-condensed'>";
			html += "<thead>";
			html += "<tr style='height: 40px'>";
			html += "<th style='text-align: center;padding-bottom:10px;' class='warning'>邮箱</th>";
			html += "<th style='text-align: center;padding-bottom:10px;' class='warning'>生日</th>";
			html += "<th style='text-align: center;padding-bottom:10px;' class='warning'>地址</th>";
			html += "<th style='text-align: center;padding-bottom:10px;' class='warning'>描述</th>";
			html += "<th style='text-align: center;padding-bottom:10px;' class='warning'>创建人</th>";
			html += "<th style='text-align: center;padding-bottom:10px;' class='warning'>创建时间</th>";
			html += "<th style='text-align: center;padding-bottom:10px;' class='warning'>修改人</th>";
			html += "<th style='text-align: center;padding-bottom:10px;' class='warning'>修改时间</th>";
			html += "</tr>";
			html += "</thead>";
			//遍历子表数据
			html += "<tr>" 
					+ "<td class='warning'>"+ row.email + "</td>"
					+ "<td class='warning'>"+ dateFormatter(row.birthday) + "</td>"
					+ "<td class='warning'>"+ row.address + "</td>"
					+ "<td class='warning'>"+ row.description + "</td>"
					+ "<td class='warning'>"+ row.createUser + "</td>"
					+ "<td class='warning'>"+ dateFormatter(row.createTime)+ "</td>" 
					+ "<td class='warning'>"+ row.modifyUser + "</td>"
					+ "<td class='warning'>"+ dateFormatter(row.modifyTime)+ "</td>" 
					+ "</tr>";
			html += '</table>';
			$detail.html(html); // 关键地方
		}
	});
}
