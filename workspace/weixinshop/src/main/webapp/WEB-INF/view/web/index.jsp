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

	<h1>首页图片轮播</h1>


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
			    	<form class="bs-example bs-example-form" id="showForm1" role="form" enctype="multipart/form-data">
			    		<input type="file" id="tupian" name="tupian" class="form-control" accept="image/*"/>
			    		
			    		<span class="btn btn-primary" onclick="submitForm1();">保存</span>
			    		
			    		<img src="" id="img" />
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
			url: "${basePath }/weshop/homeImg",
			cache: false,
			pagination: true,
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
					field: 'url',
					title: '图片地址',
					align: 'center',
					valign: 'middle'
				},{
					field: 'url',
					title: '图片预览',
					align: 'center',
					valign: 'middle',
					formatter : function(value, row, index){
						return '<img src="'+value+'" height=100 />';
					}
				},
				{
					title:'<button class="btn btn-success" onclick="add()">添加</button>',
					align: 'center',
					valign: 'middle',
					width: 350,
					formatter : function(value, row, index){
						return '<button class="btn btn-info btn-sm" onclick="del(' + row.id + ')">删除</button>';
					}
				}]
			});
		
	});
	
	
	function add(){
		$("#myModalLabel1").html("添加");
		$('#myModal1').modal();
		
		$('#tupian').fileupload({
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
	        	$("#img").attr("src", url);
	        }
	        // 进度条
	        ,progressall: function(e, data){
	        	var progress = parseInt(data.loaded / data.total * 100, 10);
	        }
	    });
	}
	
	
	function submitForm1(){
		$("#myModal1").modal('hide');
		
		$.post("/weshop/addHomeImage",
				{url:$("#img").attr("src")},
				function(data){
					$('#table').bootstrapTable("refresh");
		});
	}
	
	function del(id){
		if(confirm("确定要删除吗？")){
			$.post("/weshop/delHomeImage",
					{id:id},
					function(data){
						$('#table').bootstrapTable("refresh");
			});
		}
		
	}
	
	
	</script>
</body>
</html>