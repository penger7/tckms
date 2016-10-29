<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>课程库</title>
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
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/historycourse/historyCourse/">课程列表</a></li>
		<li class="active"><a href="${ctx}/historycourse/historyCourse/form?id=${historyCourse.id}">数据<shiro:hasPermission name="historycourse:historyCourse:edit">${not empty historyCourse.id?'展示':'添加'}</shiro:hasPermission><shiro:lacksPermission name="historycourse:historyCourse:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="historyCourse" action="${ctx}/historycourse/historyCourse/save" method="post" class="form-horizontal">
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
<!-- 					<span class="help-inline"><font color="red">*</font> </span> -->
				</td>
				<td>
					<label class="control-label">省市：</label>
				 	<sys:treeselect id="area" name="area.id" value="${historyCourse.area.id}" labelName="area.name" labelValue="${historyCourse.area.name}"
						title="区域" url="/sys/area/treeData" cssClass="" allowClear="true" notAllowSelectParent="true"/>
			 	</td>
			</tr>
			<tr>
				<td>
					<label class="control-label">课程名：</label>
					<form:input path="coursename" htmlEscape="false" maxlength="1024" class="input-xlarge "/>
				</td>
				<td> 
					<label class="control-label">教师名称：</label>
				 	<form:input path="teachername" htmlEscape="false" maxlength="256" class="input-xlarge "/>
				</td> 
			</tr>
			<tr>
				<td>
					<label class="control-label">性别：</label>
				 	<form:select path="sex" class="input-xlarge ">
						<form:option value="" label=""/>
						<form:options items="${fns:getDictList('sex')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
				</td>
				<td> 
					<label class="control-label">教师类型：</label>
					<form:select path="jiaoshileixing" class="input-xlarge ">
						<form:option value="" label=""/>
						<form:options items="${fns:getDictList('teacherType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
				</td>
			</tr>
			<tr>
				<td> 
					<label class="control-label">学段：</label>
				 	<form:select path="xueduan" class="input-xlarge ">
						<form:option value="" label=""/>
						<form:options items="${fns:getDictList('period')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
				</td>
				<td> 
					<label class="control-label">学科类型：</label>
				 	<form:select path="xuekeleixing" class="input-xlarge ">
						<form:option value="" label=""/>
						<form:options items="${fns:getDictList('subjectType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
				</td>
			</tr>
			<tr>
				<td>	 
					<label class="control-label">学科：</label>
				 	<form:select path="xueke" class="input-xlarge ">
						<form:option value="" label=""/>
						<form:options items="${fns:getDictList('subject')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
				</td>
<!--			<td> 
					<label class="control-label">教学类型：</label>
				 	<form:select path="jiaoxueleixing" class="input-xlarge ">
						<form:option value="" label=""/>
						<form:options items="${fns:getDictList('teachingType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
				</td>
				<td> 
					<label class="control-label">备注信息：</label>
				 	<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
				</td>
			</tr> 
  					<label class="control-label">归档标记（0：正常；1：删除）：</label>
					<form:radiobuttons path="archiveDoc" items="${fns:getDictList('archive_doc')}" itemLabel="label" itemValue="value" htmlEscape="false" class=""/>-->
			</tr> 
		</table>
		
		<br/><br/>
			<div class="control-group">
				<label class="control-label">ST维度_存储表：</label>
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
								<shiro:hasPermission name="historycourse:historyCourse:edit"><th width="10">&nbsp;</th></shiro:hasPermission>
							</tr>
						</thead>
						<tbody id="historyCourseStList">
						</tbody>
<!--						<shiro:hasPermission name="historycourse:historyCourse:edit"><tfoot>
							<tr><td colspan="9"><a href="javascript:" onclick="addRow('#historyCourseStList', historyCourseStRowIdx, historyCourseStTpl);historyCourseStRowIdx = historyCourseStRowIdx + 1;" class="btn">新增</a></td></tr>
						</tfoot></shiro:hasPermission>	  -->
					</table>
					<script type="text/template" id="historyCourseStTpl">//<!--
						<tr id="historyCourseStList{{idx}}">
							<td class="hide">
								<input id="historyCourseStList{{idx}}_id" name="historyCourseStList[{{idx}}].id" type="hidden" value="{{row.id}}"/>
								<input id="historyCourseStList{{idx}}_delFlag" name="historyCourseStList[{{idx}}].delFlag" type="hidden" value="0"/>
							</td>
							<td>
								<input id="historyCourseStList{{idx}}_stdatas" name="historyCourseStList[{{idx}}].stdatas" type="text" value="{{row.stdatas}}" class="input-small "/>
							</td>
							<td>
								<input id="historyCourseStList{{idx}}_sttimer" name="historyCourseStList[{{idx}}].sttimer" type="text" value="{{row.sttimer}}" maxlength="11" class="input-small required"/>
							</td>
							<td>
								<input id="historyCourseStList{{idx}}_ch" name="historyCourseStList[{{idx}}].ch" type="text" value="{{row.ch}}" class="input-small "/>
							</td>
							<td>
								<input id="historyCourseStList{{idx}}_rt" name="historyCourseStList[{{idx}}].rt" type="text" value="{{row.rt}}" class="input-small "/>
							</td>
							<td>
								<input id="historyCourseStList{{idx}}_rs" name="historyCourseStList[{{idx}}].rs" type="text" value="{{row.rs}}" class="input-small "/>
							</td>							
							<td>
								<input id="historyCourseStList{{idx}}_jiaoxueleixing" name="historyCourseStList[{{idx}}].jiaoxueleixing" type="text" value="{{row.jiaoxueleixing}}" maxlength="45" class="input-small "/>
							</td>
							
							
						</tr>//-->
					</script>
					<script type="text/javascript">
						var historyCourseStRowIdx = 0, historyCourseStTpl = $("#historyCourseStTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
						$(document).ready(function() {
							var data = ${fns:toJson(historyCourse.historyCourseStList)};
							for (var i=0; i<data.length; i++){
								addRow('#historyCourseStList', historyCourseStRowIdx, historyCourseStTpl, data[i]);
								historyCourseStRowIdx = historyCourseStRowIdx + 1;
							}
						});
					</script>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">有效性维度_存储表：</label>
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
								
								<shiro:hasPermission name="historycourse:historyCourse:edit"><th width="10">&nbsp;</th></shiro:hasPermission>
							</tr>
						</thead>
						<tbody id="historyCourseYouxiaoxingList">
						</tbody>
<!--						<shiro:hasPermission name="historycourse:historyCourse:edit"><tfoot>
							<tr><td colspan="22"><a href="javascript:" onclick="addRow('#historyCourseYouxiaoxingList', historyCourseYouxiaoxingRowIdx, historyCourseYouxiaoxingTpl);historyCourseYouxiaoxingRowIdx = historyCourseYouxiaoxingRowIdx + 1;" class="btn">新增</a></td></tr>
						</tfoot></shiro:hasPermission>	  -->
					</table>
					<script type="text/template" id="historyCourseYouxiaoxingTpl">//<!--
						<tr id="historyCourseYouxiaoxingList{{idx}}">
							<td class="hide">
								<input id="historyCourseYouxiaoxingList{{idx}}_id" name="historyCourseYouxiaoxingList[{{idx}}].id" type="hidden" value="{{row.id}}"/>
								<input id="historyCourseYouxiaoxingList{{idx}}_delFlag" name="historyCourseYouxiaoxingList[{{idx}}].delFlag" type="hidden" value="0"/>
							</td>
							<td>
								<input id="historyCourseYouxiaoxingList{{idx}}_glxwt" name="historyCourseYouxiaoxingList[{{idx}}].glxwt" type="text" value="{{row.glxwt}}" class="input-small "/>
							</td>
							<td>
								<input id="historyCourseYouxiaoxingList{{idx}}_jyxwt" name="historyCourseYouxiaoxingList[{{idx}}].jyxwt" type="text" value="{{row.jyxwt}}" class="input-small "/>
							</td>
							<td>
								<input id="historyCourseYouxiaoxingList{{idx}}_tlxwt" name="historyCourseYouxiaoxingList[{{idx}}].tlxwt" type="text" value="{{row.tlxwt}}" class="input-small "/>
							</td>
							<td>
								<input id="historyCourseYouxiaoxingList{{idx}}_czxwt" name="historyCourseYouxiaoxingList[{{idx}}].czxwt" type="text" value="{{row.czxwt}}" class="input-small "/>
							</td>
							<td>
								<input id="historyCourseYouxiaoxingList{{idx}}_ppxwt" name="historyCourseYouxiaoxingList[{{idx}}].ppxwt" type="text" value="{{row.ppxwt}}" class="input-small "/>
							</td>
							<td>
								<input id="historyCourseYouxiaoxingList{{idx}}_dm" name="historyCourseYouxiaoxingList[{{idx}}].dm" type="text" value="{{row.dm}}" class="input-small "/>
							</td>
							<td>
								<input id="historyCourseYouxiaoxingList{{idx}}_rxsqd" name="historyCourseYouxiaoxingList[{{idx}}].rxsqd" type="text" value="{{row.rxsqd}}" class="input-small "/>
							</td>
							<td>
								<input id="historyCourseYouxiaoxingList{{idx}}_jjszd" name="historyCourseYouxiaoxingList[{{idx}}].jjszd" type="text" value="{{row.jjszd}}" class="input-small "/>
							</td>
							<td>
								<input id="historyCourseYouxiaoxingList{{idx}}_jwjszd" name="historyCourseYouxiaoxingList[{{idx}}].jwjszd" type="text" value="{{row.jwjszd}}" class="input-small "/>
							</td>
							<td>
								<input id="historyCourseYouxiaoxingList{{idx}}_glxxtcwt" name="historyCourseYouxiaoxingList[{{idx}}].glxxtcwt" type="text" value="{{row.glxxtcwt}}" class="input-small "/>
							</td>
							<td>
								<input id="historyCourseYouxiaoxingList{{idx}}_jtqd" name="historyCourseYouxiaoxingList[{{idx}}].jtqd" type="text" value="{{row.jtqd}}" class="input-small "/>
							</td>
							<td>
								<input id="historyCourseYouxiaoxingList{{idx}}_tlhhb" name="historyCourseYouxiaoxingList[{{idx}}].tlhhb" type="text" value="{{row.tlhhb}}" class="input-small "/>
							</td>
							<td>
								<input id="historyCourseYouxiaoxingList{{idx}}_gbhd" name="historyCourseYouxiaoxingList[{{idx}}].gbhd" type="text" value="{{row.gbhd}}" class="input-small "/>
							</td>
							<td>
								<input id="historyCourseYouxiaoxingList{{idx}}_zyd" name="historyCourseYouxiaoxingList[{{idx}}].zyd" type="text" value="{{row.zyd}}" class="input-small "/>
							</td>
							<td>
								<input id="historyCourseYouxiaoxingList{{idx}}_whd" name="historyCourseYouxiaoxingList[{{idx}}].whd" type="text" value="{{row.whd}}" class="input-small "/>
							</td>
							<td>
								<input id="historyCourseYouxiaoxingList{{idx}}_pdsf" name="historyCourseYouxiaoxingList[{{idx}}].pdsf" type="text" value="{{row.pdsf}}" class="input-small "/>
							</td>
							<td>
								<input id="historyCourseYouxiaoxingList{{idx}}_rzjyxhd" name="historyCourseYouxiaoxingList[{{idx}}].rzjyxhd" type="text" value="{{row.rzjyxhd}}" class="input-small "/>
							</td>
							<td>
								<input id="historyCourseYouxiaoxingList{{idx}}_tlxhd" name="historyCourseYouxiaoxingList[{{idx}}].tlxhd" type="text" value="{{row.tlxhd}}" class="input-small "/>
							</td>
							<td>
								<input id="historyCourseYouxiaoxingList{{idx}}_czpjxhd" name="historyCourseYouxiaoxingList[{{idx}}].czpjxhd" type="text" value="{{row.czpjxhd}}" class="input-small "/>
							</td>
							
							
						</tr>//-->
					</script>
					<script type="text/javascript">
						var historyCourseYouxiaoxingRowIdx = 0, historyCourseYouxiaoxingTpl = $("#historyCourseYouxiaoxingTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
						$(document).ready(function() {
							var data = ${fns:toJson(historyCourse.historyCourseYouxiaoxingList)};
							for (var i=0; i<data.length; i++){
								addRow('#historyCourseYouxiaoxingList', historyCourseYouxiaoxingRowIdx, historyCourseYouxiaoxingTpl, data[i]);
								historyCourseYouxiaoxingRowIdx = historyCourseYouxiaoxingRowIdx + 1;
							}
						});
					</script>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">回应维度_存储表：</label>
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
								
								<shiro:hasPermission name="historycourse:historyCourse:edit"><th width="10">&nbsp;</th></shiro:hasPermission>
							</tr>
						</thead>
						<tbody id="historyCourseHuiyingList">
						</tbody>
<!-- 						<shiro:hasPermission name="historycourse:historyCourse:edit"><tfoot>
							<tr><td colspan="10"><a href="javascript:" onclick="addRow('#historyCourseHuiyingList', historyCourseHuiyingRowIdx, historyCourseHuiyingTpl);historyCourseHuiyingRowIdx = historyCourseHuiyingRowIdx + 1;" class="btn">新增</a></td></tr>
						</tfoot></shiro:hasPermission>		 -->
					</table>
					<script type="text/template" id="historyCourseHuiyingTpl">//<!--
						<tr id="historyCourseHuiyingList{{idx}}">
							<td class="hide">
								<input id="historyCourseHuiyingList{{idx}}_id" name="historyCourseHuiyingList[{{idx}}].id" type="hidden" value="{{row.id}}"/>
								<input id="historyCourseHuiyingList{{idx}}_delFlag" name="historyCourseHuiyingList[{{idx}}].delFlag" type="hidden" value="0"/>
							</td>
							<td>
								<input id="historyCourseHuiyingList{{idx}}_yyhy" name="historyCourseHuiyingList[{{idx}}].yyhy" type="text" value="{{row.yyhy}}" class="input-small "/>
							</td>
							<td>
								<input id="historyCourseHuiyingList{{idx}}_fyyhy" name="historyCourseHuiyingList[{{idx}}].fyyhy" type="text" value="{{row.fyyhy}}" class="input-small "/>
							</td>
							<td>
								<input id="historyCourseHuiyingList{{idx}}_kdhy" name="historyCourseHuiyingList[{{idx}}].kdhy" type="text" value="{{row.kdhy}}" class="input-small "/>
							</td>
							<td>
								<input id="historyCourseHuiyingList{{idx}}_fdhy" name="historyCourseHuiyingList[{{idx}}].fdhy" type="text" value="{{row.fdhy}}" class="input-small "/>
							</td>
							<td>
								<input id="historyCourseHuiyingList{{idx}}_why" name="historyCourseHuiyingList[{{idx}}].why" type="text" value="{{row.why}}" class="input-small "/>
							</td>
							<td>
								<input id="historyCourseHuiyingList{{idx}}_ddxshdd" name="historyCourseHuiyingList[{{idx}}].ddxshdd" type="text" value="{{row.ddxshdd}}" class="input-small "/>
							</td>
							<td>
								<input id="historyCourseHuiyingList{{idx}}_cfhdhjs" name="historyCourseHuiyingList[{{idx}}].cfhdhjs" type="text" value="{{row.cfhdhjs}}" class="input-small "/>
							</td>
							
							
						</tr>//-->
					</script>
					<script type="text/javascript">
						var historyCourseHuiyingRowIdx = 0, historyCourseHuiyingTpl = $("#historyCourseHuiyingTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
						$(document).ready(function() {
							var data = ${fns:toJson(historyCourse.historyCourseHuiyingList)};
							for (var i=0; i<data.length; i++){
								addRow('#historyCourseHuiyingList', historyCourseHuiyingRowIdx, historyCourseHuiyingTpl, data[i]);
								historyCourseHuiyingRowIdx = historyCourseHuiyingRowIdx + 1;
							}
						});
					</script>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">四何维度_存储表：</label>
				<div class="controls">
					<table id="contentTable" class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>
								<th class="hide"></th>
								<th>是何</th>
								<th>为何</th>
								<th>如何</th>
								<th>若何</th>
								
								<shiro:hasPermission name="historycourse:historyCourse:edit"><th width="10">&nbsp;</th></shiro:hasPermission>
							</tr>
						</thead>
						<tbody id="historyCourseSiheList">
						</tbody>
<!-- 						<shiro:hasPermission name="historycourse:historyCourse:edit"><tfoot>
							<tr><td colspan="7"><a href="javascript:" onclick="addRow('#historyCourseSiheList', historyCourseSiheRowIdx, historyCourseSiheTpl);historyCourseSiheRowIdx = historyCourseSiheRowIdx + 1;" class="btn">新增</a></td></tr>
						</tfoot></shiro:hasPermission>	 -->
					</table>
					<script type="text/template" id="historyCourseSiheTpl">//<!--
						<tr id="historyCourseSiheList{{idx}}">
							<td class="hide">
								<input id="historyCourseSiheList{{idx}}_id" name="historyCourseSiheList[{{idx}}].id" type="hidden" value="{{row.id}}"/>
								<input id="historyCourseSiheList{{idx}}_delFlag" name="historyCourseSiheList[{{idx}}].delFlag" type="hidden" value="0"/>
							</td>
							<td>
								<input id="historyCourseSiheList{{idx}}_sh" name="historyCourseSiheList[{{idx}}].sh" type="text" value="{{row.sh}}" class="input-small "/>
							</td>
							<td>
								<input id="historyCourseSiheList{{idx}}_wh" name="historyCourseSiheList[{{idx}}].wh" type="text" value="{{row.wh}}" class="input-small "/>
							</td>
							<td>
								<input id="historyCourseSiheList{{idx}}_ruh" name="historyCourseSiheList[{{idx}}].ruh" type="text" value="{{row.ruh}}" class="input-small "/>
							</td>
							<td>
								<input id="historyCourseSiheList{{idx}}_ruoh" name="historyCourseSiheList[{{idx}}].ruoh" type="text" value="{{row.ruoh}}" class="input-small "/>
							</td>
							
							
						</tr>//-->
					</script>
					<script type="text/javascript">
						var historyCourseSiheRowIdx = 0, historyCourseSiheTpl = $("#historyCourseSiheTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
						$(document).ready(function() {
							var data = ${fns:toJson(historyCourse.historyCourseSiheList)};
							for (var i=0; i<data.length; i++){
								addRow('#historyCourseSiheList', historyCourseSiheRowIdx, historyCourseSiheTpl, data[i]);
								historyCourseSiheRowIdx = historyCourseSiheRowIdx + 1;
							}
						});
					</script>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">对话深度_存储表：</label>
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
								
								<shiro:hasPermission name="historycourse:historyCourse:edit"><th width="10">&nbsp;</th></shiro:hasPermission>
							</tr>
						</thead>
						<tbody id="historyCourseShenduList">
						</tbody>
<!-- 						<shiro:hasPermission name="historycourse:historyCourse:edit"><tfoot>
							<tr><td colspan="8"><a href="javascript:" onclick="addRow('#historyCourseShenduList', historyCourseShenduRowIdx, historyCourseShenduTpl);historyCourseShenduRowIdx = historyCourseShenduRowIdx + 1;" class="btn">新增</a></td></tr>
						</tfoot></shiro:hasPermission>	 -->
					</table>
					<script type="text/template" id="historyCourseShenduTpl">//<!--
						<tr id="historyCourseShenduList{{idx}}">
							<td class="hide">
								<input id="historyCourseShenduList{{idx}}_id" name="historyCourseShenduList[{{idx}}].id" type="hidden" value="{{row.id}}"/>
								<input id="historyCourseShenduList{{idx}}_delFlag" name="historyCourseShenduList[{{idx}}].delFlag" type="hidden" value="0"/>
							</td>
							<td>
								<input id="historyCourseShenduList{{idx}}_sdy" name="historyCourseShenduList[{{idx}}].sdy" type="text" value="{{row.sdy}}" class="input-small "/>
							</td>
							<td>
								<input id="historyCourseShenduList{{idx}}_sder" name="historyCourseShenduList[{{idx}}].sder" type="text" value="{{row.sder}}" class="input-small "/>
							</td>
							<td>
								<input id="historyCourseShenduList{{idx}}_sds" name="historyCourseShenduList[{{idx}}].sds" type="text" value="{{row.sds}}" class="input-small "/>
							</td>
							<td>
								<input id="historyCourseShenduList{{idx}}_sdsi" name="historyCourseShenduList[{{idx}}].sdsi" type="text" value="{{row.sdsi}}" class="input-small "/>
							</td>
							<td>
								<input id="historyCourseShenduList{{idx}}_sdw" name="historyCourseShenduList[{{idx}}].sdw" type="text" value="{{row.sdw}}" class="input-small "/>
							</td>
							
							
						</tr>//-->
					</script>
					<script type="text/javascript">
						var historyCourseShenduRowIdx = 0, historyCourseShenduTpl = $("#historyCourseShenduTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
						$(document).ready(function() {
							var data = ${fns:toJson(historyCourse.historyCourseShenduList)};
							for (var i=0; i<data.length; i++){
								addRow('#historyCourseShenduList', historyCourseShenduRowIdx, historyCourseShenduTpl, data[i]);
								historyCourseShenduRowIdx = historyCourseShenduRowIdx + 1;
							}
						});
					</script>
				</div>
			</div>
			
			
			
		<div class="form-actions">
<!-- 		<shiro:hasPermission name="historycourse:historyCourse:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>	 -->	
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>