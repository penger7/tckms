function drawAllRecordData(ctxurl, historycourseid) {
	var curajax = $.ajax({
		　　url: ctxurl+'/historycourse/historycourse/regular',
		　　timeout : 5000,
		　　type : 'get',
		　　data : {'id':historycourseid},
		　　dataType : 'json',
		　　success: function(data) {
				if (data.result == "success") {
					doDrawRecordData('4mat', data);
					doDrawRecordData('question', data);
					doDrawRecordData('response', data);
					doDrawRecordData('dialogue', data);
					doDrawRecordData('st', data);
				} else {
					var priority = 'danger';
					var title    = '错误';
					var message  = '教学类型尚未确定，暂时无法获取常模数据！';
					
					$.toaster({ priority : priority, title : title, message : message , settings: {timeout: 3000}});
				}
		　　},
		　　complete : function(XMLHttpRequest,status){
		　　　　if(status=='timeout') {
					curajax.abort();
					var priority = 'danger';
					var title    = '错误';
					var message  = '获取常模超时，请检查网络配置或稍后再试!';
					
					$.toaster({ priority : priority, title : title, message : message , settings: {timeout: 3000}});
		　　　　}
		　　}
		});
}

function drawRecordData(datatype, ctxurl, courseid) {
	var curajax = $.ajax({
	　　url: ctxurl+'/historycourse/historycourse/regular',
	　　timeout : 5000,
	　　type : 'get',
	　　data : {'id':courseid},
	　　dataType : 'json',
	　　success: function(data) {
			if (data.result == "success")
				doDrawRecordData(datatype, data);
			else {
				var priority = 'danger';
				var title    = '错误';
				var message  = '教学类型尚未确定，暂时无法获取常模数据！';
				
				$.toaster({ priority : priority, title : title, message : message , settings: {timeout: 3000}});
			}
	　　},
	　　complete : function(XMLHttpRequest,status){
	　　　　if(status=='timeout') {
				curajax.abort();
				var priority = 'danger';
				var title    = '错误';
				var message  = '获取常模超时，请检查网络配置或稍后再试!';
				
				$.toaster({ priority : priority, title : title, message : message , settings: {timeout: 3000}});
	　　　　}
	　　}
	});
}

var chart4mat = null;
var chartquestion1 = null;
var chartquestion2 = null;
var chartquestion3 = null;
var chartquestion4 = null;
var chartresponse1 = null;
var chartresponse2 = null;
var chartdialogue = null;
var chartrtrs = null;
var chartrtch = null;
function doDrawRecordData(datatype, data) {
	var rp = data.regular;
	Chart.defaults.global.tooltips.enabled = false;
	Chart.defaults.global.defaultFontColor = "#000";
	Chart.defaults.global.defaultFontSize = 14;
	Chart.plugins.register({
		beforeDraw: function(chartInstance) {
		  	var ctx = chartInstance.chart.ctx;
		    ctx.fillStyle = "white";
		    ctx.fillRect(0, 0, chartInstance.chart.width, chartInstance.chart.height);
		}
	});
	if (datatype == "4mat") {
		var _4mat = data._4mat;
		var fw = parseInt(_4mat.sh);
		var fy = parseInt(_4mat.wh);
		var fh = parseInt(_4mat.ruh);
		var fi = parseInt(_4mat.ruoh);
		
		var ft = fw + fy + fh + fi;
		if (ft <= 0)
			ft = 1;
		
		if (chart4mat == null) {
			var cms = [parseFloat(rp.sh),parseFloat(rp.wh),parseFloat(rp.ruh),parseFloat(rp.ruoh)];
			var ctx = $("#chart_4mat").get(0).getContext("2d");
			var datas = {
				labels : ["是何","为何","如何","若何"],
				datasets : [
				    {
						label: "现场数据",
			            backgroundColor: [
			                'rgba(81, 130, 187, 1)',
			                'rgba(81, 130, 187, 1)',
			                'rgba(81, 130, 187, 1)',
			                'rgba(81, 130, 187, 1)'
			            ],
						data : [(fw/ft*100).toFixed(2), (fy/ft*100).toFixed(2), (fh/ft*100).toFixed(2), (fi/ft*100).toFixed(2)]
					},
					{
						label: "常模数据",
			            backgroundColor: [
			                'rgba(191, 81, 79, 1)',
			                'rgba(191, 81, 79, 1)',
			                'rgba(191, 81, 79, 1)',
			                'rgba(191, 81, 79, 1)'
			            ],
						data : [(cms[0]*100).toFixed(2),(cms[1]*100).toFixed(2),(cms[2]*100).toFixed(2),(cms[3]*100).toFixed(2)]
					}
				]
			};
			
			chart4mat = new Chart(ctx, {
                type: 'bar',
                data: datas,
                options: {
                    // Elements options apply to all of the options unless overridden in a dataset
                    // In this case, we are setting the border of each bar to be 2px wide and green
                    elements: {
                        rectangle: {
                            borderWidth: 0,
                            borderColor: 'rgb(0, 255, 0)',
                            borderSkipped: 'bottom'
                        }
                    },
                    scales: {
                        xAxes: [{
                        	beginAtZero: true,
                        	min: 0,
                        	suggestedMin: 0
                        }]
                    },
                    responsive: false,
                    title: {
                        display: true,
                        text: '四何问题'
                    },
                    legend: {
                        display: true,
                        position: 'bottom'
                    },
                    animation: {
                    	onComplete: function () {
                            var chartInstance = this.chart;
                            var ctx = chartInstance.ctx;
                            ctx.textAlign = "center";
                            Chart.helpers.each(this.data.datasets.forEach(function (dataset, i) {
                                var meta = chartInstance.controller.getDatasetMeta(i);
                                Chart.helpers.each(meta.data.forEach(function (bar, index) {
                                    ctx.fillText(dataset.data[index], bar._model.x, bar._model.y - 15);
                                }),this)
                            }),this);
                        }
                    }
                }});
		}
		
		var cms = [parseFloat(rp.sh),parseFloat(rp.wh),parseFloat(rp.ruh),parseFloat(rp.ruoh)];
		chart4mat.data.datasets[0].data = [(fw/ft*100).toFixed(2), (fy/ft*100).toFixed(2), (fh/ft*100).toFixed(2), (fi/ft*100).toFixed(2)];
		chart4mat.data.datasets[1].data = [(cms[0]*100).toFixed(2),(cms[1]*100).toFixed(2),(cms[2]*100).toFixed(2),(cms[3]*100).toFixed(2)];
		
		chart4mat.update();
	} else if (datatype == "question") {
		var question = data.question;
		var qtg = parseInt(question.glxwt);
		var qtj = parseInt(question.jyxwt);
		var qtt = parseInt(question.tlxwt);
		var qtc = parseInt(question.czxwt);
		var qtp = parseInt(question.ppxwt);
		
		var qt_t = qtg + qtj + qtt + qtc + qtp;
		if (qt_t <= 0) 
			qt_t = 1;
		//
		var qsd = parseInt(question.dm);
		var qsq = parseInt(question.rxsqd);
		var qsj = parseInt(question.jjszd);
		var qsw = parseInt(question.jwjszd);
		var qsg = parseInt(question.glxxtcwt);
		
		var qs_t = qsd + qsq + qsj + qsw + qsg;
		if (qs_t <= 0)
			qs_t = 1;
		//
		var qaq = parseInt(question.jtqd);
		var qah = parseInt(question.tlhhb);
		var qag = parseInt(question.gbhd);
		var qaz = parseInt(question.zyd);
		
		var qa_t = qaq + qah + qag + qaz;
		if (qa_t <= 0)
			qa_t = 1;
		//
		var qatw = parseInt(question.whd);
		var qatj = parseInt(question.pdsf);
		var qatr = parseInt(question.rzjyxhd);
		var qatt = parseInt(question.tlxhd);
		var qatc = parseInt(question.czpjxhd);
		
		var qat_t = qatw + qatj + qatr + qatt + qatc;
		if (qat_t <= 0)
			qat_t = 1;
		
		var cms = [parseFloat(rp.glxwt),parseFloat(rp.jyxwt),parseFloat(rp.tlxwt),parseFloat(rp.czxwt),parseFloat(rp.ppxwt),
		           parseFloat(rp.dm),parseFloat(rp.rxsqd),parseFloat(rp.jjszd),parseFloat(rp.jwjszd),parseFloat(rp.glxxtcwt),
		           parseFloat(rp.jtqd),parseFloat(rp.tlhhb),parseFloat(rp.gbhd),parseFloat(rp.zyd),
		           parseFloat(rp.whd),parseFloat(rp.pdsf),parseFloat(rp.rzjyxhd),parseFloat(rp.tlxhd),parseFloat(rp.czpjxhd)];
		if (chartquestion1 == null) {
			var ctx1 = $("#chart_question_1").get(0).getContext("2d");
			var datas1 = {
				labels : ["常规管理性问题","记忆性问题","推理性问题","创造性问题","批判性问题"],
				datasets : [
				    {
						label: "现场数据",
			            backgroundColor: [
			                'rgba(81, 130, 187, 1)',
			                'rgba(81, 130, 187, 1)',
			                'rgba(81, 130, 187, 1)',
			                'rgba(81, 130, 187, 1)',
			                'rgba(81, 130, 187, 1)'
			            ],
			            data : [(qtg/qt_t*100).toFixed(2), (qtj/qt_t*100).toFixed(2), (qtt/qt_t*100).toFixed(2), (qtc/qt_t*100).toFixed(2), (qtp/qt_t*100).toFixed(2)]
					},
					{
						label: "常模数据",
			            backgroundColor: [
			                'rgba(191, 81, 79, 1)',
			                'rgba(191, 81, 79, 1)',
			                'rgba(191, 81, 79, 1)',
			                'rgba(191, 81, 79, 1)',
			                'rgba(191, 81, 79, 1)'
			            ],
						data : [(cms[0]*100).toFixed(2),(cms[1]*100).toFixed(2),(cms[2]*100).toFixed(2),(cms[3]*100).toFixed(2),(cms[4]*100).toFixed(2)]
					}
				]
			};
			
			chartquestion1 = new Chart(ctx1, {
                type: 'bar',
                data: datas1,
                options: {
                    elements: {
                        rectangle: {
                            borderWidth: 0,
                            borderColor: 'rgb(0, 255, 0)',
                            borderSkipped: 'bottom'
                        }
                    },
                    scales: {
                        xAxes: [{
                        	beginAtZero: true,
                        	min: 0,
                        	suggestedMin: 0
                        }]
                    },
                    responsive: false,
                    title: {
                        display: true,
                        text: '问题类型'
                    },
                    legend: {
                        display: true,
                        position: 'bottom'
                    },
                    animation: {
                    	onComplete: function () {
                            var chartInstance = this.chart;
                            var ctx = chartInstance.ctx;
                            ctx.textAlign = "center";
                            Chart.helpers.each(this.data.datasets.forEach(function (dataset, i) {
                                var meta = chartInstance.controller.getDatasetMeta(i);
                                Chart.helpers.each(meta.data.forEach(function (bar, index) {
                                    ctx.fillText(dataset.data[index], bar._model.x, bar._model.y - 15);
                                }),this)
                            }),this);
                        }
                    }
                }});
			
			var ctx2 = $("#chart_question_2").get(0).getContext("2d");
			var datas2 = {
				labels : ["点名提问","让学生齐答","叫举手者答","叫未举手者答","鼓励学生提出问题"],
				datasets : [
				    {
						label: "现场数据",
			            backgroundColor: [
			                'rgba(81, 130, 187, 1)',
			                'rgba(81, 130, 187, 1)',
			                'rgba(81, 130, 187, 1)',
			                'rgba(81, 130, 187, 1)',
			                'rgba(81, 130, 187, 1)'
			            ],
			            data : [(qsd/qs_t*100).toFixed(2), (qsq/qs_t*100).toFixed(2), (qsj/qs_t*100).toFixed(2), (qsw/qs_t*100).toFixed(2), (qsg/qs_t*100).toFixed(2)]
					},
					{
						label: "常模数据",
			            backgroundColor: [
			                'rgba(191, 81, 79, 1)',
			                'rgba(191, 81, 79, 1)',
			                'rgba(191, 81, 79, 1)',
			                'rgba(191, 81, 79, 1)',
			                'rgba(191, 81, 79, 1)'
			            ],
						data : [(cms[5]*100).toFixed(2),(cms[6]*100).toFixed(2),(cms[7]*100).toFixed(2),(cms[8]*100).toFixed(2),(cms[9]*100).toFixed(2)]
					}
				]
			};
			
			chartquestion2 = new Chart(ctx2, {
                type: 'bar',
                data: datas2,
                options: {
                    elements: {
                        rectangle: {
                            borderWidth: 0,
                            borderColor: 'rgb(0, 255, 0)',
                            borderSkipped: 'bottom'
                        }
                    },
                    scales: {
                        xAxes: [{
                        	beginAtZero: true,
                        	min: 0,
                        	suggestedMin: 0
                        }]
                    },
                    responsive: false,
                    title: {
                        display: true,
                        text: '挑选回答方式'
                    },
                    legend: {
                        display: true,
                        position: 'bottom'
                    },
                    animation: {
                    	onComplete: function () {
                            var chartInstance = this.chart;
                            var ctx = chartInstance.ctx;
                            ctx.textAlign = "center";
                            Chart.helpers.each(this.data.datasets.forEach(function (dataset, i) {
                                var meta = chartInstance.controller.getDatasetMeta(i);
                                Chart.helpers.each(meta.data.forEach(function (bar, index) {
                                    ctx.fillText(dataset.data[index], bar._model.x, bar._model.y - 15);
                                }),this)
                            }),this);
                        }
                    }
                }});
			
			var ctx3 = $("#chart_question_3").get(0).getContext("2d");
			var datas3 = {
				labels : ["集体齐答","讨论后汇报","个别回答","自由答"],
				datasets : [
				    {
						label: "现场数据",
			            backgroundColor: [
			                'rgba(81, 130, 187, 1)',
			                'rgba(81, 130, 187, 1)',
			                'rgba(81, 130, 187, 1)',
			                'rgba(81, 130, 187, 1)'
			            ],
			            data : [(qaq/qa_t*100).toFixed(2), (qah/qa_t*100).toFixed(2), (qag/qa_t*100).toFixed(2), (qaz/qa_t*100).toFixed(2)]
					},
					{
						label: "常模数据",
			            backgroundColor: [
			                'rgba(191, 81, 79, 1)',
			                'rgba(191, 81, 79, 1)',
			                'rgba(191, 81, 79, 1)',
			                'rgba(191, 81, 79, 1)'
			            ],
						data : [(cms[10]*100).toFixed(2),(cms[11]*100).toFixed(2),(cms[12]*100).toFixed(2),(cms[13]*100).toFixed(2)]
					}
				]
			};
			
			chartquestion3 = new Chart(ctx3, {
                type: 'bar',
                data: datas3,
                options: {
                    elements: {
                        rectangle: {
                            borderWidth: 0,
                            borderColor: 'rgb(0, 255, 0)',
                            borderSkipped: 'bottom'
                        }
                    },
                    scales: {
                        xAxes: [{
                        	beginAtZero: true,
                        	min: 0,
                        	suggestedMin: 0
                        }]
                    },
                    responsive: false,
                    title: {
                        display: true,
                        text: '学生回答方式'
                    },
                    legend: {
                        display: true,
                        position: 'bottom'
                    },
                    animation: {
                    	onComplete: function () {
                            var chartInstance = this.chart;
                            var ctx = chartInstance.ctx;
                            ctx.textAlign = "center";
                            Chart.helpers.each(this.data.datasets.forEach(function (dataset, i) {
                                var meta = chartInstance.controller.getDatasetMeta(i);
                                Chart.helpers.each(meta.data.forEach(function (bar, index) {
                                    ctx.fillText(dataset.data[index], bar._model.x, bar._model.y - 15);
                                }),this)
                            }),this);
                        }
                    }
                }});
			
			var ctx4 = $("#chart_question_4").get(0).getContext("2d");
			var datas4 = {
				labels : ["无回答","机械判断是否","认知记忆性回答","推理性回答","创造评价性回答"],
				datasets : [
				    {
						label: "现场数据",
			            backgroundColor: [
			                'rgba(81, 130, 187, 1)',
			                'rgba(81, 130, 187, 1)',
			                'rgba(81, 130, 187, 1)',
			                'rgba(81, 130, 187, 1)',
			                'rgba(81, 130, 187, 1)'
			            ],
			            data : [(qatw/qat_t*100).toFixed(2), (qatj/qat_t*100).toFixed(2), (qatr/qat_t*100).toFixed(2), (qatt/qat_t*100).toFixed(2), (qatc/qat_t*100).toFixed(2)]
					},
					{
						label: "常模数据",
			            backgroundColor: [
			                'rgba(191, 81, 79, 1)',
			                'rgba(191, 81, 79, 1)',
			                'rgba(191, 81, 79, 1)',
			                'rgba(191, 81, 79, 1)',
			                'rgba(191, 81, 79, 1)'
			            ],
						data : [(cms[14]*100).toFixed(2),(cms[15]*100).toFixed(2),(cms[16]*100).toFixed(2),(cms[17]*100).toFixed(2),(cms[18]*100).toFixed(2)]
					}
				]
			};
			
			chartquestion4 = new Chart(ctx4, {
                type: 'bar',
                data: datas4,
                options: {
                    elements: {
                        rectangle: {
                            borderWidth: 0,
                            borderColor: 'rgb(0, 255, 0)',
                            borderSkipped: 'bottom'
                        }
                    },
                    scales: {
                        xAxes: [{
                        	beginAtZero: true,
                        	min: 0,
                        	suggestedMin: 0
                        }]
                    },
                    responsive: false,
                    title: {
                        display: true,
                        text: '学生回答类型'
                    },
                    legend: {
                        display: true,
                        position: 'bottom'
                    },
                    animation: {
                    	onComplete: function () {
                            var chartInstance = this.chart;
                            var ctx = chartInstance.ctx;
                            ctx.textAlign = "center";
                            Chart.helpers.each(this.data.datasets.forEach(function (dataset, i) {
                                var meta = chartInstance.controller.getDatasetMeta(i);
                                Chart.helpers.each(meta.data.forEach(function (bar, index) {
                                    ctx.fillText(dataset.data[index], bar._model.x, bar._model.y - 15);
                                }),this)
                            }),this);
                        }
                    }
                }});
		}
		
		chartquestion1.data.datasets[0].data = [(qtg/qt_t*100).toFixed(2), (qtj/qt_t*100).toFixed(2), (qtt/qt_t*100).toFixed(2), (qtc/qt_t*100).toFixed(2), (qtp/qt_t*100).toFixed(2)];
		chartquestion1.data.datasets[1].data = [(cms[0]*100).toFixed(2),(cms[1]*100).toFixed(2),(cms[2]*100).toFixed(2),(cms[3]*100).toFixed(2),(cms[4]*100).toFixed(2)];
		
		chartquestion1.update();
		
		chartquestion2.data.datasets[0].data = [(qsd/qs_t*100).toFixed(2), (qsq/qs_t*100).toFixed(2), (qsj/qs_t*100).toFixed(2), (qsw/qs_t*100).toFixed(2), (qsg/qs_t*100).toFixed(2)];
		chartquestion2.data.datasets[1].data = [(cms[5]*100).toFixed(2),(cms[6]*100).toFixed(2),(cms[7]*100).toFixed(2),(cms[8]*100).toFixed(2),(cms[9]*100).toFixed(2)];
		
		chartquestion2.update();
		
		chartquestion3.data.datasets[0].data = [(qaq/qa_t*100).toFixed(2), (qah/qa_t*100).toFixed(2), (qag/qa_t*100).toFixed(2), (qaz/qa_t*100).toFixed(2)];
		chartquestion3.data.datasets[1].data = [(cms[10]*100).toFixed(2),(cms[11]*100).toFixed(2),(cms[12]*100).toFixed(2),(cms[13]*100).toFixed(2)];
		
		chartquestion3.update();
		
		chartquestion4.data.datasets[0].data = [(qatw/qat_t*100).toFixed(2), (qatj/qat_t*100).toFixed(2), (qatr/qat_t*100).toFixed(2), (qatt/qat_t*100).toFixed(2), (qatc/qat_t*100).toFixed(2)];
		chartquestion4.data.datasets[1].data = [(cms[14]*100).toFixed(2),(cms[15]*100).toFixed(2),(cms[16]*100).toFixed(2),(cms[17]*100).toFixed(2),(cms[18]*100).toFixed(2)];
		
		chartquestion4.update();
	} else if (datatype == "response") {
		var response = data.resp;
		var rt = parseInt(response.yyhy);
		var ra = parseInt(response.fyyhy);
		
		var rt_t = rt + ra;
		if (rt_t <= 0) 
			rt_t = 1;
		//
		var ray = parseInt(response.kdhy);
		var ran = parseInt(response.fdhy);
		var rann = parseInt(response.why);
		var rab = parseInt(response.ddxshdd);
		var rar = parseInt(response.cfhdhjs);
		
		var ra_t = ray + ran + rann + rab + rar;
		if (ra_t <= 0)
			ra_t = 1;
		
		var cms = [parseFloat(rp.yyhy),parseFloat(rp.fyyhy),
		           parseFloat(rp.kdhy),parseFloat(rp.fdhy),parseFloat(rp.why),parseFloat(rp.ddxshdd),parseFloat(rp.cfhdhjs)];
		if (chartresponse1 == null) {
			var ctx1 = $("#chart_response_1").get(0).getContext("2d");
			var datas1 = {
				labels : ["言语回应","非言语回应"],
				datasets : [
				    {
						label: "现场数据",
			            backgroundColor: [
			                'rgba(81, 130, 187, 1)',
			                'rgba(81, 130, 187, 1)'
			            ],
			            data : [(rt/rt_t*100).toFixed(2), (ra/rt_t*100).toFixed(2)]
					},
					{
						label: "常模数据",
			            backgroundColor: [
			                'rgba(191, 81, 79, 1)',
			                'rgba(191, 81, 79, 1)'
			            ],
						data : [(cms[0]*100).toFixed(2),(cms[1]*100).toFixed(2)]
					}
				]
			};
			
			chartresponse1 = new Chart(ctx1, {
                type: 'bar',
                data: datas1,
                options: {
                    elements: {
                        rectangle: {
                            borderWidth: 0,
                            borderColor: 'rgb(0, 255, 0)',
                            borderSkipped: 'bottom'
                        }
                    },
                    scales: {
                        xAxes: [{
                        	beginAtZero: true,
                        	min: 0,
                        	suggestedMin: 0
                        }]
                    },
                    responsive: false,
                    title: {
                        display: true,
                        text: '回应方式'
                    },
                    legend: {
                        display: true,
                        position: 'bottom'
                    },
                    animation: {
                    	onComplete: function () {
                            var chartInstance = this.chart;
                            var ctx = chartInstance.ctx;
                            ctx.textAlign = "center";
                            Chart.helpers.each(this.data.datasets.forEach(function (dataset, i) {
                                var meta = chartInstance.controller.getDatasetMeta(i);
                                Chart.helpers.each(meta.data.forEach(function (bar, index) {
                                    ctx.fillText(dataset.data[index], bar._model.x, bar._model.y - 15);
                                }),this)
                            }),this);
                        }
                    }
                }});
			
			var ctx2 = $("#chart_response_2").get(0).getContext("2d");
			var datas2 = {
				labels : ["肯定回应","否定回应","无回应","打断学生回答或代答","重复回答或解释"],
				datasets : [
				    {
						label: "现场数据",
			            backgroundColor: [
			                'rgba(81, 130, 187, 1)',
			                'rgba(81, 130, 187, 1)',
			                'rgba(81, 130, 187, 1)',
			                'rgba(81, 130, 187, 1)',
			                'rgba(81, 130, 187, 1)'
			            ],
			            data : [(ray/ra_t*100).toFixed(2), (ran/ra_t*100).toFixed(2), (rann/ra_t*100).toFixed(2), (rab/ra_t*100).toFixed(2), (rar/ra_t*100).toFixed(2)]
					},
					{
						label: "常模数据",
			            backgroundColor: [
			                'rgba(191, 81, 79, 1)',
			                'rgba(191, 81, 79, 1)',
			                'rgba(191, 81, 79, 1)',
			                'rgba(191, 81, 79, 1)',
			                'rgba(191, 81, 79, 1)'
			            ],
						data : [(cms[2]*100).toFixed(2),(cms[3]*100).toFixed(2),(cms[4]*100).toFixed(2),(cms[5]*100).toFixed(2),(cms[6]*100).toFixed(2)]
					}
				]
			};
			
			chartresponse2 = new Chart(ctx2, {
                type: 'bar',
                data: datas2,
                options: {
                    elements: {
                        rectangle: {
                            borderWidth: 0,
                            borderColor: 'rgb(0, 255, 0)',
                            borderSkipped: 'bottom'
                        }
                    },
                    scales: {
                        xAxes: [{
                        	beginAtZero: true,
                        	min: 0,
                        	suggestedMin: 0
                        }]
                    },
                    responsive: false,
                    title: {
                        display: true,
                        text: '回应态度'
                    },
                    legend: {
                        display: true,
                        position: 'bottom'
                    },
                    animation: {
                    	onComplete: function () {
                            var chartInstance = this.chart;
                            var ctx = chartInstance.ctx;
                            ctx.textAlign = "center";
                            Chart.helpers.each(this.data.datasets.forEach(function (dataset, i) {
                                var meta = chartInstance.controller.getDatasetMeta(i);
                                Chart.helpers.each(meta.data.forEach(function (bar, index) {
                                    ctx.fillText(dataset.data[index], bar._model.x, bar._model.y - 15);
                                }),this)
                            }),this);
                        }
                    }
                }});
		}
		
		chartresponse1.data.datasets[0].data = [(rt/rt_t*100).toFixed(2), (ra/rt_t*100).toFixed(2)];
		chartresponse1.data.datasets[1].data = [(cms[0]*100).toFixed(2),(cms[1]*100).toFixed(2)];
		
		chartresponse1.update();
		
		chartresponse2.data.datasets[0].data = [(ray/ra_t*100).toFixed(2), (ran/ra_t*100).toFixed(2), (rann/ra_t*100).toFixed(2), (rab/ra_t*100).toFixed(2), (rar/ra_t*100).toFixed(2)];
		chartresponse2.data.datasets[1].data = [(cms[2]*100).toFixed(2),(cms[3]*100).toFixed(2),(cms[4]*100).toFixed(2),(cms[5]*100).toFixed(2),(cms[6]*100).toFixed(2)];
		
		chartresponse2.update();
	} else if (datatype == "dialogue") {
		var dialogue = data.dialogue;
		var l1 = parseInt(dialogue.sdy);
		var l2 = parseInt(dialogue.sder);
		var l3 = parseInt(dialogue.sds);
		var l4 = parseInt(dialogue.sdsi);
		var l5 = parseInt(dialogue.sdw);
		
		var lt = l1 + l2 + l3 + l4 + l5;
		if (lt <= 0)
			lt = 1;
		
		var cms = [parseFloat(rp.sdy),parseFloat(rp.sder),parseFloat(rp.sds),parseFloat(rp.sdsi),parseFloat(rp.sdw)];
		
		if (chartdialogue == null) {
			var ctx = $("#chart_dialogue").get(0).getContext("2d");
			var datas = {
				labels : ["深度一","深度二","深度三","深度四","深度五"],
				datasets : [
				    {
						label: "现场数据",
			            backgroundColor: [
			                'rgba(81, 130, 187, 1)',
			                'rgba(81, 130, 187, 1)',
			                'rgba(81, 130, 187, 1)',
			                'rgba(81, 130, 187, 1)',
			                'rgba(81, 130, 187, 1)'
			            ],
						data : [(l1/lt*100).toFixed(2), (l2/lt*100).toFixed(2), (l3/lt*100).toFixed(2), (l4/lt*100).toFixed(2), (l5/lt*100).toFixed(2)]
					},
					{
						label: "常模数据",
			            backgroundColor: [
			                'rgba(191, 81, 79, 1)',
			                'rgba(191, 81, 79, 1)',
			                'rgba(191, 81, 79, 1)',
			                'rgba(191, 81, 79, 1)',
			                'rgba(191, 81, 79, 1)'
			            ],
						data : [(cms[0]*100).toFixed(2),(cms[1]*100).toFixed(2),(cms[2]*100).toFixed(2),(cms[3]*100).toFixed(2),(cms[4]*100).toFixed(2)]
					}
				]
			};
			
			chartdialogue = new Chart(ctx, {
                type: 'bar',
                data: datas,
                options: {
                    // Elements options apply to all of the options unless overridden in a dataset
                    // In this case, we are setting the border of each bar to be 2px wide and green
                    elements: {
                        rectangle: {
                            borderWidth: 0,
                            borderColor: 'rgb(0, 255, 0)',
                            borderSkipped: 'bottom'
                        }
                    },
                    scales: {
                        xAxes: [{
                        	beginAtZero: true,
                        	min: 0,
                        	suggestedMin: 0
                        }]
                    },
                    responsive: false,
                    title: {
                        display: true,
                        text: '对话深度'
                    },
                    legend: {
                        display: true,
                        position: 'bottom'
                    },
                    animation: {
                    	onComplete: function () {
                            var chartInstance = this.chart;
                            var ctx = chartInstance.ctx;
                            ctx.textAlign = "center";
                            Chart.helpers.each(this.data.datasets.forEach(function (dataset, i) {
                                var meta = chartInstance.controller.getDatasetMeta(i);
                                Chart.helpers.each(meta.data.forEach(function (bar, index) {
                                    ctx.fillText(dataset.data[index], bar._model.x, bar._model.y - 15);
                                }),this)
                            }),this);
                        }
                    }
                }});
		}
		
		chartdialogue.data.datasets[0].data = [(l1/lt*100).toFixed(2), (l2/lt*100).toFixed(2), (l3/lt*100).toFixed(2), (l4/lt*100).toFixed(2), (l5/lt*100).toFixed(2)];
		chartdialogue.data.datasets[1].data = [(cms[0]*100).toFixed(2),(cms[1]*100).toFixed(2),(cms[2]*100).toFixed(2),(cms[3]*100).toFixed(2),(cms[4]*100).toFixed(2)];
		
		chartdialogue.update();
	} else if (datatype == "st") {
		var stdata = data.st;
		var cms = [parseFloat(rp.rt),parseFloat(rp.rs),parseFloat(rp.ch)];
		var sttimer = parseInt(stdata.sttimer)/60; 
		var ststr = stdata.stdatas;
		var sts = ststr.split("");
		var rs = 0;
		var rt = 0;
		var ch = 0;
		var lastst = "";
		var points = new Array();
		points.push({x: rt, y: rs});
		for (var i=0;i<sts.length;i++) {
			if (sts[i] == "s")
				rs++;
			else
				rt++;
			
			points.push({x: rt*sttimer, y: rs*sttimer});
			
			if (lastst != "") {
				if (lastst != sts[i]) {
					ch++;
				}
			}
			
			lastst = sts[i];
		}
		
		if (rs+rt > 0) {
			var _rt = (rt/(rs+rt)).toFixed(2);
			var _rs = (rs/(rs+rt)).toFixed(2);
			var _ch = (ch/(rs+rt)).toFixed(2);
			
			var teatype = "";
			if (_rt <= 0.3) 
				teatype = "练习型";
			else if (_rt >= 0.7)
				teatype = "讲授型";
			else {
				if (_ch >= 0.4)
					teatype = "对话型";
				else 
					teatype = "混合型";
			}
			
			if (chartrtrs == null) {
				var ctx = $("#chart_rtrs").get(0).getContext("2d");
				var datas = {
					datasets : [
					    {
					    	data: points,
					    	fill: false,
					    	borderColor: "rgba(255,0,0,1)",
					    	pointRadius: 0,
					    	lineTension: 0,
					    	borderWidth: 2
						},
						{
							label: "",
					    	data: [{x:0,y:0},{x:(rs+rt)*sttimer,y:(rs+rt)*sttimer}],
					    	fill: false,
					    	borderColor: "rgba(200,200,200,0.3)",
					    	pointRadius: 0,
					    	lineTension: 0,
					    	borderWidth: 1,
					    	
						}
					]
				};
				
				chartrtrs = new Chart(ctx, {
	                type: 'line',
	                data: datas,
	                options: {
	                	scales: {
                            xAxes: [{
                                type: 'linear',
                                position: 'bottom',
                                scaleLabel: {
                                	display: true,
                                	labelString:"T行为(单位:分钟)",
                                },
                                afterFit: function (scale) {
                                    scale.width = 500;
                                }
                            }],
                            yAxes: [{
                                type: 'linear',
                                position: 'left',
                                scaleLabel: {
                                	display: true,
                                	labelString:"S行为(单位:分钟)",
                                }
                            }]
                        },
	                    responsive: false,
	                    title: {
	                        display: true,
	                        text: 'S-T曲线图'
	                    },
	                    legend: {
	                        display: false,
	                        position: 'bottom',
	                        labels: {
	                        	boxWidth: 0,
	                        }
	                    },
	                    animation: {
	                    	onComplete: function () {
	                            var chartInstance = this.chart;
	                            var ctx = chartInstance.ctx;
	                            ctx.fillStyle = "white";
	                            ctx.fillRect(560,0,200,500);
	                            ctx.fillStyle = "black";
	                            ctx.fillText("时长: "+formatTime((rs+rt)*parseInt(stdata.sttimer)), 570, 200);
	                            ctx.fillText("间隔: "+stdata.sttimer+"秒", 570, 240);
	                            ctx.fillText("T个数 :"+rt, 570, 280);
	                            ctx.fillText("S个数 :"+rs, 570, 320);
	                        }
	                    }
	                }});
				
				var ctx1 = $("#chart_rtch").get(0).getContext("2d");
				var datas1 = {
					datasets : [
					    {
					    	type: "line",
					    	data: [{x:0, y:0},{x:0.5, y:1}],
					    	fill: false,
					    	borderColor: "rgba(0,0,0,1)",
					    	pointRadius: 0,
					    	lineTension: 0,
					    	borderWidth: 2
						},
						{
					    	type: "line",
					    	data: [{x:0.5, y:1},{x:1, y:0}],
					    	fill: false,
					    	borderColor: "rgba(0,0,0,1)",
					    	pointRadius: 0,
					    	lineTension: 0,
					    	borderWidth: 2
						},
						{
					    	type: "line",
					    	data: [{x:0.2, y:0.4},{x:0.8, y:0.4}],
					    	fill: false,
					    	borderColor: "rgba(0,0,0,1)",
					    	pointRadius: 0,
					    	lineTension: 0,
					    	borderWidth: 2
						},
						{
					    	type: "line",
					    	data: [{x:0.3, y:0},{x:0.3, y:0.6}],
					    	fill: false,
					    	borderColor: "rgba(0,0,0,1)",
					    	pointRadius: 0,
					    	lineTension: 0,
					    	borderWidth: 2
						},
						{
					    	type: "line",
					    	data: [{x:0.7, y:0},{x:0.7, y:0.6}],
					    	fill: false,
					    	borderColor: "rgba(0,0,0,1)",
					    	pointRadius: 0,
					    	lineTension: 0,
					    	borderWidth: 2
						},
						{
							type: "bubble",
							data: [{x: _rt, y: _ch, r: 4}],
							backgroundColor: '#f00',
							borderColor: '#f00',
							borderWidth: 0
		                },
					]
				};
				
				chartrtch = new Chart(ctx1, {
	                type: 'line',
	                data: datas1,
	                options: {
	                	scales: {
                            xAxes: [{
                                type: 'linear',
                                position: 'bottom',
                                scaleLabel: {
                                	display: true,
                                	labelString:"Rt",
                                },
                                afterFit: function (scale) {
                                    scale.width = 400;
                                }
                            }],
                            yAxes: [{
                                type: 'linear',
                                position: 'left',
                                scaleLabel: {
                                	display: true,
                                	labelString:"Ch",
                                }
                            }]
                        },
	                    responsive: false,
	                    title: {
	                        display: true,
	                        text: 'Rt-Ch图'
	                    },
	                    legend: {
	                        display: false,
	                        position: 'bottom',
	                        labels: {
	                        	boxWidth: 0,
	                        }
	                    },
	                    animation: {
	                    	onComplete: function () {
	                            var chartInstance = this.chart;
	                            var ctx = chartInstance.ctx;
	                            ctx.fillStyle = "white";
	                            ctx.fillRect(460,0,200,500);
	                            ctx.fillStyle = "black";
	                            ctx.fillText("转换率Ch: "+_ch, 470, 160);
	                            ctx.fillText("T占有率Rt: "+_rt, 470, 200);
	                            ctx.fillText("S占有率Rs: "+_rs, 470, 240);
	                            ctx.fillText("教学类型: "+teatype, 470, 280);
	                        }
	                    }
	                }});
			}
			
			chartrtrs.data.datasets[0].data = points;
			chartrtrs.data.datasets[1].data =[{x:0,y:0},{x:(rs+rt)*sttimer,y:(rs+rt)*sttimer}];
			chartrtrs.update();
			
			chartrtch.data.datasets[5].data = [{x: _rt, y: _ch, r: 4}];
			chartrtch.update();
			
			$("#stregular").text("参考常模：Ch："+cms[2]+" --- Rt："+cms[0]+" --- Rs："+cms[1]);
		}
	}
}

function formatTime(second) {
	var time=second;
	var days = Math.floor(time / 1440 / 60);
	var hours = Math.floor((time - days * 1440 * 60) / 3600);
	var minutes = Math.floor((time - days * 1440 * 60 - hours * 3600) / 60);
	var seconds = (time - days * 1440 * 60 - hours * 3600 - minutes *60);
	var timestr = seconds+"秒";
	if (minutes != 0)
		timestr = minutes +"分"+seconds+"秒";
	if (hours != 0) 
		timestr = hours+"时"+minutes +"分"+seconds+"秒";
	if (days != 0)
		timestr = days+"日"+hours+"时"+minutes +"分"+seconds+"秒";
	 
	return timestr;
}