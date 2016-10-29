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
public class CourseSihe extends DataEntity<CourseSihe> {
	
	private static final long serialVersionUID = 1L;
	private Course course;		// course_id 父类
	private String sh = "0";		// 是何
	private String wh = "0";		// 为何
	private String ruh = "0";		// 如何
	private String ruoh = "0";		// 若何
	
	public CourseSihe() {
		super();
	}

	public CourseSihe(String id){
		super(id);
	}

	public CourseSihe(Course course){
		this.course = course;
	}

	@Length(min=0, max=64, message="course_id长度必须介于 0 和 64 之间")
	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}
	
	public String getSh() {
		return sh;
	}

	public void setSh(String sh) {
		this.sh = sh;
	}
	
	public String getWh() {
		return wh;
	}

	public void setWh(String wh) {
		this.wh = wh;
	}
	
	public String getRuh() {
		return ruh;
	}

	public void setRuh(String ruh) {
		this.ruh = ruh;
	}
	
	public String getRuoh() {
		return ruoh;
	}

	public void setRuoh(String ruoh) {
		this.ruoh = ruoh;
	}
	
}