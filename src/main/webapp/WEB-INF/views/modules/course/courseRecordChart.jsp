<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>课程图表</title>
	<title>${course.teachername} - ${course.coursename}</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/modules/course/courserecord.js" type="text/javascript"></script>
	<script>
		$(function(){
			drawAllRecordData('${ctx}', '${course.id}');
		});
	</script>
</head>
<body>
	<table style="width:100%;">
		<tr>
             <td style="text-align:center;">
                 <br/>
                 <h3>${course.coursename} - ${course.teachername}</h3> 
             </td>
        </tr>
		<tr>
			<td>
				<br/>
				<canvas id="chart_rtrs" width="700" height="500" style="margin:0 auto;"></canvas>
			</td>
		</tr>
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
				<canvas id="chart_question_1" width="500" height="400" style="margin:0 auto;"></canvas>
			</td>
		</tr>
		<tr>
			<td>
				<br/>
				<canvas id="chart_question_2" width="500" height="400" style="margin:0 auto;"></canvas>
			</td>
		</tr>
		<tr>
			<td>
				<br/>
				<canvas id="chart_question_3" width="500" height="400" style="margin:0 auto;"></canvas>
			</td>
		</tr>
		<tr>
			<td>
				<br/>
				<canvas id="chart_question_4" width="500" height="400" style="margin:0 auto;"></canvas>
			</td>
		</tr>
		
		<tr>
			<td>
				<br/>
				<canvas id="chart_response_1" width="500" height="400" style="margin:0 auto;"></canvas>
			</td>
		</tr>
		<tr>
			<td>
				<br/>
				<canvas id="chart_response_2" width="500" height="400" style="margin:0 auto;"></canvas>
			</td>
		</tr>
		
		<tr>
			<td>
				<br/>
				<canvas id="chart_4mat" width="500" height="400" style="margin:0 auto;"></canvas>
			</td>
		</tr>
		
		<tr>
			<td colspan="5">
				<br/>
				<canvas id="chart_dialogue" width="500" height="400" style="margin:0 auto;"></canvas>
			</td>
		</tr>
	</table>
</body>
</html>