<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>查询常模管理</title>
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
		function updateregular() {
			$("#searchForm").attr('target', '_blank');
			$("#searchForm").attr('action', '${ctx}/historycourse/historycourse/updateregular');
			$("#searchForm").submit();
        	return false;
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/changmotongji/changmo/">查询常模列表</a></li>
  		<shiro:hasPermission name="changmotongji:changmo:edit"><li><a href="${ctx}/changmotongji/changmo/form">查询常模添加</a></li></shiro:hasPermission> 	 
	</ul>
	<form:form id="searchForm" modelAttribute="changmo" action="${ctx}/changmotongji/changmo/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>教学类型：</label>
				<form:select path="jiaoxueleixing" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('teachingType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
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
			<li><label>省市：</label>
				<sys:treeselect id="area" name="area.id" value="${changmo.area.id}" labelName="area.name" labelValue="${changmo.area.name}"
					title="区域" url="/sys/area/treeData" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="btns"><input id="btnRegular" class="btn btn-primary" type="button" value="更新常模" onclick="updateregular()"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>省市</th>
				<th>教学类型</th>
				<th>学段</th>
				<th>学科类型</th>
				<th>ch</th>
				<th>rt</th>
				<th>rs</th>
				<th>言语回应</th>
				<th>非言语回应</th>
				<th>肯定回应</th>
				<th>否定回应</th>
				<th>无回应</th>
				<th>打断学生回答或自己代答</th>
				<th>重复回答或解释</th>
				<th>常规管理性问题</th>
				<th>记忆性问题</th>
				<th>推理性问题</th>
				<th>创造性问题</th>
				<th>批判性问题</th>
				<th>点名提问</th>
				<th>让学生齐答</th>
				<th>叫举手者答</th>
				<th>叫未举手者答</th>
				<th>鼓励学生提出问题</th>
				<th>集体齐答</th>
				<th>讨论后汇报</th>
				<th>个别回答</th>
				<th>自由答</th>
				<th>无回答</th>
				<th>机械判断是否</th>
				<th>认知记忆性回答</th>
				<th>推理性回答</th>
				<th>创造评价性回答</th>
				<th>是何</th>
				<th>为何</th>
				<th>如何</th>
				<th>若何</th>
				<th>深度一</th>
				<th>深度二</th>
				<th>深度三</th>
				<th>深度四</th>
				<th>深度五</th>
				<th>更新时间</th>
				
<!-- 				<shiro:hasPermission name="changmotongji:changmo:edit"><th>操作</th></shiro:hasPermission> -->
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="changmo">
			<tr>
				<td>
					${changmo.area.name}
				</td>
				<td>
					${fns:getDictLabel(changmo.jiaoxueleixing, 'teachingType', '')}
				</td>
				<td>
					${fns:getDictLabel(changmo.xueduan, 'period', '')}
				</td>
				<td>
					${fns:getDictLabel(changmo.xuekeleixing, 'subjectType', '')}
				</td>
				<td>
					${changmo.ch}
				</td>
				<td>
					${changmo.rt}
				</td>
				<td>
					${changmo.rs}
				</td>
				<td>
					${changmo.yyhy}
				</td>
				<td>
					${changmo.fyyhy}
				</td>
				<td>
					${changmo.kdhy}
				</td>
				<td>
					${changmo.fdhy}
				</td>
				<td>
					${changmo.why}
				</td>
				<td>
					${changmo.ddxshdd}
				</td>
				<td>
					${changmo.cfhdhjs}
				</td>
				<td>
					${changmo.glxwt}
				</td>
				<td>
					${changmo.jyxwt}
				</td>
				<td>
					${changmo.tlxwt}
				</td>
				<td>
					${changmo.czxwt}
				</td>
				<td>
					${changmo.ppxwt}
				</td>
				<td>
					${changmo.dm}
				</td>
				<td>
					${changmo.rxsqd}
				</td>
				<td>
					${changmo.jjszd}
				</td>
				<td>
					${changmo.jwjszd}
				</td>
				<td>
					${changmo.glxxtcwt}
				</td>
				<td>
					${changmo.jtqd}
				</td>
				<td>
					${changmo.tlhhb}
				</td>
				<td>
					${changmo.gbhd}
				</td>
				<td>
					${changmo.zyd}
				</td>
				<td>
					${changmo.whd}
				</td>
				<td>
					${changmo.pdsf}
				</td>
				<td>
					${changmo.rzjyxhd}
				</td>
				<td>
					${changmo.tlxhd}
				</td>
				<td>
					${changmo.czpjxhd}
				</td>
				<td>
					${changmo.sh}
				</td>
				<td>
					${changmo.wh}
				</td>
				<td>
					${changmo.ruh}
				</td>
				<td>
					${changmo.ruoh}
				</td>
				<td>
					${changmo.sdy}
				</td>
				<td>
					${changmo.sder}
				</td>
				<td>
					${changmo.sds}
				</td>
				<td>
					${changmo.sdsi}
				</td>
				<td>
					${changmo.sdw}
				</td>
				<td>
					<fmt:formatDate value="${changmo.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				
<!-- 				<shiro:hasPermission name="changmotongji:changmo:edit"><td>
    				<a href="${ctx}/changmotongji/changmo/form?id=${changmo.id}">修改</a>
					<a href="${ctx}/changmotongji/changmo/delete?id=${changmo.id}" onclick="return confirmx('确认要删除该查询常模吗？', this.href)">删除</a>
				</td></shiro:hasPermission> -->
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>