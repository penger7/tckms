/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.changmotongji.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.changmotongji.entity.Changmo;
import com.thinkgem.jeesite.modules.course.entity.Course;
import com.thinkgem.jeesite.modules.historycourse.entity.HistoryCourse;
import com.thinkgem.jeesite.modules.changmotongji.dao.ChangmoDao;

/**
 * 常模统计Service
 * @author wp
 * @version 2016-10-05
 */
@Service
@Transactional(readOnly = true)
public class ChangmoService extends CrudService<ChangmoDao, Changmo> {

	@Autowired
	private ChangmoDao changmoDao;
	
	
	
	public Changmo get(String id) {
		return super.get(id);
	}
	
	public Changmo find(Course course) {
		List<Changmo> cms = changmoDao.find(course);
		if (cms.size() > 0)
			return cms.get(0);
		else
			return null;
	}
	
	public Changmo find(HistoryCourse course) {
		List<Changmo> cms = changmoDao.find(course);
		if (cms.size() > 0)
			return cms.get(0);
		else
			return null;
	}
	
	public List<Changmo> findList(Changmo changmo) {
		return super.findList(changmo);
	}
	
	public Page<Changmo> findPage(Page<Changmo> page, Changmo changmo) {
		return super.findPage(page, changmo);
	}
	
	@Transactional(readOnly = false)
	public void save(Changmo changmo) {
		super.save(changmo);
	}
	
	@Transactional(readOnly = false)
	public void delete(Changmo changmo) {
		super.delete(changmo);
	}
	
}