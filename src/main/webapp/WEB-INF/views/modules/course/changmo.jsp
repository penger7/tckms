<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>常模统计</title>
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
	
	<form:form id="searchForm" modelAttribute="course" action="${ctx}/course/course/changmo" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>项目名称：</label>
				<form:select path="xiangmumingcheng" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('projectName')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>省/直辖市：</label>
				<form:select path="sheng" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('province')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>市/区：</label>
				<form:select path="shi" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('area')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
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
	<div class="control-group">
				<label class="control-label">ST维度信息：</label>
				<div class="controls">
					<table id="contentTable" class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>
								
								<th>ch</th>
								<th>rt</th>
								<th>rs</th>
								<th>教学类型</th>
								
							</tr>
						</thead>
						<tbody id="courseStList">
						<tr id="courseStList{{idx}}">
							
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
								<input id="courseStList{{idx}}_jiaoxueleixing" name="courseStList[{{idx}}].jiaoxueleixing" value="{{row.jiaoxueleixing}}" class="input-small  number">
									
							</td>
						</tbody>
					</table>

				</div>
			</div>
			<div class="control-group">
				<label class="control-label">有效性维度：</label>
				<div class="controls">
					<table id="contentTable" class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>
								<th>管理性问题</th>
								<th>记忆性问题</th>
								<th>推理性问题</th>
								<th>创造性问题</th>
								<th>批判性问题</th>
													
								
							</tr>
						</thead>
						<tbody id="courseYouxiaoxingList">
							<tr>
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
							
							</tr>
						</tbody>
						<thead>
							<tr>
								<th>提问前先点名</th>
								<th>让学生齐答</th>
								<th>叫举手者答</th>
								<th>叫未举手者答</th>
								<th>鼓励学生提出问题</th>
							</tr>
						</thead>
						<tbody>
							<tr>
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
							</tr>
						</tbody>
						<thead>
							<tr>
								<th>集体齐答</th>
								<th>讨论后汇报</th>
								<th>个别回答</th>
								<th>自由答</th>
								
							</tr>
						</thead>
						<tbody>
							<tr>
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
							
							</tr>
						</tbody>
						<thead>
							<tr>
								<th>无回答</th>
								<th>机械判断是否</th>
								<th>认知记忆性回答</th>
								<th>推理性回答</th>
								<th>创造评价性回答</th>
							</tr>
						</thead>
						<tbody>
							<tr>
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
							</tr>
						</tbody>
					</table>
					
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">回应维度：</label>
				<div class="controls">
					<table id="contentTable" class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>								
								<th>言语回应</th>
								<th>非言语回应</th>
																
							</tr>
						</thead>
						<tbody id="courseHuiyingList">
							<tr>
								<td>
									<input id="courseHuiyingList{{idx}}_yyhy" name="courseHuiyingList[{{idx}}].yyhy" type="text" value="{{row.yyhy}}" class="input-small  number"/>
								</td>
								<td>
									<input id="courseHuiyingList{{idx}}_fyyhy" name="courseHuiyingList[{{idx}}].fyyhy" type="text" value="{{row.fyyhy}}" class="input-small "/>
								</td>
							</tr>
						</tbody>
						<thead>
							<tr>
								<th>肯定回应</th>
								<th>否定回应</th>
								<th>无回应</th>
								<th>打断学生回答或代答</th>
								<th>重复学生回答并解释</th>
							</tr>
						</thead>
						<tbody>
							<tr>
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
							</tr>
						</tbody>
					</table>
					
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">四何维度：</label>
				<div class="controls">
					<table id="contentTable" class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>
								
								<th>是何</th>
								<th>为何</th>
								<th>如何</th>
								<th>若何</th>
								
							</tr>
						</thead>
						<tbody id="courseSiheList">
							<tr>
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
							</tr>
						</tbody>
						
					</table>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">对话深度维度：</label>
				<div class="controls">
					<table id="contentTable" class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>
								
								<th>深度一</th>
								<th>深度二</th>
								<th>深度三</th>
								<th>深度四</th>
								<th>深度五</th>
								
							</tr>
						</thead>
						<tbody id="courseShenduList">
							<tr>
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
							</tr>
						</tbody>
						
					</table>
					
				</div>
			</div>
	
</body>
</html>