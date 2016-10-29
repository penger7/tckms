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
public class CourseYouxiaoxing extends DataEntity<CourseYouxiaoxing> {
	
	private static final long serialVersionUID = 1L;
	private Course course;		// course_id 父类
	private String glxwt = "0";		// 管理性问题
	private String jyxwt = "0";		// 记忆性问题
	private String tlxwt = "0";		// 推理性问题
	private String czxwt = "0";		// 创造性问题
	private String ppxwt = "0";		// 批判性问题
	private String dm = "0";		// 提问前先点名
	private String rxsqd = "0";		// 让学生齐答
	private String jjszd = "0";		// 叫举手者答
	private String jwjszd = "0";		// 叫未举手者答
	private String glxxtcwt = "0";		// 鼓励学生提出问题
	private String jtqd = "0";		// 集体齐答
	private String tlhhb = "0";		// 讨论后汇报
	private String gbhd = "0";		// 个别回答
	private String zyd = "0";		// 自由答
	private String whd = "0";		// 无回答
	private String pdsf = "0";		// 机械判断是否
	private String rzjyxhd = "0";		// 认知记忆性回答
	private String tlxhd = "0";		// 推理性回答
	private String czpjxhd = "0";		// 创造评价性回答
	
	public CourseYouxiaoxing() {
		super();
	}

	public CourseYouxiaoxing(String id){
		super(id);
	}

	public CourseYouxiaoxing(Course course){
		this.course = course;
	}

	@Length(min=0, max=64, message="course_id长度必须介于 0 和 64 之间")
	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}
	
	public String getGlxwt() {
		return glxwt;
	}

	public void setGlxwt(String glxwt) {
		this.glxwt = glxwt;
	}
	
	public String getJyxwt() {
		return jyxwt;
	}

	public void setJyxwt(String jyxwt) {
		this.jyxwt = jyxwt;
	}
	
	public String getTlxwt() {
		return tlxwt;
	}

	public void setTlxwt(String tlxwt) {
		this.tlxwt = tlxwt;
	}
	
	public String getCzxwt() {
		return czxwt;
	}

	public void setCzxwt(String czxwt) {
		this.czxwt = czxwt;
	}
	
	public String getPpxwt() {
		return ppxwt;
	}

	public void setPpxwt(String ppxwt) {
		this.ppxwt = ppxwt;
	}
	
	public String getDm() {
		return dm;
	}

	public void setDm(String dm) {
		this.dm = dm;
	}
	
	public String getRxsqd() {
		return rxsqd;
	}

	public void setRxsqd(String rxsqd) {
		this.rxsqd = rxsqd;
	}
	
	public String getJjszd() {
		return jjszd;
	}

	public void setJjszd(String jjszd) {
		this.jjszd = jjszd;
	}
	
	public String getJwjszd() {
		return jwjszd;
	}

	public void setJwjszd(String jwjszd) {
		this.jwjszd = jwjszd;
	}
	
	public String getGlxxtcwt() {
		return glxxtcwt;
	}

	public void setGlxxtcwt(String glxxtcwt) {
		this.glxxtcwt = glxxtcwt;
	}
	
	public String getJtqd() {
		return jtqd;
	}

	public void setJtqd(String jtqd) {
		this.jtqd = jtqd;
	}
	
	public String getTlhhb() {
		return tlhhb;
	}

	public void setTlhhb(String tlhhb) {
		this.tlhhb = tlhhb;
	}
	
	public String getGbhd() {
		return gbhd;
	}

	public void setGbhd(String gbhd) {
		this.gbhd = gbhd;
	}
	
	public String getZyd() {
		return zyd;
	}

	public void setZyd(String zyd) {
		this.zyd = zyd;
	}
	
	public String getWhd() {
		return whd;
	}

	public void setWhd(String whd) {
		this.whd = whd;
	}
	
	public String getPdsf() {
		return pdsf;
	}

	public void setPdsf(String pdsf) {
		this.pdsf = pdsf;
	}
	
	public String getRzjyxhd() {
		return rzjyxhd;
	}

	public void setRzjyxhd(String rzjyxhd) {
		this.rzjyxhd = rzjyxhd;
	}
	
	public String getTlxhd() {
		return tlxhd;
	}

	public void setTlxhd(String tlxhd) {
		this.tlxhd = tlxhd;
	}
	
	public String getCzpjxhd() {
		return czpjxhd;
	}

	public void setCzpjxhd(String czpjxhd) {
		this.czpjxhd = czpjxhd;
	}
	
}