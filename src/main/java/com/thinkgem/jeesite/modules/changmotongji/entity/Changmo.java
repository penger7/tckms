/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.changmotongji.entity;

import org.hibernate.validator.constraints.Length;
import com.thinkgem.jeesite.modules.sys.entity.Area;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 常模统计Entity
 * @author wp
 * @version 2016-10-05
 */
public class Changmo extends DataEntity<Changmo> {
	
	private static final long serialVersionUID = 1L;
	private String jiaoxueleixing;		// 教学类型
	private String xueduan;		// 学段
	private String xuekeleixing;		// 学科类型
	private Double ch;		// ch
	private Double rt;		// rt
	private Double rs;		// rs
	private Double yyhy;		// 言语回应
	private Double fyyhy;		// 非言语回应
	private Double kdhy;		// 肯定回应
	private Double fdhy;		// 否定回应
	private Double why;		// 无回应
	private Double ddxshdd;		// 打断学生回答或自己代答
	private Double cfhdhjs;		// 重复回答或解释
	private Double glxwt;		// 常规管理性问题
	private Double jyxwt;		// 记忆性问题
	private Double tlxwt;		// 推理性问题
	private Double czxwt;		// 创造性问题
	private Double ppxwt;		// 批判性问题
	private Double dm;		// 点名提问
	private Double rxsqd;		// 让学生齐答
	private Double jjszd;		// 叫举手者答
	private Double jwjszd;		// 叫未举手者答
	private Double glxxtcwt;		// 鼓励学生提出问题
	private Double jtqd;		// 集体齐答
	private Double tlhhb;		// 讨论后汇报
	private Double gbhd;		// 个别回答
	private Double zyd;		// 自由答
	private Double whd;		// 无回答
	private Double pdsf;		// 机械判断是否
	private Double rzjyxhd;		// 认知记忆性回答
	private Double tlxhd;		// 推理性回答
	private Double czpjxhd;		// 创造评价性回答
	private Double sh;		// 是何
	private Double wh;		// 为何
	private Double ruh;		// 如何
	private Double ruoh;		// 若何
	private Double sdy;		// 深度一
	private Double sder;		// 深度二
	private Double sds;		// 深度三
	private Double sdsi;		// 深度四
	private Double sdw;		// 深度五
	private Area area;		// 省市
	private int quantity;
	
	public Changmo() {
		super();
	}

	public Changmo(String id){
		super(id);
	}

	@Length(min=0, max=45, message="教学类型长度必须介于 0 和 45 之间")
	public String getJiaoxueleixing() {
		return jiaoxueleixing;
	}

	public void setJiaoxueleixing(String jiaoxueleixing) {
		this.jiaoxueleixing = jiaoxueleixing;
	}
	
	@Length(min=0, max=45, message="学段长度必须介于 0 和 45 之间")
	public String getXueduan() {
		return xueduan;
	}

	public void setXueduan(String xueduan) {
		this.xueduan = xueduan;
	}
	
	@Length(min=0, max=45, message="学科类型长度必须介于 0 和 45 之间")
	public String getXuekeleixing() {
		return xuekeleixing;
	}

	public void setXuekeleixing(String xuekeleixing) {
		this.xuekeleixing = xuekeleixing;
	}
	
	public Double getCh() {
		return ch;
	}

	public void setCh(Double ch) {
		this.ch = ch;
	}
	
	public Double getRt() {
		return rt;
	}

	public void setRt(Double rt) {
		this.rt = rt;
	}
	
	public Double getRs() {
		return rs;
	}

	public void setRs(Double rs) {
		this.rs = rs;
	}
	
	public Double getYyhy() {
		return yyhy;
	}

	public void setYyhy(Double yyhy) {
		this.yyhy = yyhy;
	}
	
	public Double getFyyhy() {
		return fyyhy;
	}

	public void setFyyhy(Double fyyhy) {
		this.fyyhy = fyyhy;
	}
	
	public Double getKdhy() {
		return kdhy;
	}

	public void setKdhy(Double kdhy) {
		this.kdhy = kdhy;
	}
	
	public Double getFdhy() {
		return fdhy;
	}

	public void setFdhy(Double fdhy) {
		this.fdhy = fdhy;
	}
	
	public Double getWhy() {
		return why;
	}

	public void setWhy(Double why) {
		this.why = why;
	}
	
	public Double getDdxshdd() {
		return ddxshdd;
	}

	public void setDdxshdd(Double ddxshdd) {
		this.ddxshdd = ddxshdd;
	}
	
	public Double getCfhdhjs() {
		return cfhdhjs;
	}

	public void setCfhdhjs(Double cfhdhjs) {
		this.cfhdhjs = cfhdhjs;
	}
	
	public Double getGlxwt() {
		return glxwt;
	}

	public void setGlxwt(Double glxwt) {
		this.glxwt = glxwt;
	}
	
	public Double getJyxwt() {
		return jyxwt;
	}

	public void setJyxwt(Double jyxwt) {
		this.jyxwt = jyxwt;
	}
	
	public Double getTlxwt() {
		return tlxwt;
	}

	public void setTlxwt(Double tlxwt) {
		this.tlxwt = tlxwt;
	}
	
	public Double getCzxwt() {
		return czxwt;
	}

	public void setCzxwt(Double czxwt) {
		this.czxwt = czxwt;
	}
	
	public Double getPpxwt() {
		return ppxwt;
	}

	public void setPpxwt(Double ppxwt) {
		this.ppxwt = ppxwt;
	}
	
	public Double getDm() {
		return dm;
	}

	public void setDm(Double dm) {
		this.dm = dm;
	}
	
	public Double getRxsqd() {
		return rxsqd;
	}

	public void setRxsqd(Double rxsqd) {
		this.rxsqd = rxsqd;
	}
	
	public Double getJjszd() {
		return jjszd;
	}

	public void setJjszd(Double jjszd) {
		this.jjszd = jjszd;
	}
	
	public Double getJwjszd() {
		return jwjszd;
	}

	public void setJwjszd(Double jwjszd) {
		this.jwjszd = jwjszd;
	}
	
	public Double getGlxxtcwt() {
		return glxxtcwt;
	}

	public void setGlxxtcwt(Double glxxtcwt) {
		this.glxxtcwt = glxxtcwt;
	}
	
	public Double getJtqd() {
		return jtqd;
	}

	public void setJtqd(Double jtqd) {
		this.jtqd = jtqd;
	}
	
	public Double getTlhhb() {
		return tlhhb;
	}

	public void setTlhhb(Double tlhhb) {
		this.tlhhb = tlhhb;
	}
	
	public Double getGbhd() {
		return gbhd;
	}

	public void setGbhd(Double gbhd) {
		this.gbhd = gbhd;
	}
	
	public Double getZyd() {
		return zyd;
	}

	public void setZyd(Double zyd) {
		this.zyd = zyd;
	}
	
	public Double getWhd() {
		return whd;
	}

	public void setWhd(Double whd) {
		this.whd = whd;
	}
	
	public Double getPdsf() {
		return pdsf;
	}

	public void setPdsf(Double pdsf) {
		this.pdsf = pdsf;
	}
	
	public Double getRzjyxhd() {
		return rzjyxhd;
	}

	public void setRzjyxhd(Double rzjyxhd) {
		this.rzjyxhd = rzjyxhd;
	}
	
	public Double getTlxhd() {
		return tlxhd;
	}

	public void setTlxhd(Double tlxhd) {
		this.tlxhd = tlxhd;
	}
	
	public Double getCzpjxhd() {
		return czpjxhd;
	}

	public void setCzpjxhd(Double czpjxhd) {
		this.czpjxhd = czpjxhd;
	}
	
	public Double getSh() {
		return sh;
	}

	public void setSh(Double sh) {
		this.sh = sh;
	}
	
	public Double getWh() {
		return wh;
	}

	public void setWh(Double wh) {
		this.wh = wh;
	}
	
	public Double getRuh() {
		return ruh;
	}

	public void setRuh(Double ruh) {
		this.ruh = ruh;
	}
	
	public Double getRuoh() {
		return ruoh;
	}

	public void setRuoh(Double ruoh) {
		this.ruoh = ruoh;
	}
	
	public Double getSdy() {
		return sdy;
	}

	public void setSdy(Double sdy) {
		this.sdy = sdy;
	}
	
	public Double getSder() {
		return sder;
	}

	public void setSder(Double sder) {
		this.sder = sder;
	}
	
	public Double getSds() {
		return sds;
	}

	public void setSds(Double sds) {
		this.sds = sds;
	}
	
	public Double getSdsi() {
		return sdsi;
	}

	public void setSdsi(Double sdsi) {
		this.sdsi = sdsi;
	}
	
	public Double getSdw() {
		return sdw;
	}

	public void setSdw(Double sdw) {
		this.sdw = sdw;
	}
	
	public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
}