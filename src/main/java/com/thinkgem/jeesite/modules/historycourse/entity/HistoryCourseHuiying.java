/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.historycourse.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * history_course_dataEntity
 * @author wp
 * @version 2016-10-05
 */
public class HistoryCourseHuiying extends DataEntity<HistoryCourseHuiying> {
	
	private static final long serialVersionUID = 1L;
	private HistoryCourse course;		// course_id 父类
	private String yyhy;		// 言语回应
	private String fyyhy;		// 非言语回应
	private String kdhy;		// 肯定回应
	private String fdhy;		// 否定回应
	private String why;		// 无回应
	private String ddxshdd;		// 打断学生回答或代答
	private String cfhdhjs;		// 重复学生回答并解释
	
	public HistoryCourseHuiying() {
		super();
	}

	public HistoryCourseHuiying(String id){
		super(id);
	}

	public HistoryCourseHuiying(HistoryCourse course){
		this.course = course;
	}

	@Length(min=0, max=64, message="course_id长度必须介于 0 和 64 之间")
	public HistoryCourse getCourse() {
		return course;
	}

	public void setCourse(HistoryCourse course) {
		this.course = course;
	}
	
	public String getYyhy() {
		return yyhy;
	}

	public void setYyhy(String yyhy) {
		this.yyhy = yyhy;
	}
	
	public String getFyyhy() {
		return fyyhy;
	}

	public void setFyyhy(String fyyhy) {
		this.fyyhy = fyyhy;
	}
	
	public String getKdhy() {
		return kdhy;
	}

	public void setKdhy(String kdhy) {
		this.kdhy = kdhy;
	}
	
	public String getFdhy() {
		return fdhy;
	}

	public void setFdhy(String fdhy) {
		this.fdhy = fdhy;
	}
	
	public String getWhy() {
		return why;
	}

	public void setWhy(String why) {
		this.why = why;
	}
	
	public String getDdxshdd() {
		return ddxshdd;
	}

	public void setDdxshdd(String ddxshdd) {
		this.ddxshdd = ddxshdd;
	}
	
	public String getCfhdhjs() {
		return cfhdhjs;
	}

	public void setCfhdhjs(String cfhdhjs) {
		this.cfhdhjs = cfhdhjs;
	}
	
}