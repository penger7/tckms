<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>课程管理</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/modules/course/courserecord.js" type="text/javascript"></script>
	<script type="text/javascript">
		var strawdatas = "${st.stdatas}";
		$(document).ready(function() {
			resetDatatype();
			setSTRawDatas();
		});
		
		function resetDatatype() {
			var dt = $("#datatype").val();
			$("div[id$=_datagroup]").hide();
			$("#"+dt+"_datagroup").show();
		}
		
		function dateRecord(datatype,opt,field) {
			if (opt == "+") {
				$("#"+field).val(parseInt($("#"+field).val())+1);
			} else if (opt == "-") {
				if (parseInt($("#"+field).val()) <= 0)
					return;
				
				$("#"+field).val(parseInt($("#"+field).val())-1);
			}
			
			if (datatype == "4mat") {
				var fw = parseInt($("#FWhat").val());
				var fy = parseInt($("#FWhy").val());
				var fh = parseInt($("#FHow").val());
				var fi = parseInt($("#FIf").val());
				
				var ft = fw + fy + fh + fi;
				$("#FWhat_percent").text("0.00");
				$("#FWhy_percent").text("0.00");
				$("#FHow_percent").text("0.00");
				$("#FIf_percent").text("0.00");
				if (ft > 0) {
					$("#FWhat_percent").text((fw/ft*100).toFixed(2));
					$("#FWhy_percent").text((fy/ft*100).toFixed(2));
					$("#FHow_percent").text((fh/ft*100).toFixed(2));
					$("#FIf_percent").text((fi/ft*100).toFixed(2));
				}
			} else if (datatype == "question") {
				var qtg = parseInt($("#QTGuanli").val());
				var qtj = parseInt($("#QTJiyi").val());
				var qtt = parseInt($("#QTTuili").val());
				var qtc = parseInt($("#QTChuang").val());
				var qtp = parseInt($("#QTPipan").val());
				
				var qt_t = qtg + qtj + qtt + qtc + qtp;
				$("#QTGuanli_percent").text("0.00");
				$("#QTJiyi_percent").text("0.00");
				$("#QTTuili_percent").text("0.00");
				$("#QTChuang_percent").text("0.00");
				$("#QTPipan_percent").text("0.00");
				if (qt_t > 0) {
					$("#QTGuanli_percent").text((qtg/qt_t*100).toFixed(2));
					$("#QTJiyi_percent").text((qtj/qt_t*100).toFixed(2));
					$("#QTTuili_percent").text((qtt/qt_t*100).toFixed(2));
					$("#QTChuang_percent").text((qtc/qt_t*100).toFixed(2));
					$("#QTPipan_percent").text((qtp/qt_t*100).toFixed(2));
				}
				//
				var qsd = parseInt($("#QSDian").val());
				var qsq = parseInt($("#QSQida").val());
				var qsj = parseInt($("#QSJushou").val());
				var qsw = parseInt($("#QSWeiju").val());
				var qsg = parseInt($("#QSGuli").val());
				
				var qs_t = qsd + qsq + qsj + qsw + qsg;
				$("#QSDian_percent").text("0.00");
				$("#QSQida_percent").text("0.00");
				$("#QSJushou_percent").text("0.00");
				$("#QSWeiju_percent").text("0.00");
				$("#QSGuli_percent").text("0.00");
				if (qs_t > 0) {
					$("#QSDian_percent").text((qsd/qs_t*100).toFixed(2));
					$("#QSQida_percent").text((qsq/qs_t*100).toFixed(2));
					$("#QSJushou_percent").text((qsj/qs_t*100).toFixed(2));
					$("#QSWeiju_percent").text((qsw/qs_t*100).toFixed(2));
					$("#QSGuli_percent").text((qsg/qs_t*100).toFixed(2));
				}
				//
				var qaq = parseInt($("#QAQida").val());
				var qah = parseInt($("#QAHuibao").val());
				var qag = parseInt($("#QAGebie").val());
				var qaz = parseInt($("#QAZiyou").val());
				
				var qa_t = qaq + qah + qag + qaz;
				$("#QAQida_percent").text("0.00");
				$("#QAHuibao_percent").text("0.00");
				$("#QAGebie_percent").text("0.00");
				$("#QAZiyou_percent").text("0.00");
				
				if (qa_t > 0) {
					$("#QAQida_percent").text((qaq/qa_t*100).toFixed(2));
					$("#QAHuibao_percent").text((qah/qa_t*100).toFixed(2));
					$("#QAGebie_percent").text((qag/qa_t*100).toFixed(2));
					$("#QAZiyou_percent").text((qaz/qa_t*100).toFixed(2));
				}
				//
				var qatw = parseInt($("#QATWu").val());
				var qatj = parseInt($("#QATJixie").val());
				var qatr = parseInt($("#QATRenzhi").val());
				var qatt = parseInt($("#QATTuili").val());
				var qatc = parseInt($("#QATChuang").val());
				
				var qat_t = qatw + qatj + qatr + qatt + qatc;
				$("#QATWu_percent").text("0.00");
				$("#QATJixie_percent").text("0.00");
				$("#QATRenzhi_percent").text("0.00");
				$("#QATTuili_percent").text("0.00");
				$("#QATChuang_percent").text("0.00");
				if (qat_t > 0) {
					$("#QATWu_percent").text((qatw/qat_t*100).toFixed(2));
					$("#QATJixie_percent").text((qatj/qat_t*100).toFixed(2));
					$("#QATRenzhi_percent").text((qatr/qat_t*100).toFixed(2));
					$("#QATTuili_percent").text((qatt/qat_t*100).toFixed(2));
					$("#QATChuang_percent").text((qatc/qat_t*100).toFixed(2));
				}
			} else if (datatype == "response") {
				var rt = parseInt($("#RTTalk").val());
				var ra = parseInt($("#RTAction").val());
				
				var rt_t = rt + ra;
				$("#RTTalk_percent").text("0.00");
				$("#RTAction_percent").text("0.00");
				if (rt_t > 0) {
					$("#RTTalk_percent").text((rt/rt_t*100).toFixed(2));
					$("#RTAction_percent").text((ra/rt_t*100).toFixed(2));
				}
				//
				var ray = parseInt($("#RAYes").val());
				var ran = parseInt($("#RANo").val());
				var rann = parseInt($("#RANone").val());
				var rab = parseInt($("#RABreak").val());
				var rar = parseInt($("#RARepeat").val());
				
				var ra_t = ray + ran + rann + rab + rar;
				
				$("#RAYes_percent").text("0.00");
				$("#RANo_percent").text("0.00");
				$("#RANone_percent").text("0.00");
				$("#RABreak_percent").text("0.00");
				$("#RARepeat_percent").text("0.00");
				if (ra_t > 0) {
					$("#RAYes_percent").text((ray/ra_t*100).toFixed(2));
					$("#RANo_percent").text((ran/ra_t*100).toFixed(2));
					$("#RANone_percent").text((rann/ra_t*100).toFixed(2));
					$("#RABreak_percent").text((rab/ra_t*100).toFixed(2));
					$("#RARepeat_percent").text((rar/ra_t*100).toFixed(2));
				}
			} else if (datatype == "dialogue") {
				var li = parseInt(field.substring(6));
				if ($("#autoDlgReset").attr("checked") == "checked") {
					if (opt == "+") {
						if (li > 1) {
							var lpi = $("#DLevel"+(li-1));
							if (parseInt(lpi.val()) > 0)
								lpi.val(parseInt(lpi.val())-1);
							else {//rollback
								$("#"+field).val(parseInt($("#"+field).val())-1);
							}
						}
					} else {
						if (li > 1) {
							var lpi = $("#DLevel"+(li-1));
							lpi.val(parseInt(lpi.val())+1);
						}
					}
				}
				
				var l1 = parseInt($("#DLevel1").val());
				var l2 = parseInt($("#DLevel2").val());
				var l3 = parseInt($("#DLevel3").val());
				var l4 = parseInt($("#DLevel4").val());
				var l5 = parseInt($("#DLevel5").val());
				
				var lt = l1 + l2 + l3 + l4 + l5;
				$("#DLevel1_percent").text("0.00");
				$("#DLevel2_percent").text("0.00");
				$("#DLevel3_percent").text("0.00");
				$("#DLevel4_percent").text("0.00");
				$("#DLevel5_percent").text("0.00");
				if (lt > 0) {
					$("#DLevel1_percent").text((l1/lt*100).toFixed(2));
					$("#DLevel2_percent").text((l2/lt*100).toFixed(2));
					$("#DLevel3_percent").text((l3/lt*100).toFixed(2));
					$("#DLevel4_percent").text((l4/lt*100).toFixed(2));
					$("#DLevel5_percent").text((l5/lt*100).toFixed(2));
				}
			}
		}
		
		var sttimer = null;
		var stltimer = null;
		var stlen = 0;
		
		function setSTRawDatas() {
			$("#stdatas").empty();
			var sts = strawdatas.split("");
			for (var i=0;i<sts.length;i++) {
				if (sts[i] != "")
					recordST(sts[i]);
			}
		}
		
		function dateSTRecord(sttype) {
			if (sttype == "s") {
				$("#btns").addClass("disabled");
				$("#btnt").removeClass("disabled");
			} else if (sttype == "t") {
				$("#btns").removeClass("disabled");
				$("#btnt").addClass("disabled");
			}
			
			var sts = $("#stdatas").find("div");
			if (sts.length > 0) 
				sts.eq(sts.length-1).text(sttype);
			else 
				recordST(sttype);
			
			if (sttimer == null) {
				var stt = 30;
				if ($.trim($("#sttimer").val())!="") 
					stt = parseInt($("#sttimer").val());
				
				if (stt<=0)
					stt = 30;
				
				sttimer = window.setInterval("autoSTRecord()", stt*1000);
				stltimer = window.setInterval("lenSTRecord()", 1000);
				
				stlen = $("#stdatas").find("div").length*stt;
			}
		}
		
		function recordST(sttype) {
			$("#stdatas").find("div").removeClass("current");
			$("#stdatas").append("<div class='stcell current' ondblclick='wrapSTRecord(this)'>"+sttype+"</div>");
		}
		
		function wrapSTRecord(athis) {
			if ($(athis).hasClass("current"))
				return;
			
			if ($(athis).text() == "s")
				$(athis).text("t");
			else
				$(athis).text("s");
		}
		
		function autoSTRecord() {
			var sts = $("#stdatas").find("div");
			if (sts.length > 0) 
				recordST(sts.eq(sts.length-1).text());
		}
		
		function lenSTRecord() {
			stlen++;
			$("#sttime").text(formatTime(stlen));
		}
		
		function stopSTRecord() {
			$("#stdatas").find("div").removeClass("current");
			saveRecordData("st", false);
			
			if (sttimer==null)
				return;
			window.clearInterval(sttimer);
		}
		
		function saveRecordData(datatype, bShowtip) {
			var showtip = arguments[1] != undefined ? arguments[1] : true;
			var datas = {"id":$("#id").val(), "datatype":datatype};
			
			if (datatype == "4mat") {
				datas["sh"] = parseInt($("#FWhat").val());
				datas["wh"] = parseInt($("#FWhy").val());
				datas["ruh"] = parseInt($("#FHow").val());
				datas["ruoh"] = parseInt($("#FIf").val());
			} else if (datatype == "question") {
				datas["glxwt"] = parseInt($("#QTGuanli").val());
				datas["jyxwt"] = parseInt($("#QTJiyi").val());
				datas["tlxwt"] = parseInt($("#QTTuili").val());
				datas["czxwt"] = parseInt($("#QTChuang").val());
				datas["ppxwt"] = parseInt($("#QTPipan").val());
				
				datas["dm"] = parseInt($("#QSDian").val());
				datas["rxsqd"] = parseInt($("#QSQida").val());
				datas["jjszd"] = parseInt($("#QSJushou").val());
				datas["jwjszd"] = parseInt($("#QSWeiju").val());
				datas["glxxtcwt"] = parseInt($("#QSGuli").val());
				
				datas["jtqd"] = parseInt($("#QAQida").val());
				datas["tlhhb"] = parseInt($("#QAHuibao").val());
				datas["gbhd"] = parseInt($("#QAGebie").val());
				datas["zyd"] = parseInt($("#QAZiyou").val());
				
				datas["whd"] = parseInt($("#QATWu").val());
				datas["pdsf"] = parseInt($("#QATJixie").val());
				datas["rzjyxhd"] = parseInt($("#QATRenzhi").val());
				datas["tlxhd"] = parseInt($("#QATTuili").val());
				datas["czpjxhd"] = parseInt($("#QATChuang").val());
			} else if (datatype == "response") {
				datas["yyhy"] = parseInt($("#RTTalk").val());
				datas["fyyhy"] = parseInt($("#RTAction").val());
				
				datas["kdhy"] = parseInt($("#RAYes").val());
				datas["fdhy"] = parseInt($("#RANo").val());
				datas["why"] = parseInt($("#RANone").val());
				datas["ddxshdd"] = parseInt($("#RABreak").val());
				datas["cfhdhjs"] = parseInt($("#RARepeat").val());
			} else if (datatype == "dialogue") {
				datas["sdy"] = parseInt($("#DLevel1").val());
				datas["sder"] = parseInt($("#DLevel2").val());
				datas["sds"] = parseInt($("#DLevel3").val());
				datas["sdsi"] = parseInt($("#DLevel4").val());
				datas["sdw"] = parseInt($("#DLevel5").val());
			} else if (datatype == "st") {
				var ststr = $("#stdatas").text();
				datas["stdatas"] = ststr;
				datas["sttimer"] = parseInt($("#sttimer").val());
			}
			
			var curajax = $.ajax({
			　　url:'${ctx}/course/course/savedata',
			　　timeout : 5000,
			　　type : 'post',
			　　data : datas,
			　　dataType : 'json',
			　　success: function(data) {
					if (showtip) {
						var priority = 'success';
						var title    = '成功';
						var message  = '保存成功!';
						
						$.toaster({ priority : priority, title : title, message : message , settings: {timeout: 3000}});
					}
			　　},
			　　complete : function(XMLHttpRequest,status){
			　　　　if(status=='timeout') {
						curajax.abort();
						var priority = 'danger';
						var title    = '错误';
						var message  = '保存超时，请检查网络配置或稍后再试!';
						
						$.toaster({ priority : priority, title : title, message : message , settings: {timeout: 3000}});
			　　　　}
			　　}
			});
		}
	</script>
	<style type="text/css">
		.data-input-control {
			width: 30px;
			text-align: center;
		}
		
		.table-header {
			height: 25px;
			background-color: lightgray;
			margin-top: 3px;
			margin-bottom: 3px;
			padding-top: 3px;
			padding-bottom: 3px;
			padding-left: 5px;
			font-size: 16px;
			font-weight: bold;
		}
		
		.stcell {
			width: 30px;
			height: 30px;
			border: 1px solid gray;
			float:left;
			font-size: 20px;
			text-align: center;
			line-height: 30px;
			color: black;
			background-color: white;
			cursor: pointer;
		}
		
		.secell, .current {
			background-color: red;
			color: white;
		}
	</style>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/course/course/">课程列表</a></li>
		<li class="active"><a href="#">数据采集</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="course" action="#" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<table>
			<tr>
				<td>
					<label class="control-label">课程名称：</label>
					<input readonly="readonly" type="text" value="${course.coursename}" class="input-large required"/>
				</td>
				<td>
					<label class="control-label">授课教师：</label>
					<input readonly="readonly" type="text" value="${course.teachername}" class="input-large required"/>
				</td>
				<td>
					<label class="control-label">学科：</label>
					<input readonly="readonly" type="text" value="${fns:getDictLabel(course.xueke, 'subject', '')}" class="input-large required"/>
				</td>
				<td>
					<label class="control-label">数据维度：</label>
					<select onchange="resetDatatype()" name="datatype" id="datatype" class="input-large required">
						<c:forEach items="${fns:getDictList('data_record_type')}" var="dt">
							<option value="${dt.value}">${dt.label}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
		</table>
		<div class="control-group" style="margin-top: 20px;" id="4mat_datagroup">
			<table style="width:100%;">
				<tr>
					<td>
						<div class="form-group">
				    		<label>是何问题：&nbsp;&nbsp;</label>
				    		<a class="btn btn-primary" onclick="dateRecord('4mat','+','FWhat')">+</a>
				   		 	<input type="text" class="form-control data-input-control" value="${_4mat.sh}" id="FWhat">
				   		 	<a class="btn btn-primary" onclick="dateRecord('4mat','-','FWhat')">-</a>
				  		</div>
					</td>
					<td>
						<div class="form-group">
				    		<label>为何问题：&nbsp;&nbsp;</label>
				    		<a class="btn btn-primary" onclick="dateRecord('4mat','+','FWhy')">+</a>
				    		<input type="text" class="form-control data-input-control" value="${_4mat.wh}" id="FWhy">
				    		<a class="btn btn-primary" onclick="dateRecord('4mat','-','FWhy')">-</a>
				 		</div>
					</td>
					<td>
						<div class="form-group">
				   			<label>如何问题：&nbsp;&nbsp;</label>
				   			<a class="btn btn-primary" onclick="dateRecord('4mat','+','FHow')">+</a>
				  			<input type="text" class="form-control data-input-control" value="${_4mat.ruh}" id="FHow">
				  			<a class="btn btn-primary" onclick="dateRecord('4mat','-','FHow')">-</a>
						</div>
					</td>
					<td>
						<div class="form-group">
							<label>若何问题：&nbsp;&nbsp;</label>
							<a class="btn btn-primary" onclick="dateRecord('4mat','+','FIf')">+</a>
				    		<input type="text" class="form-control data-input-control" value="${_4mat.ruoh}" id="FIf">
				    		<a class="btn btn-primary" onclick="dateRecord('4mat','-','FIf')">-</a>
				  		</div>
					</td>
				</tr>
				<tr>
					<td style="text-align:center;">
						<br/>
						<label id="FWhat_percent">0.00</label>%
					</td>
					<td style="text-align:center;">
						<br/>
						<label id="FWhy_percent">0.00</label>%
					</td>
					<td style="text-align:center;">
						<br/>
						<label id="FHow_percent">0.00</label>%
					</td>
					<td style="text-align:center;">
						<br/>
						<label id="FIf_percent">0.00</label>%
					</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:center;">
						</br></br>
	  					<a class="btn btn-success" onclick="saveRecordData('4mat')"><b>保存数据</b></a>
	  					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  					<a class="btn btn-warning" onclick="drawRecordData('4mat', '${ctx}', '${course.id}')"><b>绘制图表</b></a>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<br/>
						<canvas id="chart_4mat" width="500" height="400" style="margin:0 auto;"></canvas>
					</td>
				</tr>
			</table>
		</div>
		<div class="control-group" style="margin-top: 20px;" id="question_datagroup">
			<table style="width:100%;">
				<tr><td colspan="5" class="table-header">问题类型</td></tr>
				<tr>
					<td>
						<div class="form-group">
				    		<label>管理性问题：&nbsp;&nbsp;</label>
				    		<a class="btn btn-primary" onclick="dateRecord('question','+','QTGuanli')">+</a>
				   		 	<input type="text" class="form-control data-input-control" value="${question.glxwt}" id="QTGuanli">
				   		 	<a class="btn btn-primary" onclick="dateRecord('question','-','QTGuanli')">-</a>
				  		</div>
					</td>
					<td>
						<div class="form-group">
				    		<label>记忆性问题：&nbsp;&nbsp;</label>
				    		<a class="btn btn-primary" onclick="dateRecord('question','+','QTJiyi')">+</a>
				    		<input type="text" class="form-control data-input-control" value="${question.jyxwt}" id="QTJiyi">
				    		<a class="btn btn-primary" onclick="dateRecord('question','-','QTJiyi')">-</a>
				 		</div>
					</td>
					<td>
						<div class="form-group">
				   			<label>推理性问题：&nbsp;&nbsp;</label>
				   			<a class="btn btn-primary" onclick="dateRecord('question','+','QTTuili')">+</a>
				  			<input type="text" class="form-control data-input-control" value="${question.tlxwt}" id="QTTuili">
				  			<a class="btn btn-primary" onclick="dateRecord('question','-','QTTuili')">-</a>
						</div>
					</td>
					<td>
						<div class="form-group">
							<label>创造性问题：&nbsp;&nbsp;</label>
							<a class="btn btn-primary" onclick="dateRecord('question','+','QTChuang')">+</a>
				    		<input type="text" class="form-control data-input-control" value="${question.czxwt}" id="QTChuang">
				    		<a class="btn btn-primary" onclick="dateRecord('question','-','QTChuang')">-</a>
				  		</div>
					</td>
					<td>
						<div class="form-group">
							<label>批判性问题：&nbsp;&nbsp;</label>
							<a class="btn btn-primary" onclick="dateRecord('question','+','QTPipan')">+</a>
				    		<input type="text" class="form-control data-input-control" value="${question.ppxwt}" id="QTPipan">
				    		<a class="btn btn-primary" onclick="dateRecord('question','-','QTPipan')">-</a>
				  		</div>
					</td>
				</tr>
				<tr>
					<td style="text-align:center;">
						<label id="QTGuanli_percent">0.00</label>%
					</td>
					<td style="text-align:center;">
						<label id="QTJiyi_percent">0.00</label>%
					</td>
					<td style="text-align:center;">
						<label id="QTTuili_percent">0.00</label>%
					</td>
					<td style="text-align:center;">
						<label id="QTChuang_percent">0.00</label>%
					</td>
					<td style="text-align:center;">
						<label id="QTPipan_percent">0.00</label>%
					</td>
				</tr>
			</table>
			<table style="width:100%;">
				<tr><td colspan="5" class="table-header">挑选回答方式</td></tr>
				<tr>
					<td>
						<div class="form-group">
				    		<label>提问前先点名：&nbsp;&nbsp;</label>
				    		<a class="btn btn-primary" onclick="dateRecord('question','+','QSDian')">+</a>
				   		 	<input type="text" class="form-control data-input-control" value="${question.dm}" id="QSDian">
				   		 	<a class="btn btn-primary" onclick="dateRecord('question','-','QSDian')">-</a>
				  		</div>
					</td>
					<td>
						<div class="form-group">
				    		<label>让学生齐答：&nbsp;&nbsp;</label>
				    		<a class="btn btn-primary" onclick="dateRecord('question','+','QSQida')">+</a>
				    		<input type="text" class="form-control data-input-control" value="${question.rxsqd}" id="QSQida">
				    		<a class="btn btn-primary" onclick="dateRecord('question','-','QSQida')">-</a>
				 		</div>
					</td>
					<td>
						<div class="form-group">
				   			<label>叫举手者答：&nbsp;&nbsp;</label>
				   			<a class="btn btn-primary" onclick="dateRecord('question','+','QSJushou')">+</a>
				  			<input type="text" class="form-control data-input-control" value="${question.jjszd}" id="QSJushou">
				  			<a class="btn btn-primary" onclick="dateRecord('question','-','QSJushou')">-</a>
						</div>
					</td>
					<td>
						<div class="form-group">
							<label>叫未举手者答：&nbsp;&nbsp;</label>
							<a class="btn btn-primary" onclick="dateRecord('question','+','QSWeiju')">+</a>
				    		<input type="text" class="form-control data-input-control" value="${question.jwjszd}" id="QSWeiju">
				    		<a class="btn btn-primary" onclick="dateRecord('question','-','QSWeiju')">-</a>
				  		</div>
					</td>
					<td>
						<div class="form-group">
							<label>鼓励学生提出问题：&nbsp;&nbsp;</label>
							<a class="btn btn-primary" onclick="dateRecord('question','+','QSGuli')">+</a>
				    		<input type="text" class="form-control data-input-control" value="${question.glxxtcwt}" id="QSGuli">
				    		<a class="btn btn-primary" onclick="dateRecord('question','-','QSGuli')">-</a>
				  		</div>
					</td>
				</tr>
				<tr>
					<td style="text-align:center;">
						<label id="QSDian_percent">0.00</label>%
					</td>
					<td style="text-align:center;">
						<label id="QSQida_percent">0.00</label>%
					</td>
					<td style="text-align:center;">
						<label id="QSJushou_percent">0.00</label>%
					</td>
					<td style="text-align:center;">
						<label id="QSWeiju_percent">0.00</label>%
					</td>
					<td style="text-align:center;">
						<label id="QSGuli_percent">0.00</label>%
					</td>
				</tr>
			</table>
			<table style="width:100%;">
				<tr><td colspan="4" class="table-header">学生回答方式</td></tr>
				<tr>
					<td>
						<div class="form-group">
				    		<label>集体齐答：&nbsp;&nbsp;</label>
				    		<a class="btn btn-primary" onclick="dateRecord('question','+','QAQida')">+</a>
				   		 	<input type="text" class="form-control data-input-control" value="${question.jtqd}" id="QAQida">
				   		 	<a class="btn btn-primary" onclick="dateRecord('question','-','QAQida')">-</a>
				  		</div>
					</td>
					<td>
						<div class="form-group">
				    		<label>讨论后汇报：&nbsp;&nbsp;</label>
				    		<a class="btn btn-primary" onclick="dateRecord('question','+','QAHuibao')">+</a>
				    		<input type="text" class="form-control data-input-control" value="${question.tlhhb}" id="QAHuibao">
				    		<a class="btn btn-primary" onclick="dateRecord('question','-','QAHuibao')">-</a>
				 		</div>
					</td>
					<td>
						<div class="form-group">
				   			<label>个别回答：&nbsp;&nbsp;</label>
				   			<a class="btn btn-primary" onclick="dateRecord('question','+','QAGebie')">+</a>
				  			<input type="text" class="form-control data-input-control" value="${question.gbhd}" id="QAGebie">
				  			<a class="btn btn-primary" onclick="dateRecord('question','-','QAGebie')">-</a>
						</div>
					</td>
					<td>
						<div class="form-group">
							<label>自由答：&nbsp;&nbsp;</label>
							<a class="btn btn-primary" onclick="dateRecord('question','+','QAZiyou')">+</a>
				    		<input type="text" class="form-control data-input-control" value="${question.zyd}" id="QAZiyou">
				    		<a class="btn btn-primary" onclick="dateRecord('question','-','QAZiyou')">-</a>
				  		</div>
					</td>
				</tr>
				<tr>
					<td style="text-align:center;">
						<label id="QAQida_percent">0.00</label>%
					</td>
					<td style="text-align:center;">
						<label id="QAHuibao_percent">0.00</label>%
					</td>
					<td style="text-align:center;">
						<label id="QAGebie_percent">0.00</label>%
					</td>
					<td style="text-align:center;">
						<label id="QAZiyou_percent">0.00</label>%
					</td>
				</tr>
			</table>
			<table style="width:100%;">
				<tr><td colspan="5" class="table-header">学生回答类型</td></tr>
				<tr>
					<td>
						<div class="form-group">
				    		<label>无回答：&nbsp;&nbsp;</label>
				    		<a class="btn btn-primary" onclick="dateRecord('question','+','QATWu')">+</a>
				   		 	<input type="text" class="form-control data-input-control" value="${question.whd}" id="QATWu">
				   		 	<a class="btn btn-primary" onclick="dateRecord('question','-','QATWu')">-</a>
				  		</div>
					</td>
					<td>
						<div class="form-group">
				    		<label>机械判断是否：&nbsp;&nbsp;</label>
				    		<a class="btn btn-primary" onclick="dateRecord('question','+','QATJixie')">+</a>
				   		 	<input type="text" class="form-control data-input-control" value="${question.pdsf}" id="QATJixie">
				   		 	<a class="btn btn-primary" onclick="dateRecord('question','-','QATJixie')">-</a>
				  		</div>
					</td>
					<td>
						<div class="form-group">
				    		<label>认知记忆性回答：&nbsp;&nbsp;</label>
				    		<a class="btn btn-primary" onclick="dateRecord('question','+','QATRenzhi')">+</a>
				    		<input type="text" class="form-control data-input-control" value="${question.rzjyxhd}" id="QATRenzhi">
				    		<a class="btn btn-primary" onclick="dateRecord('question','-','QATRenzhi')">-</a>
				 		</div>
					</td>
					<td>
						<div class="form-group">
				   			<label>推理性回答：&nbsp;&nbsp;</label>
				   			<a class="btn btn-primary" onclick="dateRecord('question','+','QATTuili')">+</a>
				  			<input type="text" class="form-control data-input-control" value="${question.tlxhd}" id="QATTuili">
				  			<a class="btn btn-primary" onclick="dateRecord('question','-','QATTuili')">-</a>
						</div>
					</td>
					<td>
						<div class="form-group">
							<label>创造评价性回答：&nbsp;&nbsp;</label>
							<a class="btn btn-primary" onclick="dateRecord('question','+','QATChuang')">+</a>
				    		<input type="text" class="form-control data-input-control" value="${question.czpjxhd}" id="QATChuang">
				    		<a class="btn btn-primary" onclick="dateRecord('question','-','QATChuang')">-</a>
				  		</div>
					</td>
				</tr>
				<tr>
					<td style="text-align:center;">
						<label id="QATWu_percent">0.00</label>%
					</td>
					<td style="text-align:center;">
						<label id="QATJixie_percent">0.00</label>%
					</td>
					<td style="text-align:center;">
						<label id="QATRenzhi_percent">0.00</label>%
					</td>
					<td style="text-align:center;">
						<label id="QATTuili_percent">0.00</label>%
					</td>
					<td style="text-align:center;">
						<label id="QATChuang_percent">0.00</label>%
					</td>
				</tr>
				<tr>
					<td colspan="5" style="text-align:center;">
						<br/><br/>
						<a class="btn btn-success" onclick="saveRecordData('question')"><b>保存数据</b></a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  					<a class="btn btn-warning" onclick="drawRecordData('question', '${ctx}', '${course.id}')"><b>绘制图表</b></a>
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<br/>
						<canvas id="chart_question_1" width="500" height="400" style="margin:0 auto;"></canvas>
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<br/>
						<canvas id="chart_question_2" width="500" height="400" style="margin:0 auto;"></canvas>
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<br/>
						<canvas id="chart_question_3" width="500" height="400" style="margin:0 auto;"></canvas>
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<br/>
						<canvas id="chart_question_4" width="500" height="400" style="margin:0 auto;"></canvas>
					</td>
				</tr>
			</table>
		</div>
		
		<div class="control-group" style="margin-top: 20px;" id="response_datagroup">
			<table style="width:100%;">
				<tr><td colspan="5" class="table-header">回应方式</td></tr>
				<tr>
					<td>
						<div class="form-group">
				    		<label>言语回应：&nbsp;&nbsp;</label>
				    		<a class="btn btn-primary" onclick="dateRecord('response','+','RTTalk')">+</a>
				   		 	<input type="text" class="form-control data-input-control" value="${resp.yyhy}" id="RTTalk">
				   		 	<a class="btn btn-primary" onclick="dateRecord('response','-','RTTalk')">-</a>
				  		</div>
					</td>
					<td>
						<div class="form-group">
				    		<label>非言语回应：&nbsp;&nbsp;</label>
				    		<a class="btn btn-primary" onclick="dateRecord('response','+','RTAction')">+</a>
				    		<input type="text" class="form-control data-input-control" value="${resp.fyyhy}" id="RTAction">
				    		<a class="btn btn-primary" onclick="dateRecord('response','-','RTAction')">-</a>
				 		</div>
					</td>
				</tr>
				<tr>
					<td style="text-align:center;">
						<label id="RTTalk_percent">0.00</label>%
					</td>
					<td style="text-align:center;">
						<label id="RTAction_percent">0.00</label>%
					</td>
				</tr>
			</table>
			<table style="width:100%;">
				<tr><td colspan="5" class="table-header">回应态度</td></tr>
				<tr>
					<td>
						<div class="form-group">
				    		<label>肯定回应：&nbsp;&nbsp;</label>
				    		<a class="btn btn-primary" onclick="dateRecord('response','+','RAYes')">+</a>
				   		 	<input type="text" class="form-control data-input-control" value="${resp.kdhy}" id="RAYes">
				   		 	<a class="btn btn-primary" onclick="dateRecord('response','-','RAYes')">-</a>
				  		</div>
					</td>
					<td>
						<div class="form-group">
				    		<label>否定回应：&nbsp;&nbsp;</label>
				    		<a class="btn btn-primary" onclick="dateRecord('response','+','RANo')">+</a>
				   		 	<input type="text" class="form-control data-input-control" value="${resp.fdhy}" id="RANo">
				   		 	<a class="btn btn-primary" onclick="dateRecord('response','-','RANo')">-</a>
				  		</div>
					</td>
					<td>
						<div class="form-group">
				    		<label>无回应：&nbsp;&nbsp;</label>
				    		<a class="btn btn-primary" onclick="dateRecord('response','+','RANone')">+</a>
				    		<input type="text" class="form-control data-input-control" value="${resp.why}" id="RANone">
				    		<a class="btn btn-primary" onclick="dateRecord('response','-','RANone')">-</a>
				 		</div>
					</td>
					<td>
						<div class="form-group">
				   			<label>打断学生回答或代答：&nbsp;&nbsp;</label>
				   			<a class="btn btn-primary" onclick="dateRecord('response','+','RABreak')">+</a>
				  			<input type="text" class="form-control data-input-control" value="${resp.ddxshdd}" id="RABreak">
				  			<a class="btn btn-primary" onclick="dateRecord('response','-','RABreak')">-</a>
						</div>
					</td>
					<td>
						<div class="form-group">
							<label>重复学生回答并解释：&nbsp;&nbsp;</label>
							<a class="btn btn-primary" onclick="dateRecord('response','+','RARepeat')">+</a>
				    		<input type="text" class="form-control data-input-control" value="${resp.cfhdhjs}" id="RARepeat">
				    		<a class="btn btn-primary" onclick="dateRecord('response','-','RARepeat')">-</a>
				  		</div>
					</td>
				</tr>
				<tr>
					<td style="text-align:center;">
						<label id="RAYes_percent">0.00</label>%
					</td>
					<td style="text-align:center;">
						<label id="RANo_percent">0.00</label>%
					</td>
					<td style="text-align:center;">
						<label id="RANone_percent">0.00</label>%
					</td>
					<td style="text-align:center;">
						<label id="RABreak_percent">0.00</label>%
					</td>
					<td style="text-align:center;">
						<label id="RARepeat_percent">0.00</label>%
					</td>
				</tr>
				<tr>
					<td colspan="5" style="text-align:center;">
						<br/><br/>
						<a class="btn btn-success" onclick="saveRecordData('response')"><b>保存数据</b></a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  					<a class="btn btn-warning" onclick="drawRecordData('response', '${ctx}', '${course.id}')"><b>绘制图表</b></a>
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<br/>
						<canvas id="chart_response_1" width="500" height="400" style="margin:0 auto;"></canvas>
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<br/>
						<canvas id="chart_response_2" width="500" height="400" style="margin:0 auto;"></canvas>
					</td>
				</tr>
			</table>
		</div>
		
		<div class="control-group" style="margin-top: 20px;" id="dialogue_datagroup">
			<table style="width:100%;">
				<tr>
					<td>
						<div class="form-group">
				    		<label>深度一：&nbsp;&nbsp;</label>
				    		<a class="btn btn-primary" onclick="dateRecord('dialogue','+','DLevel1')">+</a>
				   		 	<input type="text" class="form-control data-input-control" value="${dialogue.sdy}" id="DLevel1">
				   		 	<a class="btn btn-primary" onclick="dateRecord('dialogue','-','DLevel1')">-</a>
				  		</div>
					</td>
					<td>
						<div class="form-group">
				    		<label>深度二：&nbsp;&nbsp;</label>
				    		<a class="btn btn-primary" onclick="dateRecord('dialogue','+','DLevel2')">+</a>
				    		<input type="text" class="form-control data-input-control" value="${dialogue.sder}" id="DLevel2">
				    		<a class="btn btn-primary" onclick="dateRecord('dialogue','-','DLevel2')">-</a>
				 		</div>
					</td>
					<td>
						<div class="form-group">
				   			<label>深度三：&nbsp;&nbsp;</label>
				   			<a class="btn btn-primary" onclick="dateRecord('dialogue','+','DLevel3')">+</a>
				  			<input type="text" class="form-control data-input-control" value="${dialogue.sds}" id="DLevel3">
				  			<a class="btn btn-primary" onclick="dateRecord('dialogue','-','DLevel3')">-</a>
						</div>
					</td>
					<td>
						<div class="form-group">
							<label>深度四：&nbsp;&nbsp;</label>
							<a class="btn btn-primary" onclick="dateRecord('dialogue','+','DLevel4')">+</a>
				    		<input type="text" class="form-control data-input-control" value="${dialogue.sdsi}" id="DLevel4">
				    		<a class="btn btn-primary" onclick="dateRecord('dialogue','-','DLevel4')">-</a>
				  		</div>
					</td>
					<td>
						<div class="form-group">
							<label>深度五：&nbsp;&nbsp;</label>
							<a class="btn btn-primary" onclick="dateRecord('dialogue','+','DLevel5')">+</a>
				    		<input type="text" class="form-control data-input-control" value="${dialogue.sdw}" id="DLevel5">
				    		<a class="btn btn-primary" onclick="dateRecord('dialogue','-','DLevel5')">-</a>
				  		</div>
					</td>
				</tr>
				<tr>
					<td style="text-align:center;">
						<br/>
						<label id="DLevel1_percent">0.00</label>%
					</td>
					<td style="text-align:center;">
						<br/>
						<label id="DLevel2_percent">0.00</label>%
					</td>
					<td style="text-align:center;">
						<br/>
						<label id="DLevel3_percent">0.00</label>%
					</td>
					<td style="text-align:center;">
						<br/>
						<label id="DLevel4_percent">0.00</label>%
					</td>
					<td style="text-align:center;">
						<br/>
						<label id="DLevel5_percent">0.00</label>%
					</td>
				</tr>
				<tr>
					<td colspan="5" style="text-align:center;">
						</br></br>
						<label><input type="checkbox" id="autoDlgReset"/>自动深度处理</label>
	  					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  					<a class="btn btn-success" onclick="saveRecordData('dialogue')"><b>保存数据</b></a>
	  					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  					<a class="btn btn-warning" onclick="drawRecordData('dialogue', '${ctx}', '${course.id}')"><b>绘制图表</b></a>
					</td>
					<tr>
					<td colspan="5">
						<br/>
						<canvas id="chart_dialogue" width="500" height="400" style="margin:0 auto;"></canvas>
					</td>
				</tr>
				</tr>
			</table>
		</div>
		
		<div class="control-group" style="margin-top: 20px;" id="st_datagroup">
			<table style="width:100%;">
				<tr>
					<td style="text-align:center;">
						间隔：<input type="text" class="form-control data-input-control" id="sttimer" value="${st.sttimer}"/>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a id="btns" class="btn btn-primary" onclick="dateSTRecord('s')">S 行为</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a id="btnt" class="btn btn-primary" onclick="dateSTRecord('t')">T 行为</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						时长：<label id="sttime">0秒</label>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a class="btn btn-success" onclick="saveRecordData('st')"><b>保存数据</b></a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a class="btn btn-success" onclick="stopSTRecord()"><b>结束采样</b></a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  					<a class="btn btn-warning" onclick="drawRecordData('st', '${ctx}', '${course.id}')"><b>绘制图表</b></a>
					</td>
				</tr>
			</table>
			<br/><br/>
			<div id="stdatas"></div>
			<div style="clear:both;"></div>
			<table style="width:100%;">
				<tr>
					<td>
						<br/>
						<canvas id="chart_rtch" width="600" height="400" style="margin:0 auto;"></canvas>
					</td>
				</tr>
				<tr>
					<td style="text-align:center;">
						<br/>
						<span id="stregular"></span>
					</td>
				</tr>
				<tr>
					<td>
						<br/>
						<canvas id="chart_rtrs" width="700" height="500" style="margin:0 auto;"></canvas>
					</td>
				</tr>
			</table>
		</div>
	</form:form>
</body>
</html>