<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>课程管理</title>
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
		function addRow(list, idx, tpl, row){
			if ($(list).find('tr').length > 0)
				return;
			
			$(list).append(Mustache.render(tpl, {
				idx: idx, delBtn: true, row: row
			}));
			$(list+idx).find("select").each(function(){
				$(this).val($(this).attr("data-value"));
			});
			$(list+idx).find("input[type='checkbox'], input[type='radio']").each(function(){
				var ss = $(this).attr("data-value").split(',');
				for (var i=0; i<ss.length; i++){
					if($(this).val() == ss[i]){
						$(this).attr("checked","checked");
					}
				}
			});
		}
		function delRow(obj, prefix){
			var id = $(prefix+"_id");
			var delFlag = $(prefix+"_delFlag");
			if (id.val() == ""){
				$(obj).parent().parent().remove();
			}else if(delFlag.val() == "0"){
				delFlag.val("1");
				$(obj).html("&divide;").attr("title", "撤销删除");
				$(obj).parent().parent().addClass("error");
			}else if(delFlag.val() == "1"){
				delFlag.val("0");
				$(obj).html("&times;").attr("title", "删除");
				$(obj).parent().parent().removeClass("error");
			}
		}
	</script>
	<style>
		.form-horizontal .control-label {
			width: 100px;
		}
		.form-horizontal .controls {
			margin-left: 120px;
		}
	</style>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/course/course/">课程列表</a></li>
		<li class="active"><a href="${ctx}/course/course/form?id=${course.id}">课程<shiro:hasPermission name="course:course:edit">${not empty course.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="course:course:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="course" action="${ctx}/course/course/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<table>
			<tr>
				<td>
					<label class="control-label">项目名称：</label>
							<form:select path="xiangmumingcheng" class="input-xlarge required">
							<form:option value="" label=""/>
							<form:options items="${fns:getDictList('projectName')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>
							<span class="help-inline"><font color="red">*</font> </span>
				</td>
				<td>
					<label class="control-label">省市：</label>
					<sys:treeselect id="area" name="area.id" value="${course.area.id}" labelName="area.name" labelValue="${course.area.name}"
					title="省市" url="/sys/area/treeData" cssClass="required"/>
					<span class="help-inline"><font color="red">*</font> </span>
				</td>
			</tr>
			<tr>
				<td>
					<label class="control-label">课程名：</label>
							<form:input path="coursename" htmlEscape="false" maxlength="45" class="input-xlarge required"/>
							<span class="help-inline"><font color="red">*</font> </span>
				</td>
				<td>
					<label class="control-label">教师名称：</label>
							<form:input path="teachername" htmlEscape="false" maxlength="45" class="input-xlarge required"/>
							<span class="help-inline"><font color="red">*</font> </span>
				</td>
				<td>
					<label class="control-label">性别：</label>
							<form:select path="sex" class="input-xlarge required">
							<form:option value="" label=""/>
							<form:options items="${fns:getDictList('sex')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>
							<span class="help-inline"><font color="red">*</font> </span>
				</td>
			</tr>
			<tr>
				<td>
					<label class="control-label">教师类型：</label>
							<form:select path="jiaoshileixing" class="input-xlarge required">
							<form:option value="" label=""/>
							<form:options items="${fns:getDictList('teacherType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>
							<span class="help-inline"><font color="red">*</font> </span>
				</td>
				<td>
					<label class="control-label">学段：</label>
							<form:select path="xueduan" class="input-xlarge required">
							<form:option value="" label=""/>
							<form:options items="${fns:getDictList('period')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>
							<span class="help-inline"><font color="red">*</font> </span>
				</td>
				<td>
					<label class="control-label">学科类型：</label>
							<form:select path="xuekeleixing" class="input-xlarge required">
							<form:option value="" label=""/>
							<form:options items="${fns:getDictList('subjectType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>
							<span class="help-inline"><font color="red">*</font> </span>
				</td>
			</tr>
			<tr>
				<td>
					<label class="control-label">学科：</label>
							<form:select path="xueke" class="input-xlarge required">
							<form:option value="" label=""/>
							<form:options items="${fns:getDictList('subject')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>
							<span class="help-inline"><font color="red">*</font> </span>
				</td>
<!-- 				<td>
					<label class="control-label">归档：</label>
					<form:radiobuttons path="archiveDoc" items="${fns:getDictList('archive_doc')}" itemLabel="label" itemValue="value" htmlEscape="false" class=""/>
				</td> -->
			</tr>
		</table>
		<br/><br/>
		<div class="control-group">
				<label class="control-label">ST维度信息：</label>
				<div class="controls">
					<table id="contentTable" class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>
								<th class="hide"></th>
								<th>ST采样数据</th>
								<th>采样间隔</th>
								<th>ch</th>
								<th>rt</th>
								<th>rs</th>
								<th>教学类型</th>
								<shiro:hasPermission name="course:course:edit"><th width="10">&nbsp;</th></shiro:hasPermission>
							</tr>
						</thead>
						<tbody id="courseStList">
						</tbody>
						<shiro:hasPermission name="course:course:edit"><tfoot>
							<tr><td colspan="7">
								<a href="javascript:" onclick="addRow('#courseStList', courseStRowIdx, courseStTpl);courseStRowIdx = courseStRowIdx + 1;" class="btn">直接录入</a>
							</td></tr>
						</tfoot></shiro:hasPermission>
					</table>
					<script type="text/template" id="courseStTpl">//<!--
						<tr id="courseStList{{idx}}">
							<td class="hide">
								<input id="courseStList{{idx}}_id" name="courseStList[{{idx}}].id" type="hidden" value="{{row.id}}"/>
								<input id="courseStList{{idx}}_delFlag" name="courseStList[{{idx}}].delFlag" type="hidden" value="0"/>
							</td>
							<td>
								<input id="courseStList{{idx}}_stdatas" name="courseStList[{{idx}}].stdatas" type="text" value="{{row.stdatas}}" class="input-small"/>
							</td>
							<td>
								<input id="courseStList{{idx}}_sttimer" name="courseStList[{{idx}}].sttimer" type="text" value="{{row.sttimer}}" class="input-small  number"/>
							</td>
							<td>
								<input id="courseStList{{idx}}_ch" name="courseStList[{{idx}}].ch" type="text" value="{{row.ch}}" class="input-small  number"/>
							</td>
							<td>
								<input id="courseStList{{idx}}_rt" name="courseStList[{{idx}}].rt" type="text" value="{{row.rt}}" class="input-small  number"/>
							</td>
							<td>
								<input id="courseStList{{idx}}_rs" name="courseStList[{{idx}}].rs" type="text" value="{{row.rs}}" class="input-small  number"/>
							</td>
							<td>
								<select id="courseStList{{idx}}_jiaoxueleixing" name="courseStList[{{idx}}].jiaoxueleixing" data-value="{{row.jiaoxueleixing}}" class="input-small ">
									<option value=""></option>
									<c:forEach items="${fns:getDictList('teachingType')}" var="dict">
										<option value="${dict.value}">${dict.label}</option>
									</c:forEach>
								</select>
							</td>
							<shiro:hasPermission name="course:course:edit"><td class="text-center" width="10">
								{{#delBtn}}<span class="close" onclick="delRow(this, '#courseStList{{idx}}')" title="删除">&times;</span>{{/delBtn}}
							</td></shiro:hasPermission>
						</tr>//-->
					</script>
					<script type="text/javascript">
						var courseStRowIdx = 0, courseStTpl = $("#courseStTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
						$(document).ready(function() {
							var data = ${fns:toJson(course.courseStList)};
							for (var i=0; i<data.length; i++){
								addRow('#courseStList', courseStRowIdx, courseStTpl, data[i]);
								courseStRowIdx = courseStRowIdx + 1;
							}
						});
					</script>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">有效性维度：</label>
				<div class="controls">
					<table id="contentTable" class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>
								<th class="hide"></th>
								<th>管理性问题</th>
								<th>记忆性问题</th>
								<th>推理性问题</th>
								<th>创造性问题</th>
								<th>批判性问题</th>
								<th>提问前先点名</th>
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
								<shiro:hasPermission name="course:course:edit"><th width="10">&nbsp;</th></shiro:hasPermission>
							</tr>
						</thead>
						<tbody id="courseYouxiaoxingList">
						</tbody>
						<shiro:hasPermission name="course:course:edit"><tfoot>
							<tr><td colspan="22"><a href="javascript:" onclick="addRow('#courseYouxiaoxingList', courseYouxiaoxingRowIdx, courseYouxiaoxingTpl);courseYouxiaoxingRowIdx = courseYouxiaoxingRowIdx + 1;" class="btn">直接录入</a></td></tr>
						</tfoot></shiro:hasPermission>
					</table>
					<script type="text/template" id="courseYouxiaoxingTpl">//<!--
						<tr id="courseYouxiaoxingList{{idx}}">
							<td class="hide">
								<input id="courseYouxiaoxingList{{idx}}_id" name="courseYouxiaoxingList[{{idx}}].id" type="hidden" value="{{row.id}}"/>
								<input id="courseYouxiaoxingList{{idx}}_delFlag" name="courseYouxiaoxingList[{{idx}}].delFlag" type="hidden" value="0"/>
							</td>
							<td>
								<input id="courseYouxiaoxingList{{idx}}_glxwt" name="courseYouxiaoxingList[{{idx}}].glxwt" type="text" value="{{row.glxwt}}" class="input-small  number"/>
							</td>
							<td>
								<input id="courseYouxiaoxingList{{idx}}_jyxwt" name="courseYouxiaoxingList[{{idx}}].jyxwt" type="text" value="{{row.jyxwt}}" class="input-small  number"/>
							</td>
							<td>
								<input id="courseYouxiaoxingList{{idx}}_tlxwt" name="courseYouxiaoxingList[{{idx}}].tlxwt" type="text" value="{{row.tlxwt}}" class="input-small  number"/>
							</td>
							<td>
								<input id="courseYouxiaoxingList{{idx}}_czxwt" name="courseYouxiaoxingList[{{idx}}].czxwt" type="text" value="{{row.czxwt}}" class="input-small  number"/>
							</td>
							<td>
								<input id="courseYouxiaoxingList{{idx}}_ppxwt" name="courseYouxiaoxingList[{{idx}}].ppxwt" type="text" value="{{row.ppxwt}}" class="input-small  number"/>
							</td>
							<td>
								<input id="courseYouxiaoxingList{{idx}}_dm" name="courseYouxiaoxingList[{{idx}}].dm" type="text" value="{{row.dm}}" class="input-small  number"/>
							</td>
							<td>
								<input id="courseYouxiaoxingList{{idx}}_rxsqd" name="courseYouxiaoxingList[{{idx}}].rxsqd" type="text" value="{{row.rxsqd}}" class="input-small  number"/>
							</td>
							<td>
								<input id="courseYouxiaoxingList{{idx}}_jjszd" name="courseYouxiaoxingList[{{idx}}].jjszd" type="text" value="{{row.jjszd}}" class="input-small  number"/>
							</td>
							<td>
								<input id="courseYouxiaoxingList{{idx}}_jwjszd" name="courseYouxiaoxingList[{{idx}}].jwjszd" type="text" value="{{row.jwjszd}}" class="input-small  number"/>
							</td>
							<td>
								<input id="courseYouxiaoxingList{{idx}}_glxxtcwt" name="courseYouxiaoxingList[{{idx}}].glxxtcwt" type="text" value="{{row.glxxtcwt}}" class="input-small  number"/>
							</td>
							<td>
								<input id="courseYouxiaoxingList{{idx}}_jtqd" name="courseYouxiaoxingList[{{idx}}].jtqd" type="text" value="{{row.jtqd}}" class="input-small  number"/>
							</td>
							<td>
								<input id="courseYouxiaoxingList{{idx}}_tlhhb" name="courseYouxiaoxingList[{{idx}}].tlhhb" type="text" value="{{row.tlhhb}}" class="input-small  number"/>
							</td>
							<td>
								<input id="courseYouxiaoxingList{{idx}}_gbhd" name="courseYouxiaoxingList[{{idx}}].gbhd" type="text" value="{{row.gbhd}}" class="input-small  number"/>
							</td>
							<td>
								<input id="courseYouxiaoxingList{{idx}}_zyd" name="courseYouxiaoxingList[{{idx}}].zyd" type="text" value="{{row.zyd}}" class="input-small  number"/>
							</td>
							<td>
								<input id="courseYouxiaoxingList{{idx}}_whd" name="courseYouxiaoxingList[{{idx}}].whd" type="text" value="{{row.whd}}" class="input-small  number"/>
							</td>
							<td>
								<input id="courseYouxiaoxingList{{idx}}_pdsf" name="courseYouxiaoxingList[{{idx}}].pdsf" type="text" value="{{row.pdsf}}" class="input-small  number"/>
							</td>
							<td>
								<input id="courseYouxiaoxingList{{idx}}_rzjyxhd" name="courseYouxiaoxingList[{{idx}}].rzjyxhd" type="text" value="{{row.rzjyxhd}}" class="input-small  number"/>
							</td>
							<td>
								<input id="courseYouxiaoxingList{{idx}}_tlxhd" name="courseYouxiaoxingList[{{idx}}].tlxhd" type="text" value="{{row.tlxhd}}" class="input-small  number"/>
							</td>
							<td>
								<input id="courseYouxiaoxingList{{idx}}_czpjxhd" name="courseYouxiaoxingList[{{idx}}].czpjxhd" type="text" value="{{row.czpjxhd}}" class="input-small  number"/>
							</td>
							<shiro:hasPermission name="course:course:edit"><td class="text-center" width="10">
								{{#delBtn}}<span class="close" onclick="delRow(this, '#courseYouxiaoxingList{{idx}}')" title="删除">&times;</span>{{/delBtn}}
							</td></shiro:hasPermission>
						</tr>//-->
					</script>
					<script type="text/javascript">
						var courseYouxiaoxingRowIdx = 0, courseYouxiaoxingTpl = $("#courseYouxiaoxingTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
						$(document).ready(function() {
							var data = ${fns:toJson(course.courseYouxiaoxingList)};
							for (var i=0; i<data.length; i++){
								addRow('#courseYouxiaoxingList', courseYouxiaoxingRowIdx, courseYouxiaoxingTpl, data[i]);
								courseYouxiaoxingRowIdx = courseYouxiaoxingRowIdx + 1;
							}
						});
					</script>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">回应维度：</label>
				<div class="controls">
					<table id="contentTable" class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>
								<th class="hide"></th>
								<th>言语回应</th>
								<th>非言语回应</th>
								<th>肯定回应</th>
								<th>否定回应</th>
								<th>无回应</th>
								<th>打断学生回答或代答</th>
								<th>重复学生回答并解释</th>
								<shiro:hasPermission name="course:course:edit"><th width="10">&nbsp;</th></shiro:hasPermission>
							</tr>
						</thead>
						<tbody id="courseHuiyingList">
						</tbody>
						<shiro:hasPermission name="course:course:edit"><tfoot>
							<tr><td colspan="10"><a href="javascript:" onclick="addRow('#courseHuiyingList', courseHuiyingRowIdx, courseHuiyingTpl);courseHuiyingRowIdx = courseHuiyingRowIdx + 1;" class="btn">直接录入</a></td></tr>
						</tfoot></shiro:hasPermission>
					</table>
					<script type="text/template" id="courseHuiyingTpl">//<!--
						<tr id="courseHuiyingList{{idx}}">
							<td class="hide">
								<input id="courseHuiyingList{{idx}}_id" name="courseHuiyingList[{{idx}}].id" type="hidden" value="{{row.id}}"/>
								<input id="courseHuiyingList{{idx}}_delFlag" name="courseHuiyingList[{{idx}}].delFlag" type="hidden" value="0"/>
							</td>
							<td>
								<input id="courseHuiyingList{{idx}}_yyhy" name="courseHuiyingList[{{idx}}].yyhy" type="text" value="{{row.yyhy}}" class="input-small  number"/>
							</td>
							<td>
								<input id="courseHuiyingList{{idx}}_fyyhy" name="courseHuiyingList[{{idx}}].fyyhy" type="text" value="{{row.fyyhy}}" class="input-small "/>
							</td>
							<td>
								<input id="courseHuiyingList{{idx}}_kdhy" name="courseHuiyingList[{{idx}}].kdhy" type="text" value="{{row.kdhy}}" class="input-small  number"/>
							</td>
							<td>
								<input id="courseHuiyingList{{idx}}_fdhy" name="courseHuiyingList[{{idx}}].fdhy" type="text" value="{{row.fdhy}}" class="input-small  number"/>
							</td>
							<td>
								<input id="courseHuiyingList{{idx}}_why" name="courseHuiyingList[{{idx}}].why" type="text" value="{{row.why}}" class="input-small  number"/>
							</td>
							<td>
								<input id="courseHuiyingList{{idx}}_ddxshdd" name="courseHuiyingList[{{idx}}].ddxshdd" type="text" value="{{row.ddxshdd}}" class="input-small  number"/>
							</td>
							<td>
								<input id="courseHuiyingList{{idx}}_cfhdhjs" name="courseHuiyingList[{{idx}}].cfhdhjs" type="text" value="{{row.cfhdhjs}}" class="input-small  number"/>
							</td>
							<shiro:hasPermission name="course:course:edit"><td class="text-center" width="10">
								{{#delBtn}}<span class="close" onclick="delRow(this, '#courseHuiyingList{{idx}}')" title="删除">&times;</span>{{/delBtn}}
							</td></shiro:hasPermission>
						</tr>//-->
					</script>
					<script type="text/javascript">
						var courseHuiyingRowIdx = 0, courseHuiyingTpl = $("#courseHuiyingTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
						$(document).ready(function() {
							var data = ${fns:toJson(course.courseHuiyingList)};
							for (var i=0; i<data.length; i++){
								addRow('#courseHuiyingList', courseHuiyingRowIdx, courseHuiyingTpl, data[i]);
								courseHuiyingRowIdx = courseHuiyingRowIdx + 1;
							}
						});
					</script>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">四何维度：</label>
				<div class="controls">
					<table id="contentTable" class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>
								<th class="hide"></th>
								<th>是何</th>
								<th>为何</th>
								<th>如何</th>
								<th>若何</th>
								<shiro:hasPermission name="course:course:edit"><th width="10">&nbsp;</th></shiro:hasPermission>
							</tr>
						</thead>
						<tbody id="courseSiheList">
						</tbody>
						<shiro:hasPermission name="course:course:edit"><tfoot>
							<tr><td colspan="7"><a href="javascript:" onclick="addRow('#courseSiheList', courseSiheRowIdx, courseSiheTpl);courseSiheRowIdx = courseSiheRowIdx + 1;" class="btn">直接录入</a></td></tr>
						</tfoot></shiro:hasPermission>
					</table>
					<script type="text/template" id="courseSiheTpl">//<!--
						<tr id="courseSiheList{{idx}}">
							<td class="hide">
								<input id="courseSiheList{{idx}}_id" name="courseSiheList[{{idx}}].id" type="hidden" value="{{row.id}}"/>
								<input id="courseSiheList{{idx}}_delFlag" name="courseSiheList[{{idx}}].delFlag" type="hidden" value="0"/>
							</td>
							<td>
								<input id="courseSiheList{{idx}}_sh" name="courseSiheList[{{idx}}].sh" type="text" value="{{row.sh}}" class="input-small  number"/>
							</td>
							<td>
								<input id="courseSiheList{{idx}}_wh" name="courseSiheList[{{idx}}].wh" type="text" value="{{row.wh}}" class="input-small  number"/>
							</td>
							<td>
								<input id="courseSiheList{{idx}}_ruh" name="courseSiheList[{{idx}}].ruh" type="text" value="{{row.ruh}}" class="input-small  number"/>
							</td>
							<td>
								<input id="courseSiheList{{idx}}_ruoh" name="courseSiheList[{{idx}}].ruoh" type="text" value="{{row.ruoh}}" class="input-small  number"/>
							</td>
							<shiro:hasPermission name="course:course:edit"><td class="text-center" width="10">
								{{#delBtn}}<span class="close" onclick="delRow(this, '#courseSiheList{{idx}}')" title="删除">&times;</span>{{/delBtn}}
							</td></shiro:hasPermission>
						</tr>//-->
					</script>
					<script type="text/javascript">
						var courseSiheRowIdx = 0, courseSiheTpl = $("#courseSiheTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
						$(document).ready(function() {
							var data = ${fns:toJson(course.courseSiheList)};
							for (var i=0; i<data.length; i++){
								addRow('#courseSiheList', courseSiheRowIdx, courseSiheTpl, data[i]);
								courseSiheRowIdx = courseSiheRowIdx + 1;
							}
						});
					</script>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">对话深度维度：</label>
				<div class="controls">
					<table id="contentTable" class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>
								<th class="hide"></th>
								<th>深度一</th>
								<th>深度二</th>
								<th>深度三</th>
								<th>深度四</th>
								<th>深度五</th>
								<shiro:hasPermission name="course:course:edit"><th width="10">&nbsp;</th></shiro:hasPermission>
							</tr>
						</thead>
						<tbody id="courseShenduList">
						</tbody>
						<shiro:hasPermission name="course:course:edit"><tfoot>
							<tr><td colspan="8"><a href="javascript:" onclick="addRow('#courseShenduList', courseShenduRowIdx, courseShenduTpl);courseShenduRowIdx = courseShenduRowIdx + 1;" class="btn">直接录入</a></td></tr>
						</tfoot></shiro:hasPermission>
					</table>
					<script type="text/template" id="courseShenduTpl">//<!--
						<tr id="courseShenduList{{idx}}">
							<td class="hide">
								<input id="courseShenduList{{idx}}_id" name="courseShenduList[{{idx}}].id" type="hidden" value="{{row.id}}"/>
								<input id="courseShenduList{{idx}}_delFlag" name="courseShenduList[{{idx}}].delFlag" type="hidden" value="0"/>
							</td>
							<td>
								<input id="courseShenduList{{idx}}_sdy" name="courseShenduList[{{idx}}].sdy" type="text" value="{{row.sdy}}" class="input-small  number"/>
							</td>
							<td>
								<input id="courseShenduList{{idx}}_sder" name="courseShenduList[{{idx}}].sder" type="text" value="{{row.sder}}" class="input-small  number"/>
							</td>
							<td>
								<input id="courseShenduList{{idx}}_sds" name="courseShenduList[{{idx}}].sds" type="text" value="{{row.sds}}" class="input-small  number"/>
							</td>
							<td>
								<input id="courseShenduList{{idx}}_sdsi" name="courseShenduList[{{idx}}].sdsi" type="text" value="{{row.sdsi}}" class="input-small  number"/>
							</td>
							<td>
								<input id="courseShenduList{{idx}}_sdw" name="courseShenduList[{{idx}}].sdw" type="text" value="{{row.sdw}}" class="input-small  number"/>
							</td>
							<shiro:hasPermission name="course:course:edit"><td class="text-center" width="10">
								{{#delBtn}}<span class="close" onclick="delRow(this, '#courseShenduList{{idx}}')" title="删除">&times;</span>{{/delBtn}}
							</td></shiro:hasPermission>
						</tr>//-->
					</script>
					<script type="text/javascript">
						var courseShenduRowIdx = 0, courseShenduTpl = $("#courseShenduTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
						$(document).ready(function() {
							var data = ${fns:toJson(course.courseShenduList)};
							for (var i=0; i<data.length; i++){
								addRow('#courseShenduList', courseShenduRowIdx, courseShenduTpl, data[i]);
								courseShenduRowIdx = courseShenduRowIdx + 1;
							}
						});
					</script>
				</div>
			</div>
		<div class="form-actions">
			<shiro:hasPermission name="course:course:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>