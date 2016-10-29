/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.historycourse.entity;

import org.hibernate.validator.constraints.Length;
import com.thinkgem.jeesite.modules.sys.entity.Area;
import java.util.List;
import com.google.common.collect.Lists;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * history_course_dataEntity
 * @author wp
 * @version 2016-10-05
 */
public class HistoryCourse extends DataEntity<HistoryCourse> {
	
	private static final long serialVersionUID = 1L;
	private String xiangmumingcheng;		// 项目名称
	private Area area;		// 省市
	private String coursename;		// 课程名
	private String teachername;		// 教师名称
	private String sex;		// 性别
	private String jiaoshileixing;		// 教师类型
	private String xueduan;		// 学段
	private String xuekeleixing;		// 学科类型
	private String xueke;		// 学科
	private String jiaoxueleixing;		// 教学类型
	private String archiveDoc;		// 归档标记（0：正常；1：删除）
	private List<HistoryCourseHuiying> historyCourseHuiyingList = Lists.newArrayList();		// 子表列表
	private List<HistoryCourseShendu> historyCourseShenduList = Lists.newArrayList();		// 子表列表
	private List<HistoryCourseSihe> historyCourseSiheList = Lists.newArrayList();		// 子表列表
	private List<HistoryCourseSt> historyCourseStList = Lists.newArrayList();		// 子表列表
	private List<HistoryCourseYouxiaoxing> historyCourseYouxiaoxingList = Lists.newArrayList();		// 子表列表
	private String regularFlag;
	
	public HistoryCourse() {
		super();
	}

	public HistoryCourse(String id){
		super(id);
	}
	
	public HistoryCourse(String regularFlag,String xueduan,String xuekeleixing,String jiaoxueleixing){
		super();
		this.regularFlag = regularFlag;
		this.xueduan = xueduan;
		this.xuekeleixing = xuekeleixing;
		this.jiaoxueleixing = jiaoxueleixing;		
	}

	@Length(min=1, max=45, message="项目名称长度必须介于 1 和 45 之间")
	public String getXiangmumingcheng() {
		return xiangmumingcheng;
	}

	public void setXiangmumingcheng(String xiangmumingcheng) {
		this.xiangmumingcheng = xiangmumingcheng;
	}
	
	public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}
	
	@Length(min=0, max=1024, message="课程名长度必须介于 0 和 1024 之间")
	public String getCoursename() {
		return coursename;
	}

	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}
	
	@Length(min=0, max=256, message="教师名称长度必须介于 0 和 256 之间")
	public String getTeachername() {
		return teachername;
	}

	public void setTeachername(String teachername) {
		this.teachername = teachername;
	}
	
	@Length(min=0, max=45, message="性别长度必须介于 0 和 45 之间")
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}
	
	@Length(min=0, max=45, message="教师类型长度必须介于 0 和 45 之间")
	public String getJiaoshileixing() {
		return jiaoshileixing;
	}

	public void setJiaoshileixing(String jiaoshileixing) {
		this.jiaoshileixing = jiaoshileixing;
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
	
	@Length(min=0, max=45, message="学科长度必须介于 0 和 45 之间")
	public String getXueke() {
		return xueke;
	}

	public void setXueke(String xueke) {
		this.xueke = xueke;
	}
	
	@Length(min=0, max=45, message="教学类型长度必须介于 0 和 45 之间")
	public String getJiaoxueleixing() {
		return jiaoxueleixing;
	}

	public void setJiaoxueleixing(String jiaoxueleixing) {
		this.jiaoxueleixing = jiaoxueleixing;
	}
	
	@Length(min=0, max=1, message="归档标记（0：正常；1：删除）长度必须介于 0 和 1 之间")
	public String getArchiveDoc() {
		return archiveDoc;
	}

	public void setArchiveDoc(String archiveDoc) {
		this.archiveDoc = archiveDoc;
	}
	
	public String getRegularFlag() {
		return regularFlag;
	}

	public void setRegularFlag(String regularFlag) {
		this.regularFlag = regularFlag;
	}
	
	public List<HistoryCourseHuiying> getHistoryCourseHuiyingList() {
		return historyCourseHuiyingList;
	}

	public void setHistoryCourseHuiyingList(List<HistoryCourseHuiying> historyCourseHuiyingList) {
		this.historyCourseHuiyingList = historyCourseHuiyingList;
	}
	public List<HistoryCourseShendu> getHistoryCourseShenduList() {
		return historyCourseShenduList;
	}

	public void setHistoryCourseShenduList(List<HistoryCourseShendu> historyCourseShenduList) {
		this.historyCourseShenduList = historyCourseShenduList;
	}
	public List<HistoryCourseSihe> getHistoryCourseSiheList() {
		return historyCourseSiheList;
	}

	public void setHistoryCourseSiheList(List<HistoryCourseSihe> historyCourseSiheList) {
		this.historyCourseSiheList = historyCourseSiheList;
	}
	public List<HistoryCourseSt> getHistoryCourseStList() {
		return historyCourseStList;
	}

	public void setHistoryCourseStList(List<HistoryCourseSt> historyCourseStList) {
		this.historyCourseStList = historyCourseStList;
	}
	public List<HistoryCourseYouxiaoxing> getHistoryCourseYouxiaoxingList() {
		return historyCourseYouxiaoxingList;
	}

	public void setHistoryCourseYouxiaoxingList(List<HistoryCourseYouxiaoxing> historyCourseYouxiaoxingList) {
		this.historyCourseYouxiaoxingList = historyCourseYouxiaoxingList;
	}
}