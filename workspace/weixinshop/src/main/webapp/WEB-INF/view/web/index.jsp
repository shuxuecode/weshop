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


	<div>
		<table id="table"></table>
	</div>

	<script type="text/javascript" src="${basePath }/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="/js/bootstrap-3.3.0/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/bootstrap-table/bootstrap-table.min.js"></script>
	<script type="text/javascript" src="/js/bootstrap-table/bootstrap-table-zh-CN.min.js"></script>
	
	
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
					field: 'feedbackTime',
					title: '督导时间',
					align: 'center',
					valign: 'middle',
					formatter : function(value, row, index){
						return value==null?"-":(new Date(value)).Format("yyyy-MM-dd hh:mm:ss");
					}
				},
				{
					title:'<button class="btn btn-success" onclick="showMember(\'insert\')">添加</button>',
					align: 'center',
					valign: 'middle',
					width: 350,
					formatter : function(value, row, index){
						return '<button class="btn btn-info btn-sm" '
						+ 'onclick="showMember(\'update\',' + row.id + ',' + row.familyNo + ')">编辑</button>';
					}
				}]
			});
		
	});
	
	
	
	
	
	</script>
</body>
</html>