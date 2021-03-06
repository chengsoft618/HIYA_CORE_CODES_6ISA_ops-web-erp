<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>经营诊断的优惠内容管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/diagnosis/diagnosisDiscount/">经营诊断的优惠内容列表</a></li>
		<shiro:hasPermission name="diagnosis:diagnosisDiscount:edit"><li><a href="${ctx}/diagnosis/diagnosisDiscount/form">经营诊断的优惠内容添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="diagnosisDiscount" action="${ctx}/diagnosis/diagnosisDiscount/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>活动标题：</label>
				<form:input path="title" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>活动标题</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="diagnosis:diagnosisDiscount:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="diagnosisDiscount">
			<tr>
				<td><a href="${ctx}/diagnosis/diagnosisDiscount/form?id=${diagnosisDiscount.id}">
					${diagnosisDiscount.title}
				</a></td>
				<td>
					<fmt:formatDate value="${diagnosisDiscount.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${diagnosisDiscount.remarks}
				</td>
				<shiro:hasPermission name="diagnosis:diagnosisDiscount:edit"><td>
    				<a href="${ctx}/diagnosis/diagnosisDiscount/form?id=${diagnosisDiscount.id}">修改</a>
					<a href="${ctx}/diagnosis/diagnosisDiscount/delete?id=${diagnosisDiscount.id}" onclick="return confirmx('确认要删除该经营诊断的优惠内容吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>