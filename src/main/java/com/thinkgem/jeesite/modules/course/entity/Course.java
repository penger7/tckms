/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.course.entity;

import org.hibernate.validator.constraints.Length;

import java.util.List;

import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.Area;

/**
 * 课程管理Entity
 * @author wp
 * @version 2016-07-10
 */
public class Course extends DataEntity<Course> {
	
	private static final long serialVersionUID = 1L;
	private String Id;
	private String xiangmumingcheng;		// 项目名称
	private Area area;		// 归属区域
	private String coursename;		// 课程名
	private String teachername;		// 教师名称
	private String sex;		// 性别
	private String jiaoshileixing;		// 教师类型
	private String xueduan;		// 学段
	private String xuekeleixing;		// 学科类型
	private String xueke;		// 学科
	private String jiaoxueleixing;		// 教学类型
	private String archiveDoc;		// 归档标记（0：归档；1：不归档）
	private List<CourseHuiying> courseHuiyingList = Lists.newArrayList();		// 子表列表
	private List<CourseShendu> courseShenduList = Lists.newArrayList();		// 子表列表
	private List<CourseSihe> courseSiheList = Lists.newArrayList();		// 子表列表
	private List<CourseSt> courseStList = Lists.newArrayList();		// 子表列表
	private List<CourseYouxiaoxing> courseYouxiaoxingList = Lists.newArrayList();		// 子表列表
	
	public Course() {
		super();
	}

	public Course(String id){
		super(id);
	}

	public String getId(){
		return Id;
	}
	
	public void setId(String id){
		this.Id = id;
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

	@Length(min=1, max=1024, message="课程名长度必须介于 1 和 1024 之间")
	public String getCoursename() {
		return coursename;
	}

	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}
	
	@Length(min=1, max=256, message="教师名称长度必须介于 1 和 256 之间")
	public String getTeachername() {
		return teachername;
	}

	public void setTeachername(String teachername) {
		this.teachername = teachername;
	}
	
	@Length(min=1, max=45, message="性别长度必须介于 1 和 45 之间")
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}
	
	@Length(min=1, max=45, message="教师类型长度必须介于 1 和 45 之间")
	public String getJiaoshileixing() {
		return jiaoshileixing;
	}

	public void setJiaoshileixing(String jiaoshileixing) {
		this.jiaoshileixing = jiaoshileixing;
	}
	
	@Length(min=1, max=45, message="学段长度必须介于 1 和 45 之间")
	public String getXueduan() {
		return xueduan;
	}

	public void setXueduan(String xueduan) {
		this.xueduan = xueduan;
	}
	
	@Length(min=1, max=45, message="学科类型长度必须介于 1 和 45 之间")
	public String getXuekeleixing() {
		return xuekeleixing;
	}

	public void setXuekeleixing(String xuekeleixing) {
		this.xuekeleixing = xuekeleixing;
	}
	
	@Length(min=1, max=45, message="学科长度必须介于 1 和 45 之间")
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
	
	@Length(min=0, max=1, message="归档标记（0：归档；1：不归档）长度必须介于 0 和 1 之间")
	public String getArchiveDoc() {
		return archiveDoc;
	}

	public void setArchiveDoc(String archiveDoc) {
		this.archiveDoc = archiveDoc;
	}
	
	public List<CourseHuiying> getCourseHuiyingList() {
		return courseHuiyingList;
	}

	public void setCourseHuiyingList(List<CourseHuiying> courseHuiyingList) {
		this.courseHuiyingList = courseHuiyingList;
	}
	public List<CourseShendu> getCourseShenduList() {
		return courseShenduList;
	}

	public void setCourseShenduList(List<CourseShendu> courseShenduList) {
		this.courseShenduList = courseShenduList;
	}
	public List<CourseSihe> getCourseSiheList() {
		return courseSiheList;
	}

	public void setCourseSiheList(List<CourseSihe> courseSiheList) {
		this.courseSiheList = courseSiheList;
	}
	public List<CourseSt> getCourseStList() {
		return courseStList;
	}

	public void setCourseStList(List<CourseSt> courseStList) {
		this.courseStList = courseStList;
	}
	public List<CourseYouxiaoxing> getCourseYouxiaoxingList() {
		return courseYouxiaoxingList;
	}

	public void setCourseYouxiaoxingList(List<CourseYouxiaoxing> courseYouxiaoxingList) {
		this.courseYouxiaoxingList = courseYouxiaoxingList;
	}
}