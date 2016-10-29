/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.course.web;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.changmotongji.entity.Changmo;
import com.thinkgem.jeesite.modules.changmotongji.service.ChangmoService;
import com.thinkgem.jeesite.modules.course.dao.CourseHuiyingDao;
import com.thinkgem.jeesite.modules.course.dao.CourseShenduDao;
import com.thinkgem.jeesite.modules.course.dao.CourseSiheDao;
import com.thinkgem.jeesite.modules.course.dao.CourseStDao;
import com.thinkgem.jeesite.modules.course.dao.CourseYouxiaoxingDao;
import com.thinkgem.jeesite.modules.course.entity.Course;
import com.thinkgem.jeesite.modules.course.entity.CourseHuiying;
import com.thinkgem.jeesite.modules.course.entity.CourseShendu;
import com.thinkgem.jeesite.modules.course.entity.CourseSihe;
import com.thinkgem.jeesite.modules.course.entity.CourseSt;
import com.thinkgem.jeesite.modules.course.entity.CourseYouxiaoxing;
import com.thinkgem.jeesite.modules.course.service.CourseService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 课程管理Controller
 * @author wp
 * @version 2016-07-10
 */
@Controller
@RequestMapping(value = "${adminPath}/course/course")
public class CourseController extends BaseController {

	@Autowired
	private CourseService courseService;
	@Autowired
	private ChangmoService changmoService;
	@Autowired
	private CourseSiheDao course4matDao;
	@Autowired
	private CourseYouxiaoxingDao coursequestionDao;
	@Autowired
	private CourseHuiyingDao courseresponseDao;
	@Autowired
	private CourseShenduDao coursedialogueDao;
	@Autowired
	private CourseStDao coursestDao;
	
	@ModelAttribute
	public Course get(@RequestParam(required=false) String id) {
		Course entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = courseService.get(id);
		}
		if (entity == null){
			entity = new Course();
		}
		return entity;
	}
	
	@RequiresPermissions("course:course:view")
	@RequestMapping(value = {"changmo"})
	public String tongJi(Course course, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Course> page = courseService.changMOTongJi(new Page<Course>(request, response), course); 
		model.addAttribute("course", course);
		return "modules/course/changmo";
	}
	
	@RequiresPermissions("course:course:view")
	@RequestMapping(value = {"list", ""})
	public String list(Course course, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Course> page = courseService.findPage(new Page<Course>(request, response), course);
		model.addAttribute("page", page);
		return "modules/course/courseList";
	}

	@RequiresPermissions("course:course:view")
	@RequestMapping(value = "form")
	public String form(Course course, Model model) {
		model.addAttribute("course", course);
		return "modules/course/courseForm";
	}
	
	@RequiresPermissions("course:course:edit")
	@RequestMapping(value = "listregular")
	public String listregular(Course course, Model model) {
		List<Course> courses = courseService.findList(course);
		List<Changmo> changmos = changmoService.findList(new Changmo());
		model.addAttribute("regulars", changmos);
		List<Map<String,Object>> dataList = new ArrayList<Map<String,Object>>();
		for (int i=0;i<courses.size();i++) {
			Map dataMap = new HashMap<String,Object>();
			Course c = courses.get(i);
			List<CourseSihe> _4mats = course4matDao.findList(new CourseSihe(c));
			CourseSihe _4mat = null;
			if (_4mats.size() > 0)
				_4mat = _4mats.get(0);
			else
				_4mat = new CourseSihe();
			dataMap.put("_4mat", _4mat);
			
			List<CourseYouxiaoxing> questions = coursequestionDao.findList(new CourseYouxiaoxing(c));
			CourseYouxiaoxing question = null;
			if (questions.size() > 0)
				question = questions.get(0);
			else
				question = new CourseYouxiaoxing();
			dataMap.put("question", question);
			
			List<CourseHuiying> resps = courseresponseDao.findList(new CourseHuiying(c));
			CourseHuiying resp = null;
			if (resps.size() > 0)
				resp = resps.get(0);
			else
				resp = new CourseHuiying();
			dataMap.put("response", resp);
			
			List<CourseShendu> dialogues = coursedialogueDao.findList(new CourseShendu(c));
			CourseShendu dialogue = null;
			if (dialogues.size() > 0)
				dialogue = dialogues.get(0);
			else
				dialogue = new CourseShendu();
			dataMap.put("dialogue", dialogue);
			
			List<CourseSt> sts = coursestDao.findList(new CourseSt(c));
			CourseSt st = null;
			if (sts.size() > 0)
				st = sts.get(0);
			else
				st = new CourseSt();
			dataMap.put("st", st);
			
			dataList.add(dataMap);
		}
		model.addAttribute("datalist", dataList);
		return "modules/course/listregular";
	}

	@RequiresPermissions("course:course:edit")
	@RequestMapping(value = "save")
	public String save(Course course, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, course)){
			return form(course, model);
		}
		courseService.save(course);
		addMessage(redirectAttributes, "保存课程成功");
		return "redirect:"+Global.getAdminPath()+"/course/course/?repage";
	}
	
	@RequiresPermissions("course:course:edit")
	@RequestMapping(value = "delete")
	public String delete(Course course, RedirectAttributes redirectAttributes) {
		courseService.delete(course);
		addMessage(redirectAttributes, "删除课程成功");
		return "redirect:"+Global.getAdminPath()+"/course/course/?repage";
	}
	
	@RequiresPermissions("course:course:edit")
	@RequestMapping(value = "archiving")
	public String archive(Course course, Model model,RedirectAttributes redirectAttributes) {
		Course c = courseService.get(course.getId());
		if (!courseService.judgeArchive(c)){
			addMessage(redirectAttributes, "归档课程失败，数据不完整");
			return "redirect:"+Global.getAdminPath()+"/course/course/?repage";
		}else{
			courseService.delete(course);
			courseService.archive(course);
			addMessage(redirectAttributes, "归档课程成功");
			return "redirect:"+Global.getAdminPath()+"/course/course/?repage";
		}
	}

	@RequiresPermissions("course:course:edit")
	@RequestMapping(value = "record")
	public String record(Course course, Model model) {
		model.addAttribute("course", course);
		List<CourseSihe> _4mats = course4matDao.findList(new CourseSihe(course));
		CourseSihe _4mat = null;
		if (_4mats.size() > 0)
			_4mat = _4mats.get(0);
		else
			_4mat = new CourseSihe();
		model.addAttribute("_4mat", _4mat);
		
		List<CourseYouxiaoxing> questions = coursequestionDao.findList(new CourseYouxiaoxing(course));
		CourseYouxiaoxing question = null;
		if (questions.size() > 0)
			question = questions.get(0);
		else
			question = new CourseYouxiaoxing();
		model.addAttribute("question", question);
		
		List<CourseHuiying> resps = courseresponseDao.findList(new CourseHuiying(course));
		CourseHuiying resp = null;
		if (resps.size() > 0)
			resp = resps.get(0);
		else
			resp = new CourseHuiying();
		model.addAttribute("resp", resp);
		
		List<CourseShendu> dialogues = coursedialogueDao.findList(new CourseShendu(course));
		CourseShendu dialogue = null;
		if (dialogues.size() > 0)
			dialogue = dialogues.get(0);
		else
			dialogue = new CourseShendu();
		model.addAttribute("dialogue", dialogue);
		
		List<CourseSt> sts = coursestDao.findList(new CourseSt(course));
		CourseSt st = null;
		if (sts.size() > 0)
			st = sts.get(0);
		else
			st = new CourseSt();
		model.addAttribute("st", st);
		return "modules/course/courseRecord";
	}
	
	@RequiresPermissions("course:course:edit")
	@RequestMapping(value = "drawall")
	public String drawAll(Course course, Model model) {
		model.addAttribute("course", course);
		return "modules/course/courseRecordChart";
	}
	
	@RequiresPermissions("course:course:edit")
	@ResponseBody
	@RequestMapping(value = "regular", method = RequestMethod.GET)
	public Map<String, Object> getRegular(HttpServletRequest request,HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		Course course = courseService.get(request.getParameter("id").toString());
		List<CourseSt> sts = coursestDao.findList(new CourseSt(course));
		CourseSt st = null;
		if (sts.size() > 0) {
			st = sts.get(0);
			if (st.getJiaoxueleixing().equals(""))
				map.put("result", "error");
			else {
				Changmo cm = changmoService.find(course);
				map.put("regular", cm);
				
				map.put("course", course);
				List<CourseSihe> _4mats = course4matDao.findList(new CourseSihe(course));
				CourseSihe _4mat = null;
				if (_4mats.size() > 0)
					_4mat = _4mats.get(0);
				else
					_4mat = new CourseSihe();
				map.put("_4mat", _4mat);
				
				List<CourseYouxiaoxing> questions = coursequestionDao.findList(new CourseYouxiaoxing(course));
				CourseYouxiaoxing question = null;
				if (questions.size() > 0)
					question = questions.get(0);
				else
					question = new CourseYouxiaoxing();
				map.put("question", question);
				
				List<CourseHuiying> resps = courseresponseDao.findList(new CourseHuiying(course));
				CourseHuiying resp = null;
				if (resps.size() > 0)
					resp = resps.get(0);
				else
					resp = new CourseHuiying();
				map.put("resp", resp);
				
				List<CourseShendu> dialogues = coursedialogueDao.findList(new CourseShendu(course));
				CourseShendu dialogue = null;
				if (dialogues.size() > 0)
					dialogue = dialogues.get(0);
				else
					dialogue = new CourseShendu();
				map.put("dialogue", dialogue);
				
				map.put("st", st);
			}
		} else {
			map.put("result", "error");
		}
	
		return map;
	}
	
	@RequiresPermissions("course:course:edit")
	@ResponseBody
	@RequestMapping(value = "savedata", method = RequestMethod.POST)
	public Map<String, Object> savedata(HttpServletRequest request,HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		String dt = request.getParameter("datatype").toString();
		Course course = courseService.get(request.getParameter("id").toString());
		if (dt.equals("4mat")) {
			CourseSihe _4mat = new CourseSihe(course);
			course4matDao.delete(_4mat);
			
			_4mat.setId(IdGen.uuid());
			_4mat.setSh(request.getParameter("sh").toString());
			_4mat.setWh(request.getParameter("wh").toString());
			_4mat.setRuh(request.getParameter("ruh").toString());
			_4mat.setRuoh(request.getParameter("ruoh").toString());
			_4mat.setCreateBy(UserUtils.getUser());
			_4mat.setCreateDate(new java.util.Date());
			_4mat.setUpdateBy(UserUtils.getUser());
			_4mat.setUpdateDate(new java.util.Date());
			
			course4matDao.insert(_4mat);
		} else if (dt.equals("question")) {
			CourseYouxiaoxing question = new CourseYouxiaoxing(course);
			coursequestionDao.delete(question);
			
			question.setId(IdGen.uuid());
			
			question.setGlxwt(request.getParameter("glxwt").toString());
			question.setJyxwt(request.getParameter("jyxwt").toString());
			question.setTlxwt(request.getParameter("tlxwt").toString());
			question.setCzxwt(request.getParameter("czxwt").toString());
			question.setPpxwt(request.getParameter("ppxwt").toString());
			
			question.setDm(request.getParameter("dm").toString());
			question.setRxsqd(request.getParameter("rxsqd").toString());
			question.setJjszd(request.getParameter("jjszd").toString());
			question.setJwjszd(request.getParameter("jwjszd").toString());
			question.setGlxxtcwt(request.getParameter("glxxtcwt").toString());
			
			question.setJtqd(request.getParameter("jtqd").toString());
			question.setTlhhb(request.getParameter("tlhhb").toString());
			question.setGbhd(request.getParameter("gbhd").toString());
			question.setZyd(request.getParameter("zyd").toString());
			
			question.setWhd(request.getParameter("whd").toString());
			question.setPdsf(request.getParameter("pdsf").toString());
			question.setRzjyxhd(request.getParameter("rzjyxhd").toString());
			question.setTlxhd(request.getParameter("tlxhd").toString());
			question.setCzpjxhd(request.getParameter("czpjxhd").toString());
			
			question.setCreateBy(UserUtils.getUser());
			question.setCreateDate(new java.util.Date());
			question.setUpdateBy(UserUtils.getUser());
			question.setUpdateDate(new java.util.Date());
			
			coursequestionDao.insert(question);
		} else if (dt.equals("response")) {
			CourseHuiying resp = new CourseHuiying(course);
			courseresponseDao.delete(resp);
			
			resp.setId(IdGen.uuid());
			resp.setYyhy(request.getParameter("yyhy").toString());
			resp.setFyyhy(request.getParameter("fyyhy").toString());
			
			resp.setKdhy(request.getParameter("kdhy").toString());
			resp.setFdhy(request.getParameter("fdhy").toString());
			resp.setWhy(request.getParameter("why").toString());
			resp.setDdxshdd(request.getParameter("ddxshdd").toString());
			resp.setCfhdhjs(request.getParameter("cfhdhjs").toString());
			
			resp.setCreateBy(UserUtils.getUser());
			resp.setCreateDate(new java.util.Date());
			resp.setUpdateBy(UserUtils.getUser());
			resp.setUpdateDate(new java.util.Date());
			
			courseresponseDao.insert(resp);
		} else if (dt.equals("dialogue")) {
			CourseShendu dialogue = new CourseShendu(course);
			coursedialogueDao.delete(dialogue);
			
			dialogue.setId(IdGen.uuid());
			
			dialogue.setSdy(request.getParameter("sdy").toString());
			dialogue.setSder(request.getParameter("sder").toString());
			dialogue.setSds(request.getParameter("sds").toString());
			dialogue.setSdsi(request.getParameter("sdsi").toString());
			dialogue.setSdw(request.getParameter("sdw").toString());
			
			dialogue.setCreateBy(UserUtils.getUser());
			dialogue.setCreateDate(new java.util.Date());
			dialogue.setUpdateBy(UserUtils.getUser());
			dialogue.setUpdateDate(new java.util.Date());
			
			coursedialogueDao.insert(dialogue);
		} else if (dt.equals("st")) {
			CourseSt st = new CourseSt(course);
			coursestDao.delete(st);
			
			st.setId(IdGen.uuid());
			
			st.setStdatas(request.getParameter("stdatas").toString());
			st.setSttimer(request.getParameter("sttimer").toString());
			
			String[] sts = st.getStdatas().split("");
			int rs = 0;
			int rt = 0;
			int ch = 0;
			String lastst = "";
			for (int i=0;i<sts.length;i++) {
				if (sts[i].equals("s")) 
					rs++;
				else
					rt++;
				
				if (!lastst.equals("")) {
					if (!lastst.equals(sts[i])) {
						ch++;
					}
				}
				
				lastst = sts[i];
			}
			
			if (rs+rt > 0) {
				float _rt = ((float)rt/(rs+rt));
				float _rs = ((float)rs/(rs+rt));
				float _ch = ((float)ch/(rs+rt)); 
				BigDecimal b = new BigDecimal(_rt);
			    _rt = b.setScale(2, BigDecimal.ROUND_HALF_UP).floatValue();
			    b = new BigDecimal(_rs);
			    _rs = b.setScale(2, BigDecimal.ROUND_HALF_UP).floatValue();
			    b = new BigDecimal(_ch);
			    _ch = b.setScale(2, BigDecimal.ROUND_HALF_UP).floatValue();
				st.setRt(_rt+"");
				st.setRs(_rs+"");
				st.setCh(_ch+"");
				
				String tt = "";
				if (_rt <= 0.3) 
					tt = "4";
				else if (_rt >= 0.7)
					tt = "3";
				else {
					if (_ch >= 0.4)
						tt = "2";
					else 
						tt = "1";
				}
				
				st.setJiaoxueleixing(tt);
			}
			
			st.setCreateBy(UserUtils.getUser());
			st.setCreateDate(new java.util.Date());
			st.setUpdateBy(UserUtils.getUser());
			st.setUpdateDate(new java.util.Date());
			
			coursestDao.insert(st);
			
			course.setJiaoxueleixing(st.getJiaoxueleixing());
			courseService.save(course);
		}
		
		map.put("result", "success");
		
		return map;
	}
}