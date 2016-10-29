<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>课程常模</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		var csize = ${datalist.size()};
        var data = new Object();
        data['ch'] = 0;
        data['rt'] = 0;      
        data['rs'] = 0;      
        data['yyhy'] = 0;    
        data['fyyhy'] = 0;   
        data['kdhy'] = 0;    
        data['fdhy'] = 0;    
        data['why'] = 0;     
        data['ddxshdd'] = 0; 
        data['cfhdhjs'] = 0; 
        data['glxwt'] = 0;   
        data['jyxwt'] = 0;   
        data['tlxwt'] = 0;   
        data['czxwt'] = 0;   
        data['ppxwt'] = 0;   
        data['dm'] = 0;      
        data['rxsqd'] = 0;   
        data['jjszd'] = 0;   
        data['jwjszd'] = 0;  
        data['glxxtcwt'] = 0;
        data['jtqd'] = 0;    
        data['tlhhb'] = 0;   
        data['gbhd'] = 0;    
        data['zyd'] = 0;     
        data['whd'] = 0;     
        data['pdsf'] = 0;    
        data['rzjyxhd'] = 0; 
        data['tlxhd'] = 0;   
        data['czpjxhd'] = 0; 
        data['sh'] = 0;      
        data['wh'] = 0;      
        data['ruh'] = 0;     
        data['ruoh'] = 0;    
        data['sdy'] = 0;     
        data['sder'] = 0;    
        data['sds'] = 0;     
        data['sdsi'] = 0;    
        data['sdw'] = 0;     
        
        <c:forEach items="${datalist}" var="data">
            data['ch']       =  data['ch']         +  ${data.st.ch}      ;
            data['rt']       =  data['rt']         +  ${data.st.rt}      ;
            data['rs']       =  data['rs']         +  ${data.st.rs}      ;
            data['yyhy']     =  data['yyhy']       +  ${data.response.yyhy}    ;
            data['fyyhy']    =  data['fyyhy']      +  ${data.response.fyyhy}   ;
            data['kdhy']     =  data['kdhy']       +  ${data.response.kdhy}    ;
            data['fdhy']     =  data['fdhy']       +  ${data.response.fdhy}    ;
            data['why']      =  data['why']        +  ${data.response.why}     ;
            data['ddxshdd']  =  data['ddxshdd']    +  ${data.response.ddxshdd} ;
            data['cfhdhjs']  =  data['cfhdhjs']    +  ${data.response.cfhdhjs} ;
            data['glxwt']    =  data['glxwt']      +  ${data.question.glxwt}   ;
            data['jyxwt']    =  data['jyxwt']      +  ${data.question.jyxwt}   ;
            data['tlxwt']    =  data['tlxwt']      +  ${data.question.tlxwt}   ;
            data['czxwt']    =  data['czxwt']      +  ${data.question.czxwt}   ;
            data['ppxwt']    =  data['ppxwt']      +  ${data.question.ppxwt}   ;
            data['dm']       =  data['dm']         +  ${data.question.dm}      ;
            data['rxsqd']    =  data['rxsqd']      +  ${data.question.rxsqd}   ;
            data['jjszd']    =  data['jjszd']      +  ${data.question.jjszd}   ;
            data['jwjszd']   =  data['jwjszd']     +  ${data.question.jwjszd}  ;
            data['glxxtcwt'] =  data['glxxtcwt']   +  ${data.question.glxxtcwt};
            data['jtqd']     =  data['jtqd']       +  ${data.question.jtqd}    ;
            data['tlhhb']    =  data['tlhhb']      +  ${data.question.tlhhb}   ;
            data['gbhd']     =  data['gbhd']       +  ${data.question.gbhd}    ;
            data['zyd']      =  data['zyd']        +  ${data.question.zyd}     ;
            data['whd']      =  data['whd']        +  ${data.question.whd}     ;
            data['pdsf']     =  data['pdsf']       +  ${data.question.pdsf}    ;
            data['rzjyxhd']  =  data['rzjyxhd']    +  ${data.question.rzjyxhd} ;
            data['tlxhd']    =  data['tlxhd']      +  ${data.question.tlxhd}   ;
            data['czpjxhd']  =  data['czpjxhd']    +  ${data.question.czpjxhd} ;
            data['sh']       =  data['sh']         +  ${data._4mat.sh}      ;
            data['wh']       =  data['wh']         +  ${data._4mat.wh}      ;
            data['ruh']      =  data['ruh']        +  ${data._4mat.ruh}     ;
            data['ruoh']     =  data['ruoh']       +  ${data._4mat.ruoh}    ;
            data['sdy']      =  data['sdy']        +  ${data.dialogue.sdy}     ;
            data['sder']     =  data['sder']       +  ${data.dialogue.sder}    ;
            data['sds']      =  data['sds']        +  ${data.dialogue.sds}     ;
            data['sdsi']     =  data['sdsi']       +  ${data.dialogue.sdsi}    ;
            data['sdw']      =  data['sdw']        +  ${data.dialogue.sdw}     ;
        </c:forEach>
        for(var item in data) 
            data[item] = data[item]/csize; 
		
		var rsize = ${regulars.size()};
		var regular = new Object();
		regular['ch'] = 0;
		regular['rt'] = 0;      
		regular['rs'] = 0;      
		regular['yyhy'] = 0;    
		regular['fyyhy'] = 0;   
		regular['kdhy'] = 0;    
		regular['fdhy'] = 0;    
		regular['why'] = 0;     
		regular['ddxshdd'] = 0; 
		regular['cfhdhjs'] = 0; 
		regular['glxwt'] = 0;   
		regular['jyxwt'] = 0;   
		regular['tlxwt'] = 0;   
		regular['czxwt'] = 0;   
		regular['ppxwt'] = 0;   
		regular['dm'] = 0;      
		regular['rxsqd'] = 0;   
		regular['jjszd'] = 0;   
		regular['jwjszd'] = 0;  
		regular['glxxtcwt'] = 0;
		regular['jtqd'] = 0;    
		regular['tlhhb'] = 0;   
		regular['gbhd'] = 0;    
		regular['zyd'] = 0;     
		regular['whd'] = 0;     
		regular['pdsf'] = 0;    
		regular['rzjyxhd'] = 0; 
		regular['tlxhd'] = 0;   
		regular['czpjxhd'] = 0; 
		regular['sh'] = 0;      
		regular['wh'] = 0;      
		regular['ruh'] = 0;     
		regular['ruoh'] = 0;    
		regular['sdy'] = 0;     
		regular['sder'] = 0;    
		regular['sds'] = 0;     
		regular['sdsi'] = 0;    
		regular['sdw'] = 0;     
		
		<c:forEach items="${regulars}" var="regular">
			regular['ch']       =  regular['ch']         +  ${regular.ch}      ;
			regular['rt']       =  regular['rt']         +  ${regular.rt}      ;
			regular['rs']       =  regular['rs']         +  ${regular.rs}      ;
			regular['yyhy']     =  regular['yyhy']       +  ${regular.yyhy}    ;
			regular['fyyhy']    =  regular['fyyhy']      +  ${regular.fyyhy}   ;
			regular['kdhy']     =  regular['kdhy']       +  ${regular.kdhy}    ;
			regular['fdhy']     =  regular['fdhy']       +  ${regular.fdhy}    ;
			regular['why']      =  regular['why']        +  ${regular.why}     ;
			regular['ddxshdd']  =  regular['ddxshdd']    +  ${regular.ddxshdd} ;
			regular['cfhdhjs']  =  regular['cfhdhjs']    +  ${regular.cfhdhjs} ;
			regular['glxwt']    =  regular['glxwt']      +  ${regular.glxwt}   ;
			regular['jyxwt']    =  regular['jyxwt']      +  ${regular.jyxwt}   ;
			regular['tlxwt']    =  regular['tlxwt']      +  ${regular.tlxwt}   ;
			regular['czxwt']    =  regular['czxwt']      +  ${regular.czxwt}   ;
			regular['ppxwt']    =  regular['ppxwt']      +  ${regular.ppxwt}   ;
			regular['dm']       =  regular['dm']         +  ${regular.dm}      ;
			regular['rxsqd']    =  regular['rxsqd']      +  ${regular.rxsqd}   ;
			regular['jjszd']    =  regular['jjszd']      +  ${regular.jjszd}   ;
			regular['jwjszd']   =  regular['jwjszd']     +  ${regular.jwjszd}  ;
			regular['glxxtcwt'] =  regular['glxxtcwt']   +  ${regular.glxxtcwt};
			regular['jtqd']     =  regular['jtqd']       +  ${regular.jtqd}    ;
			regular['tlhhb']    =  regular['tlhhb']      +  ${regular.tlhhb}   ;
			regular['gbhd']     =  regular['gbhd']       +  ${regular.gbhd}    ;
			regular['zyd']      =  regular['zyd']        +  ${regular.zyd}     ;
			regular['whd']      =  regular['whd']        +  ${regular.whd}     ;
			regular['pdsf']     =  regular['pdsf']       +  ${regular.pdsf}    ;
			regular['rzjyxhd']  =  regular['rzjyxhd']    +  ${regular.rzjyxhd} ;
			regular['tlxhd']    =  regular['tlxhd']      +  ${regular.tlxhd}   ;
			regular['czpjxhd']  =  regular['czpjxhd']    +  ${regular.czpjxhd} ;
			regular['sh']       =  regular['sh']         +  ${regular.sh}      ;
			regular['wh']       =  regular['wh']         +  ${regular.wh}      ;
			regular['ruh']      =  regular['ruh']        +  ${regular.ruh}     ;
			regular['ruoh']     =  regular['ruoh']       +  ${regular.ruoh}    ;
			regular['sdy']      =  regular['sdy']        +  ${regular.sdy}     ;
			regular['sder']     =  regular['sder']       +  ${regular.sder}    ;
			regular['sds']      =  regular['sds']        +  ${regular.sds}     ;
			regular['sdsi']     =  regular['sdsi']       +  ${regular.sdsi}    ;
			regular['sdw']      =  regular['sdw']        +  ${regular.sdw}     ;
		</c:forEach>
		for(var item in regular) 
			regular[item] = regular[item]/rsize; 
		
		$(document).ready(function() {
			Chart.defaults.global.tooltips.enabled = false;
			Chart.defaults.global.defaultFontColor = "#000";
			Chart.defaults.global.defaultFontSize = 14;
			//st
			var ctx = $("#chart_st").get(0).getContext("2d");
			var datas = {
				labels : ["Ch","Rt","Rs"],
				datasets : [
				    {
						label: "全国常模",
			            backgroundColor: [
			                'rgba(81, 130, 187, 1)',
			                'rgba(81, 130, 187, 1)',
			                'rgba(81, 130, 187, 1)'
			            ],
			            data : [(regular['ch']*100).toFixed(2), (regular['rt']*100).toFixed(2), (regular['rs']*100).toFixed(2)]
					},
					{
						label: "现场课常模",
			            backgroundColor: [
							'rgba(191, 81, 79, 1)',
							'rgba(191, 81, 79, 1)',
							'rgba(191, 81, 79, 1)'
			            ],
			            data : [(data['ch']*100).toFixed(2), (data['rt']*100).toFixed(2), (data['rs']*100).toFixed(2)]
					}
				]
			};
			
			var chartst = new Chart(ctx, {
                type: 'bar',
                data: datas,
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
                        text: 'ST分析'
                    },
                    legend: {
                        display: true,
                        position: 'right'
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
                }
			});
			
			//question 1
			var total = data['ppxwt'] + data['czxwt'] + data['tlxwt'] + data['jyxwt'] + data['glxwt']; 
			ctx = $("#chart_question_1").get(0).getContext("2d");
			datas = {
				labels : ["全国常模","现场课常模"],	
				datasets : [
				    {
						label: "批判性问题",
			            backgroundColor: [
			                'rgba(81, 130, 187, 1)',
			                'rgba(81, 130, 187, 1)'
			            ],
			            data : [(regular['ppxwt']*100).toFixed(2), (data['ppxwt']/total*100).toFixed(2)]
					},
					{
						label: "创造性问题",
			            backgroundColor: [
			                'rgba(191, 81, 79, 1)',
			                'rgba(191, 81, 79, 1)'
			            ],
			            data : [(regular['czxwt']*100).toFixed(2), (data['czxwt']/total*100).toFixed(2)]
					},
					{
						label: "推理性问题",
			            backgroundColor: [
							'rgba(155, 186, 94, 1)',
							'rgba(155, 186, 94, 1)'
			            ],
			            data : [(regular['tlxwt']*100).toFixed(2), (data['tlxwt']/total*100).toFixed(2)]
					},
					{
						label: "记忆性问题",
			            backgroundColor: [
							'rgba(128, 102, 162, 1)',
							'rgba(128, 102, 162, 1)'
			            ],
			            data : [(regular['jyxwt']*100).toFixed(2), (data['jyxwt']/total*100).toFixed(2)]
					},
					{
						label: "常规管理性问题",
			            backgroundColor: [
							'rgba(80, 172, 196, 1)',
							'rgba(80, 172, 196, 1)'
			            ],
			            data : [(regular['glxwt']*100).toFixed(2), (data['glxwt']/total*100).toFixed(2)]
					}
				]
			};
			
			var chartquestion1 = new Chart(ctx, {
                type: 'bar',
                data: datas,
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
                        	stacked: true,
                        	barThickness: 60
                        }],
                        yAxes: [{
                            stacked: true
                        }]
                    },
                    responsive: false,
                    title: {
                        display: true,
                        text: '问题类型'
                    },
                    legend: {
                        display: true,
                        position: 'right'
                    },
                    animation: {
                    	onComplete: function () {
                            var chartInstance = this.chart;
                            var ctx = chartInstance.ctx;
                            ctx.textAlign = "center";
                            ctx.fillStyle = "#000";
                            Chart.helpers.each(this.data.datasets.forEach(function (dataset, i) {
                                var meta = chartInstance.controller.getDatasetMeta(i);
                                Chart.helpers.each(meta.data.forEach(function (bar, index) {
                                    ctx.fillText(dataset.data[index], bar._model.x, bar._model.y + 3);
                                }),this)
                            }),this);
                        }
                    }
                }
			});
			
			//question 2
			total = data['glxxtcwt'] + data['jwjszd'] + data['jjszd'] + data['rxsqd'] + data['dm']; 
			ctx = $("#chart_question_2").get(0).getContext("2d");
			datas = {
				labels : ["全国常模","现场课常模"],	
				datasets : [
				    {
						label: "鼓励学生提出问题",
			            backgroundColor: [
			                'rgba(81, 130, 187, 1)',
			                'rgba(81, 130, 187, 1)'
			            ],
			            data : [(regular['glxxtcwt']*100).toFixed(2), (data['glxxtcwt']/total*100).toFixed(2)]
					},
					{
						label: "叫未举手者答",
			            backgroundColor: [
			                'rgba(191, 81, 79, 1)',
			                'rgba(191, 81, 79, 1)'
			            ],
			            data : [(regular['jwjszd']*100).toFixed(2), (data['jwjszd']/total*100).toFixed(2)]
					},
					{
						label: "叫举手者答",
			            backgroundColor: [
							'rgba(155, 186, 94, 1)',
							'rgba(155, 186, 94, 1)'
			            ],
			            data : [(regular['jjszd']*100).toFixed(2), (data['jjszd']/total*100).toFixed(2)]
					},
					{
						label: "让学生齐答",
			            backgroundColor: [
							'rgba(128, 102, 162, 1)',
							'rgba(128, 102, 162, 1)'
			            ],
			            data : [(regular['rxsqd']*100).toFixed(2), (data['rxsqd']/total*100).toFixed(2)]
					},
					{
						label: "提问前，先点名",
			            backgroundColor: [
							'rgba(80, 172, 196, 1)',
							'rgba(80, 172, 196, 1)'
			            ],
			            data : [(regular['dm']*100).toFixed(2), (data['dm']/total*100).toFixed(2)]
					}
				]
			};
			
			var chartquestion2 = new Chart(ctx, {
                type: 'bar',
                data: datas,
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
                        	stacked: true,
                        	barThickness: 60
                        }],
                        yAxes: [{
                            stacked: true
                        }]
                    },
                    responsive: false,
                    title: {
                        display: true,
                        text: '挑选回答方式'
                    },
                    legend: {
                        display: true,
                        position: 'right'
                    },
                    animation: {
                    	onComplete: function () {
                            var chartInstance = this.chart;
                            var ctx = chartInstance.ctx;
                            ctx.textAlign = "center";
                            ctx.fillStyle = "#000";
                            Chart.helpers.each(this.data.datasets.forEach(function (dataset, i) {
                                var meta = chartInstance.controller.getDatasetMeta(i);
                                Chart.helpers.each(meta.data.forEach(function (bar, index) {
                                    ctx.fillText(dataset.data[index], bar._model.x, bar._model.y + 3);
                                }),this)
                            }),this);
                        }
                    }
                }
			});
			
			//question 3
			total = data['zyd'] + data['gbhd'] + data['tlhhb'] + data['jtqd']; 
			ctx = $("#chart_question_3").get(0).getContext("2d");
			datas = {
				labels : ["全国常模","现场课常模"],	
				datasets : [
				    {
						label: "自由答",
			            backgroundColor: [
			                'rgba(81, 130, 187, 1)',
			                'rgba(81, 130, 187, 1)'
			            ],
			            data : [(regular['zyd']*100).toFixed(2), (data['zyd']/total*100).toFixed(2)]
					},
					{
						label: "个别回答",
			            backgroundColor: [
			                'rgba(191, 81, 79, 1)',
			                'rgba(191, 81, 79, 1)'
			            ],
			            data : [(regular['gbhd']*100).toFixed(2), (data['gbhd']/total*100).toFixed(2)]
					},
					{
						label: "讨论后汇报",
			            backgroundColor: [
							'rgba(155, 186, 94, 1)',
							'rgba(155, 186, 94, 1)'
			            ],
			            data : [(regular['tlhhb']*100).toFixed(2), (data['tlhhb']/total*100).toFixed(2)]
					},
					{
						label: "集体齐答",
			            backgroundColor: [
							'rgba(128, 102, 162, 1)',
							'rgba(128, 102, 162, 1)'
			            ],
			            data : [(regular['jtqd']*100).toFixed(2), (data['jtqd']/total*100).toFixed(2)]
					}
				]
			};
			
			var chartquestion3 = new Chart(ctx, {
                type: 'bar',
                data: datas,
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
                        	stacked: true,
                        	barThickness: 60
                        }],
                        yAxes: [{
                            stacked: true
                        }]
                    },
                    responsive: false,
                    title: {
                        display: true,
                        text: '学生回答方式'
                    },
                    legend: {
                        display: true,
                        position: 'right'
                    },
                    animation: {
                    	onComplete: function () {
                            var chartInstance = this.chart;
                            var ctx = chartInstance.ctx;
                            ctx.textAlign = "center";
                            ctx.fillStyle = "#000";
                            Chart.helpers.each(this.data.datasets.forEach(function (dataset, i) {
                                var meta = chartInstance.controller.getDatasetMeta(i);
                                Chart.helpers.each(meta.data.forEach(function (bar, index) {
                                    ctx.fillText(dataset.data[index], bar._model.x, bar._model.y + 3);
                                }),this)
                            }),this);
                        }
                    }
                }
			});
			
			//question 4
			total = data['czpjxhd'] + data['tlxhd'] + data['rzjyxhd'] + data['pdsf'] + data['whd']; 
			ctx = $("#chart_question_4").get(0).getContext("2d");
			datas = {
				labels : ["全国常模","现场课常模"],	
				datasets : [
				    {
						label: "创造评价性回答",
			            backgroundColor: [
			                'rgba(81, 130, 187, 1)',
			                'rgba(81, 130, 187, 1)'
			            ],
			            data : [(regular['czpjxhd']*100).toFixed(2), (data['czpjxhd']/total*100).toFixed(2)]
					},
					{
						label: "推理性回答",
			            backgroundColor: [
			                'rgba(191, 81, 79, 1)',
			                'rgba(191, 81, 79, 1)'
			            ],
			            data : [(regular['tlxhd']*100).toFixed(2), (data['tlxhd']/total*100).toFixed(2)]
					},
					{
						label: "认知记忆性回答",
			            backgroundColor: [
							'rgba(155, 186, 94, 1)',
							'rgba(155, 186, 94, 1)'
			            ],
			            data : [(regular['rzjyxhd']*100).toFixed(2), (data['rzjyxhd']/total*100).toFixed(2)]
					},
					{
						label: "机械判断是否",
			            backgroundColor: [
							'rgba(128, 102, 162, 1)',
							'rgba(128, 102, 162, 1)'
			            ],
			            data : [(regular['pdsf']*100).toFixed(2), (data['pdsf']/total*100).toFixed(2)]
					},
					{
						label: "无回答",
			            backgroundColor: [
							'rgba(80, 172, 196, 1)',
							'rgba(80, 172, 196, 1)'
			            ],
			            data : [(regular['whd']*100).toFixed(2), (data['whd']/total*100).toFixed(2)]
					}
				]
			};
			
			var chartquestion4 = new Chart(ctx, {
                type: 'bar',
                data: datas,
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
                        	stacked: true,
                        	barThickness: 60
                        }],
                        yAxes: [{
                            stacked: true
                        }]
                    },
                    responsive: false,
                    title: {
                        display: true,
                        text: '学生回答类型'
                    },
                    legend: {
                        display: true,
                        position: 'right'
                    },
                    animation: {
                    	onComplete: function () {
                            var chartInstance = this.chart;
                            var ctx = chartInstance.ctx;
                            ctx.textAlign = "center";
                            ctx.fillStyle = "#000";
                            Chart.helpers.each(this.data.datasets.forEach(function (dataset, i) {
                                var meta = chartInstance.controller.getDatasetMeta(i);
                                Chart.helpers.each(meta.data.forEach(function (bar, index) {
                                    ctx.fillText(dataset.data[index], bar._model.x, bar._model.y + 3);
                                }),this)
                            }),this);
                        }
                    }
                }
			});
			
			//response 1
			total = data['fyyhy'] + data['yyhy']; 
			ctx = $("#chart_response_1").get(0).getContext("2d");
			datas = {
				labels : ["全国常模","现场课常模"],	
				datasets : [
				    {
						label: "非言语回应",
			            backgroundColor: [
			                'rgba(81, 130, 187, 1)',
			                'rgba(81, 130, 187, 1)'
			            ],
			            data : [(regular['fyyhy']*100).toFixed(2), (data['fyyhy']/total*100).toFixed(2)]
					},
					{
						label: "言语回应",
			            backgroundColor: [
			                'rgba(191, 81, 79, 1)',
			                'rgba(191, 81, 79, 1)'
			            ],
			            data : [(regular['yyhy']*100).toFixed(2), (data['yyhy']/total*100).toFixed(2)]
					}
				]
			};
			
			var chartresponse1 = new Chart(ctx, {
                type: 'bar',
                data: datas,
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
                        	stacked: true,
                        	barThickness: 60
                        }],
                        yAxes: [{
                            stacked: true
                        }]
                    },
                    responsive: false,
                    title: {
                        display: true,
                        text: '回应方式'
                    },
                    legend: {
                        display: true,
                        position: 'right'
                    },
                    animation: {
                    	onComplete: function () {
                            var chartInstance = this.chart;
                            var ctx = chartInstance.ctx;
                            ctx.textAlign = "center";
                            ctx.fillStyle = "#000";
                            Chart.helpers.each(this.data.datasets.forEach(function (dataset, i) {
                                var meta = chartInstance.controller.getDatasetMeta(i);
                                Chart.helpers.each(meta.data.forEach(function (bar, index) {
                                    ctx.fillText(dataset.data[index], bar._model.x, bar._model.y + 3);
                                }),this)
                            }),this);
                        }
                    }
                }
			});
			
			//response 2
			total = data['cfhdhjs'] + data['ddxshdd'] + data['why'] + data['fdhy'] + data['kdhy']; 
			ctx = $("#chart_response_2").get(0).getContext("2d");
			datas = {
				labels : ["全国常模","现场课常模"],	
				datasets : [
				    {
						label: "重复回答或解释",
			            backgroundColor: [
			                'rgba(81, 130, 187, 1)',
			                'rgba(81, 130, 187, 1)'
			            ],
			            data : [(regular['cfhdhjs']*100).toFixed(2), (data['cfhdhjs']/total*100).toFixed(2)]
					},
					{
						label: "打断学生回答或自己代答",
			            backgroundColor: [
			                'rgba(191, 81, 79, 1)',
			                'rgba(191, 81, 79, 1)'
			            ],
			            data : [(regular['ddxshdd']*100).toFixed(2), (data['ddxshdd']/total*100).toFixed(2)]
					},
					{
						label: "无回应",
			            backgroundColor: [
							'rgba(155, 186, 94, 1)',
							'rgba(155, 186, 94, 1)'
			            ],
			            data : [(regular['why']*100).toFixed(2), (data['why']/total*100).toFixed(2)]
					},
					{
						label: "否定回应",
			            backgroundColor: [
							'rgba(128, 102, 162, 1)',
							'rgba(128, 102, 162, 1)'
			            ],
			            data : [(regular['fdhy']*100).toFixed(2), (data['fdhy']/total*100).toFixed(2)]
					},
					{
						label: "肯定回应",
			            backgroundColor: [
							'rgba(80, 172, 196, 1)',
							'rgba(80, 172, 196, 1)'
			            ],
			            data : [(regular['kdhy']*100).toFixed(2), (data['kdhy']/total*100).toFixed(2)]
					}
				]
			};
			
			var chartresponse2 = new Chart(ctx, {
                type: 'bar',
                data: datas,
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
                        	stacked: true,
                        	barThickness: 60
                        }],
                        yAxes: [{
                            stacked: true
                        }]
                    },
                    responsive: false,
                    title: {
                        display: true,
                        text: '回应态度'
                    },
                    legend: {
                        display: true,
                        position: 'right'
                    },
                    animation: {
                    	onComplete: function () {
                            var chartInstance = this.chart;
                            var ctx = chartInstance.ctx;
                            ctx.textAlign = "center";
                            ctx.fillStyle = "#000";
                            Chart.helpers.each(this.data.datasets.forEach(function (dataset, i) {
                                var meta = chartInstance.controller.getDatasetMeta(i);
                                Chart.helpers.each(meta.data.forEach(function (bar, index) {
                                    ctx.fillText(dataset.data[index], bar._model.x, bar._model.y + 3);
                                }),this)
                            }),this);
                        }
                    }
                }
			});
			
			//4mat
			total = data['ruoh'] + data['ruh'] + data['wh'] + data['sh']; 
			ctx = $("#chart_4mat").get(0).getContext("2d");
			datas = {
				labels : ["全国常模","现场课常模"],	
				datasets : [
				    {
						label: "若何",
			            backgroundColor: [
			                'rgba(81, 130, 187, 1)',
			                'rgba(81, 130, 187, 1)'
			            ],
			            data : [(regular['ruoh']*100).toFixed(2), (data['ruoh']/total*100).toFixed(2)]
					},
					{
						label: "如何",
			            backgroundColor: [
			                'rgba(191, 81, 79, 1)',
			                'rgba(191, 81, 79, 1)'
			            ],
			            data : [(regular['ruh']*100).toFixed(2), (data['ruh']/total*100).toFixed(2)]
					},
					{
						label: "为何",
			            backgroundColor: [
							'rgba(155, 186, 94, 1)',
							'rgba(155, 186, 94, 1)'
			            ],
			            data : [(regular['wh']*100).toFixed(2), (data['wh']/total*100).toFixed(2)]
					},
					{
						label: "是和",
			            backgroundColor: [
							'rgba(128, 102, 162, 1)',
							'rgba(128, 102, 162, 1)'
			            ],
			            data : [(regular['sh']*100).toFixed(2), (data['sh']/total*100).toFixed(2)]
					}
				]
			};
			
			var chart4mat = new Chart(ctx, {
                type: 'bar',
                data: datas,
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
                        	stacked: true,
                        	barThickness: 60
                        }],
                        yAxes: [{
                            stacked: true
                        }]
                    },
                    responsive: false,
                    title: {
                        display: true,
                        text: '四何问题'
                    },
                    legend: {
                        display: true,
                        position: 'right'
                    },
                    animation: {
                    	onComplete: function () {
                            var chartInstance = this.chart;
                            var ctx = chartInstance.ctx;
                            ctx.textAlign = "center";
                            ctx.fillStyle = "#000";
                            Chart.helpers.each(this.data.datasets.forEach(function (dataset, i) {
                                var meta = chartInstance.controller.getDatasetMeta(i);
                                Chart.helpers.each(meta.data.forEach(function (bar, index) {
                                    ctx.fillText(dataset.data[index], bar._model.x, bar._model.y + 3);
                                }),this)
                            }),this);
                        }
                    }
                }
			});
			
			//dialogue
			total = data['sdw'] + data['sdsi'] + data['sds'] + data['sder'] + data['sdy']; 
			ctx = $("#chart_dialogue").get(0).getContext("2d");
			datas = {
				labels : ["全国常模","现场课常模"],	
				datasets : [
				    {
						label: "深度五",
			            backgroundColor: [
			                'rgba(81, 130, 187, 1)',
			                'rgba(81, 130, 187, 1)'
			            ],
			            data : [(regular['sdw']*100).toFixed(2), (data['sdw']/total*100).toFixed(2)]
					},
					{
						label: "深度四",
			            backgroundColor: [
			                'rgba(191, 81, 79, 1)',
			                'rgba(191, 81, 79, 1)'
			            ],
			            data : [(regular['sdsi']*100).toFixed(2), (data['sdsi']/total*100).toFixed(2)]
					},
					{
						label: "深度三",
			            backgroundColor: [
							'rgba(155, 186, 94, 1)',
							'rgba(155, 186, 94, 1)'
			            ],
			            data : [(regular['sds']*100).toFixed(2), (data['sds']/total*100).toFixed(2)]
					},
					{
						label: "深度二",
			            backgroundColor: [
							'rgba(128, 102, 162, 1)',
							'rgba(128, 102, 162, 1)'
			            ],
			            data : [(regular['sder']*100).toFixed(2), (data['sder']/total*100).toFixed(2)]
					},
					{
						label: "深度一",
			            backgroundColor: [
							'rgba(80, 172, 196, 1)',
							'rgba(80, 172, 196, 1)'
			            ],
			            data : [(regular['sdy']*100).toFixed(2), (data['sdy']/total*100).toFixed(2)]
					}
				]
			};
			
			var chartdialogue = new Chart(ctx, {
                type: 'bar',
                data: datas,
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
                        	stacked: true,
                        	barThickness: 60
                        }],
                        yAxes: [{
                            stacked: true
                        }]
                    },
                    responsive: false,
                    title: {
                        display: true,
                        text: '对话深度'
                    },
                    legend: {
                        display: true,
                        position: 'right'
                    },
                    animation: {
                    	onComplete: function () {
                            var chartInstance = this.chart;
                            var ctx = chartInstance.ctx;
                            ctx.textAlign = "center";
                            ctx.fillStyle = "#000";
                            Chart.helpers.each(this.data.datasets.forEach(function (dataset, i) {
                                var meta = chartInstance.controller.getDatasetMeta(i);
                                Chart.helpers.each(meta.data.forEach(function (bar, index) {
                                    ctx.fillText(dataset.data[index], bar._model.x, bar._model.y + 3);
                                }),this)
                            }),this);
                        }
                    }
                }
			});
		});
	</script>
</head>
<body>
	<table style="width:100%;">
		<tr>
			<td>
				<br/>
				<canvas id="chart_st" width="600" height="400" style="margin:0 auto;"></canvas>
			</td>
		</tr>
		
		<tr>
			<td>
				<br/>
				<canvas id="chart_question_1" width="600" height="400" style="margin:0 auto;"></canvas>
			</td>
		</tr>
		<tr>
			<td>
				<br/>
				<canvas id="chart_question_2" width="600" height="400" style="margin:0 auto;"></canvas>
			</td>
		</tr>
		<tr>
			<td>
				<br/>
				<canvas id="chart_question_3" width="600" height="400" style="margin:0 auto;"></canvas>
			</td>
		</tr>
		<tr>
			<td>
				<br/>
				<canvas id="chart_question_4" width="600" height="400" style="margin:0 auto;"></canvas>
			</td>
		</tr>
		
		<tr>
			<td>
				<br/>
				<canvas id="chart_response_1" width="600" height="400" style="margin:0 auto;"></canvas>
			</td>
		</tr>
		<tr>
			<td>
				<br/>
				<canvas id="chart_response_2" width="600" height="400" style="margin:0 auto;"></canvas>
			</td>
		</tr>
		
		<tr>
			<td>
				<br/>
				<canvas id="chart_4mat" width="600" height="400" style="margin:0 auto;"></canvas>
			</td>
		</tr>
		
		<tr>
			<td colspan="5">
				<br/>
				<canvas id="chart_dialogue" width="600" height="400" style="margin:0 auto;"></canvas>
			</td>
		</tr>
	</table>
</body>
</html>