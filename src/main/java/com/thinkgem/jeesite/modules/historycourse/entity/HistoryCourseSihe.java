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
public class HistoryCourseSihe extends DataEntity<HistoryCourseSihe> {
	
	private static final long serialVersionUID = 1L;
	private HistoryCourse course;		// course_id 父类
	private String sh;		// 是何
	private String wh;		// 为何
	private String ruh;		// 如何
	private String ruoh;		// 若何
	
	public HistoryCourseSihe() {
		super();
	}

	public HistoryCourseSihe(String id){
		super(id);
	}

	public HistoryCourseSihe(HistoryCourse course){
		this.course = course;
	}

	@Length(min=0, max=64, message="course_id长度必须介于 0 和 64 之间")
	public HistoryCourse getCourse() {
		return course;
	}

	public void setCourse(HistoryCourse course) {
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