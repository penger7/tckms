/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.course.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.course.entity.Course;
import com.thinkgem.jeesite.modules.course.dao.CourseDao;
import com.thinkgem.jeesite.modules.course.entity.CourseHuiying;
import com.thinkgem.jeesite.modules.course.dao.CourseHuiyingDao;
import com.thinkgem.jeesite.modules.course.entity.CourseShendu;
import com.thinkgem.jeesite.modules.course.dao.CourseShenduDao;
import com.thinkgem.jeesite.modules.course.entity.CourseSihe;
import com.thinkgem.jeesite.modules.course.dao.CourseSiheDao;
import com.thinkgem.jeesite.modules.course.entity.CourseSt;
import com.thinkgem.jeesite.modules.course.dao.CourseStDao;
import com.thinkgem.jeesite.modules.course.entity.CourseYouxiaoxing;
import com.thinkgem.jeesite.modules.course.dao.CourseYouxiaoxingDao;

/**
 * 课程管理Service
 * @author wp
 * @version 2016-07-10
 */
@Service
@Transactional(readOnly = true)
public class CourseService extends CrudService<CourseDao, Course> {

	@Autowired
	private CourseDao courseDao;
	@Autowired
	private CourseHuiyingDao courseHuiyingDao;
	@Autowired
	private CourseShenduDao courseShenduDao;
	@Autowired
	private CourseSiheDao courseSiheDao;
	@Autowired
	private CourseStDao courseStDao;
	@Autowired
	private CourseYouxiaoxingDao courseYouxiaoxingDao;
	
	public Course get(String id) {
		Course course = super.get(id);
		course.setCourseHuiyingList(courseHuiyingDao.findList(new CourseHuiying(course)));
		course.setCourseShenduList(courseShenduDao.findList(new CourseShendu(course)));
		course.setCourseSiheList(courseSiheDao.findList(new CourseSihe(course)));
		course.setCourseStList(courseStDao.findList(new CourseSt(course)));
		course.setCourseYouxiaoxingList(courseYouxiaoxingDao.findList(new CourseYouxiaoxing(course)));
		return course;
	}
	
	public boolean judgeArchive(Course course){
		if(course.getCourseStList().isEmpty())
			return false;
		else if(course.getCourseYouxiaoxingList().isEmpty())
			return false;
		else if(course.getCourseHuiyingList().isEmpty())
			return false;
		else if(course.getCourseSiheList().isEmpty())
			return false;
		else if(course.getCourseShenduList().isEmpty())
			return false;
		else
			return true;
	}
	
	public Page<Course> changMOTongJi(Page<Course> page, Course course) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public List<Course> findList(Course course) {
		return super.findList(course);
	}
	
	public Page<Course> findPage(Page<Course> page, Course course) {
		return super.findPage(page, course);
	}
	
	@Transactional(readOnly = false)
	public void save(Course course) {
		super.save(course);
		for (CourseHuiying courseHuiying : course.getCourseHuiyingList()){
			if (courseHuiying.getId() == null){
				continue;
			}
			if (CourseHuiying.DEL_FLAG_NORMAL.equals(courseHuiying.getDelFlag())){
				if (StringUtils.isBlank(courseHuiying.getId())){
					courseHuiying.setCourse(course);
					courseHuiying.preInsert();
					courseHuiyingDao.insert(courseHuiying);
				}else{
					courseHuiying.preUpdate();
					courseHuiyingDao.update(courseHuiying);
				}
			}else{
				courseHuiyingDao.delete(courseHuiying);
			}
		}
		for (CourseShendu courseShendu : course.getCourseShenduList()){
			if (courseShendu.getId() == null){
				continue;
			}
			if (CourseShendu.DEL_FLAG_NORMAL.equals(courseShendu.getDelFlag())){
				if (StringUtils.isBlank(courseShendu.getId())){
					courseShendu.setCourse(course);
					courseShendu.preInsert();
					courseShenduDao.insert(courseShendu);
				}else{
					courseShendu.preUpdate();
					courseShenduDao.update(courseShendu);
				}
			}else{
				courseShenduDao.delete(courseShendu);
			}
		}
		for (CourseSihe courseSihe : course.getCourseSiheList()){
			if (courseSihe.getId() == null){
				continue;
			}
			if (CourseSihe.DEL_FLAG_NORMAL.equals(courseSihe.getDelFlag())){
				if (StringUtils.isBlank(courseSihe.getId())){
					courseSihe.setCourse(course);
					courseSihe.preInsert();
					courseSiheDao.insert(courseSihe);
				}else{
					courseSihe.preUpdate();
					courseSiheDao.update(courseSihe);
				}
			}else{
				courseSiheDao.delete(courseSihe);
			}
		}
		for (CourseSt courseSt : course.getCourseStList()){
			if (courseSt.getId() == null){
				continue;
			}
			if (CourseSt.DEL_FLAG_NORMAL.equals(courseSt.getDelFlag())){
				if (StringUtils.isBlank(courseSt.getId())){
					courseSt.setCourse(course);
					courseSt.preInsert();
					if (courseSt.getCh().equals(""))
						courseSt.setCh("0");
					if (courseSt.getRt().equals(""))
						courseSt.setRt("0");
					if (courseSt.getRs().equals(""))
						courseSt.setRs("0");
					if (courseSt.getSttimer().equals(""))
						courseSt.setSttimer("30");
					courseStDao.insert(courseSt);
				}else{
					courseSt.preUpdate();
					courseStDao.update(courseSt);
				}
			}else{
				courseStDao.delete(courseSt);
			}
		}
		for (CourseYouxiaoxing courseYouxiaoxing : course.getCourseYouxiaoxingList()){
			if (courseYouxiaoxing.getId() == null){
				continue;
			}
			if (CourseYouxiaoxing.DEL_FLAG_NORMAL.equals(courseYouxiaoxing.getDelFlag())){
				if (StringUtils.isBlank(courseYouxiaoxing.getId())){
					courseYouxiaoxing.setCourse(course);
					courseYouxiaoxing.preInsert();
					courseYouxiaoxingDao.insert(courseYouxiaoxing);
				}else{
					courseYouxiaoxing.preUpdate();
					courseYouxiaoxingDao.update(courseYouxiaoxing);
				}
			}else{
				courseYouxiaoxingDao.delete(courseYouxiaoxing);
			}
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(Course course) {
		super.delete(course);
		courseHuiyingDao.delete(new CourseHuiying(course));
		courseShenduDao.delete(new CourseShendu(course));
		courseSiheDao.delete(new CourseSihe(course));
		courseStDao.delete(new CourseSt(course));
		courseYouxiaoxingDao.delete(new CourseYouxiaoxing(course));
	}

	@Transactional(readOnly = false)
	public void archive(Course course){
		//将课程数据插入到历史表中
		course.preInsert();
		courseDao.archive(course);
		
		CourseHuiying courseHuiying = course.getCourseHuiyingList().get(0);
		courseHuiying.setCourse(course);
		courseHuiying.preInsert();
		courseHuiyingDao.archive(courseHuiying);
				
		CourseShendu courseShendu = course.getCourseShenduList().get(0);
		courseShendu.setCourse(course);
		courseShendu.preInsert();
		courseShenduDao.archive(courseShendu);
						
		CourseSihe courseSihe = course.getCourseSiheList().get(0);
		courseSihe.setCourse(course);
		courseSihe.preInsert();
		courseSiheDao.archive(courseSihe);
				
		CourseSt courseSt = course.getCourseStList().get(0);
		courseSt.setCourse(course);
		courseSt.preInsert();
		courseStDao.archive(courseSt);
		
		CourseYouxiaoxing courseYouxiaoxing = course.getCourseYouxiaoxingList().get(0);
		courseYouxiaoxing.setCourse(course);
		courseYouxiaoxing.preInsert();
		courseYouxiaoxingDao.archive(courseYouxiaoxing);

		
				
	}

	
	
}