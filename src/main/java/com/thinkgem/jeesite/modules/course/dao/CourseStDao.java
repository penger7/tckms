/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.course.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.course.entity.CourseSt;

/**
 * 课程管理DAO接口
 * @author wp
 * @version 2016-07-10
 */
@MyBatisDao
public interface CourseStDao extends CrudDao<CourseSt> {
	int archive(CourseSt coursest);
}