/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.historycourse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.historycourse.entity.HistoryCourse;
import com.thinkgem.jeesite.modules.historycourse.dao.HistoryCourseDao;
import com.thinkgem.jeesite.modules.historycourse.entity.HistoryCourseHuiying;
import com.thinkgem.jeesite.modules.historycourse.dao.HistoryCourseHuiyingDao;
import com.thinkgem.jeesite.modules.historycourse.entity.HistoryCourseShendu;
import com.thinkgem.jeesite.modules.historycourse.dao.HistoryCourseShenduDao;
import com.thinkgem.jeesite.modules.historycourse.entity.HistoryCourseSihe;
import com.thinkgem.jeesite.modules.historycourse.dao.HistoryCourseSiheDao;
import com.thinkgem.jeesite.modules.historycourse.entity.HistoryCourseSt;
import com.thinkgem.jeesite.modules.historycourse.dao.HistoryCourseStDao;
import com.thinkgem.jeesite.modules.historycourse.entity.HistoryCourseYouxiaoxing;
import com.thinkgem.jeesite.modules.historycourse.dao.HistoryCourseYouxiaoxingDao;

/**
 * history_course_dataService
 * @author wp
 * @version 2016-10-05
 */
@Service
@Transactional(readOnly = true)
public class HistoryCourseService extends CrudService<HistoryCourseDao, HistoryCourse> {

	@Autowired
	private HistoryCourseDao historyCourseDao;
	@Autowired
	private HistoryCourseHuiyingDao historyCourseHuiyingDao;
	@Autowired
	private HistoryCourseShenduDao historyCourseShenduDao;
	@Autowired
	private HistoryCourseSiheDao historyCourseSiheDao;
	@Autowired
	private HistoryCourseStDao historyCourseStDao;
	@Autowired
	private HistoryCourseYouxiaoxingDao historyCourseYouxiaoxingDao;

	
	public HistoryCourse get(String id) {
		HistoryCourse historyCourse = super.get(id);
		historyCourse.setHistoryCourseHuiyingList(historyCourseHuiyingDao.findList(new HistoryCourseHuiying(historyCourse)));
		historyCourse.setHistoryCourseShenduList(historyCourseShenduDao.findList(new HistoryCourseShendu(historyCourse)));
		historyCourse.setHistoryCourseSiheList(historyCourseSiheDao.findList(new HistoryCourseSihe(historyCourse)));
		historyCourse.setHistoryCourseStList(historyCourseStDao.findList(new HistoryCourseSt(historyCourse)));
		historyCourse.setHistoryCourseYouxiaoxingList(historyCourseYouxiaoxingDao.findList(new HistoryCourseYouxiaoxing(historyCourse)));
		return historyCourse;
	}
	
	public List<HistoryCourse> findList(HistoryCourse historyCourse) {
		return super.findList(historyCourse);
	}
	
	public Page<HistoryCourse> findPage(Page<HistoryCourse> page, HistoryCourse historyCourse) {
		return super.findPage(page, historyCourse);
	}
	
	
	@Transactional(readOnly = false)
	public void save(HistoryCourse historyCourse) {
		super.save(historyCourse);
		for (HistoryCourseHuiying historyCourseHuiying : historyCourse.getHistoryCourseHuiyingList()){
			if (historyCourseHuiying.getId() == null){
				continue;
			}
			if (HistoryCourseHuiying.DEL_FLAG_NORMAL.equals(historyCourseHuiying.getDelFlag())){
				if (StringUtils.isBlank(historyCourseHuiying.getId())){
					historyCourseHuiying.setCourse(historyCourse);
					historyCourseHuiying.preInsert();
					historyCourseHuiyingDao.insert(historyCourseHuiying);
				}else{
					historyCourseHuiying.preUpdate();
					historyCourseHuiyingDao.update(historyCourseHuiying);
				}
			}else{
				historyCourseHuiyingDao.delete(historyCourseHuiying);
			}
		}
		for (HistoryCourseShendu historyCourseShendu : historyCourse.getHistoryCourseShenduList()){
			if (historyCourseShendu.getId() == null){
				continue;
			}
			if (HistoryCourseShendu.DEL_FLAG_NORMAL.equals(historyCourseShendu.getDelFlag())){
				if (StringUtils.isBlank(historyCourseShendu.getId())){
					historyCourseShendu.setCourse(historyCourse);
					historyCourseShendu.preInsert();
					historyCourseShenduDao.insert(historyCourseShendu);
				}else{
					historyCourseShendu.preUpdate();
					historyCourseShenduDao.update(historyCourseShendu);
				}
			}else{
				historyCourseShenduDao.delete(historyCourseShendu);
			}
		}
		for (HistoryCourseSihe historyCourseSihe : historyCourse.getHistoryCourseSiheList()){
			if (historyCourseSihe.getId() == null){
				continue;
			}
			if (HistoryCourseSihe.DEL_FLAG_NORMAL.equals(historyCourseSihe.getDelFlag())){
				if (StringUtils.isBlank(historyCourseSihe.getId())){
					historyCourseSihe.setCourse(historyCourse);
					historyCourseSihe.preInsert();
					historyCourseSiheDao.insert(historyCourseSihe);
				}else{
					historyCourseSihe.preUpdate();
					historyCourseSiheDao.update(historyCourseSihe);
				}
			}else{
				historyCourseSiheDao.delete(historyCourseSihe);
			}
		}
		for (HistoryCourseSt historyCourseSt : historyCourse.getHistoryCourseStList()){
			if (historyCourseSt.getId() == null){
				continue;
			}
			if (HistoryCourseSt.DEL_FLAG_NORMAL.equals(historyCourseSt.getDelFlag())){
				if (StringUtils.isBlank(historyCourseSt.getId())){
					historyCourseSt.setCourse(historyCourse);
					historyCourseSt.preInsert();
					historyCourseStDao.insert(historyCourseSt);
				}else{
					historyCourseSt.preUpdate();
					historyCourseStDao.update(historyCourseSt);
				}
			}else{
				historyCourseStDao.delete(historyCourseSt);
			}
		}
		for (HistoryCourseYouxiaoxing historyCourseYouxiaoxing : historyCourse.getHistoryCourseYouxiaoxingList()){
			if (historyCourseYouxiaoxing.getId() == null){
				continue;
			}
			if (HistoryCourseYouxiaoxing.DEL_FLAG_NORMAL.equals(historyCourseYouxiaoxing.getDelFlag())){
				if (StringUtils.isBlank(historyCourseYouxiaoxing.getId())){
					historyCourseYouxiaoxing.setCourse(historyCourse);
					historyCourseYouxiaoxing.preInsert();
					historyCourseYouxiaoxingDao.insert(historyCourseYouxiaoxing);
				}else{
					historyCourseYouxiaoxing.preUpdate();
					historyCourseYouxiaoxingDao.update(historyCourseYouxiaoxing);
				}
			}else{
				historyCourseYouxiaoxingDao.delete(historyCourseYouxiaoxing);
			}
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(HistoryCourse historyCourse) {
		super.delete(historyCourse);
		historyCourseHuiyingDao.delete(new HistoryCourseHuiying(historyCourse));
		historyCourseShenduDao.delete(new HistoryCourseShendu(historyCourse));
		historyCourseSiheDao.delete(new HistoryCourseSihe(historyCourse));
		historyCourseStDao.delete(new HistoryCourseSt(historyCourse));
		historyCourseYouxiaoxingDao.delete(new HistoryCourseYouxiaoxing(historyCourse));
	}
	
}