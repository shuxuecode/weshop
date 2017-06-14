<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/common/com.jsp" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	<link rel="stylesheet" type="text/css" href="/js/bootstrap-3.3.0/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="/js/bootstrap-table/bootstrap-table.min.css" />
	
</head>
<body>
<h1>商品列表</h1>

	<div>
		<table id="table"></table>
	</div>
	
	
	<!--  -->
	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" 
		aria-labelledby="myModalLabel1" aria-hidden="true" style="top: 2%;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel1"></h4>
				</div>
				<div class="">
			    	<form class="bs-example bs-example-form" id="showForm1" role="form">
			    		
			    		<div class="form-group">
							<label for="name">短名称</label>
							<input type="text" class="form-control" id="shortName" placeholder="请输入短名称">
						</div>
						<div class="form-group">
							<label for="name">长名称</label>
							<input type="text" class="form-control" id="longName" placeholder="请输入长名称">
						</div>
						<div class="form-group">
							<label for="name">简介</label>
							<input type="text" class="form-control" id="summary" placeholder="请输入简介">
						</div>
						<div class="form-group">
							<label for="name">短名称</label>
							<input type="file" class="form-control" name="tupian" id="file_image"/>
							<img alt="" src="" id="image" height=100>
						</div>
						<div class="form-group">
							<label for="name">价格</label>
							<input type="text" class="form-control" id="price" placeholder="请输入价格">
						</div>
						
						<div class="form-group">
							<label for="name">商品类型</label>
							<input type="text" class="form-control" id="goodsType" placeholder="请输入数字">
						</div>
						<div class="form-group">
							<label for="name">总数量</label>
							<input type="text" class="form-control" id="totalNum" placeholder="请输入数字">
						</div>
						<div class="form-group">
							<label for="name">卖出数量</label>
							<input type="text" class="form-control" id="sellNum" placeholder="请输入数字">
						</div>
						
						<div class="form-group">
							<label for="name">详情</label>
							<input type="text" class="form-control" id="detail" placeholder="请输入详情">
						</div>
			    		
			    		<span class="btn btn-primary" onclick="submitForm1();">保存</span>
			    		
			    	</form>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>

	<script type="text/javascript" src="${basePath }/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="/js/bootstrap-3.3.0/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/bootstrap-table/bootstrap-table.min.js"></script>
	<script type="text/javascript" src="/js/bootstrap-table/bootstrap-table-zh-CN.min.js"></script>
	
	<script type="text/javascript" src="/js/jquery-fileupload/jquery.ui.widget.js"></script>
	<script type="text/javascript" src="/js/jquery-fileupload/jquery.iframe-transport.js"></script>
	<script type="text/javascript" src="/js/jquery-fileupload/jquery.fileupload.js"></script>
	<script type="text/javascript" src="/js/jquery-fileupload/jquery.fileupload-process.js"></script>
	<script type="text/javascript" src="/js/jquery-fileupload/jquery.fileupload-validate.js"></script>
	
	
	<script type="text/javascript">
	
	$(function(){
		
		$('#table').bootstrapTable({
			url: "${basePath }/weshop/allGoods",
			cache: false,
			//pagination: true,
			pageList: [10,20],
			pageSize:10,
			pageNumber:1,
			sidePagination:'server',//设置为服务器端分页
			queryParams: function (params) {
		        return {
		            pageSize: params.limit,
		            offset: params.offset,
		            sort: params.sort,
		            sortOrder: params.order//,
		    		//collegeInfo:$("#collegeInfo").val()
		        }
		    },//参数
			sortName: 'id',
		    sortOrder: 'desc',
			clickToSelect: true,
			columns: [
				{
//					checkbox: true,
//					align: 'center'
//				},{
					field: 'shortName',
					title: '短名称',
					align: 'center',
					valign: 'middle'
				},{
					field: 'longName',
					title: '长名称',
					align: 'center',
					valign: 'middle'
				},{
					field: 'summary',
					title: '简介',
					align: 'center',
					valign: 'middle'
				},{
					field: 'image',
					title: '照片',
					align: 'center',
					valign: 'middle',
					formatter : function(value, row, index){
						return '<img src="'+value+'" height=100 />';
					}
				},{
					field: 'price',
					title: '价格',
					align: 'center',
					valign: 'middle'
				},{
					field: 'goodsType',
					title: '类型',
					align: 'center',
					valign: 'middle'
				},{
					field: 'totalNum',
					title: '总数量',
					align: 'center',
					valign: 'middle'
				},{
					field: 'sellNum',
					title: '卖出数量',
					align: 'center',
					valign: 'middle'
				},{
					field: 'detail',
					title: '详细介绍',
					align: 'center',
					valign: 'middle',
					formatter : function(value, row, index){
						return value;
					}
				},
				{
					title:'<button class="btn btn-success" onclick="add()">添加</button>',
					align: 'center',
					valign: 'middle',
					formatter : function(value, row, index){
						return '<a class="btn btn-info btn-sm" href="/weshop/goodsImagesPage?id=' + row.id + '" target="_blank" >展示图片</a>'
							  +'<button class="btn btn-info btn-sm" onclick="del(' + row.id + ')">删除</button>';
					}
				}]
			});
		
	});
	
	
	function add(){
		$("#myModalLabel1").html("添加");
		$('#myModal1').modal();
		
		$('#file_image').fileupload({
			url : '/upload/img',
			add: function (e, data) {
				var uploadErrors = [];
				var acceptFileTypes = /(\.|\/)(jpe?g|png)$/i;
			     if(!acceptFileTypes.test(data.originalFiles[0]['name'])) {
			         uploadErrors.push('文件类型不正确(jpg|jpeg|png)！');
			     }
				if(uploadErrors.length > 0) {
					alert(uploadErrors.join("\n"));
				} else {
					data.submit();
				}
	        },
	        done: function (e, data) {
	        	var url=data.result.url;
	        	$("#image").attr("src", url);
	        }
	        // 进度条
	        ,progressall: function(e, data){
	        	var progress = parseInt(data.loaded / data.total * 100, 10);
	        }
	    });
	}
	
	
	function submitForm1(){
		$("#myModal1").modal('hide');
		
		$.post("/weshop/addGoods",
				{
					shortName:$("#shortName").val(), 
					longName:$("#longName").val(), 
					summary:$("#summary").val(), 
					image:$("#image").attr("src"), 
					price:$("#price").val(), 
					goodsType:$("#goodsType").val(), 
					totalNum:$("#totalNum").val(), 
					sellNum:$("#sellNum").val(), 
					detail:$("#detail").val()
			
				},
				function(data){
					$('#table').bootstrapTable("refresh");
		});
	}
	
	function del(id){
		if(confirm("确定要删除吗？")){
			$.post("/weshop/delGoods",
					{id:id},
					function(data){
						$('#table').bootstrapTable("refresh");
			});
		}
		
	}
	
	
	
	</script>
</body>
</html>