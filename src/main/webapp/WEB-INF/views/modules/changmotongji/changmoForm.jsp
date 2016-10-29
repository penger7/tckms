<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>查询常模管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/changmotongji/changmo/">查询常模列表</a></li>
		<li class="active"><a href="${ctx}/changmotongji/changmo/form?id=${changmo.id}">查询常模<shiro:hasPermission name="changmotongji:changmo:edit">${not empty changmo.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="changmotongji:changmo:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="changmo" action="${ctx}/changmotongji/changmo/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">教学类型：</label>
			<div class="controls">
				<form:select path="jiaoxueleixing" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('teachingType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">学段：</label>
			<div class="controls">
				<form:select path="xueduan" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('period')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">学科类型：</label>
			<div class="controls">
				<form:select path="xuekeleixing" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('subjectType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">ch：</label>
			<div class="controls">
				<form:input path="ch" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">rt：</label>
			<div class="controls">
				<form:input path="rt" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">rs：</label>
			<div class="controls">
				<form:input path="rs" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">言语回应：</label>
			<div class="controls">
				<form:input path="yyhy" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">非言语回应：</label>
			<div class="controls">
				<form:input path="fyyhy" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">肯定回应：</label>
			<div class="controls">
				<form:input path="kdhy" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">否定回应：</label>
			<div class="controls">
				<form:input path="fdhy" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">无回应：</label>
			<div class="controls">
				<form:input path="why" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">打断学生回答或自己代答：</label>
			<div class="controls">
				<form:input path="ddxshdd" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">重复回答或解释：</label>
			<div class="controls">
				<form:input path="cfhdhjs" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">常规管理性问题：</label>
			<div class="controls">
				<form:input path="glxwt" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">记忆性问题：</label>
			<div class="controls">
				<form:input path="jyxwt" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">推理性问题：</label>
			<div class="controls">
				<form:input path="tlxwt" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">创造性问题：</label>
			<div class="controls">
				<form:input path="czxwt" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">批判性问题：</label>
			<div class="controls">
				<form:input path="ppxwt" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">点名提问：</label>
			<div class="controls">
				<form:input path="dm" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">让学生齐答：</label>
			<div class="controls">
				<form:input path="rxsqd" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">叫举手者答：</label>
			<div class="controls">
				<form:input path="jjszd" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">叫未举手者答：</label>
			<div class="controls">
				<form:input path="jwjszd" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">鼓励学生提出问题：</label>
			<div class="controls">
				<form:input path="glxxtcwt" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">集体齐答：</label>
			<div class="controls">
				<form:input path="jtqd" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">讨论后汇报：</label>
			<div class="controls">
				<form:input path="tlhhb" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">个别回答：</label>
			<div class="controls">
				<form:input path="gbhd" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">自由答：</label>
			<div class="controls">
				<form:input path="zyd" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">无回答：</label>
			<div class="controls">
				<form:input path="whd" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">机械判断是否：</label>
			<div class="controls">
				<form:input path="pdsf" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">认知记忆性回答：</label>
			<div class="controls">
				<form:input path="rzjyxhd" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">推理性回答：</label>
			<div class="controls">
				<form:input path="tlxhd" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">创造评价性回答：</label>
			<div class="controls">
				<form:input path="czpjxhd" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">是何：</label>
			<div class="controls">
				<form:input path="sh" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">为何：</label>
			<div class="controls">
				<form:input path="wh" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">如何：</label>
			<div class="controls">
				<form:input path="ruh" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">若何：</label>
			<div class="controls">
				<form:input path="ruoh" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">深度一：</label>
			<div class="controls">
				<form:input path="sdy" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">深度二：</label>
			<div class="controls">
				<form:input path="sder" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">深度三：</label>
			<div class="controls">
				<form:input path="sds" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">深度四：</label>
			<div class="controls">
				<form:input path="sdsi" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">深度五：</label>
			<div class="controls">
				<form:input path="sdw" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">省市：</label>
			<div class="controls">
				<sys:treeselect id="area" name="area.id" value="${changmo.area.id}" labelName="area.name" labelValue="${changmo.area.name}"
					title="区域" url="/sys/area/treeData" cssClass="" allowClear="true" notAllowSelectParent="true"/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="changmotongji:changmo:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>