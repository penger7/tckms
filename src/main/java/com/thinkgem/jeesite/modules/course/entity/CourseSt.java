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
public class CourseSt extends DataEntity<CourseSt> {
	
	private static final long serialVersionUID = 1L;
	private Course course;		// course_id 父类
	private String stdatas = "";
	private String sttimer = "30";
	private String ch = "0";		// ch
	private String rt = "0";		// rt
	private String rs = "0";		// rs
	private String jiaoxueleixing = "";		// 教学类型
	
	public CourseSt() {
		super();
	}
	
	public CourseSt(String id){
		super(id);
	}

	public CourseSt(Course course){
		this.course = course;
	}
	
	@Length(min=0, max=64, message="course_id长度必须介于 0 和 64 之间")
	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}
	
	public String getStdatas() {
		return stdatas;
	}

	public void setStdatas(String stdatas) {
		this.stdatas = stdatas;
	}
	
	public String getSttimer() {
		return sttimer;
	}

	public void setSttimer(String sttimer) {
		this.sttimer = sttimer;
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
	
	@Length(min=0, max=45, message="教学类型长度必须介于 0 和 45 之间")
	public String getJiaoxueleixing() {
		return jiaoxueleixing;
	}

	public void setJiaoxueleixing(String jiaoxueleixing) {
		this.jiaoxueleixing = jiaoxueleixing;
	}
	
}