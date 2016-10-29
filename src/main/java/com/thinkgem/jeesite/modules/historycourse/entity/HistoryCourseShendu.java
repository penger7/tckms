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
public class HistoryCourseShendu extends DataEntity<HistoryCourseShendu> {
	
	private static final long serialVersionUID = 1L;
	private HistoryCourse course;		// course_id 父类
	private String sdy;		// 深度一
	private String sder;		// 深度二
	private String sds;		// 深度三
	private String sdsi;		// 深度四
	private String sdw;		// 深度五
	
	public HistoryCourseShendu() {
		super();
	}

	public HistoryCourseShendu(String id){
		super(id);
	}

	public HistoryCourseShendu(HistoryCourse course){
		this.course = course;
	}

	@Length(min=0, max=64, message="course_id长度必须介于 0 和 64 之间")
	public HistoryCourse getCourse() {
		return course;
	}

	public void setCourse(HistoryCourse course) {
		this.course = course;
	}
	
	public String getSdy() {
		return sdy;
	}

	public void setSdy(String sdy) {
		this.sdy = sdy;
	}
	
	public String getSder() {
		return sder;
	}

	public void setSder(String sder) {
		this.sder = sder;
	}
	
	public String getSds() {
		return sds;
	}

	public void setSds(String sds) {
		this.sds = sds;
	}
	
	public String getSdsi() {
		return sdsi;
	}

	public void setSdsi(String sdsi) {
		this.sdsi = sdsi;
	}
	
	public String getSdw() {
		return sdw;
	}

	public void setSdw(String sdw) {
		this.sdw = sdw;
	}
	
}