<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta http-equiv="X-UA-Compatible" content="ie=edge" />
	<link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css"/>
	<script src="https://cdn.jsdelivr.net/npm/vue@2.5.21/dist/vue.js"></script>
  	<script src="https://unpkg.com/element-ui/lib/index.js"></script>
  	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	<title></title>
</head>

<body>
	<div id="app">
	
			<el-form :inline="true" :model="menu" class="demo-form-inline">
			  <el-form-item label="菜单名称">
			    <el-input v-model="menu.title" placeholder="请输入菜单名称"></el-input>
			  </el-form-item>
			  <el-form-item>
			    <el-button type="primary" @click="searchMenu">查询</el-button>
			  </el-form-item>
			</el-form>
			<el-table :data="list" stripe border  style="width: 100%">
				<el-table-column type="index"></el-table-column>
				<el-table-column prop="title" label="菜单名称" width="180" align="center"></el-table-column>
				<el-table-column prop="href" label="菜单路径" width="300" align="center" :formatter="hrefFormatter"></el-table-column>
				<el-table-column prop="opt" label="菜单级别" width="170" align="center" :formatter="levelFormatter"></el-table-column>
				<el-table-column prop="description" label="菜单描述" width="180" align="center"></el-table-column>
				<el-table-column prop="priority" label="菜单权重" width="100" align="center"></el-table-column>
				<el-table-column prop="mdifyTime" label="修改时间" width="180" align="center" :formatter="dateFormatter"></el-table-column>
				<el-table-column prop="prohibition" label="是否禁用" width="180" align="center" :formatter="dataFormatter"></el-table-column>
			</el-table>
			<el-pagination background layout="prev, pager, next, sizes, total, jumper" :page-sizes="[5, 10, 15, 20,50,100]"
			 :page-size="pagesize" :total="total" @current-change="handleCurrentChange" @size-change="handleSizeChange">
			</el-pagination>
	</div>
</body>
<script>
	
	Vue.use(ELEMENT);
	
	axios.defaults.baseURL = "http://localhost:8080/bdqnoa";
	axios.defaults.timeout = 1000;
	
	var vm = new Vue({
		el: "#app",
		data: {
			msg: 8888,
			list: [],
			pagesize: 10,
			currpage: 1,
			total: 0,
			menu:{title:""}
		},
		methods: {
			getlist() {
				var that = this;
				var url = null;
				if(that.menu.title != null || that.menu.title != "" || that.menu.title != undefined){
					url = "/menu/list/" + that.currpage + "/" + that.pagesize+"/"+that.menu.title;
				}else if(that.menu.title == ""){
					url = "/menu/list/" + that.currpage + "/" + that.pagesize;
				}
				axios(url)
					.then(function (response) {
						that.list = response.data.list;
						that.total = response.data.total;
					})
					.catch(function (error) {
						alert("请求失败");
					});
			},
			handleCurrentChange: function (cpage) {
				this.currpage = cpage;
				this.getlist();
			},
			handleSizeChange: function (psize) {
				this.pagesize = psize;
				this.getlist();
			},
			dataFormatter: function (row, column, cellValue, index) {
				let pro = row.prohibition;
				if (pro === 0) {
					return "已禁用";
				} else {
					return "未禁用";
				}
			},
			dateFormatter: function (row, column, cellValue, index) {
				let datetime = row.mdifyTime;
				if (datetime) {
					datetime = new Date(datetime);
					let y = datetime.getFullYear() + "-";
					let mon = datetime.getMonth() + 1 + "-";
					let d = datetime.getDate();
					return y + mon + d;
				}
				return "";
			},
			hrefFormatter: function (row, column, cellValue, index) {
				let href = row.href;
				console.log(href);
				if (href == "" || href == null || href == undefined) {
					return "-";
				}
				return href;
			},
			levelFormatter:function(row, column,cellValue,index){
				let pid = row.pid;
				if(pid == null || pid == "" || pid == undefined){
					return "父级菜单";
				}
				return "子级菜单";
			},
			searchMenu:function(){
				this.getlist();
			}
		},
		mounted() {
			this.getlist();
		}
	});
</script>
</html>