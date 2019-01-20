<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>系统首页</title>
<style type="text/css">
.seeContent:hover{
 	color:green;
 	cursor:pointer;
 }
 .pull-right.pagination-detail{ 
display:none; 
}
</style>
<meta name="renderer" content="webkit">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/plugins/layui/css/layui.css" media="all" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/js/layuiadmin/style/admin.css" media="all">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/bootstrap/vendor/bootstrap/css/bootstrap.css"/>

<link id="layuicss-layer" rel="stylesheet" href="${pageContext.request.contextPath}/static/plugins/layer/theme/default/layer.css" media="all">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/bootstrap/bootstraptable/bootstrap-table.css" media="all" />
<script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/vendor/jquery/jquery-1.10.2.min.js"></script>
<script src="${pageContext.request.contextPath}/static/Highcharts-6.2.0/code/highcharts.js"></script>
<script src="${pageContext.request.contextPath}/static/Highcharts-6.2.0/code/modules/data.js"></script>
<script src="${pageContext.request.contextPath}/static/Highcharts-6.2.0/code/modules/drilldown.js"></script>
<script src="${pageContext.request.contextPath}/static/js/heightcharts/highcharts-zh_CN.js"></script>
 <script src="${pageContext.request.contextPath}/static/js/heightcharts/grid-light.js"></script> 
 <script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/bootstraptable/bootstrap-table.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/bootstraptable/bootstrap-table-zh-CN.js"></script>
<body style="background-color:#F2F2F2 ">
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/static/js/tool.js"></script>
	<div class="layui-fluid">
		<div class="layui-row layui-col-space15">
			<div class="layui-col-md8">
				<div class="layui-row layui-col-space15">
					<div class="layui-col-md6">
						<div class="layui-card">
							<div class="layui-card-header">教师分析</div>
							<div class="layui-card-body">

								<div class="layui-carousel layadmin-carousel layadmin-backlog">
									<div carousel-item>
										<ul class="layui-row layui-col-space10">
											<li class="layui-col-xs10">
												<div class="layui-card-body layuiadmin-card-list">
													<p id = "teaCount" class="layuiadmin-big-font"></p>
													<p style="margin-top: 50px">
														石家庄北大青鸟正式员工总计量
													</p>
													<p style="position: relative;left: 90%;bottom: 58px"><i style="font-size: 85px;font-weight: 0"  class="layui-icon layui-icon-user"></i>  </p>
												</div>
											</li>
										</ul>
										<ul class="layui-row layui-col-space12">
										<li class="layui-col-xs12" style="height: 210px;margin: 0px;padding: 0px">
												<div class="layui-col-xs12" id="teacherContainer" style=" height:100%; width:100%; margin: 0px 0px;"></div>
										</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="layui-col-md6">
						<div class="layui-card">
							<div class="layui-card-header">学员分析</div>
							<div class="layui-card-body">

								<div class="layui-carousel layadmin-carousel layadmin-backlog">
									<div carousel-item>
										<ul class="layui-row layui-col-space10">
											<li class="layui-col-xs10">
												<div class="layui-card-body layuiadmin-card-list">
													<p id = "stuCount" class="layuiadmin-big-font"></p>
													<p style="margin-top: 50px">
														石家庄北大青鸟正式学生总计量
													</p>
													<p style="position: relative;left: 90%;bottom: 58px"><i style="font-size: 85px;font-weight: 0"  class="layui-icon layui-icon-rate"></i>  </p>
												</div>
											</li>
										</ul>
										<ul class="layui-row layui-col-space10">
											<li class="layui-col-xs12" style="height: 205px;margin: 0px;padding: 0px">
													<div class="layui-col-xs12" id="stuContainer" style=" height:100%; width:100%; margin: 0px 0px;"></div>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="layui-col-md12">
						<div class="layui-card">
							<div class="layui-card-header">题库分析</div>
							<div class="layui-card-body">

								<div class="layui-carousel layadmin-carousel layadmin-dataview"
									data-anim="fade" lay-filter="LAY-index-dataview" style="margin: 0px;padding: 0px" >
									<div carousel-item id="LAY-index-dataview">
										<div id="questionContainer" style=" height:100%; width:100%; margin: 0px 0px;min-width: 310px;"></div>
										<!-- <div>占位</div> -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="layui-col-md4">
				<div class="layui-card">
					<div class="layui-card-header">版本信息</div>
					<div class="layui-card-body layui-text">
						<table class="layui-table">
							<colgroup>
								<col width="100">
								<col>
							</colgroup>
							<tbody>
								<tr height="58px">
									<td>当前版本</td>
									<td>
                     				v1.0
                     				<!-- <a href="#" target="_blank" style="padding-left: 15px;">更新日志</a> -->
                  				 </td>
								</tr>
								<tr height="58px">
									<td>开发团队</td>
									<td>石家庄北大青鸟精英班</td>
								</tr>
								<tr height="58px">
									<td>服务</td>
									<td>教师端</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

				<div class="layui-card">
					<div class="layui-card-header">待办事项 </div>
					<div class="layui-card-body layadmin-takerates" style="height: 352px;overflow:scroll;overflow: hidden; " >
						<blockquote class="layui-elem-quote news_search" style="display: flex; flex-direction: row; justify-content:flex-start; flex-wrap: nowrap;">
							<button class="layui-btn  layui-btn-xs" onclick="addMemo()" style="background-color: #FF5823;">新增</button>
							 <button class="layui-btn  layui-btn-xs" onclick="delMemo()">删除</button>
							 <button class="layui-btn  layui-btn-xs" onclick="editMemo()" style="background-color:#5cb85c ">已办</button>
							 <button class="layui-btn  layui-btn-xs" onclick="callMemo()" style="background-color: #2F4056;" >提醒</button>
							 <select id="alreadyDone" name="alreadyDone" onchange="selectChange()" lay-verify="" class="layui-btn layui-btn-xs search_input"  style="background-color:#4CC3FA; cursor:pointer;">
				  				<option value="">全部</option>	
				  				<option value="0">未办</option>	
				  				<option value="1">已办</option>	
				  			 </select>
						</blockquote>
						
						<div class="table-responsive">
							<table class="table table-striped table-hover"  data-toolbar="#btn-group" id="channelTable" style="text-align:center"></table>
						</div> 
						
					</div>
				</div>


			</div>

		</div>
	</div>
	<script src="${pageContext.request.contextPath}/static/plugins/layui/layui.js?t=1"></script>
	<script>
		layui.config({
			base : getRootPath() + '/static/js/layuiadmin/' //静态资源所在路径
		}).extend({
			index : 'lib/index' //主入口模块
		}).use([ 'index', 'console' ]);
	</script>
	<style id="LAY_layadmin_theme">
.layui-side-menu, .layadmin-pagetabs .layui-tab-title li:after,
	.layadmin-pagetabs .layui-tab-title li.layui-this:after,
	.layui-layer-admin .layui-layer-title, .layadmin-side-shrink .layui-side-menu .layui-nav>.layui-nav-item>.layui-nav-child
	{
	background-color: #20222A !important;
}

.layui-nav-tree .layui-this, .layui-nav-tree .layui-this>a,
	.layui-nav-tree .layui-nav-child dd.layui-this, .layui-nav-tree .layui-nav-child dd.layui-this a
	{
	background-color: cornflowerblue !important;
}

.layui-layout-admin .layui-logo {
	background-color: #20222A !important;
}
</style>
</body>
<script>
var tea = null;
var stu = null;
var question = null;

var teaSeries = {};
var stuSeries = {};
var queSeries = {};

//新增备忘
function addMemo() {
	parent.layer.open({
		type : 2,
		title : "新增我的待办事项",
		area : [ '100%', '100%' ],
		encodeURI : 'utf-8',
		shade : [1.2,"#000"],
		id:"add_one",
		maxmin : false,
		closeBtn:0,
		content : getRootPath() + "/memo/addentity/view.do",
		btn:["确定","关闭"],
		btnAlign:'c',
		yes:function(index,layero){
			var body = layer.getChildFrame('body', index);
		    var iframeWin = parent.window[layero.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：
		    iframeWin.subChildForm();
		},
		btn2:function(index,layero){
			parent.layer.close(index);
		},
		end : function() {
			$("#channelTable").bootstrapTable('refresh');
		}
	});
}

//选择下拉框查询
function selectChange() {
	$("#channelTable").bootstrapTable('destroy');
	initChannelTable();
}

//逻辑删除备忘
function delMemo() {
	var rows = $("#channelTable").bootstrapTable('getSelections');
	
	if(rows.length != 1){
		parent.layer.msg("请选中一条内容进行操作");
		return false;
	}
	
	parent.layer.confirm(
			"您确定要操作该条记录吗?",
			{title:'删除待办'},
			function(index){
				$.ajax({
					dataType:'json',
					type:'POST',
					data:{"memoId":rows[0].id},
					url:getRootPath()+"/memo/del/entity.do",
					success:function(data){
						layer.close(index);
						parent.layer.msg(data.message);
						$("#channelTable").bootstrapTable('refresh');
					}
				});
			}
	);	
}


//修改状态为已办
function editMemo() {
	var rows = $("#channelTable").bootstrapTable('getSelections');
	
	if(rows.length != 1){
		parent.layer.msg("请选中一条内容进行操作");
		return false;
	}
	
	if(rows[0].alreadyDone == '1'){
		parent.layer.msg("该事项为已办状态");
		return false;
	}
	
	parent.layer.confirm(
			"您确定要操作该条记录吗?",
			{title:'确认已办'},
			function(index){
				$.ajax({
					dataType:'json',
					type:'POST',
					data:{"memoId":rows[0].id},
					url:getRootPath()+"/memo/edit/alreadydone.do",
					success:function(data){
						layer.close(index);
						parent.layer.msg(data.message);
						$("#channelTable").bootstrapTable('refresh');
					}
				});
			}
	);	
	
}

/**
 * 提醒备忘 如果已经有要提醒的时间，那么弹窗给出修改，如果没有时间，那么让用户新定时间
 */
function callMemo() {
	var rows = $("#channelTable").bootstrapTable('getSelections');
	if(rows.length != 1){
		parent.layer.msg("请选中一条内容进行操作");
		return false;
	}
	if(rows[0].alreadyDone == '1'){
		parent.layer.msg("该事项已经处理完毕，无法定时提醒");
		return false;
	}
	//获得提醒时间
	var ct = rows[0].callTime;
	if(ct != null && ct != "") {
		parent.layer.confirm("本条事项您已经开启了提醒，确定要修改吗?",{title:'确认操作'},
				function(index){
					parent.layer.close(index);
					parent.layer.open({
						type : 2,
						title : "修改备忘定时提醒",
						area : [ '100%', '100%' ],
						encodeURI : 'utf-8',
						shade : [1.2,"#000"],
						maxmin : false,
						closeBtn:0,
						content : getRootPath() + "/memo/editentity/view.do?id="+rows[0].id,
						btn:["确定定时","取消提醒","关闭窗口"],
						btnAlign:'c',
						yes:function(index,layero){
							var body = layer.getChildFrame('body', index);
						    var iframeWin = parent.window[layero.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：
						    iframeWin.subChildForm();
						},btn2:function(index,layero){
							//删除本次定时任务
							var body = layer.getChildFrame('body', index);
						    var iframeWin = parent.window[layero.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：
						    iframeWin.subChildForm();
						},
						end : function() {
							$("#channelTable").bootstrapTable('refresh');
						}
					});
				}
		);	
	}else{
		parent.layer.open({
			type : 2,
			title : "指定定时提醒",
			area : [ '100%', '100%' ],
			encodeURI : 'utf-8',
			shade : [1.2,"#000"],
			id:"add_one1",
			maxmin : false,
			closeBtn:0,
			content : getRootPath() + "/memo/editentity/view.do?id="+rows[0].id,
			btn:["确定定时","关闭窗口"],
			btnAlign:'c',
			yes:function(index,layero){
				var body = layer.getChildFrame('body', index);
			    var iframeWin = parent.window[layero.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：
			    iframeWin.subChildForm();
			},
			btn2:function(index,layero){
				parent.layer.close(index);
			},
			end : function() {
				$("#channelTable").bootstrapTable('refresh');
			}
		});
	}
}
//此方法格式化数字 以逗号分隔
function toThousands(num) {
	var flag = "";
	for(var i = 0; i<9-num.length;i++){
		flag += "0";
	}
	flag += num;
	var result = [ ], counter = 0;
	flag = (flag || 0).toString().split('');
    for (var i = flag.length - 1; i >= 0; i--) {
        counter++;
        result.unshift(flag[i]);
        if (!(counter % 3) && i != 0) { result.unshift(','); }
    }
    return result.join('');
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
	$.ajax({
		url:getRootPath()+"/system/charts/get/indexdata.do",
		contentType : 'application/json',
		type:'POST',
		dataType:'json',
		success : function(data) {
			$("#teaCount").html(toThousands(data.teacherCount+""));
			$("#stuCount").html(toThousands(data.stuentCount+""));
			tea = Highcharts.chart('teacherContainer', {
				chart : {
					type : 'column'
					//type:'pie'
				},
				title : {
					text : "教职工人员统计"
				},
				subtitle : {
					text : "各部门分析"
				},
				xAxis : {
					categories : [""]
				},
				yAxis : {
					title : {
						text : '人数'
					}
				},
				plotOptions : {
					line : {
						dataLabels : {
							// 开启数据标签
							enabled : true
						},
						// 关闭鼠标跟踪，对应的提示框、点击事件会失效
						enableMouseTracking : false
					},
					column:{
                        dataLabels:{
                            enabled:true, // dataLabels设为true
                            style:{
                                color:'#D7DEE9'
                            }
                        }
                    }
				},
				responsive: {
					  rules: [{              // 在图表小于 500px 的情况下关闭图例
					    condition: {         // 响应条件
					      maxWidth:100 
					    },
					    chartOptions: {      // 响应内容
					      legend: {
					        enabled: true
					      }
					    }
					  }]
					},
					credits: {
					    // enabled:true,                    // 默认值，如果想去掉版权信息，设置为false即可
					    text: '@石家庄北大青鸟互联网教育集团',             // 显示的文字
					    href: '#',      // 链接地址
					},
				    tooltip: {
				        headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
				        pointFormat: '<span style="color:{point.color}">{point.name}</span><b>该部门总人数：{point.y}</b>人<br/>'
				    }
			});	
			$.each(data.teacherList, function(i, v) {//这是多个
				teaSeries = {
					name : v.name,
					data : v.data
				};
				tea.addSeries(teaSeries);
			});
			
			
			question = Highcharts.chart('questionContainer', {
				chart : {
					type : 'column',
				},
				title : {
					text : "题库分析柱状图"
				},
				subtitle : {
					text : "各种题型总数统计"
				},
				xAxis : {
					categories : [""]
				},
				yAxis : {
					title : {
						text : '题数'
					}
				},
			    tooltip: {
			        headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
			        pointFormat: '<span style="color:{point.color}">{point.name}</span><b>题库共计：{point.y}</b>道<br/>'
			    },
				plotOptions : {
					line : {
						dataLabels : {
							// 开启数据标签
							enabled : true,
						},
						// 关闭鼠标跟踪，对应的提示框、点击事件会失效
						enableMouseTracking : false
					},
					column:{
                        dataLabels:{
                            enabled:true, // dataLabels设为true
                            style:{
                                color:'#D7DEE9'
                            }
                        }
                    }
				},
				credits: {
				    // enabled:true,                    // 默认值，如果想去掉版权信息，设置为false即可
				    text: '@石家庄北大青鸟互联网教育集团',             // 显示的文字
				    href: '',      // 链接地址
				}
			});	
			$.each(data.questionList, function(i, v) {//这是多个
				queSeries = {
					name : v.name,
					data : v.data
				};
				question.addSeries(queSeries);
			});
			
			
			
			stu = Highcharts.chart('stuContainer', {
				chart : {
					type : 'column'
				},
				title : {
					text : "学员分析柱状图"
				},
				subtitle : {
					text : "各阶段总数统计"
				},
				xAxis : {
					categories : [""]
				},
				yAxis : {
					title : {
						text : '人数'
					}
				},
				plotOptions : {
					line : {
						dataLabels : {
							// 开启数据标签
							enabled : true
						},
						// 关闭鼠标跟踪，对应的提示框、点击事件会失效
						enableMouseTracking : false
					},
					column:{
                        dataLabels:{
                            enabled:true, // dataLabels设为true
                            style:{
                                color:'#D7DEE9'
                            }
                        }
                    }
				},
				credits: {
				    // enabled:true,                    // 默认值，如果想去掉版权信息，设置为false即可
				    text: '@石家庄北大青鸟互联网教育集团',             // 显示的文字
				    href: '#',      // 链接地址
				},
			    tooltip: {
			        headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
			        pointFormat: '<span style="color:{point.color}">{point.name}</span><b>该阶段学员总数：{point.y}</b>人<br/>'
			    }
			});	
			$.each(data.studentList, function(i, v) {//这是多个
				stuSeries = {
					name : v.name,
					data : v.data
				};
				stu.addSeries(stuSeries);
			});
		},
		cache : false
	});
	initChannelTable();
})

function checkStatus(num) {
	switch(num){
		case '1': return '<font color="#8CFF8A"><b>已完成 √</b></font>';
		case '0': return '<font color="red"><b>未完成 ×</b></font>';
	}
}

function checkTime(num) {
	switch(num){
		case 0: return '未开启定时提醒';
		default: return dateFormatter(num);
	}
}

function memoDetail(context,alreadyDone,callTime) {
	 parent.layer.open({
	        type: 1
	        ,title: false //不显示标题栏
	        ,closeBtn: false
	        ,area: '300px;'
	        ,shade: 0.8
	        ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
	        ,btn: ['确定']
	        ,btnAlign: 'c'
	        ,moveType: 1 //拖拽模式，0或者1
	        ,content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">'
	        	+'待办事项：<br>'
	        	+context
	        	+'<br><br>事项状态：'+checkStatus(alreadyDone)
	        	+'<br>提醒时间：'+checkTime(parseInt(callTime))
	        	+'</div>'
	      });
}

function initChannelTable(){ 
	$("#channelTable").bootstrapTable({
		url:getRootPath()+'/memo/s/list.do',//加载表格数据的接口
		method:'GET',//提交方式
		dataType:'json',//服务器返回的数据格式
		toolbar:'#tb', //指定按钮组
		checkboxHeader:false,//设置为false时,表头隐藏复选框
		singleSelect:false,//只能单选行
		striped:true,//隔行换色
		cache:false,//不进行缓存
		clickToSelect:true, //点击行时,自动勾选复选框或单选框
		pagination:true,//开启分页功能
		sidePagination:'server',//这个分页功能需要在服务器端实现
		pageNumber:1,//分页的起始页
		pageSize:5,//初始化页面容量为10
		uniqueId:'id',//设置行的唯一标示
		cardView:false,//是否显示详细视图
		detailView:false,//是否显示父子表
		paginationDetailHAlign:"right",
		queryParams:function(params){
			var temp = {
				limit:params.limit, //每页显示数量
				offset:params.offset,//sql语句中的起始索引  //↓总页数
				page:(params.offset / params.limit) + 1 ,
				alreadyDone:$("#alreadyDone").val()
			};
			return temp;
		},
		columns:[
			{radio:true},
			{field:'id',visible:false},//设置隐藏列
			{field:'content',title:'备忘内容',align:'center',formatter:function(value,row,index){
				if(value.length>7){
					return "<font class = 'seeContent' color='#777777' onclick=\"memoDetail('"+row.content+"','"+row.alreadyDone+"',' "+row.callTime+" ')\">"+value.substring(0,7)+"......</font>";
				}else{
					return "<font class = 'seeContent' color='#777777' onclick=\"memoDetail('"+row.content+"','"+row.alreadyDone+"',' "+row.callTime+" ')\">"+value+"</font>";
				}
			}},
			{field:'alreadyDone',title:'状态',align:'center',formatter:function(value,row,index){
				if(value == 1) return "<font color='green'>已办</font>";
				if(value == 0) return "<font color='red'>未办</font>";
			}},
			{field:'callTime',title:'提醒',align:'center',formatter:function(value,row,index){
				//如果是时间戳初始时间，表明没有进行定时任务
				if(dateFormatter(value) == '1970-01-01 08:00:00'){
					return "<font color='red'>否</font>";
				}else{
					return "<font color='green'>是</font>";
				}
			}}
		]
	});
}

</script>

</html>
