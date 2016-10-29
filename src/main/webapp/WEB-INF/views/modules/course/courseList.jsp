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
		function listregular() {
			$("#searchForm").attr('target', '_blank');
			$("#searchForm").attr('action', '${ctx}/course/course/listregular');
			$("#searchForm").submit();
			
			$("#searchForm").attr('target', '_self');
		    $("#searchForm").attr('action', '${ctx}/course/course/');
        	return false;
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/course/course/">课程列表</a></li>
		<shiro:hasPermission name="course:course:edit"><li><a href="${ctx}/course/course/form">课程添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="course" action="${ctx}/course/course/" method="post" class="breadcrumb form-search">
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
				<form:input path="coursename" htmlEscape="false" maxlength="45" class="input-medium"/>
			</li>
			<li><label>教师名称：</label>
				<form:input path="teachername" htmlEscape="false" maxlength="45" class="input-medium"/>
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
			<li class="btns"><input id="btnRegular" class="btn btn-primary" type="button" value="计算常模" onclick="listregular()"/></li>
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
				<th>更新日期</th>
				<th>备注</th>
				<shiro:hasPermission name="course:course:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="course">
			<tr>
				<td><a href="${ctx}/course/course/form?id=${course.id}">
					${fns:getDictLabel(course.xiangmumingcheng, 'projectName', '')}
				</a></td>
				<td>
					${course.area.name}
				</td>
				<td>
					${course.coursename}
				</td>
				<td>
					${course.teachername}
				</td>
				<td>
					${fns:getDictLabel(course.sex, 'sex', '')}
				</td>
				<td>
					${fns:getDictLabel(course.jiaoshileixing, 'teacherType', '')}
				</td>
				<td>
					${fns:getDictLabel(course.xueduan, 'period', '')}
				</td>
				<td>
					${fns:getDictLabel(course.xuekeleixing, 'subjectType', '')}
				</td>
				<td>
					${fns:getDictLabel(course.xueke, 'subject', '')}
				</td>
				<td>
					${fns:getDictLabel(course.jiaoxueleixing, 'teachingType', '')}
				</td>
				<td>
					<fmt:formatDate value="${course.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${course.remarks}
				</td>
				<shiro:hasPermission name="course:course:edit"><td>
					<a href="${ctx}/course/course/record?id=${course.id}">数据采集</a>&nbsp;
					<a href="${ctx}/course/course/drawall?id=${course.id}" target="_blank">绘制图表</a>&nbsp;
    				<a href="${ctx}/course/course/form?id=${course.id}">修改</a>&nbsp;
					<a href="${ctx}/course/course/delete?id=${course.id}" onclick="return confirmx('确认要删除该课程吗？', this.href)">删除</a>&nbsp;
					<a href="${ctx}/course/course/archiving?id=${course.id}" onclick="return confirmx('确认要归档该课程吗？归档后课程会从本界面删除！', this.href)">归档</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>