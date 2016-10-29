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
public class HistoryCourseSt extends DataEntity<HistoryCourseSt> {
	
	private static final long serialVersionUID = 1L;
	private HistoryCourse course;		// course_id 父类
	private String ch;		// ch
	private String rt;		// rt
	private String rs;		// rs
	private String stdatas;		// stdatas
	private String sttimer;		// sttimer
	private String jiaoxueleixing;		// 教学类型
	
	public HistoryCourseSt() {
		super();
	}

	public HistoryCourseSt(String id){
		super(id);
	}

	public HistoryCourseSt(HistoryCourse course){
		this.course = course;
	}

	@Length(min=0, max=64, message="course_id长度必须介于 0 和 64 之间")
	public HistoryCourse getCourse() {
		return course;
	}

	public void setCourse(HistoryCourse course) {
		this.course = course;
	}
	
	public String getCh() {
		return ch;
	}

	public void setCh(String ch) {
		this.ch = ch;
	}
	
	public String getRt() {
		return rt;
	}

	public void setRt(String rt) {
		this.rt = rt;
	}
	
	public String getRs() {
		return rs;
	}

	public void setRs(String rs) {
		this.rs = rs;
	}
	
	public String getStdatas() {
		return stdatas;
	}

	public void setStdatas(String stdatas) {
		this.stdatas = stdatas;
	}
	
	@Length(min=1, max=11, message="sttimer长度必须介于 1 和 11 之间")
	public String getSttimer() {
		return sttimer;
	}

	public void setSttimer(String sttimer) {
		this.sttimer = sttimer;
	}
	
	@Length(min=0, max=45, message="教学类型长度必须介于 0 和 45 之间")
	public String getJiaoxueleixing() {
		return jiaoxueleixing;
	}

	public void setJiaoxueleixing(String jiaoxueleixing) {
		this.jiaoxueleixing = jiaoxueleixing;
	}
	
}