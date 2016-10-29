/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.historycourse.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.historycourse.entity.HistoryCourseSt;

/**
 * history_course_dataDAO接口
 * @author wp
 * @version 2016-10-05
 */
@MyBatisDao
public interface HistoryCourseStDao extends CrudDao<HistoryCourseSt> {
	
}