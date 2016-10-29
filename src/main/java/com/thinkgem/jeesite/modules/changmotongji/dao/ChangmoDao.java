/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.changmotongji.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.changmotongji.entity.Changmo;
import com.thinkgem.jeesite.modules.course.entity.Course;
import com.thinkgem.jeesite.modules.historycourse.entity.HistoryCourse;

/**
 * 常模统计DAO接口
 * @author wp
 * @version 2016-10-05
 */
@MyBatisDao
public interface ChangmoDao extends CrudDao<Changmo> {
	List<Changmo> find(Course course);
	List<Changmo> find(HistoryCourse course);
	
}