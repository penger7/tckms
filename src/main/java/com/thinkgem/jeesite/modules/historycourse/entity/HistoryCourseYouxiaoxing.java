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
public class HistoryCourseYouxiaoxing extends DataEntity<HistoryCourseYouxiaoxing> {
	
	private static final long serialVersionUID = 1L;
	private HistoryCourse course;		// course_id 父类
	private String glxwt;		// 管理性问题
	private String jyxwt;		// 记忆性问题
	private String tlxwt;		// 推理性问题
	private String czxwt;		// 创造性问题
	private String ppxwt;		// 批判性问题
	private String dm;		// 提问前先点名
	private String rxsqd;		// 让学生齐答
	private String jjszd;		// 叫举手者答
	private String jwjszd;		// 叫未举手者答
	private String glxxtcwt;		// 鼓励学生提出问题
	private String jtqd;		// 集体齐答
	private String tlhhb;		// 讨论后汇报
	private String gbhd;		// 个别回答
	private String zyd;		// 自由答
	private String whd;		// 无回答
	private String pdsf;		// 机械判断是否
	private String rzjyxhd;		// 认知记忆性回答
	private String tlxhd;		// 推理性回答
	private String czpjxhd;		// 创造评价性回答
	
	public HistoryCourseYouxiaoxing() {
		super();
	}

	public HistoryCourseYouxiaoxing(String id){
		super(id);
	}

	public HistoryCourseYouxiaoxing(HistoryCourse course){
		this.course = course;
	}

	@Length(min=0, max=64, message="course_id长度必须介于 0 和 64 之间")
	public HistoryCourse getCourse() {
		return course;
	}

	public void setCourse(HistoryCourse course) {
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