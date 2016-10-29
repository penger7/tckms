<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>课程管理</title>
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
		<li class="active"><a href="${ctx}/historycourse/historyCourse/">课程列表</a></li>
<!--		<shiro:hasPermission name="historycourse:historyCourse:edit"><li><a href="${ctx}/historycourse/historyCourse/form">课程添加</a></li></shiro:hasPermission>	  -->
	</ul>
	<form:form id="searchForm" modelAttribute="historyCourse" action="${ctx}/historycourse/historyCourse/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>项目名称：</label>
				<form:select path="xiangmumingcheng" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('projectName')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>省市：</label>
				<sys:treeselect id="area" name="area.id" value="${testarea.area.id}" labelName="area.name" labelValue="${testarea.area.name}"
					title="区域" url="/sys/area/treeData" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li>
			<li><label>课程名：</label>
				<form:input path="coursename" htmlEscape="false" maxlength="1024" class="input-medium"/>
			</li>
			<li><label>教师名称：</label>
				<form:input path="teachername" htmlEscape="false" maxlength="256" class="input-medium"/>
			</li>
			<li><label>性别：</label>
				<form:select path="sex" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('sex')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>教师类型：</label>
				<form:select path="jiaoshileixing" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('teacherType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>学段：</label>
				<form:select path="xueduan" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('period')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>学科类型：</label>
				<form:select path="xuekeleixing" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('subjectType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>学科：</label>
				<form:select path="xueke" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('subject')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>教学类型：</label>
				<form:select path="jiaoxueleixing" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('teachingType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>项目名称</th>
				<th>省市</th>
				<th>课程名</th>
				<th>教师名称</th>
				<th>性别</th>
				<th>教师类型</th>
				<th>学段</th>
				<th>学科类型</th>
				<th>学科</th>
				<th>教学类型</th>
				<th>更新时间</th>
				<th>备注信息</th>
<!-- 				<shiro:hasPermission name="historycourse:historyCourse:edit"><th>操作</th></shiro:hasPermission>	 -->
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="historyCourse">
			<tr>
				<td><a href="${ctx}/historycourse/historycourse/form?id=${historyCourse.id}">
					${fns:getDictLabel(historyCourse.xiangmumingcheng, 'projectName', '')}
				</a></td>
				<td>
					${historyCourse.area.name}
				</td>
				<td>
					${historyCourse.coursename}
				</td>
				<td>
					${historyCourse.teachername}
				</td>
				<td>
					${fns:getDictLabel(historyCourse.sex, 'sex', '')}
				</td>
				<td>
					${fns:getDictLabel(historyCourse.jiaoshileixing, 'teacherType', '')}
				</td>
				<td>
					${fns:getDictLabel(historyCourse.xueduan, 'period', '')}
				</td>
				<td>
					${fns:getDictLabel(historyCourse.xuekeleixing, 'subjectType', '')}
				</td>
				<td>
					${fns:getDictLabel(historyCourse.xueke, 'subject', '')}
				</td>
				<td>
					${fns:getDictLabel(historyCourse.jiaoxueleixing, 'teachingType', '')}
				</td>
				<td>
					<fmt:formatDate value="${historyCourse.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${historyCourse.remarks}
				</td>
 			<shiro:hasPermission name="historycourse:historyCourse:edit"><td>
					<a href="${ctx}/historycourse/historycourse/drawall?id=${historyCourse.id}" target="_blank">绘制图表</a>
<!--   				<a href="${ctx}/historycourse/historyCourse/form?id=${historyCourse.id}">修改</a>
					<a href="${ctx}/historycourse/historyCourse/delete?id=${historyCourse.id}" onclick="return confirmx('确认要删除该课程吗？', this.href)">删除</a>		-->
				</td></shiro:hasPermission>	 	
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>