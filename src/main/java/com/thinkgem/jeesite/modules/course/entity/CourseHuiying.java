/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.course.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 课程管理Entity
 * @author wp
 * @version 2016-07-10
 */
public class CourseHuiying extends DataEntity<CourseHuiying> {
	
	private static final long serialVersionUID = 1L;
	private Course course;		// course_id 父类
	private String yyhy = "0";		// 言语回应
	private String fyyhy = "0";		// 非言语回应
	private String kdhy = "0";		// 肯定回应
	private String fdhy = "0";		// 否定回应
	private String why = "0";		// 无回应
	private String ddxshdd = "0";		// 打断学生回答或代答
	private String cfhdhjs = "0";		// 重复学生回答并解释
	
	public CourseHuiying() {
		super();
	}

	public CourseHuiying(String id){
		super(id);
	}

	public CourseHuiying(Course course){
		this.course = course;
	}

	@Length(min=0, max=64, message="course_id长度必须介于 0 和 64 之间")
	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
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